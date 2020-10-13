<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}"/>
<fmt:setBundle basename="messages"/>
<html>
<head>
    <title>Error page</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<fmt:message key="label.error"/>

<form action="/frontControllerServlet" method = "post">
    <button class="design" name="command" value="homePage"><fmt:message key="label.homePage"/></button>
</form>
</body>
</html>
