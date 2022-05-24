<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Form</h1>
<a href="/controller">Back to product list</a>
<form method="post" style="width: 30%">
    <fieldset>
        <legend>Product Update Information</legend>
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="newName" id="name"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td>Brand</td>
                <td><input type="text" name="brand" id="brand"></td>
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
