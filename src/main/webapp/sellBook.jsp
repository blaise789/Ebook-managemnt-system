<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Sell Book</title>
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
						<h3>Sell Book</h3>
					</div>
					<div class="card-body">
						<form action="AddOldBook" method="post" enctype="multipart/form-data">
							<input type="hidden" name="email" value="${obj.email }">
							<div class="mb-3">
								<label for="exampleInputText1" class="form-label">Book
									Name</label> <input type="text" name="bname" class="form-control"
									id="exampleInputText1" aria-describedby="emailHelp" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputText1" class="form-label">Author Name</label>
								<input type="text" name="baname" class="form-control"
									id="exampleInputText1" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputNumber1" class="form-label">Price</label>
								<input type="number" name="bprice" class="form-control"
									id="exampleInputNumber1" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputFile1" class="form-label">Upload photo</label>
								<input type="file" accept="image/*" class="form-control" id="exampleInputFile1" required name="bimg">
							</div>
							<button type="submit" class="btn btn-primary">Sell book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>