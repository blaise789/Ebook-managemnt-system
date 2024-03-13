<%@page import="com.db.ConnectionProvider"%>
<%@page import="com.dao.BookDAOImplement"%>
<%@ page import="java.util.*" %>
<%@ page import="com.entities.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<c:if test="${empty obj }">
	<c:redirect url="../login.jsp"></c:redirect>
</c:if>
<meta charset="ISO-8859-1">
<%@ include file="/components/css.jsp"%>
<title>All Books</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<h3 class="text-center my-3">Hello, Admin</h3>
	<div class="container-fluid">
		<c:if test="${not empty successmsg }">
			<div class="alert alert-success my-2">${successmsg }</div>
			<c:remove var="successmsg" scope="session"/>
		</c:if>
		<c:if test="${not empty failedmsg }">
			<div class="alert alert-success my-2">${failedmsg }</div>
			<c:remove var="failedmsg" scope="session"/>
		</c:if>
		<table class="table text-center">
			<thead class="thead bg-primary text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Image</th>
					<th scope="col">Status</th>
					<th scope="col">User</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
					List<BookDetails> list =  bookdao.getAllBooks();
					for(BookDetails bookDetails : list){
						%>
							<tr>
								<td><%=bookDetails.getBookid()  %></td>
								<td><%=bookDetails.getBookname() %></td>
								<td><%=bookDetails.getAuthor() %></td>
								<td><%=bookDetails.getPrice() %></td>
								<td><%=bookDetails.getBookcategory() %></td>
								<td><img src="../books/<%=bookDetails.getPhoto() %>" width="50px"></td>
								<td><%=bookDetails.getStatus() %></td>
								<td><%=bookDetails.getEmail() %></td>
								<td>
									<a href="edit_book.jsp?id=<%=bookDetails.getBookid() %>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
									<a href="../DeleteBook?id=<%=bookDetails.getBookid() %>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
								</td>
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