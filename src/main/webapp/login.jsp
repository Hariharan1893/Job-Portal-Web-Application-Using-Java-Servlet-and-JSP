<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="Components/allStyles.jsp"%>

</head>
<body style="background: #f0f1f2">
	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class=" col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body mx-auto">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
						</div>

						<form action="login" method="post">

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
								Login</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>