<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>Adopter - Animal Detail</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1 class="page-header text-center">Adopter - Animal Detail</h1>
<table class="table">
	<thead>
	<tr>
		<th>Animal ID</th>
		<th>Type</th>
		<th>Gender</th>
		<th>Color</th>
		<th>Photo</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${sessionScope.animalViewed.animalId}</td>
		<td>${sessionScope.animalViewed.type}</td>
		<td>${sessionScope.animalViewed.gender}</td>
		<td>${sessionScope.animalViewed.color}</td>
		<td><img width="150" src="${sessionScope.animalViewed.file}" alt="photo" /></td>
	</tr>
</tbody>
</table>

<form action="${contextPath}/adopter/animalDetail" method="post" class="form-inline text-center">
<input type="submit" value="Apply for Adoption" class="form-control">
</form>

</body>
</html>