<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.db.*"%>
<%@ page import="com.entities.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<% User user = (User)session.getAttribute("obj"); %>
<title>Ebook: Index</title>
<style>
* {
	scroll-behavior: smooth;
}

.back-img {
	height: 50vh;
	background: url("img/Books.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.card:hover {
	background-color: gainsboro;
}


/* Snackbar */
/* The snackbar - position it at the bottom and in the middle of the screen */
#snackbar {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #dc3545; /* Black background color */
  color: #fff; /* White text color */
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 90%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
  border-radius: 10px;
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
  visibility: visible; /* Show the snackbar */
  /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
</head>
<body>
	<div id="snackbar">Some text some message..</div>
	<%@ include file="components/navbar.jsp"%>
	<c:if test="${not empty successmsg }">
		<script>
			  var x = document.getElementById("snackbar");	
			  x.innerHTML = "${successmsg}";
			  // Add the "show" class to DIV
			  x.className = "show";	
			  // After 3 seconds, remove the show class from DIV
			  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		</script>
		<c:remove var="successmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedmsg }">
		<script>
			  var x = document.getElementById("snackbar");	
			  x.innerHTML = "${successmsg}";
			  // Add the "show" class to DIV
			  x.className = "show";	
			  // After 3 seconds, remove the show class from DIV
			  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		</script>
		<c:remove var="failedmsg" scope="session"/>
	</c:if>
	<div
		class="container-fluid-fluid d-flex align-items-end justify-content-center back-img">
		<h2 class="text-center text-white bg-primary p-2">Ebook
			Management System</h2>
	</div>
	<div class="container-fluid py-3 bg-light">
		<h3 class="text-center py-3 text-white bg-primary" id="recent-books">Recent
			Books</h3>
		<div class="row">

			<%
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			List<BookDetails> list1 = bookdao.getRecentBook();
			for (BookDetails b : list1) {
			%>
			<div class="col-md-3">
				<div class="card">
					<img src="books/<%=b.getPhoto()%>" class="card-img-top my-3"
						style="width: 50%; height: 300px; margin: 0 auto;">
					<div class="card-body">
						<h4><%=b.getBookname()%></h4>
						<p>
							Categories:
							<%=b.getBookcategory()%></p>

					</div>
					<div class="card-footer text-center ">

						<%
						if (b.getBookcategory().equals("new")) {
						%>	
							<%if(user==null){
							%>
								<a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 							
							<%
						}else{
							%>
								<a href="CartServlet?bid=<%=b.getBookid() %>&uid=<%=user.getId() %>" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%
						} %>
						<%
						}
						%>
						<a href="view_books.jsp?id=<%=b.getBookid() %>" class="btn btn-primary"> View Detail</a> 
						<a href="# %>"
							class="btn btn-primary"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center my-3">
			<a href="allRecentBook.jsp" class="btn btn-danger">View all</a>
		</div>
	</div>
	<div class="container-fluid py-3 bg-light">
		<h3 class="text-center py-3 text-white bg-primary" id="new-books">New
			Books</h3>
		<div class="row">
			<%
			List<BookDetails> list2 = bookdao.getNewBook();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card">
					<img src="books/<%=b.getPhoto()%>" class="card-img-top my-3"
						style="width: 50%; height: 300px; margin: 0 auto;">
					<div class="card-body">
						<h4><%=b.getBookname()%></h4>
						<p>
							Categories:
							<%=b.getBookcategory()%></p>

					</div>
					<div class="card-footer text-center ">
						<%if(user==null){
							%>
								<a href="login.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 							
							<%
						}else{
							%>
								<a href="CartServlet?bid=<%=b.getBookid() %>&uid=<%=user.getId() %>" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
							<%
						} %>
						<a href="view_books.jsp?id=<%=b.getBookid() %>" class="btn btn-primary"> View Detail</a> 
						<a href="#" class="btn btn-primary"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center my-3">
			<a href="allNewBook.jsp" class="btn btn-danger">View all</a>
		</div>
	</div>
	<div class="container-fluid py-3 bg-light">
		<h3 class="text-center py-3 text-white bg-primary" id="old-books">Old
			Books</h3>
		<div class="row">
			<%
			List<BookDetails> list3 = bookdao.getOldBook();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card">
					<img src="books/<%=b.getPhoto()%>" class="card-img-top my-3"
						style="width: 50%; height: 300px; margin: 0 auto;">
					<div class="card-body">
						<h4><%=b.getBookname() %></h4>
						<p>
							Categories:
							<%=b.getBookcategory()%></p>

					</div>
					<div class="card-footer text-center ">
						<a href="view_books.jsp?id=<%=b.getBookid() %>" class="btn btn-primary"> View Detail</a> <a href="# %>"
							class="btn btn-primary"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center my-3">
			<a href="allOldBook.jsp" class="btn btn-danger">View all</a>
		</div>
	</div>

	<%@ include file="components/footer.jsp"%>
</body>
</html>