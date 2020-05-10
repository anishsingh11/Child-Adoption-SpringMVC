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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Manager Dashboard</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/logout" method="get" class="form-inline">
<p class="welcome">Welcome, ${sessionScope.user.name}</p>
	<input type="submit" value="Logout" class="form-control submitbtn logout">
</form>

<h1 class="page-header text-center">Manager Dashboard</h1>
<form action="${contextPath}/adoptionSupervise/superviseNew" method="get" class="form-inline">
<div class="table-div">
	<table class="table table-striped table-hover flat-table">
		<thead>
			<tr>
				<th></th>
				<th>Application ID</th>
				<th>Application Date</th>
				<th>Child ID</th>
				<th>Name</th>
				<th>Adopter Email</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.records}">
				<tr>
					<td><input type="radio" name="recordSelected" value="${item.id}"></td>
					<td>${item.id}</td>
					<td>${item.date}</td>
					<td>${item.child.childId}</td>
					<td>${item.child.name}</td>
					<td>${item.adopter.email}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<input type="submit" value="Evaluate Selected Application" class="form-control text-center submitbtn treat">
</form>

</body>
</html>