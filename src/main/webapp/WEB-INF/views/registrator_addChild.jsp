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

<title>Registrar Work Area - Register New</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Registrator - Add New Child</h1>
	<div class="main">
	<div class="logIn">
	<form action="${contextPath}/registration/newChild" method="post"  enctype="multipart/form-data" commandName="model" class="form-inline text-center">
		<div class="form-group text-center">
			<label for="type">Name: </label>
			<input type="text" name="name" class="form-control" required="required"><br>
		</div>
		<br><br>
                <div class="form-group text-center">
			<label for="type">Race: </label>
			<input type="text" name="type" class="form-control" required="required"><br>
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="gender">Gender: </label>
                        <input type="radio" id="male" name="gender" value="Male" required="required">
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="gender" value="Female" required="required">
                        <label for="female">Female</label>
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="color">Complexion: </label>
			<input type="text" name="color" class="form-control" required="required">
		</div>
                <br><br>
		<div class="form-group text-center">
			<label for="age">Age: </label>
			<input type="number" name="age" class="form-control" min="0" required="required">
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="photo">Select Photo: </label>
			<input type="file" name="photo" class="form-control" required="required">
		</div>
		<br><br>
		<div>
			<input type="submit" value="Register" class="form-control submitbtn">
		</div>
	</form>
	</div>
	</div>
</body>
</html>