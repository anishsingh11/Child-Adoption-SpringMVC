<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrator Work Area</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form action="${contextPath}/user/logout" method="get" class="form-inline">
		<input type="submit" value="Logout" class="form-control">
		<p>You're signed in as ${sessionScope.user.name}</p>
	</form>
	
	
	<h1 class="page-header text-center">Registrator Work Area</h1>
	<a href="${contextPath}/registration/newAnimal.htm">Register new animal</a>
	
	<c:if test="${isEmpty}">
		<p>${message}</p>
	</c:if>

<c:if test="${!isEmpty}">
	<table class="table table-striped">
	<thead>
		<tr>
			<th>Date</th>
			<th>Animal ID</th>
			<th>Type</th>
			<th>Gender</th>
			<th>Color</th>
			<th>Status</th>
			<th>Registrator</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="record" items="${sessionScope.rescueRecordList}">
			<tr>
				<td>${record.date}</td>
				<td>${record.animal.animalId}</td>
				<td>${record.animal.type}</td>
				<td>${record.animal.gender}</td>
				<td>${record.animal.color}</td>
				<td>${record.animal.status}</td>
				<td>${record.registrator.name}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	</table>
</c:if>
</body>
</html>