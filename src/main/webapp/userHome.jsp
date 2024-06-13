<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*, com.database.*, com.dao.*, com.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@include file="Components/allStyles.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="Components/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="userSearch.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location:</h5>
							</div>
							<div class="form-group col-md-4 mt-1">
								<h5>Category:</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="location" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option selected value="location">Choose...</option>
									<Option value="">Chennai</Option>
									<Option value="">Bangalore</Option>
									<Option value="">Trivandrum</Option>
									<Option value="">Hydrabad</Option>
									<Option value="">Noida</Option>
									<Option value="">Guargon</Option>
								</select>
							</div>

							<div class="form-group col-md-5">
								<select name="category" class="custom-select"
									id="inlineFormCustomSelectPref">
									<option value="category" selected>Choose..</option>
									<Option value="Tester">Tester</Option>
									<Option value="Developer">Developer</Option>
									<Option value="Network Engineer">Network Engineer</Option>
									<Option value="Devops">Devops</Option>
									<Option value="Cyber Security">Cyber Security</Option>
									<Option value="Cloud Technology">Cloud Technology</Option>
								</select>
							</div>

							<button class="btn btn-success">Submit</button>

						</form>

						<%
							jobDAO dao = new jobDAO(DbConnection.getCon());
							List<Jobs> list = dao.getAllJobsForUsers();
							
							for(Jobs j : list){ %>

						<div class="card mt-2">
							<div class="card-body">
								<i class="far fa-clipboard fa-2x"></i>
							</div>

							<h6><%= j.getTitle() %></h6>

							<%
										if(j.getDescription().length() > 0 && j.getDescription().length() < 120){
									%>
							<p><%=j.getDescription() %></p>
							<%
										}
										else{
									%>
							<p><%=j.getDescription().substring(0,120) %>...
							</p>

							<% } %>

							<br>

							<div class="form-row">
								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
										value="Location: <%= j.getLocation() %>" readonly />
								</div>

								<div class="form-group col-md-3">
									<input type="text" class="form-control form-control-sm"
										value="Category: <%= j.getCategory() %>" readonly />
								</div>

							</div>

							<h6>
								Publish Date:
								<%= j.getPdate().toString() %></h6>

							<div class="text-center">
								<a href="singleJobView.jsp?id=<%= j.getId() %>"
									class="btn btn-sm bg-success text-white">View</a>
							</div>

						</div>

						<%}%>






					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>