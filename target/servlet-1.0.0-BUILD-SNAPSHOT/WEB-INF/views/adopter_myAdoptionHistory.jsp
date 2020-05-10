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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Adopter - My Adoption History</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h1 class="page-header text-center">Adopter - My Adoption History</h1>
<a href="${contextPath}/adopter/dashboard" class="anchor return">Return to dashboard</a>
<div class="table-div">
	<table class="table table-striped table-hover flat-table">
		<thead>
			<tr>
				<th>Date</th>
				<th>Child ID</th>
                                <th>Name</th>
				<th>Race</th>
				<th>Gender</th>
                                <th>Age</th>
				<th>Complexion</th>
				<th>Photo</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.myAdoptions}">
				<tr>
					<td>${item.date}</td>
					<td>${item.child.childId}</td>
                                        <td>${item.child.name}</td>
					<td>${item.child.type}</td>
					<td>${item.child.gender}</td>
                                        <td>${item.child.age}</td>
					<td>${item.child.color}</td>
					<td><img width="150" src="${pageContext.request.contextPath}/resources/theme/images/5.jpg" alt="photo" /></td>
					<td>${item.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>