<%@page import="java.util.*"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
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
<title>Cart Page</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<c:if test="${not empty successmsg }">
			<div class="alert alert-success mt-3" role="alert">${successmsg }</div>
			<c:remove var="successmsg" scope="session"/>			
		</c:if>
		<c:if test="${not empty failedmsg }">
			<div class="alert alert-danger mt-3" role="alert">${failedmsg }</div>
			<c:remove var="failedmsg" scope="session"/>			
		</c:if>
		<div class="row mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">You selected items</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("obj");
								CartDAOImplement cartdao = new CartDAOImplement(ConnectionProvider.getConnection());
								List<Cart> cart = cartdao.getBookByUserId(user.getId());
								double totalprice = 0;
								for (Cart c : cart) {
									totalprice = c.getTotalprice();
								%>
									<tr>
										<td><%=c.getBookname() %></td>
										<td><%=c.getAuthor() %></td>
										<td><%=c.getPrice() %></td>
										<td><a href="RemoveCartBook?cid=<%=c.getCid() %>&bid=<%=c.getBid() %>&uid=<%=c.getUserid() %>" class="btn btn-danger">Remove</a></td>
									</tr>
								<%
								}
								%>
								<tr class="bg-dark text-white">
									<td><i class="fa-solid">Total Price</i></td>
									<td></td>
									<td></td>
									<td><i class="fa-solid fa-indian-rupee-sign"> <%=totalprice %></i></td>
								</tr>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your details for order</h3>
						<form action="OrderServlet" method="post">
							<input type="hidden" name="userid" value="${obj.id }">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Name</label> <input type="text" class="form-control"
										placeholder="Name" name="fname" value="<%=user.getName()%>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label>Email</label> <input type="email" class="form-control"
										placeholder="Email" name="email" value="<%=user.getEmail()%>" readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Phone number</label> <input type="tel"
										class="form-control" placeholder="Phone number" name="phone_number" value="<%=user.getPhone_number()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label>Address</label> <input type="text" class="form-control"
										placeholder="Address" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>Landmark</label> <input type="text" class="form-control"
										placeholder="Landmark" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label>City</label> <input type="text" class="form-control"
										placeholder="City" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label>State</label> <input type="text" class="form-control"
										placeholder="State" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label>Pin code</label> <input type="number"
										class="form-control" placeholder="Pin code" name="pincode" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label>Payment type</label> <select class="form-control" name="paymenttype">
										<option value="none">---Select---</option>
										<option value="cod">Cash on delivery</option>
										<option value="online">Online payment</option>
									</select>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<button class="btn btn-warning form-control">Order now</button>
								</div>
								<div class="form-group col-md-6">
									<a class="btn btn-success form-control">Continue shopping</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>