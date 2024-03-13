<%@page import="com.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Old Books</title>
</head>
<body>
	<%@ include file="components/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<%
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			List<BookDetails> list1 = bookdao.getAllOldBook();
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
						<a href="#" class="btn btn-primary"><i
							class="fa-solid fa-cart-shopping"></i> Add Cart</a>
						<%
						}
						%>
						<a href="view_books.jsp?id=<%=b.getBookid() %>" class="btn btn-primary"> View Detail</a> <a href="#"
							class="btn btn-primary"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file="components/footer.jsp" %>
</body>
</html>