<%@page import="com.entities.*"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% User user = (User)session.getAttribute("obj"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>View Book</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			BookDetails b = bookdao.getBookById(id);
			%>
			<div class="col-md-6 text-center p-5">
				<img src="books/<%=b.getPhoto()%>"
					style="width: 50%; height: 300px; margin: 15px auto;">
				<h4>
					Book Name: <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookcategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 ">
				<h2><%=b.getBookname()%></h2>
				<%
				if (b.getBookcategory().equals("old")) {
				%>
				<h4> Contact to <a href="#!"><%=b.getEmail()%></a></h4>
				<div class="row">
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-rotate-left fa-2x mx-3"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-truck fa-2x mx-3"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 my-3">
						<a href="index.jsp" class="btn btn-success"><i
							class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a
							href="#" class="btn btn-primary"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
				<%
				} else {
				%>
				<h4> Contact to <a href="#!"><%=b.getEmail()%></a></h4>
				<div class="row">
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-rotate-left fa-2x mx-3"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-danger my-5">
						<i class="fa-solid fa-truck fa-2x mx-3"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 my-3">
						<%if(user==null){
							%>
								<a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 							
							<%
						}else{
							%>
								<a href="CartServlet?bid=<%=b.getBookid() %>&uid=<%=user.getId() %>" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%
						} %>
						<a href="#" class="btn btn-primary"><i
							class="fa-solid fa-cart-shopping"></i> Add to cart</a> 
							<a href="#"
							class="btn btn-primary"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>