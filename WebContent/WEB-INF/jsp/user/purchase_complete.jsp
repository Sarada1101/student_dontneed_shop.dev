<%@ page import="shop.model.bean.ProductBeans" %>
<%@ page import="shop.model.service.ErrorCheckService" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<ProductBeans> purchaseList = (List<ProductBeans>) session.getAttribute("productList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>購入完了画面</title>
    <%@include file="/WEB-INF/jsp/bootstrap.jsp" %>
</head>

<body>
<%@include file="/WEB-INF/jsp/user/member_header.jsp" %>

<h1 class="text-center my-5">購入完了</h1>

<div class="px-1 px-md-3 px-lg-5">
    <div class="row">
        <form action="memberTop" method="get" class="col-11 col-md-8 mx-auto mb-3 row">
            <button type="submit" class="btn btn-outline-dark btn-block col-5 mr-auto">トップへ戻る</button>
        </form>

        <div class="col-7"><p></p></div>

        <table class="table table-hover col-11 col-md-8 mx-auto">
            <thead>
            <tr class="row">
                <th scope="col" class="col-3 col-lg-2">画像</th>
                <th scope="col" class="col-3 col-lg-4">商品名</th>
                <th scope="col" class="col-6">価格</th>
            </tr>
            </thead>

            <tbody>
            <%
                int i = 0;
                for (ProductBeans productBeans : purchaseList) {
            %>
            <tr class="row">
                <td scope="row" id="square-image<%=i%>" class="square-image col-3 col-lg-2">
                    <img src="getImageList?index=<%=i%>" alt="">
                </td>
                <td class="col-3 col-lg-4">
                    <strong>
                        <%=ErrorCheckService.escapeProcess(productBeans.getProductName())%>
                    </strong>
                </td>
                <td class="col-6">
                    <%=ErrorCheckService.escapeProcess(String.valueOf(productBeans.getPrice())) + "円"%>
                </td>
            </tr>
            <%
                    i++;
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<%@include file="/WEB-INF/jsp/user/member_footer.jsp" %>

<script>
    document.addEventListener("DOMContentLoaded", imageResizeFunc);
    window.addEventListener("resize", imageResizeFunc);

    function imageResizeFunc() {
        var width = document.getElementById("square-image0").offsetWidth;
        console.log(width)
        var imageList = document.querySelectorAll(".square-image");
        console.log(imageList.length);
        width = String(width) + "px";
        for (var i = 0; i < imageList.length; i++) {
            document.getElementById("square-image" + i).style.height = width;
        }
    }
</script>

<%@include file="/WEB-INF/jsp/script.jsp" %>
</body>
</html>
