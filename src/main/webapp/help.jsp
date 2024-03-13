<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Help Center</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("obj");
	%>
	<div class="container text-center" style="height: 100vh;">
		<c:if test="${empty obj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		<div class="row my-5">
			<div class="col-md-12">
				<i class="fa-solid fa-circle-info fa-4x my-3"></i>
				<h3>24 / 7 Service</h3>
				<h3>Helpline number</h3>
				<h3>+91-0123456789</h3>
				<h3>Helpline email</h3>
				<h3>abc123@ebook.com</h3>
				<a href="index.jsp" class="btn btn-primary">Home</a>
			</div>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>