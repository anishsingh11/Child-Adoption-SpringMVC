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

<title>Admin - Report</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/logout" method="get" class="form-inline">
	<input type="submit" value="Logout" class="form-control">
</form>

<h1 class="page-header text-center">Adopter - My Adoption History</h1>
	<br>
	<h4>Total count of rescued animal : ${total}</h4>
	
	<br>
	<h4>Percentage by Type</h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Dogs</th>
				<th>Cats</th>
				<th>Other</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${dogPercentage}</td>
				<td>${catPercentage}</td>
				<td>${otherPercentage}</td>
			</tr>
		</tbody>
	</table>
	
	<br>
	<h4>Percentage by Gender</h4>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Male</th>
				<th>Female</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${malePercentage}</td>
				<td>${femalePercentage}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>