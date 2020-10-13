
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Rooms</title>
</head>
<body>
<table>
    <c:forEach var="elem" items="${freeRoomsList}" varStatus="status">
        <tr>
            <td><c:out value="${ elem.totalPrice }" /></td>
        </tr>
    </c:forEach>
</table>
</body></html>