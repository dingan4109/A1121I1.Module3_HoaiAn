<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/19/2022
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Currency Converter JSP</title>
</head>
<body>
<h1>Currency Converter JSP</h1>
<form action="converter.jsp" method="post">
  <input name="rate" type="text">
  <input name="usd" type="text">
  <br>
  <button type="submit">Convert</button>
</form>
</body>
</html>
