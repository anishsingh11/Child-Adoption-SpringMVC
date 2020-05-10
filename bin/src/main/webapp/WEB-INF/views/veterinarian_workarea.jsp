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
<form action="${contextPath}/user/logout" method="get" class="form-inline">
	<input type="submit" value="Logout" class="form-control">
	<p>You're signed in as ${sessionScope.user.name}</p>
</form>

<h1 class="page-header text-center">Veterinarian Work Area</h1>

<c:if test="${isEmpty}">
	<p>${message}</p>
</c:if>

<c:if test="${!isEmpty}">
<form action="${contextPath}/veterinarian/newTreat" method="get" class="form-inline">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th></th>
				<th>Registration Date</th>
				<th>Animal ID</th>
				<th>Type</th>
				<th>Gender</th>
				<th>Color</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="record" items="${sessionScope.rescueRecordList}">
				<tr>
					<td>
						<c:if test="${record.animal.isNotTreated()}">
							<input type="radio" name="animalSelected" value="${record.animalid}">
						</c:if>
   
					</td>
					<td>${record.date}</td>
					<td>${record.animal.animalId}</td>
					<td>${record.animal.type}</td>
					<td>${record.animal.gender}</td>
					<td>${record.animal.color}</td>
					<td>${record.animal.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="submit" value="Treat Selected Animal" class="form-control text-center">
</form>
</c:if>
</body>
</html>