<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty obj }">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<meta charset="ISO-8859-1">
<%@ include file="/components/css.jsp"%>
<title>Ebook: Admin Home</title>
<style>
.row a{
	text-decoration:none;
}
.card:hover {
	background-color: lightgray;
}

.card i {
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<h2 class="text-center my-4">Hello, Welcome to Admin Home page</h2>

	<div class="container my-5" style="height: 56vh">
		<div class="row">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-circle-plus fa-3x text-primary"></i>
							<h4>Add Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i>
							<h4>All Books</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box fa-3x text-warning"></i>
							<h4>Orders</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#logoutModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i>
							<h4>Logout</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<%@ include file="/components/footer.jsp"%>
</body>
</html>