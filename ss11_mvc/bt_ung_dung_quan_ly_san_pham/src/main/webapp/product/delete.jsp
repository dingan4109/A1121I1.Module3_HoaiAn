<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<a href="/controller">Back to product list</a>
<p>Are you sure?</p>
<form method="post" style="width: 30%">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td>${product.id}</td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>Description:</td>
                <td>${product.description}</td>
            </tr>
            <tr>
                <td>Brand:</td>
                <td>${product.brand}</td>
            </tr>
            <tr>
                <td><button type="submit">Delete</button> </td>
                <td><a href="/controller">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
