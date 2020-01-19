<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="/task-manager/app" />
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/admin_dashboard.css"> 
	<script src="${context}/js/welcomeadmin.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-dark">
    	<div class="navbar-header">
      		<a class="navbar-brand" href="#">WebSiteName</a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li class="nav-item"><a class="nav-link" href="/">Home</a></li>
      		<li class="nav-item active"><a class="nav-link" href="#">Welcome</a></li>
    	</ul>
   		<div  class="collapse navbar-collapse justify-content-end ">
			<a href="${context}/logout" class="btn btn-outline-info a-btn-slide-text" >
				<i class="fa fa-sign-out-alt" aria-hidden="true"></i>
				<span><strong>Logout</strong></span>
			</a>
		</div>
	</nav>

	<div class="row">
		<div class="col-md-9">
			<h2 style="margin-left: 220px;">Welcome admin</h2>
		</div>
	</div>
	<hr>
	<table class="table table-bordered table-hover" id="t1">
		<thead class="thead-dark">
			<tr>
				<th>UserName</th>
				<th>Email</th>
				<th>Details</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user" >
				<tr id="${user.id}">
					<td align="center"><a href="${context}/user/dashboard"><c:out value="${user.name}" /></a></td>
					<td align="center"><c:out value="${user.email}" /></td>
					<td align="center">
						<a href="#" class="btn btn-outline-info a-btn-slide-text" id="detail" data-toggle="modal" data-target="#detailModal" onclick="getDetail(${user.id})"> 
							<i class="fa fa-info-circle" aria-hidden="true"></i> 
							<span><strong>Details</strong></span>
						</a>
					</td>
					<td align="center">
						<a href="#" class="btn btn-outline-primary a-btn-slide-text" id="editbut" onclick=""> 
							<i class='fa fa-pencil-alt' aria-hidden='true'></i>  
							<span><strong>Edit</strong></span>
						</a>
					</td>
					<td align="center">
						<a href="#" class="btn btn-outline-danger a-btn-slide-text" id="delbut" data-toggle="modal" data-target="#delconfirm" onclick="deluserconf(${user.id})"> 
							<i class='fa fa-trash-alt' aria-hidden='true'></i>
							<span><strong>Delete</strong></span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="modals/admin-dashboard/user-delete.jsp"></jsp:include>
	
	<jsp:include page="modals/admin-dashboard/user-details.jsp"></jsp:include>	
	
</body>
</html>