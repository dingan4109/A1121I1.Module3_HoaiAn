<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Customer</title>
</head>
<body>
<a href="/customers">Back to customer list</a>
<table>
    <tr>
        <td>Name:</td>
        <td>${customer.getName()}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${customer.getEmail()}</td>
    </tr>
    <tr>
        <td>Name:</td>
        <td>${customer.getAddress()}</td>
    </tr>
</table>
</body>
</html>
