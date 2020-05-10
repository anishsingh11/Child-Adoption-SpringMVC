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

<title>Admin - Report</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<form action="${contextPath}/user/logout" method="get" class="form-inline">
	<input type="submit" value="Logout" class="form-control logout submitbtn">
</form>

<h1 class="page-header text-center">Admin Dashboard</h1>
	<br>
	<h4>Total count of rescued Children : <span class="spancss">${total}</span></h4>
	
	<br>
	
	<h4>Rescued by Age</h4>
	<div class="table-div2">
	<table class="table table-bordered flat-table">
		<thead>
			<tr>
				<th>0 - 5</th>
				<th>5 - 10</th>
				<th>Others</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${age1Percentage}</td>
				<td>${age2Percentage}</td>
				<td>${otherPercentage}</td>
			</tr>
		</tbody>
	</table>
	</div>
	<br>
	<h4>Rescued by Gender</h4>
	<div class="table-div2">
	<table class="table table-bordered flat-table">
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
	</div> 
        <br>
        <div>
            <center><img src="${pageContext.request.contextPath}/resources/theme/images/piechart.png" alt="photo" /></center>
        </div>
</body>
</html>