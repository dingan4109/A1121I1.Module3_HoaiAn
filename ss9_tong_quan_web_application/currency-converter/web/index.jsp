<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/18/2022
  Time: 12:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Converter</title>
    <style>
      form {
        width: 200px;
        height: 150px;
        border: 1px solid black;
        padding: 10px;
      }
    </style>
  </head>
  <body>
  <title>Currency Converter</title>
  <form action="/convert" method="post">
    <label>Rate</label><br>
    <input type="text" name="rate" value="22000"><br>
    <label>USD</label><br>
    <input type="number" name="usd"><br>
    <br>
    <input type="submit"></input>
  </form>
  </body>
</html>
