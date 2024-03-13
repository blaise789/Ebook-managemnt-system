<%@page import="com.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.*"%>
<%@page import="com.db.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="components/css.jsp"%>
<meta charset="ISO-8859-1">
<title>Remove Old Book</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<c:if test="${empty obj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center my-5">Hello, ${obj.getName() }</h3>
	<div class="container">
		<c:if test="${not empty successmsg }">
			<div class="alert alert-success my-3">${successmsg }</div>
			<c:remove var="successmsg" scope="session"/>
		</c:if>
		<c:if test="${not empty failedmsg }">
			<div class="alert alert-danger my-3">${failedmsg }</div>
			<c:remove var="failedmsg" scope="session"/>
		</c:if>
		<div class="row">
			<div class="col-md-12">
				<table class="table border">
					<thead class="thead bg-primary text-white">
						<tr>
							<th scope="col">Book Name</th>
							<th scope="col">Author Name</th>
							<th scope="col">Price</th>
							<th scope="col">Image</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
							User user = (User)session.getAttribute("obj");
							BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
							List<BookDetails> list = bookdao.getOldBook(user.getEmail(), "old");
							for(BookDetails b : list){
								%>
									<tr>
										<td><%=b.getBookname() %></td>
										<td><%=b.getAuthor() %></td>
										<td><%=b.getPrice() %></td>
										<td><img src="books/<%=b.getPhoto() %>" width="50px"></td>
										<td><a href="RemoveOldBook?bid=<%=b.getBookid() %>&category=<%=b.getEmail() %>&email=<%=b.getBookcategory() %>" class="btn btn-danger text-white">Remove</a></td>
									</tr>
								<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>