<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="context" value="/task-manager/app" />
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/restore_credentials.css">
	<link rel="stylesheet" href="${context}/css/nav.css">
	<script src="${context}/js/restore.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div id="signupbox" class="mainbox col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
			<div class="panel panel-info">
				<div class="panel-body">
   					<font color="red">${errorMessage}</font>
   					<font color="green">${msg}</font>
   					<h2 style="text-align:center;">Restore Credentials</h2>
   					<hr>
    				<form autocomplete="off" method="post" action="restoreCredentials">
    					<div class="form-group row">
      						<label for="colFormLabel" class="control-label col-md-6 col-form-label-lg" style="font-size: 18px;">Please enter email/username : </label>
      						<div class="controls col-md-6">
     							<input type="text" name="email" class="form-control" oninput="doneTyping()" id="email" />
     						</div>
     						<div class="col-md-4 offset-md-6" id="icn" style="display: none;"> 
     							<i class="fa fa-check" aria-hidden="true" style="color:green"></i> 
     							<font color="green">User Exists</font>
     						</div>
    						<div class="col-md-4 offset-md-6" id="icn2" style="display: none;">  
    							<i class="fa fa-times" aria-hidden="true" style="color:red"></i> 
    							<font color="red">User Does Not Exists</font>
    						</div>
  						</div>
     					<div class="form-group row" style="display: none;" id="sec">
							<label for="colFormLabel" class="control-label col-md-6 col-form-label-lg" id="ques">Security Question </label>
						    <div class="controls col-md-6">
     							<input type="text" name="ans" class="form-control" id="ans" oninput="answer()"/>
     						</div>
       						<div class="col-md-4 offset-md-6" id="icn3" style="display: none;"> 
       							<i class="fa fa-check" aria-hidden="true" style="color:green"></i> 
       							<font color="green">Correct answer</font>
       						</div>
	    					<div class="col-md-4 offset-md-6" id="icn4" style="display: none;">  
	    						<i class="fa fa-times" aria-hidden="true" style="color:red"></i> 
	    						<font color="red">Incorrect answer</font>
	    					</div>
     					</div>
     					<div class="form-group row" style="display: none;" id="npass">
      						<label for="colFormLabel" class="control-label col-md-6 col-form-label-lg ">Please enter your new Password : </label>
      						<div class="controls col-md-6 ">
     							<input type="password" name="pass" class="form-control" id="p1" disabled="disabled" oninput="pas()" />
     						</div>
       						<div class="col-md-4 offset-md-6" id="icn5" style="display: none;"> 
       							<i class="fa fa-check" aria-hidden="true" style="color:green"></i> 
       							<font color="green">Password Accurate</font>
       						</div>
    						<div class="col-md-4 offset-md-6" id="icn6" style="display: none;">  
    							<i class="fa fa-times" aria-hidden="true" style="color:red"></i> 
    							<font color="red">Inaccurate password</font>
    						</div>
     					</div>
     					<div class="form-group row" style="display: none;" id="npass2">
      						<label for="colFormLabel" class="control-label col-md-6 col-form-label-lg">Please re-enter new Password : </label>
      						<div class="controls col-md-6">
     							<input type="password" name="pass2" class="form-control" id="p2" disabled="disabled" oninput="matchpas()" />
     						</div>
     						<div class="col-md-4 offset-md-6" id="icn7" style="display: none;"> 
     							<i class="fa fa-check" aria-hidden="true" style="color:green"></i> 
     							<font color="green">Password match</font>
     						</div>
    						<div class="col-md-4 offset-md-6" id="icn8" style="display: none;">  
    							<i class="fa fa-times" aria-hidden="true" style="color:red"></i> 
    							<font color="red">Password do not match</font>
    						</div>
     						<br>
     					</div>
   	  					<div class="col-md-8 offset-md-2"  >  
        					<input type="button" class="btn btn-primary btn-block btn-md" id="but" disabled="disabled" value="Click to Reset Credentials" onclick="showForm()"/>
        				</div>
        	 			<div class="col-md-8 offset-md-2" style="display: none;" id="subm" >  
        					<input type="submit" class="btn btn-primary btn-block btn-md"  disabled="disabled" id="sb" value="Submit"/>
        				</div>
    				</form>
    				<br><br>
   					<div class="offset-md-1">
     					<a href="${context}/login">Go to login page</a>
     				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>