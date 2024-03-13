<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Ebook: Login</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid" style="height:100vh;">
		<c:if test="${not empty successmsg }">
			<div class="alert alert-success mt-2" role="alert">${successmsg }</div>
			<c:remove var="successmsg" scope="session"></c:remove>
		</c:if>
		<c:if test="${not empty failedMsg }">
			<div class="alert alert-danger mt-2" role="alert">${failedMsg }</div>
			<c:remove var="failedMsg" scope="session"></c:remove>
		</c:if>
		<div class="row my-5  align-items-center justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header bg-primary text-white"><h3>Login</h3></div>
					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required name="email">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" required name="password">
							</div>
							<button type="submit" class="btn btn-primary">Login</button>
							<div class="my-3">
								<a href="register.jsp">Create account</a>								
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="components/footer.jsp"%>
</body>
</html>