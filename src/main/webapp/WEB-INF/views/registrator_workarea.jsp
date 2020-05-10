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
<link href="${pageContext.request.contextPath}/resources/theme/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,400i,600,600i,700,700i,900&display=swap" rel="stylesheet">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form action="${contextPath}/user/logout" method="get" class="form-inline">
		<p class="welcome">Welcome, ${sessionScope.user.name}</p>
		<input type="submit" value="Logout" class="form-control submitbtn logout">
		
	</form>
	
	
	<h1 class="page-header text-center">Registrar Work Area</h1>
	<a href="${contextPath}/registration/newChild.htm" class="anchor return">Register new Child</a>
	
	<c:if test="${isEmpty}">
		<p>${message}</p>
	</c:if>

<c:if test="${!isEmpty}">
<div class="table-div">
	<table class="table table-striped flat-table">
	<thead>
		<tr>
			<th>Date</th>
			<th>Child ID</th>
                        <th>Name</th>
			<th>Race</th>
			<th>Gender</th>
                        <th>Age</th>
			<th>Complexion</th>
			<th>Status</th>
			<th>Registrar</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="record" items="${sessionScope.rescueRecordList}">
			<tr>
				<td>${record.date}</td>
				<td>${record.child.childId}</td>
                                <td>${record.child.name}</td>
				<td>${record.child.type}</td>
				<td>${record.child.gender}</td>
                                <td>${record.child.age}</td>
				<td>${record.child.color}</td>
				<td>${record.child.status}</td>
				<td>${record.registrator.name}</td>
			</tr>
		</c:forEach>
	</tbody>
	
	</table>
	</div>
</c:if>
</body>
</html>