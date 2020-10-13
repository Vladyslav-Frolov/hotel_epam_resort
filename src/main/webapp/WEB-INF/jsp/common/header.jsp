<%--
  Created by IntelliJ IDEA.
  User: Владислав
  Date: 12.10.2020
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--приветствие--%>
<fmt:message key="label.greatings"/>
<br/>

<%--выбор языка--%>
<form id="locale" action="/frontControllerServlet" method="post" >
    <input type="hidden" name="command" value="homePage"/>
    <select required name="lang" onchange="this.form.submit()">
        <option value="" hidden disabled selected>
            ${param.lang}
        </option>
        <option value="en"><fmt:message key="label.lang.en"/></option>
        <option value="uk"><fmt:message key="label.lang.ua"/></option>
    </select>

</form>
</body>
</html>
