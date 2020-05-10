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

<title>Adoption Supervisor Work Area</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/logout" method="get" class="form-inline">
	<input type="submit" value="Logout" class="form-control">
	<p>You're signed in as ${sessionScope.user.name}</p>
</form>

<h1 class="page-header text-center">Adoption Supervisor Work Area</h1>
<form action="${contextPath}/adoptionSupervise/superviseNew" method="get" class="form-inline">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th></th>
				<th>Application ID</th>
				<th>Application Date</th>
				<th>Animal ID</th>
				<th>Animal Type</th>
				<th>Adopter Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.records}">
				<tr>
					<td><input type="radio" name="recordSelected" value="${item.id}"></td>
					<td>${item.id}</td>
					<td>${item.date}</td>
					<td>${item.animal.animalId}</td>
					<td>${item.animal.type}</td>
					<td>${item.adopter.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="Evaluate Selected Application" class="form-control text-center">
</form>
</body>
</html>