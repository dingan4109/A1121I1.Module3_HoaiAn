<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/28/2022
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User information</title>
</head>
<body>
<h1>User information</h1>
<table>
    <tr>
        <td>Name: </td>
        <td>${user.getName()}</td>
    </tr>
    <tr>
        <td>Email: </td>
        <td>${user.getEmail()}</td>
    </tr>
    <tr>
        <td>Name: </td>
        <td>${user.getCountry()}</td>
    </tr>
    <tr>
        <td></td>
        <td><button type="button" onclick="window.location.href='/controller'">Back to user list</button> </td>
    </tr>
</table>
</body>
</html>
