<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<%@include file="Components/allStyles.jsp"%>
</head>
<body style="background: #f0f1f2">

	<%@include file="Components/navbar.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored= "false" %> 

	<div class="container-fluid">
		<div class="row p-5">
			<div class=" col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body mx-auto">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration Page</h5>
						</div>
						
						<c:if test="${not empty SuccessMsg }">
							<h4 class="text-center text-success">${SuccessMsg }</h4>
							<c:remove var="SuccessMsg"/>
						</c:if>

						<form action="signUp" method="post">

							<div class="form-group">
								<label>Enter the Name</label> <input type="text"
									required="required" class="form-control" id="exampleInputName"
									name="name" />
							</div>

							<div class="form-group">
								<label>Enter the Qualification</label> <input type="text"
									required="required" class="form-control"
									id="exampleInputQualification" name="qualification" />
							</div>

							<div class="form-group">
								<label>Enter the Email id</label> <input type="email"
									required="required" class="form-control" id="exampleInputEmail"
									aria-describedby="emailHelp" name="email" />
							</div>

							<div class="form-group">
								<label>Enter the Password</label> <input type="password"
									required="required" class="form-control"
									id="exampleInputPassword1" name="password" />
							</div>

							<button type="submit"
								class="btn mt-4 btn-primary badge-pill btn-black">
								Register</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>