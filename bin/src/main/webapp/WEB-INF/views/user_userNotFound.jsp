<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Not Found</title>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<h4>User is invalid.</h4>
<a href="${contextPath}/user/loginAsAdopter.htm">Return to login page</a>
</body>
</html>