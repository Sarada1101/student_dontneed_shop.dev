package shop.servlet.admin;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import shop.model.bean.ProductBeans;
import shop.model.service.ErrorCheckService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/productDeleteCheck")
public class ProductDeleteCheckServlet extends HttpServlet {

    private Logger logger = LogManager.getLogger();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.trace("{} Start", ErrorCheckService.getMethodName());

        HttpSession        session     = request.getSession();
        List<ProductBeans> productList = (List<ProductBeans>) session.getAttribute("productList");
        int                index       = (int) session.getAttribute("index");
        logger.info("productList.size={}", productList.size());
        logger.info("index={}", index);

        ProductBeans productBeans = new ProductBeans();
        productBeans.setProductId(productList.get(index).getProductId());
        productBeans.setProductName(productList.get(index).getProductName());
        productBeans.setPrice(productList.get(index).getPrice());
        productBeans.setImage(productList.get(index).getImage());
        productBeans.setProductExplanation(productList.get(index).getProductExplanation());
        productBeans.setSold(productList.get(index).isSold());
        productBeans.setGenreCode(productList.get(index).getGenreCode());

        session.setAttribute("productBeans", productBeans);
        logger.trace("{} End", ErrorCheckService.getMethodName());
        request.getRequestDispatcher("WEB-INF/jsp/admin/product_delete_check.jsp").forward(request, response);
    }
}
