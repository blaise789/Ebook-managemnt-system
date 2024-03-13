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
<title>My orders</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("obj");
	%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container-fluid" style="height: 100vh;">
		<c:if test="${empty obj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		<div class="row my-5">
			<div class="col-md-12">
				<table class="table">
					<thead class="thead bg-primary text-white">
						<tr>
							<th scope="col">Order id</th>
							<th scope="col">Name</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Payment type</th>
						</tr>
					</thead>
					<tbody>
						<%
						BookOrderDAOImplement bookdao = new BookOrderDAOImplement(ConnectionProvider.getConnection());
						List<BookOrder> list = bookdao.getBooks(user.getEmail());
						for (BookOrder b : list) {
						%>
						<tr>
							<td><b><%=b.getOid() %></b></td>
							<td><%=b.getUsername() %></td>
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
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>