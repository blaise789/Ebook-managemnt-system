<%--
  Created by IntelliJ IDEA.
  User: bigirabagaboblaise
  Date: 14/02/2024
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
<div class="navbar">hello</div>
<form action="login" method="post">
    <input type="email" name="email" class="email" placeholder="Email">
    <input type="password" name="password" >
    <input type="submit" value="login">
    <p>Don't have an account?<a href="signUp.jsp">Sign Up</a></p>
</form>
 <p class="error">${error}</p>

</body>
</html>
