<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/24/2022
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<h1>Product List</h1>
<a href="/controller?action=create">Create new product</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td><a href="/controller?action=view&name=${product.name}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.brand}</td>
            <td><a href="/controller?action=edit&name=${product.name}">Edit</a></td>
            <td><a href="/controller?action=delete&name=${product.name}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<form action="/controller" method="get">
    <h1>Product search</h1>
    <input type="text" name="name" placeholder="input name">
    <br>
    <input type="submit" name="action" value="search">
</form>
<div>
<c:if test="${product!=null}">
    <%@include file="view.jsp"%>
</c:if>
</div>
</body>
</html>
<script type="text/javascript">
    <%--function x() {--%>
    <%--    let mess = ""--%>
    <%--    document.getElementById("display").innerHTML = "<%@include file=\"view.jsp\"%>";--%>
    <%--}--%>
</script>
