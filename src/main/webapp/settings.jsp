<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Settings</title>
<style>
.card:hover {
	background-color: lightgray;
}

.card i {
	margin-bottom: 20px;
}
a{
	text-decoration:none!important;
}
</style>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center my-5">Hello, ${obj.getName() }</h3>
	<div class="container my-5" style="height: 56vh">
		<div class="row my-3">
			<div class="col-md-4">
				<a href="sellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h4>Sell old books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="RemoveBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							<h4>Remove old books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="loginAndSecurity.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-sharp fa-solid fa-address-card fa-3x text-primary"></i>
							<h4>Login and Security</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<a href="manageAddress.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-location-dot fa-3x text-warning"></i>
							<h4>Manage Address</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="myOrders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-danger"></i>
							<h4>My orders</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="help.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-sharp fa-solid fa-circle-info fa-3x text-success"></i>
							<h4>Help center</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>	
	<%@ include file="components/footer.jsp"%>
</body>
</html>