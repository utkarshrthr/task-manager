<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="/task-manager/app" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Task Manager</title>
	<link rel="icon" href="images/logo1.png" type = "image/x-icon"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css"> 
	<link rel="stylesheet" href="css/home.css">
	<link rel="stylesheet" href="css/app_common.css">
	<link rel="stylesheet" href="css/nav.css">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="hea">
		<h1>Organize it all with us</h1>
		<a href="${context}/login" class="btn btn-danger" >
			<span><strong>Click here to begin</strong></span>
		</a>
	</div>
	<img src="images/home.jpg" class="im1">
	<script>
		$(function(){
			$("#nav-home").addClass("active");
		});
	</script>
</body>
</html>