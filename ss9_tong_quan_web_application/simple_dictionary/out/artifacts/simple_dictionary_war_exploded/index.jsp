<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/18/2022
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Simple Dictionary</title>
  </head>
  <body>
  <h2>Vietnamese Dictionary</h2>
  <form action="/translate" method="post">
    <input type="text" name="word" placeholder="Enter your word:">
    <button type="submit">Search</button>
  </form>
  </body>
</html>
