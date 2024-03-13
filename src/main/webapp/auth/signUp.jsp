<%--
  Created by IntelliJ IDEA.
  User: bigirabagaboblaise
  Date: 14/02/2024
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="signup" method="post">
    <input type="text" name="username" id="username" placeholder="Username"/>
    <input type="email" name="email" id="email" placeholder="Email"/>
    <input type="password" name="password" id="password" placeholder="Password"/>
    <input type="number" name="age" id="age" placeholder="age"/>
    <input type="number" name="amount" id="amount" placeholder="amount"/>
     <select name="accountType" id="accountType">
     <option value="saving account">current account</option>
     <option value="saving account">saving account</option>
     </select>
    <input type="submit" value="Sign Up">
    <p>Already have an account? <a href="login.jsp">Login</a></p>

</form>
</body>
</html>
