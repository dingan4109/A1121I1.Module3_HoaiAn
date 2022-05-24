<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/22/2022
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new customer</title>
</head>
<body>
<a href="/customers">Back to customer list</a>
<%--<p>--%>
<%--    <c:if test="${requestScope[message]!=null}">--%>
<%--        <span>${requestScope[message]}</span>--%>
<%--    </c:if>--%>
<%--</p>--%>
<form method="post" style="width: 30%">
    <fieldset>
        <legend>model.Customer information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
