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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Adopter - Child Detail</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h1 class="page-header text-center">Adopter - Child Detail</h1>
<div class="table-div">
<table class="table flat-table">
	<thead>
	<tr>
		<th>Child ID</th>
                <th>Name</th>
		<th>Race</th>
		<th>Gender</th>
                <th>Age</th>
		<th>Complexion</th>
		<th>Photo</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>${sessionScope.childViewed.childId}</td>
                <td>${sessionScope.childViewed.name}</td>
		<td>${sessionScope.childViewed.type}</td>
		<td>${sessionScope.childViewed.gender}</td>
                <td>${sessionScope.childViewed.age}</td>
		<td>${sessionScope.childViewed.color}</td>
		<td><img width="150" src="${pageContext.request.contextPath}/resources/theme/images/5.jpg" alt="photo" /></td>
	</tr>
</tbody>
</table>

<form action="${contextPath}/adopter/childDetail" method="post" class="form-inline text-center">
<input type="submit" value="Apply for Adoption" class="form-control submitbtn">
</form>
</div>
</body>
</html>