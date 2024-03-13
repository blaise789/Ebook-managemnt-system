<%@page import="com.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.db.*"%>
<%@page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User user = (User) session.getAttribute("obj");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="components/css.jsp"%>
<title>Search Books</title>
</head>
<body>
	<%@ include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			String ch = request.getParameter("ch");
			BookDAOImplement bookdao = new BookDAOImplement(ConnectionProvider.getConnection());
			List<BookDetails> list1 = bookdao.getBookBySearch(ch);
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
						<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-primary"><i
								class="fa-solid fa-cart-shopping"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="CartServlet?bid=<%=b.getBookid()%>&uid=<%=user.getId()%>"
								class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>
								Add Cart</a>
							<%
							}
							%>
						<%
						}
						%>
						<a href="view_books.jsp?id=<%=b.getBookid()%>"
							class="btn btn-primary"> View Detail</a> <a href="#"
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
	<%@ include file="components/footer.jsp"%>
</body>
</html>