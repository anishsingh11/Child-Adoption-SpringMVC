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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Doctor - Treat a Child</title>
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<h1 class="page-header text-center">Doctor - Treat a Child</h1>
		<div class="">
	<div class="">
	<div class="table-div">
	<table class="table table-striped table-hover flat-table">
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
			<td>${sessionScope.childTreated.childId}</td>
                        <td>${sessionScope.childTreated.name}</td>
			<td>${sessionScope.childTreated.type}</td>
			<td>${sessionScope.childTreated.gender}</td>
                         <td>${sessionScope.childTreated.age}</td>
			<td>${sessionScope.childTreated.color}</td>
			<td><img width="150" src="${pageContext.request.contextPath}/resources/theme/images/5.jpg" alt="photo" /></td>
		</tr>
	</tbody>
	</table>
</div>
<form action="${contextPath}/doctor/newTreat" method="post">
<input type="submit" value="Finish treatment" class="form-control text-center submitbtn">
</form>
</div></div>
</body>
</html>