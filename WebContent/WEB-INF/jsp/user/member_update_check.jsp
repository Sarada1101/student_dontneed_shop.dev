<%@ page import="shop.model.bean.MemberBeans" %>
<%@ page import="shop.model.service.CommonService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    MemberBeans memberBeans = (MemberBeans) session.getAttribute("memberBeans");

    CommonService commonService = new CommonService();
    String memberMail = commonService.escapeProcess(memberBeans.getMemberMail());
    String name = commonService.escapeProcess(memberBeans.getMemberName());
    String postalCode = commonService.escapeProcess(memberBeans.getPostalCode());
    String address = commonService.escapeProcess(memberBeans.getAddress());
    String tell = commonService.escapeProcess(memberBeans.getTell());
    String creditCard = commonService.escapeProcess(memberBeans.getCreditCard());
    String expirationDate = commonService.escapeProcess(memberBeans.getExpirationDate());
    String holder = commonService.escapeProcess(memberBeans.getHolder());
    String securityCode = commonService.escapeProcess(memberBeans.getSecurityCode());
%><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員情報変更確認</title>
    <%@include file="/WEB-INF/jsp/bootstrap.jsp" %>
</head>

<body>
<%@include file="/WEB-INF/jsp/user/member_header.jsp" %>

<h1 class="mt-3 text-center">会員情報変更確認</h1>
<div class="row  mt-3">
    <div class="col-11 col-sm-8 col-md-6 col-lg-4 row mx-auto">
        <table class="table table-striped">
            <tbody>
            <tr class="row">
                <th class="col-4">メールアドレス</th>
                <td class="col-8">
                    <%=memberMail%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">パスワード</th>
                <td class="col-8">
                    ●●●●●●●●
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">名前</th>
                <td class="col-8">
                    <%=name%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">郵便番号</th>
                <td class="col-8">
                    <%=postalCode%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">住所</th>
                <td class="col-8">
                    <%=address%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">電話番号</th>
                <td class="col-8">
                    <%=tell%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">クレジット番号</th>
                <td class="col-8">
                    <%=creditCard%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">有効期限</th>
                <td class="col-8">
                    <%=expirationDate%>
                </td>
            </tr>

            <tr class="row">
                <th class="col-4">名義者名</th>
                <td class="col-8">
                    <%=holder%>
                </td>
            </tr>
            <tr class="row">
                <th class="col-4">セキュリティコード</th>
                <td class="col-8">
                    <%=securityCode%>
                </td>
            </tr>
        </table>

        <form action="memberUpdateInput" method="get" class="col-6 pl-0">
            <button type="submit" class="btn btn-outline-dark btn-block">戻る</button>
        </form>

        <form action="memberUpdateComplete" method="get" class="col-6 pr-0">
            <button type="submit" class="btn btn-primary btn-block">変更</button>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/jsp/user/member_footer.jsp" %>

<%@include file="/WEB-INF/jsp/script.jsp" %>

</body>
</html>

