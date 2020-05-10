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

<title>Adopter - My Adoption History</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h1 class="page-header text-center">Adopter - My Adoption History</h1>
<a href="${contextPath}/adopter/dashboard">Return to dashboard</a>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>Date</th>
				<th>Animal ID</th>
				<th>Type</th>
				<th>Gender</th>
				<th>Color</th>
				<th>Photo</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.myAdoptions}">
				<tr>
					<td>${item.date}</td>
					<td>${item.animal.animalId}</td>
					<td>${item.animal.type}</td>
					<td>${item.animal.gender}</td>
					<td>${item.animal.color}</td>
					<td><img width="150" src="${item.animal.file}" alt="photo" /></td>
					<td>${item.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>