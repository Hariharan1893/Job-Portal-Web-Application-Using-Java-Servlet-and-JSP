<style>
nav .navbar-nav li a {
	color: #F3F7EC !important;
	font-size: medium;
}

.navbar-brand {
	color: #F3F7EC !important;
	font-size: x-large;
}

.navbar .nav-item:hover .nav-link {
	background: #005C78;
	color: #F3F7EC;
	border-radius: 35px;
}
</style>



<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg bg-body-tertiary"
	style="background-color: #006989">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">UpZella</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house"></i> Home</a></li>

				<c:if test="${userObj.role eq 'admin'}">
					<li class="nav-item"><a class="nav-link" href="postJob.jsp"><i
							class="fa-solid fa-circle-plus"></i> Post Job</a></li>
					<li class="nav-item"><a class="nav-link" href="viewJob.jsp"><i
							class="fa-regular fa-eye"></i> View Job</a></li>
				</c:if>



			</ul>
			<form class="form-inline my-2 my-lg-0">
				<c:choose>
					<c:when test="${not empty userObj and userObj.role eq 'admin'}">
						<a href="admin.jsp" class="btn btn-light"> <i
							class="fas fa-user"></i> Admin
						</a>
						<a href="logout?userObj=${userObj}" class="btn btn-success"> <i
							class="fas fa-sign-in-alt"></i> LogOut
						</a>
					</c:when>
					<c:when test="${not empty userObj and userObj.role ne 'admin'}">
						<a href="userHome.jsp" class="btn btn-light"> <i
							class="fas fa-user"></i>
							${userObj.name }
						</a>
						<a href="logout?userObj=${userObj}" class="btn btn-success"> <i
							class="fas fa-sign-in-alt"></i> LogOut
						</a>
					</c:when>
					<c:otherwise>
						<a href="login.jsp" class="btn btn-primary"> <i
							class="fa-solid fa-right-to-bracket"></i> LogIn
						</a>
						<a href="signup.jsp" class="btn btn-success"> <i
							class="fa-regular fa-user"></i> SignUp
						</a>
					</c:otherwise>
				</c:choose>
			</form>


		</div>
	</div>
</nav>
