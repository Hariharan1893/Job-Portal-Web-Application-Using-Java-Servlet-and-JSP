<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<%@include file="Components/allStyles.jsp"%>


<style type="text/css">
.back-img {
	background: url("Images/adminImg.jpg");
	height: 88vh;
	width: 750px;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>

</head>
<body>

	<c:if test="${userObj.role ne 'admin'}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-white p-4">Welcome Admin</h1>
		</div>
	</div>

	<%@include file="Components/footer.jsp"%>

</body>
</html>