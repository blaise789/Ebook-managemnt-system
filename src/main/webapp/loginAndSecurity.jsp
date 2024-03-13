<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Login and Security</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid" style="height: 100vh;">
		<c:if test="${empty obj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		<c:if test="${not empty successmsg }">
			<div class="alert alert-success my-3">${successmsg }</div>
			<c:remove var="successmsg" scope="session"/>
		</c:if>
		<c:if test="${not empty failedmsg }">
			<div class="alert alert-danger my-3">${failedmsg }</div>
			<c:remove var="failedmsg" scope="session"/>
		</c:if>
		<div class="row my-5  align-items-center justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header bg-primary text-white">
						<h3>Edit profile</h3>
					</div>
					<div class="card-body">
						<form action="UpdateProfile" method="post">
							<input type="hidden" name="id" value="${obj.id }">
							<div class="mb-3">
								<label for="exampleInputText1" class="form-label">Full Name</label> <input type="text" class="form-control"
									id="exampleInputText1" aria-describedby="emailHelp" required name="fname" value="${obj.name }">
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email</label>
								<input type="email" class="form-control"
									id="exampleInputEmail1" required name="email" value="${obj.email }">
							</div>
							<div class="mb-3">
								<label for="exampleInputTel1" class="form-label">Phone number</label>
								<input type="tel" class="form-control"
									id="exampleInputTel1" required name="phone_number" value="${obj.phone_number }">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required name="password" value="${obj.password }">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>