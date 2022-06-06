<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/30/2022
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="jquery/jquery-3.6.0.min.js"></script>
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
            <h1>Customer List</h1>
            <div class="row">
                <div class="col-md-3">
                    <a href="/customerServlet?action=create">
                        <button class="btn btn-primary me-md-2"
                                style="background: lightgrey">Create new
                            customer
                        </button>
                    </a>
                </div>
                <div class="col-md-9">
                  
                </div>
            </div>
            <br><br>
            <c:if test="${mess!=null}">
                <p>${mess}</p>
            </c:if>
            <table class="table table-striped table-hover">
                <tr>
                    <th>Id</th>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Birthday</th>
                    <th>Gender</th>
                    <th>Id Card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <c:forEach items="${customerList}" var="customer">
                    <tr>
                        <td>${customer.getCustomerId()}</td>
                        <c:forEach items="${customerTypes}" var="customerType">
                            <c:if test="${customer.getCustomerTypeId() == customerType.getCustomerTypeId()}">
                                <td><c:out value="${customerType.getCustomerTypeName()}"></c:out></td>
                            </c:if>
                        </c:forEach>
                        <td>${customer.getCustomerName()}</td>
                        <td>${customer.getCustomerBirthday()}</td>
                        <c:if test="${customer.getCustomerGender() == 0}">
                            <td>Nữ</td>
                        </c:if>
                        <c:if test="${customer.getCustomerGender() == 1}">
                            <td>Nam</td>
                        </c:if>
                        <td>${customer.getCustomerIdCard()}</td>
                        <td>${customer.getCustomerPhone()}</td>
                        <td>${customer.getCustomerEmail()}</td>
                        <td>${customer.getCustomerAddress()}</td>
                        <td><a href="/customerServlet?action=edit&customer_id=${customer.getCustomerId()}">
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="16" height="16" fill="currentColor"
                                    class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd"
                                      d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                        </a></td>
                        <td><a
                                onclick="customerInfo('${customer.getCustomerId()}','${customer.getCustomerTypeId()}','${customer.getCustomerName()}','${customer.getCustomerBirthday()}','${customer.getCustomerGender()}','${customer.getCustomerIdCard()}','${customer.getCustomerPhone()}','${customer.getCustomerEmail()}','${customer.getCustomerAddress()}')"
                                data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="16"
                                    height="16" fill="currentColor"
                                    class="bi bi-trash3" viewBox="0 0 16 16">
                                <path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
                            </svg>
                        </a></td>
                    </tr>
                </c:forEach>
            </table>

            <div>
                <nav aria-label="...">
                    <ul class="pagination">
                        <c:if test="${currentPage!=1}">
                            <li class="page-item">
                                <a class="page-link text-body"
                                   href="/customerServlet?currentPage=${currentPage - 1}">Previous
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${noOfPage}" var="i">
                     <c:choose>
                         <c:when test="${currentPage == i}">
                             <li
                                     class="page-item active"><a class="page-link text-body"
                                                          href="/customerServlet?currentPage=${i}">
                                     ${i}</a></li>
                         </c:when>
                         <c:otherwise>
                             <li
                                     class="page-item"><a class="page-link text-body"
                                                          href="/customerServlet?currentPage=${i}">
                                     ${i}</a></li>
                         </c:otherwise>
                     </c:choose>
                        </c:forEach>
                        <c:if test="${currentPage != noOfPage}">
                            <li class="page-item">
                                <a class="page-link text-body"
                                   href="/customerServlet?currentPage=${currentPage + 1}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/customerServlet?action=delete" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Confirm to delete customer?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input hidden type="text" id="id" name="customer_id">
                        <table>
                            <tr>
                                <td>Type:</td>
                                <td id="type"></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td id="name"></td>
                            </tr>
                            <tr>
                                <td>Birthday:</td>
                                <td id="birthday"></td>
                            </tr>
                            <tr>
                                <td>Gender:</td>
                                <td id="gender"></td>
                            </tr>
                            <tr>
                                <td>Id card:</td>
                                <td id="idCard"></td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td id="phone"></td>
                            </tr>
                            <tr>
                                <td>Email:</td>
                                <td id="email"></td>
                            </tr>
                            <tr>
                                <td>Address:</td>
                                <td id="address"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--    End Modal--%>
</main>
<footer class="border">
    <%@include file="/footer.jsp" %>
</footer>
</body>
</html>

<script>
    function customerInfo(id, type, name, birthday, gender, idCard, phone, email, address) {
        document.getElementById("id").value = id;
        document.getElementById("type").innerText = type;
        document.getElementById("name").innerText = name;
        document.getElementById("birthday").innerText = birthday;
        if (gender == 0) {
            document.getElementById("gender").innerText = "Nữ";
        } else {
            document.getElementById("gender").innerText = "Nam";
        }
        document.getElementById("idCard").innerText = idCard;
        document.getElementById("phone").innerText = phone;
        document.getElementById("email").innerText = email;
        document.getElementById("address").innerText = address;
    }
</script>