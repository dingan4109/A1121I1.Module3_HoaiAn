<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/19/2022
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
<%
    Map<String,String> dictionary = new HashMap<>();
    String[] keys = {"book","pen","ruler","hello","bye"};
    String[] values = {"sach","but","thuoc","xin chao","tam biet"};

    for(int i = 0;i<keys.length;i++) {
        dictionary.put(keys[i],values[i]);
    }

    String txtSearch = request.getParameter("txtSearch");
    String vietnamese = dictionary.get(txtSearch);
    if(vietnamese != null) {
        out.println(("English: " + txtSearch));
        out.println(("\nVietnamese: " + vietnamese));
    }else {
        out.println("Not found");
    }
%>

</body>
</html>
