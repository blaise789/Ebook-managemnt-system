<%@page import="java.util.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.db.*"%>
<%@page import="com.entities.*"%>
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
<title>Orders</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<h3 class="text-center">Hello Admin</h3>
	<div class="container-fluid">
		<table class="table">
			<thead class="thead bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone Number</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderDAOImplement bookorderdao = new BookOrderDAOImplement(ConnectionProvider.getConnection());
				List<BookOrder> list = bookorderdao.getAllOrders();
				for (BookOrder b : list) {
				%>
				<tr>
					<td><%=b.getOid() %></td>
					<td><%=b.getUsername() %></td>
					<td><%=b.getEmail() %></td>
					<td><%=b.getAddress() %></td>
					<td><%=b.getPhone() %></td>
					<td><%=b.getBookname() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPayment().toUpperCase() %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%@ include file="/components/footer.jsp"%>
</body>
</html>