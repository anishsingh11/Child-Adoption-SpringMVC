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

<title>Adoption Supervisor - Supervise Application</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1 class="page-header text-center">Supervise Adoption</h1>
<h3>Application Detail</h3>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Application Date</th>
			<th>Animal ID</th>
			<th>Type</th>
			<th>Adopter Name</th>
			<th>Adopter Email</th>
			<th>Adopter Phone</th>
			<th>Adopter Address</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${sessionScope.recordSelected.date}</td>
			<td>${sessionScope.animalSupervised.animalId}</td>
			<td>${sessionScope.animalSupervised.type}</td>
			<td>${sessionScope.adopterSupervised.firstName} ${item.adopterSupervised.lastName}</td>
			<td>${sessionScope.adopterSupervised.email}</td>
			<td>${sessionScope.adopterSupervised.phone}</td>
			<td>${sessionScope.adopterSupervised.address}</td>
		</tr>
	</tbody>
</table>


<form action="${contextPath}/adoptionSupervise/superviseNew" method="post" class="form-inline text-center">
	<div class="text-center">
		<div class="form-group">
			<input type="radio" name="statusSelected" value="approved" checked>
			<label for="statusSelected">Approve</label>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="form-group">
			<input type="radio" name="statusSelected" value="denied" checked>
			<label for="statusSelected">Deny</label>
		</div>
	</div>
	<br><br>
	<div class="form-group text-center">
		<input type="submit" value="Submit" class="form-control">
	</div>
</form>

</body>
</html>