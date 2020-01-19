<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="/task-manager/app" />
<% String currentTheme = (String)session.getAttribute("currentTheme");%>
<!DOCTYPE html>
<html>
<head> 
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/dashboard_common.css">
	<link rel="stylesheet" href="${context}/css/app_common.css">
	<link rel="stylesheet" href="${context}/css/settings.css">
	<c:if test="${currentTheme eq 'dark'}">
		<link id="dark-theme" rel="stylesheet" href="${context}/css/app-dark-theme.css">
	</c:if>
</head>
<body>
	<div class="wrapper main-container">
		<div class="side-bar" id="sidebar">
			<jsp:include page="sideMenu.jsp"></jsp:include>
		</div>
		<div class="main-board content">
			<h1 class="text-center" style="margin-top: 18%; margin-bottom: 2%; color: #ccdcdc; font-size:75px; font-weight: bolder;">404</h1>
			<h2 class="text-center" style=" font-weight: bold;color: #dcdcdc; margin-bottom: 2%;">Page Not Found</h2>
			<p class="text-center" style="line-height: 25px;">The page you are looking for does not exists 
				<br> <a href="javascript:window.history.back()">Go back</a> </p>
		</div>
	</div>
</body>