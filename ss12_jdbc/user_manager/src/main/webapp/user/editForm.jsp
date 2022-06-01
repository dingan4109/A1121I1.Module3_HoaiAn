<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/27/2022
  Time: 7:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user form</title>
</head>
<body>
<h1>Edit user form</h1>
<a href="/controller">Back to user list</a>
<form method="post" style="width: 30%;">
    <fieldset>
        <legend>User information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" placeholder="${user.getName()}"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" placeholder="${user.getEmail()}"></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="country" placeholder="${user.getCountry()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Edit</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
