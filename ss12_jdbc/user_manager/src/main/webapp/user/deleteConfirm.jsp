<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/27/2022
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete user</title>
</head>
<body>
<a href="/controller">Back to user list</a>
<h1>Confirm to delete this user?</h1>
<form method="post" style="width: 30%;">
    <fieldset>
        <legend>User information</legend>
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
                <td><button type="submit">Delete</button> </td>
                <td><button type="button" onclick="window.location.href='/controller'">Back to user list</button> </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
