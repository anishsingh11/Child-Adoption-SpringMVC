<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Veterinarian - Treat an animal</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Veterinarian - Treat Animal</h1>

	<table class="table table-striped table-hover">
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
			<td>${sessionScope.animalTreated.animalId}</td>
			<td>${sessionScope.animalTreated.type}</td>
			<td>${sessionScope.animalTreated.gender}</td>
			<td>${sessionScope.animalTreated.color}</td>
			<td><img width="150" src="${sessionScope.animalTreated.file}" alt="photo" /></td>
		</tr>
	</tbody>
	</table>

<form action="${contextPath}/veterinarian/newTreat" method="post">
<input type="submit" value="Finish treatment" class="form-control text-center">
</form>

</body>
</html>