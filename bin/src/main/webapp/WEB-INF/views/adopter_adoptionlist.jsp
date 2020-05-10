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

<title>Veterinarian Work Area</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h1 class="page-header text-center">Adopter - Adoption List</h1>
<form action="${contextPath}/adopter/animalDetail" method="get" class="form-inline">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th></th>
				<th>Animal ID</th>
				<th>Type</th>
				<th>Gender</th>
				<th>Color</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.adoptionList}">
				<tr>
					<td>
						<input type="radio" name="animalViewed" value="${item.animalId}">
					</td>
					<td>${item.animalId}</td>
					<td>${item.type}</td>
					<td>${item.gender}</td>
					<td>${item.color}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="form-group text-center">
		<input type="submit" value="View Animal Detail" class="form-control text-center">
	</div>
</form>
</body>
</html>