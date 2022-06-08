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
    <title>Create Contract Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <style>
        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body class="container-fluid">
<header class="border">
    <%@include file="/header.jsp" %>
</header>
<nav class="border">
    <%@include file="/navBar.jsp" %>
</nav>
<main>
    <div class="row border">
        <%@include file="/sideBar.jsp" %>
        <div class="col-md-9 border">
            <h1>Create new contract form</h1>
            <c:if test="${mess!=null}">
            <p>${mess}</p>
            </c:if>
            <a href="/employeeServlet?currentPage=1">
                <button class="btn btn-primary me-md-2"
                        style="background: lightgrey">Back to contract
                    list
                </button>
            </a>
            <form class="row g-3 border" method="post">
                <div class="col-md-6">
                    <label for="startDate" class="form-label">Start Date</label>
                    <input type="date" class="form-control" id="startDate" name="startDate">
                </div>
                <div class="col-md-6">
                    <label for="endDate" class="form-label">End Date</label>
                    <input type="date" class="form-control" id="endDate" name="endDate">
                </div>
                <div class="col-6">
                    <label for="deposit" class="form-label">Deposit</label>
                    <input type="text" class="form-control" id="deposit" name="deposit">
                </div>
                <div class="col-6">
                    <label for="total" class="form-label">Total money</label>
                    <input type="text" class="form-control" id="total" name="total">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Employee name</label>
                    //lúc nào đầu óc bình thường thì sửa lại chỗ này
                    <select name="employee">
                        <c:forEach items="${employeeList}" var="employee">
                            <option value="${employee.getEmployeeId()}">${employee.getEmployeeName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Customer name</label>
                    //sửa luôn chỗ này
                    <select name="customer">
                        <c:forEach items="${customerList}" var="customer">
                        <option value="${customer.getCustomerId()}">${customer.getCustomerName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Service name</label>
                    <select name="service">
                        <c:forEach items="${serviceList}" var="service">
                            <option value="${service.getServiceId()}">${service.getServiceName()}</option>
                        </c:forEach>
                    </select>
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
                    <button type="submit" class="btn btn-primary">Create contract</button>
                </div>
            </form>
        </div>
    </div>
</main>
<footer class="border">
    <%@include file="/footer.jsp" %>
</footer>
</body>
</html>
