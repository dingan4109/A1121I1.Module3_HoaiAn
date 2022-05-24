<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
</head>
<body>
<h1>Create Form</h1>
<a href="/controller">Back to product list</a>
<form method="post" style="width: 30%">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
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
                <td><button type="submit">Create</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
