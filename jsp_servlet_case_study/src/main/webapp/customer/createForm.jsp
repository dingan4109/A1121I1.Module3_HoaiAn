<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/30/2022
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Customer Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <style>
        a{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body class="container-fluid">
<header class="border">
    <div class="row" style="height: 10%">
        <div class="col-md-3">
            <img src="https://data.designervn.net/2019/10/9999_ee1666fd5ed5fc063404b448f6b9e301.jpg" style="width:
            30px;height: 20px;">
        </div>
        <div class="col-md-9 border-primary">
            <p class="text-end">Nguyen Van A</p>
        </div>
    </div>
</header>
<nav class="border">
    <div class="row">
        <div class="col-md-9">
            <ul class="list-unstyled list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Employee</a></li>
                <li class="list-inline-item"><a href="/customerServlet?action=viewList">Customer</a></li>
                <li class="list-inline-item"><a href="#">Service</a></li>
                <li class="list-inline-item"><a href="#">Contract</a></li>
            </ul>
        </div>
        <div class="col-md-3">
            <input type="search" placeholder="Input to search" style="border-radius: 5px">
        </div>
    </div>
</nav>
<main>
    <div class="row border h-75">
        <div class="col-md-3">
            <ul class="list-unstyled">
                <li><a href="#">Item One</a></li>
                <li><a href="#">Item Two</a></li>
                <li><a href="#">Item Three</a></li>
            </ul>
        </div>
        <div class="col-md-9 border">
            <h1>Create new customer form</h1>
            <a href="/customerServlet?action="><button class="btn btn-primary me-md-2"
                                               style="background: lightgrey">Back to customer list</button></a>
            <form class="row g-3 border" method="post">
                <div class="col-md-3">
                    <label class="form-label">Customer type id</label>
                    <select>
                        <c:forEach items="typeList" var="type">

                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-9">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                </div>
                <div class="col-md-6">
                    <label for="birthday" class="form-label">Birthday</label>
                    <input type="date" class="form-control" id="birthday" name="birthday">
                </div>
                <div class="col-6">
                    <label for="gender" class="form-label">Gender</label>
                    <input type="text" class="form-control" id="gender" name="gender">
                </div>
                <div class="col-6">
                    <label for="idCard" class="form-label">Id Card</label>
                    <input type="text" class="form-control" id="idCard" name="idCard">
                </div>
                <div class="col-md-6">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email">
                </div>
                <div class="col-md-12">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" name="address">
                </div>
                <div class="col-12">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                            Check me out
                        </label>
                    </div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Create customer</button>
                </div>
            </form>
        </div>
    </div>
</main>
<footer class="border">
    <p class="text-center">Footer...</p>
</footer>
</body>
</html>
