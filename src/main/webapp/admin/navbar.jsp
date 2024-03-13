<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid pt-2 pb-2 text-center ">
	<div class="row">
		<div class="col-md-3">
			<h3>
				<a href="../index.jsp"><i class="fa-solid fa-book"></i> Ebook</a>
			</h3>
		</div>
		<div class="col-md-6"></div>
		<div class="col-md-3">
			<c:if test="${not empty obj }">
				<a href="#!" class="btn btn-success"><i
					class="fa-solid fa-circle-user"></i> ${obj.name }</a>
				<a class="btn btn-primary text-white" data-toggle="modal"
					data-target="#logoutModal"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</c:if>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house"></i><span class="sr-only">(current)</span></a>
			</li>
		</ul>
	</div>
</nav>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-body text-center">
				<h4>Do you want to logout?</h4>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../LogoutServlet" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>
