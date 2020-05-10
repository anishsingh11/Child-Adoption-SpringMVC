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

<title>Doctor Work Area</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/logout" method="get" class="form-inline">
<p class="welcome">Welcome, ${sessionScope.user.name}</p>
	<input type="submit" value="Logout" class="form-control submitbtn logout">
</form>

<h1 class="page-header text-center">Doctor Work Area</h1>

<c:if test="${isEmpty}">
	<p>${message}</p>
</c:if>

<c:if test="${!isEmpty}">
<form action="${contextPath}/doctor/newTreat" method="get" class="form-inline">
<div class="table-div">
	<table class="table table-striped table-hover flat-table">
		<thead>
			<tr>
				<th></th>
				<th>Registration Date</th>
				<th>Child ID</th>
                                <th>Name</th>
				<th>Race</th>
				<th>Gender</th>
                                 <th>Age</th>
				<th>Complexion</th>
				<th>Status</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="record" items="${sessionScope.rescueRecordList}">
				<tr>
					<td>
						<c:if test="${record.child.isNotTreated()}">
							<input type="radio" name="childSelected" value="${record.childid}">
						</c:if>
   
					</td>
					<td>${record.date}</td>
					<td>${record.child.childId}</td>
                                        <td>${record.child.name}</td>
					<td>${record.child.type}</td>
					<td>${record.child.gender}</td>
                                         <td>${record.child.age}</td>
					<td>${record.child.color}</td>
					<td>${record.child.status}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<input type="submit" value="Treat Selected Child" class="form-control text-center submitbtn treat">
</form>
</c:if>
</body>
</html>