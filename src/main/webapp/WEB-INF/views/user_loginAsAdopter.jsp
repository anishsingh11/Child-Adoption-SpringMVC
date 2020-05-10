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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Child Rescue Center - Login Page</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Adopter Login</h1>
	<div class="main">
	<div class="logIn">
	<FORM ACTION="${contextPath}/user/loginAsAdopter" METHOD="POST" class="form-inline text-center">
		<TABLE class="text-center">
			<div class="form-group text-center">
				<label for="email">Email: </label>
				<INPUT TYPE="TEXT" NAME="email" class="form-control">
			</div>
			<br><br>
			<div class="form-group text-center">
				<label for="password">Password: </label>
				<INPUT TYPE="PASSWORD" NAME="password" class="form-control">
			</div>
			<br><br>
			<div class="form-group text-center">
				<INPUT TYPE="SUBMIT" VALUE="Log In" class="form-control submitbtn">
			</div>
			<br><br>
			<a href="${contextPath}/user/signup.htm" class="anchor">Sign up as new Adopter</a>
			&nbsp;&nbsp;&nbsp;
			<a href="${contextPath}/user/loginAsEmployee.htm" class="anchor">Login as Employee</a>
		</TABLE>
	</FORM>
	</div>
</div>
</body>
</html>