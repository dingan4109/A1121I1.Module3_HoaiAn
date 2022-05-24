<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/23/2022
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Customer</title>
</head>
<body>
<a href="/customers">Back to customer list</a>
<form method="post" style="width: 30%">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td>${customer.getName()}</td>
            </tr>
            <tr>
                <td>Email</td>
                <td>${customer.getEmail()}</td>
            </tr>
            <tr>
                <td>Address</td>
                <td>${customer.getAddress()}</td>
            </tr>
            <tr>
                <td><button type="submit">Delete customer</button></td>
                <td><a href="/customers">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
