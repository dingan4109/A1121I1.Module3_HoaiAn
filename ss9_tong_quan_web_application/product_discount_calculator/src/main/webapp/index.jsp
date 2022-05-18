<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/18/2022
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
    <style>
      form {
        width: 300px;
        height: 200px;
        border: 1px solid black;
      }
    </style>
  </head>
  <body>
  <h1>Product Discount Calculator</h1>
  <form action="/calculate" method="post">
    <label>Product Description</label><br>
    <input type="text" name="description"><br>
    <label>List Price</label><br>
    <input type="text" name="price"><br>
    <label>Discount percent</label><br>
    <input type="text" name="percent"><br>
    <br>
    <button type="submit">Final rate</button>
  </form>
  </body>
</html>
