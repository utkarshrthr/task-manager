<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="/task-manager/app" />
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="css/nav.css">
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include><div class="bd">
	<div class="container-fluid">
	<div class="row">
		<div  class="col col-md-3" style="width:5%"><img alt="" src="images/login1.png" style="width:70%;height:50%;margin-top:85%"></div>
	
		<div id="signupbox" 
			class="mainbox col-md-6 col-md-offset-3 col-sm-9 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">
				
				</div>
				<div class="panel-body">
					<font color="red">${errorMessage}</font> <font color="green">${msg}</font>
							<h2 style="text-align:center;">LOGIN</h2>
					<hr>
						<form method="post" action="/j_spring_security_check" style="align-items:center;">
							<div class="form-group row">
								<label for="colFormLabel"
									class="control-label col-md-3 offset-md-1 col-form-label-lg">UserName</label>
								<div class="controls col-md-7">
									<input type="text" name="name" class="form-control" />
								</div>
							</div>
							<br>
							<div class="form-group row">
								<label for="colFormLabel"
									class="control-label col-md-3 offset-md-1 col-form-label-lg">Password</label>
								<div class="controls col-md-7">
									<input type="password" name="password" class="form-control" />
								</div>
							</div>
							<div class="col-md-8 offset-md-2" >
								<input type="submit" class="btn btn-primary btn-block btn-md " value="Login" />
							</div>
						</form>
					<div class="offset-md-1 pt-4">
					<a href="${context}/user/credentials/forget">Forgot Credentials</a><br>
					<br> New User? <a href="${context}/signup">Click here</a> to create
					account.
					</div>
					 
				</div>
			</div>
		</div>
		</div>
	</div>
<!--  	<img src="images/bg.jpg" class="im1">-->
	</div>
	<script>
		$(function(){
			$("#nav-login").addClass("active");
		});
	</script>
</body>
</html>