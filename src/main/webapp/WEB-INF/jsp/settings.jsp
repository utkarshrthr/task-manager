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
			<div class="search-container" style="height: 60px;">
				<h5 style="width:200px; float: left;font-weight: bolder; line-height: 35px;">App Settings:</h5>
				<jsp:include page="actionMenu.jsp"></jsp:include>
			</div> 
			<div class="settings-container">
				<div class="row">
					<div class="col-md-2" style="line-height:34px; ">
						<b>Theme:</b>	
					</div>
					<div class="col-md-3">
						<div class="switch">
  							<button class="slider round"></button>
						</div> 
						<span class="current-theme">Light Mode</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${context}/js/settings.js"></script>
</body>