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
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<%--внедрение хедера, внутри хедера:
1. приветствие
2. выбор языка--%>
<%@ include file="WEB-INF/jsp/common/header.jsp" %>


<%--запрос на выбор номеров по дате--%>
<form id="free_rooms_list" action="/frontControllerServlet" method="post">
    <input type="hidden" name="command" value="fetchRooms"/>

    <p>
        <label><fmt:message key="list_menu_jsp.check_in_date"/></label>
        <input type="date" id="date_in" name="check_in_date"/>
    </p>
    <p>
        <label><fmt:message key="list_menu_jsp.check_out_date"/></label>
        <input type="date" id="date_out" name="check_out_date"/>
    </p>

    <p>
        <button class="design" type="submit">
            <fmt:message key="list_menu_jsp.button.choose.period"/>
        </button>
    </p>

</form>

<%--просьба о вводе данных → сделать локализацию--%>
<c:out value="${ enter_period}"/>
<c:out value="${ check_in_date}"/>


<%--вывод таблицы, если параметр не пустой--%>
<c:if test="${not empty freeRoomsList}">
<form id="to_book" action="controller">
    <input type="hidden" name="command" value="toBook"/>
    <input type="submit" value='<fmt:message key="list_menu_jsp.button.booking"/>'/>
    <table class="table">
        <tr>
            <th>Room number</th>
            <th>Room type</th>
            <th>Total Price</th>
            <th>Choose</th>
        </tr>

        <c:forEach var="elem" items="${freeRoomsList}" varStatus="status">
            <tr>
                <td><c:out value="${ elem.id }"/></td>
                <td><c:out value="${ elem.roomType }"/></td>
                <td><c:out value="${ elem.totalPrice }"/></td>
                <td><input type="checkbox" name="elemId" value="${elem.id}"/></td>
            </tr>
        </c:forEach>
    </table>

    </c:if>

    <c:set var="p" value="${param.pageNumber}"/> <%-- current page (1-based) --%>
    <c:set var="l" value="5"/> <%-- amount of page links to be displayed --%>
    <c:set var="r" value="${l / 2}"/> <%-- minimum link range ahead/behind --%>
    <c:set var="t" value="${tot}"/> <%-- total amount of pages --%>

    <c:set var="begin" value="${((p - r) > 0 ? ((p - r) < (t - l + 1) ? (p - r) : (t - l)) : 0) + 1}"/>
    <c:set var="end" value="${(p + r) < t ? ((p + r) > l ? (p + r) : l) : t}"/>

    <c:forEach begin="${begin}" end="${end}" var="page">
        ${page}
    </c:forEach>


    <%--внедрение футера--%>
    <%@ include file="WEB-INF/jsp/common/footer.jsp" %>

</body>
</html>
