<%--
  Created by IntelliJ IDEA.
  User: V
  Date: 30.09.2020
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>
    <title>Home page</title>
    <style>
        .design {
            display: inline-block; /* Строчно-блочный элемент */
            padding: 5px 20px; /* Добавляем поля */
            text-decoration: none; /* Убираем подчёркивание у ссылки */
            cursor: pointer; /* Курсор в виде руки */
            background: #deefff; /* Фон для браузеров, не поддерживающих градиент */
            /* Градиент */
            background: -moz-linear-gradient(top, #deefff 0%, #98bede 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #deefff), color-stop(100%, #98bede));
            background: -webkit-linear-gradient(top, #deefff 0%, #98bede 100%);
            background: -o-linear-gradient(top, #deefff 0%, #98bede 100%);
            background: -ms-linear-gradient(top, #deefff 0%, #98bede 100%);
            background: linear-gradient(top, #deefff 0%, #98bede 100%);
            border-radius: 10px; /* Скругляем уголки */
            border: 1px solid #008; /* Добавляем синюю рамку */
            font: 12px/1 Arial, sans-serif; /* Рубленый шрифт */
            color: #2c539e; /* Цвет текста и ссылки */
        }
    </style>

</head>
<body>
<fmt:message key="label.greatings" />
<br/>

<h2>
    <fmt:message key="label.chooseSessionLocale" />
</h2>

<form id="locale" action="/frontControllerServlet" method="post">
    <input type="hidden" name="command" value="homePage"/>
    <select name="lang">
        <option value="en"><fmt:message key="label.lang.en"/></option>
        <option value="ua"><fmt:message key="label.lang.ua"/></option>
    </select>
    <input type="submit" value="<fmt:message key="label.changeLang"/>">

</form>
















<table id="main-container">

    <%--    <%@ include file="/WEB-INF/jspf/header.jspf" %>--%>

    <tr>
        <td class="content">
            <%-- CONTENT --%>

            <form id="make_order" action="controller">
                <input type="hidden" name="command" value="makeOrder"/>
                <input type="submit" value='<fmt:message key="list_menu_jsp.button.make_an_order"/>'/>

                <table id="list_menu_table">
                    <thead>
                    <tr>
                        <td>№</td>
                        <td><fmt:message key="list_menu_jsp.table.header.name"/></td>
                        <td><fmt:message key="list_menu_jsp.table.header.price"/></td>
                        <td><fmt:message key="list_menu_jsp.table.header.order"/></td>
                    </tr>
                    </thead>

                    <c:set var="k" value="0"/>
                    <c:forEach var="item" items="${menuItems}">
                        <c:set var="k" value="${k+1}"/>
                        <tr>
                            <td><c:out value="${k}"/></td>
                            <td>${item.name}</td>
                            <td>${item.price}</td>
                            <td><input type="checkbox" name="itemId" value="${item.id}"/></td>
                        </tr>
                    </c:forEach>
                </table>

            </form>

            <%-- CONTENT --%>
        </td>
    </tr>

    <%--    <%@ include file="/WEB-INF/jspf/footer.jspf" %>--%>

</table>

</body>
</html>
