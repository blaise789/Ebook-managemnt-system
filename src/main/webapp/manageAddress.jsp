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
<title>Manage Address</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<% User user = (User)session.getAttribute("obj"); %>
	<div class="container" style="height: 100vh;">
		<c:if test="${empty obj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		<div class="row my-5  align-items-center justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header bg-primary text-white">
						<h3>Manage Address</h3>
					</div>
					<div class="card-body">
						<form action="#!" method="post">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Address</label> <input type="text" class="form-control"
										placeholder="Address">
								</div>
								<div class="form-group col-md-6">
									<label>Landmark</label> <input type="text" class="form-control"
										placeholder="Landmark">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>City</label> <input type="text" class="form-control"
										placeholder="City">
								</div>
								<div class="form-group col-md-4">
									<label>State</label> <input type="text" class="form-control"
										placeholder="State">
								</div>
								<div class="form-group col-md-4">
									<label>Pin code</label> <input type="number"
										class="form-control" placeholder="Pin code">
								</div>
							</div>
							<button type="submit" class="btn btn-primary">Add address</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>