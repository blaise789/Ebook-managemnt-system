<%--
  Created by IntelliJ IDEA.
  User: bigirabagaboblaise
  Date: 14/02/2024
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="ISO-8859-1"   %>
<html>
<head>
    <title>Title</title>
   <meta charset="ISO-8859-1">
</head>
<body>
<%
int a=Integer.parseInt(request.getParameter("num1"));
int b=Integer.parseInt(request.getParameter("num2"));
int sum=a+b;
double cons=Double.parseDouble(config.getInitParameter("constant"));
%>
<%="constant is"+cons %>
<%="sum is:"+sum %>

</body>
</html>
