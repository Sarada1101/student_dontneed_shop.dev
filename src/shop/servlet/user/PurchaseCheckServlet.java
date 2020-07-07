package shop.servlet.user;

import shop.model.bean.MemberBeans;
import shop.model.bean.ProductBeans;
import shop.model.service.PurchaseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/purchaseCheck")
public class PurchaseCheckServlet extends HttpServlet {

    private PurchaseService purchaseService = new PurchaseService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String memberMail = ((MemberBeans) session.getAttribute("memberLoginInfo")).getMemberMail();
        Map<String, List<ProductBeans>> purchaseMap = purchaseService.checkExistsStock(memberMail);

        String errorMessage = "";

        if (purchaseMap.get("deleteList") != null) {
            List<ProductBeans> deleteList = purchaseMap.get("deleteList");
            for (ProductBeans productBeans : deleteList) {
                purchaseService.deleteCart(memberMail, productBeans.getProductId());
                errorMessage += productBeans.getProductName() + "\n";
            }
            errorMessage += "が既に販売済みであったためカートから削除しました";
        }

        request.setAttribute("errorMessage", errorMessage);
        session.setAttribute("purchaseList", purchaseMap.get("purchaseList"));

        request.getRequestDispatcher("WEB-INF/jsp/user/purchase_check.jsp").forward(request, response);
    }
}