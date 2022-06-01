<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/27/2022
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body class="container">
<h1>User List</h1>
<button onclick="window.location.href='/controller?action=create'">Create new user</button>
<button onclick="window.location.href='/controller'">View full list</button>
<br>
<table class="table">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.getId()}</td>
            <td><a href="/controller?action=view&id=${user.id}">${user.getName()}</a></td>
            <td>${user.getEmail()}</td>
            <td>${user.getCountry()}</td>
            <td>
                <button onclick="window.location.href='/controller?action=edit&id=${user.getId()}'">Edit</button>
                <a href="/controller?action=delete&id=${user.getId()}"><button>Delete</button></a>
            </td>
        </tr>
    </c:forEach>
</table>

<h1>Search by country</h1>
<form action="/controller" method="get">
    <input type="text" name="searchCountry" placeholder="Input country">
    <input type="submit" name="action" value="Search">
</form>
<br>
<h1>Order by name</h1>
    <a href="/controller?action=order&choose=asc"><button>ASC</button></a>
    <a href="/controller?action=order&choose=desc"><button>DESC</button></a>
</body>
</html>
