<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="/task-manager/app" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String currentTheme = (String)session.getAttribute("currentTheme");%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/dashboard_common.css">
	<link rel="stylesheet" href="${context}/css/user_dashboard.css">
	<link rel="stylesheet" href="${context}/css/app_common.css">
	<link rel="stylesheet" href="${context}/css/notes.css">
	<link rel="stylesheet" href="${context}/css/bootstrap-tagsinput.css">
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
			<div class="search-container">
				<div class="search-field">
					<input type="search" class="form-control search" placeholder="Search your notes...">
				</div>
				<jsp:include page="actionMenu.jsp"></jsp:include>
			</div>
			<div id="notes-container">
				<c:if test="${fn:length(notes) gt 0}">
					<c:forEach var="note" items="${notes}">
						<div class='note'>
							<a href='#' class='btn btn-block a-btn-slide-text note-delete' onclick='deleteNote(this, <c:out value="${note.id}" />)'> 
								<i class='fa fa-trash-alt' aria-hidden='true'></i> 
							</a>
							<a href='#' class='btn btn-block a-btn-slide-text note-delete note-edit' onclick='editNote(this, <c:out value="${note.id}" />)'> 
								<i class='fa fa-pencil-alt' aria-hidden='true'></i>   
							</a>
							<span class='note-x'>&times;</span> 
							<h4 class='note-title'>
								<c:out value="${note.title}" />
								<span class='note-date'>
									<c:out value="${note.commonData.createdOn}" />
								</span> 
							</h4>
							<p class='note-content'>
								<c:out value="${note.content}" />
								<span class="read-more" onclick="toggleFullScreen(this)"><b>&nbsp;&nbsp;&nbsp;More</b></span>
							</p>
							<p class='note-tags'>
								<c:if test="${fn:length(note.tags) gt 0}">
									<c:forEach var="tag" items="${note.tags}">
										<span class='tag'>
											<c:out value="${tag}" />
										</span>
									</c:forEach>
								</c:if>
							</p>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${fn:length(notes) eq 0}">
					<div id="no-note-container">	
						<h1 id="no-note-msg">Nothing Here!!!</h1>
						<div class="text-center">
							<button id="add-first-note" class="btn btn-primary" data-toggle="modal" data-target="#new-task-modal" >Add Now</button>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<jsp:include page="modals/user-note/user-new-note.jsp"></jsp:include>

	<script src="${context}/js/notes.js"></script>
	<script src="${context}/js/bootstrap-tagsinput.min.js"></script>
</body>
</html>
