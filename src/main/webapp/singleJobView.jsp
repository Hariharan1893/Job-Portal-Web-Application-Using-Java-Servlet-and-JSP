<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="com.database.*, com.entity.*, com.dao.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Job View</title>
<%@include file="Components/allStyles.jsp"%>

</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${empty userObj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="Components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				jobDAO dao = new jobDAO(DbConnection.getCon());
				Jobs j = dao.getJobsById(id);
				%>

				<div class="card mt-5">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>

						<br>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly />
							</div>

							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly />
							</div>
						</div>

						<h6>
							Publish Date:
							<%=j.getPdate().toString()%>
						</h6>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>

</body>
</html>