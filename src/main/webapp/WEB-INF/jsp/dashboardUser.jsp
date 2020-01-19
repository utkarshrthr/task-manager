<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="/task-manager/app" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% String currentTheme = (String)session.getAttribute("currentTheme");%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/dashboard_common.css">
	<link rel="stylesheet" href="${context}/css/user_dashboard.css">
	<link rel="stylesheet" href="${context}/css/app_common.css">	
	<c:if test="${currentTheme eq 'dark'}">
		<link rel="stylesheet" href="${context}/css/app-dark-theme.css" id="dark-theme">
	</c:if>
</head>
<body>
	<div id="dashboard-user">
		<div class="wrapper main-container">
			<div class="side-bar" id="sidebar">
				<jsp:include page="sideMenu.jsp"></jsp:include>
			</div>
			<div class="main-board content">
				<div class="search-container">
					<div class="search-field">
						<input type="search" class="form-control search" placeholder="Search your tasks...">
					</div>
					<jsp:include page="actionMenu.jsp"></jsp:include>
				</div>
				<div id="summary">
					<h5>Summary</h5>
					<div class="summary-details">
						<div class="summary-section">
							<p class="summary-data">
								<span class="summary-title">Tasks</span>
								<span class="summary-count">20</span>
							</p>
							<p class="summary-data">
								<span class="summary-title">Mails</span>
								<span class="summary-count">8</span>
							</p>
						</div>
						<div class="summary-section">
							<p class="summary-data">
								<span class="summary-title">In Progress</span>
								<span class="summary-count">10</span>
							</p>
							<p class="summary-data">
								<span class="summary-title">Notes</span>
								<span class="summary-count">15</span>
							</p>
						</div>
						<div class="summary-section">
							<p class="summary-data">
								<span class="summary-title">Completed</span>
								<span class="summary-count">8</span>
							</p>						
							<p class="summary-data">
								<span class="summary-title">Documents</span>
								<span class="summary-count">5</span>
							</p>
						</div>
						<div class="summary-section" style="border: none;">
							<p class="summary-data">
								<span class="summary-title">Delayed</span>
								<span class="summary-count">7</span>
							</p>
							<p class="summary-data">
								<span class="summary-title">Reminders</span>
								<span class="summary-count">4</span>
							</p>
						</div>		
					</div>
					<div class="progress-container">
						<canvas id="myChart"></canvas>
					</div>
				</div>
				<div class="task-board">
					<div class="board" id="new-task-board">
						<div class="task-board-title">
							<h6>New</h6>
							<hr>
						</div>
					 	<c:forEach items="${tasks}" var="task" begin="0">
						<div class="task-card new-task">
							<h6 class="task-title">${task.taskTitle}</h6>
							<p class="">${task.description}</p>
							<p>
								<span class="task-category">Category</span> 
								<span class="task-date">Done By : <fmt:formatDate value="${task.doneBy}" pattern="dd/MM/yyyy" /></span>
							</p>
						</div>
						</c:forEach>
						<div class="show-all-container" id="show-all-container-new">
							<button class="btn btn-sm btn-block show-all-btn btn-outline-primary">Show All</button>
						</div>
					</div>
					<div class="board" id="progress-task-board">
						<div class="task-board-title">
							<h6 class="text-primary">In Progress</h6>
							<hr>
						</div>
						<div class="task-card progress-task">
							<h6 class="task-title">Title</h6>
							<p>Some description of the task</p>
							<p>
								<span class="task-category">Category</span> 
								<span class="task-date">22/12/2019</span>
							</p>
						</div>
						<div class="show-all-container" id="show-all-container-progress">
							<button class="btn btn-sm btn-block btn-primary show-all-btn">Show All</button>
						</div>
					</div>
					<div class="board" id="completed-task-board">
						<div class="task-board-title">
							<h6 class="text-success">Completed</h6>
							<hr>
						</div>
						<div class="task-card completed-task">
							<h6 class="task-title">Title</h6>
							<p>Some description of the task</p>
							<p>
								<span class="task-category">Category</span> 
								<span class="task-date">22/12/2019</span>
							</p>
						</div>
						<div class="show-all-container" id="show-all-container-completed">
							<button class="btn btn-sm btn-block btn-success show-all-btn">Show All</button>
						</div>
					</div>
					<div class="board" id="delayed-task-board">
						<div class="task-board-title">
							<h6 class="text-danger">Delayed</h6>
							<hr>
						</div>
						<div class="task-card delayed-task">
							<h6 class="task-title">Title</h6>
							<p>Some description of the task</p>
							<p>
								<span class="task-category">Category</span> 
								<span class="task-date">22/12/2019</span>
							</p>
						</div>
						<div class="show-all-container" id="show-all-container-delayed">
							<button class="btn btn-sm btn-block btn-danger show-all-btn">Show All</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="modals/user-task/user-new-task.jsp"></jsp:include>
  	
  	<div class="task-card new-task hidden-task" id="demo-task">
		<h6 class="task-title ellipsis" id="demo-task-title"></h6>
		<p class="task-desc ellipsis"></p>
		<p>
			<span  class="task-category"></span> 
			<span  class="task-date"></span>
		</p>
	</div>
	
	<script src="${context}/js/chart.js"></script>
	<script src="${context}/js/doughnut.js"></script>
	<script src="${context}/js/user_dashboard.js"></script>
</body>
</html>
