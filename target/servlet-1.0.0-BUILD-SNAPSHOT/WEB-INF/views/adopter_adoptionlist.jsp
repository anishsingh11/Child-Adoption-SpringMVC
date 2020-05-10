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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Adopter - Adoption List</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<h1 class="page-header text-center">Adopter - Adoption List</h1>
			<div class="">
	<div class="table-div">
<form action="${contextPath}/adopter/childDetail" method="get" class="form-inline">
	<table class="table table-striped table-hover flat-table">
		<thead>
			<tr>
				<th></th>
				<th>Child ID</th>
                                <th>Name</th>
				<th>Race</th>
				<th>Gender</th>
                                 <th>Age</th>
				<th>Complexion</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${sessionScope.adoptionList}">
				<tr>
					<td>
						<input type="radio" name="childViewed" value="${item.childId}">
					</td>
					<td>${item.childId}</td>
                                        <td>${item.name}</td>
					<td>${item.type}</td>
					<td>${item.gender}</td>
                                        <td>${item.age}</td>
					<td>${item.color}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="form-group text-center">
		<input type="submit" value="View Child Detail" class="form-control text-center submitbtn">
	</div>
</form>
</div>
</div>
</body>
</html>