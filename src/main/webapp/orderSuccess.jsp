<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp" %>
<title>Thank You</title>
</head>
<body>
	<%@ include file="components/navbar.jsp" %>
	<c:if test="${empty obj }">
		<c:redirect url="index.jsp"></c:redirect>
	</c:if>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank you</h1>
		<h2>Your order successfully placed</h2>
		<h5>within 7 days your product will be delivered in your address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="myOrders.jsp" class="btn btn-danger mt-3"> View Orders</a>
	</div>
</body>
</html>