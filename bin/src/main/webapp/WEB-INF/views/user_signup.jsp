<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Animal Rescue Center - Sign up!</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body class="text-center">
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Sign up Page</h1>
	<form action="${contextPath}/user/signup" method="post" class="form-inline">
		<div class="form-group">
			<label for="firstname">First Name: </label>
			<input type="text" name="firstname" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<label for="lastname">Last Name: </label>
			<input type="text" name="lastname" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<label for="gender">Gender: </label>
			<input type="text" name="gender" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<label for="email">Email: </label>
			<input type="email" name="email" required="required" class="form-control">
		</div>
		<br><br>
	 	<div class="form-group">
	 		<label for="phone">Phone Number: </label>
	 		<input type="text" name="phone" required="required" class="form-control">
	 	</div>
	 	<br><br>
	 	<div class="form-group">
	 		<label for="address">Address: </label>
	 		<input type="text" name="address" required="required" class="form-control">
	 	</div>
		<br><br>
		<div class="form-group">
			<label for="password">Password: </label>
			<input type="password" name="password" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group">
			<label for="password2">Confirm Your Password: </label>
			<input type="password" name="password2" required="required" class="form-control">
		</div>
		<br><br>
		<div class="form-group text-center">
			<input type="submit" value="Sign Up" class="form-control text-center">
		</div>
	
	</form>
</body>
</html>