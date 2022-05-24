<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product information</h1>
<table>
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
            <td><a href="/controller">Back to product list</a></td>
            <td></td>
        </tr>
</table>
</body>
</html>
