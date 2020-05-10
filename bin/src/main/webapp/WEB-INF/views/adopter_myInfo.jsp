<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Adopter - My Info</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Adopter - My Info</h1>
	<form action="${contextPath}/adopter/myInfo" method="post" class="form-inline text-center">
		<div class="form-group">
			<label>Email: </label>
			${sessionScope.user.email}
		</div>
		<br><br>
		<div class="form-group">
			<label>First Name: </label>
			${sessionScope.user.firstName}
		</div>
		<br><br>
		<div class="form-group">
			<label>Last Name: </label>
			${sessionScope.user.lastName}
		</div>
		<br><br>
		<div class="form-group">
			<label>Gender: </label>
			${sessionScope.user.gender}
		</div>
		<br><br>
		<div class="form-group">
			<label for="phone">Phone: </label>
			<input type="text" name="phone" value="${sessionScope.user.phone}" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<label for="address">Address: </label>
			<input type="text" name="address" value="${sessionScope.user.address}" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<input type="submit" value="Save Change" class="form-control"><br>
		</div>
	</form>
</body>
</html>