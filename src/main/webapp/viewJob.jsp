<%@page
	import="com.database.DbConnection, com.dao.jobDAO, com.entity.Jobs, java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Job</title>
<%@include file="Components/allStyles.jsp"%>
</head>
<body style="background: #f0f1f2">


	<c:if test="${userObj.role ne 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="Components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All jobs</h5>


				<c:if test="${not empty SuccessMsg}">
					<div class="alert alert-success" role="alert">${SuccessMsg}</div>
					<c:remove var="SuccessMsg" />
				</c:if>


				<%
				jobDAO dao = new jobDAO(DbConnection.getCon());
				List<Jobs> list = dao.getAllJobs();

				for (Jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6>
							Title:
							<%=j.getTitle()%></h6>
						<p>
							Description:
							<%=j.getDescription()%></p>
						<br>

						<div class="form-row">
							<div class="form-group mb-3 col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>

							<div class="form-group mb-3 col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>

							<div class="form-group mb-3 col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>

						<h6>
							Publish Date:
							<%=j.getPdate()%></h6>


						<div class="text-center">
							<a href="editJobs.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="deleteJobs?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>
						</div>

					</div>
				</div>


				<%
				}
				%>

			</div>
		</div>
	</div>

</body>
</html>