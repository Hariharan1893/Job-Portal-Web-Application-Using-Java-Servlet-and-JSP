<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*, com.database.*, com.dao.*, com.entity.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Job Search</title>
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

				<%
					String location = request.getParameter("location");
					String category = request.getParameter("category");
					String message = "";
					
					jobDAO dao = new jobDAO(DbConnection.getCon());
					List<Jobs> list = null;
					
					if("location".equals(location) && "category".equals(category)){
						list = new ArrayList<Jobs>();
						message = "Sorry..No Jobs are Available";
					}else if("location".equals(location) || "category".equals(category)){
						list = dao.getJobsORLocationAndCategory(category, location);
					}else{
						list = dao.getJobsORLocationAndCategory(category, location);		
					}
					
					if(list.isEmpty()){
					
				%>
				<h4 class="text-center text-danger">No Jobs Available</h4>

				<%} 
					
					if(list != null){
						for(Jobs j : list){
				%>
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

				<%}}
					else{
					%>

				<h4 class="text-center text-danger"><%=message %></h4>

				<%} %>





			</div>
		</div>
	</div>





















</body>
</html>