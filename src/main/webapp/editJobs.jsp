<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.dao.* , com.entity.*, com.database.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
<%@include file="Components/allStyles.jsp"%>
</head>
<body style="background: #f0f1f2">
	<%@include file="Components/navbar.jsp"%>


	<c:if test="${userObj.role ne 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						jobDAO dao = new jobDAO(DbConnection.getCon());
						Jobs j = dao.getJobsById(id);
						%>


						<h5>Edit Jobs</h5>
					</div>

					<form action="UpdateJob" method="post">

						<input type="hidden" value="<%=j.getId() %>" name="id" />

						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>" />
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="location">

									<option selected><%=j.getLocation()%></option>
									<option value="Chennai">Chennai..</option>
									<option value="Bangalore">Bangalore..</option>
									<option value="Trivandrum">Trivandrum..</option>
									<option value="Hydrabad">Hydrabad..</option>
									<option value="Noida">Noida..</option>
									<option value="Guargon">Guargon..</option>

								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="category">

									<option selected><%=j.getCategory()%></option>
									<option value="Tester">Tester..</option>
									<option value="Developer">Developer..</option>
									<option value="Netword Eng">Netword Eng..</option>
									<option value="Devops">Devops..</option>
									<option value="Cyber Security">Cyber Security..</option>
									<option value="Cloud Tech">Cloud Tech..</option>

								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select class="custom-select"
									id="inlineFormCustomSelectPref" name="status">
									<option selected><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="InActive" value="InActive">Inactive</option>

								</select>
							</div>

							<div class="form-group">
								<label>Description</label>
								<textarea required rows="6" cols="" name="description"
									class="form-control">
									<%=j.getDescription()%>
									</textarea>
							</div>

							<button class="btn btn-success mt-3">Update jobs</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>