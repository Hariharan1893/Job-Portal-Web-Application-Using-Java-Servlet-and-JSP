<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.Connection" %>
<%@page import="com.database.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job Portal</title>

<%@include file="Components/allStyles.jsp" %>

<style type="text/css">
	.back-img{
		background : url("Images/job_search_portals.webp");
		width: 100%;
		height: 89vh;
		background-repeat: no-repeat;
		background-size: cover;
	}
</style>

</head>
<body>
	<%@include file="Components/navbar.jsp" %>

	
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-black p-4">
				<i class="fa fa-book" aria-hidden="true"></i>
				UpZella - Job Portal
			</h1>
		</div>
	</div>
	
	<%@include file="Components/footer.jsp" %>
</body>
</html>