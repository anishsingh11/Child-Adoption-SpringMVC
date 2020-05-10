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

<title>Animal Rescue Center - Login Page</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Login As Employee</h1>
	<FORM ACTION="${contextPath}/user/loginAsEmployee" METHOD="POST" class="form-inline text-center">
		<div class="form-group text-center">
			<label for="employeeid">Employee ID: </label>
			<input TYPE="TEXT" NAME="employeeid" class="form-control">
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="password">Password: </label>
			<INPUT TYPE="PASSWORD" NAME="password" class="form-control">
		</div>
		<br><br>
		<div>
			<INPUT TYPE="SUBMIT" VALUE="Login" class="form-control">
		</div>
		<br><br>
		<a href="${contextPath}/user/loginAsAdopter.htm">Login as Adopter</a>
	</FORM>
</body>
</html>