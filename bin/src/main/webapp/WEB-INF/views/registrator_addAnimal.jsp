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

<title>Registrator Work Area - Register New</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Registrator - Add New Animal</h1>
	<form action="${contextPath}/registration/newAnimal" method="post"  enctype="multipart/form-data" commandName="model" class="form-inline text-center">
		<div class="form-group text-center">
			<label for="type">Type: </label>
			<input type="text" name="type" class="form-control"><br>
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="gender">Gender: </label>
			<input type="text" name="gender" class="form-control"><br>
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="color">Color: </label>
			<input type="text" name="color" class="form-control">
		</div>
		<br><br>
		<div class="form-group text-center">
			<label for="photo">Select Photo: </label>
			<input type="file" name="photo" class="form-control">
		</div>
		<br><br>
		<div>
			<input type="submit" value="Register" class="form-control">
		</div>
	</form>
</body>
</html>