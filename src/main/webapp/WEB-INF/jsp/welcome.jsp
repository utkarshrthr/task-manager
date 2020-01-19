<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="js/welcome.js"></script>
 <style>
.table{
width:70%;
margin:auto;
}

</style>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: #222;">

    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
      <li class="nav-item active"><a class="nav-link" href="#">Welcome</a></li>
 
    </ul>
  
   <div  class="collapse navbar-collapse justify-content-end ">
		<a href="lgot" class="btn btn-outline-info a-btn-slide-text" ><i class="fa fa-sign-out" aria-hidden="true"></i><span><strong>Logout</strong></span></a>
</div>
  
</nav>




<div class="row">
<div class="col-md-9">
	<h2 style="margin-left:220px;">Welcome ${name}!!</h2>
	   <button style="margin-left:220px;" type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal" id="show">Click here to add a task</button>
	<br>
	<br>
	 <p style="margin-left:220px;">Here is the list of your task:</p>
	</div>
	
</div>
<%--  <h3>Welcome ${name}!!</h3> 
   <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal" id="show">Click here to add a task</button>
<!--  <a href="#" id="show">Click here</a> to add your todo's.<br> -->
   --%>
  
  <div class="container">
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-dialog-centered ">
      <div class="modal-content">
        <div class="modal-header">
         
          <h4 class="modal-title">Add your task:</h4>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form autocomplete="off" method="post" id="myForm">
        <div class="modal-body">
         <div id="form">
  
  <font color="red" id="err">${errorMessage}</font>
  <fieldset  class="scheduler-border">
    
   <div class="form-group row">
  <label for="colFormLabel" class="col-md-4 col-form-label-lg">Task : </label>
    <div class="col-md-7">
     <input class="form-control" id="task" type="text" name="task">
     </div>
     <div class="col-sm-2" id="icn" style="display: none;"> <span class="glyphicon">&#xe013;</span> <font color="green">User Exists</font></div>
    <div class="col-sm-2" id="icn2" style="display: none;">  <span class="glyphicon">&#xe014;</span> <font color="red">User Does Not Exists</font></div>
    </div>
   
       <div class="form-group row">
       <label for="colFormLabel" class="col-md-4 col-form-label-lg">Who should do it : </label>
     <div class="col-md-7">  
      <input class="form-control" id="doer" type="text" name="doer">
      </div>
       <div class="col-sm-2" id="icn" style="display: none;"> <span class="glyphicon">&#xe013;</span> <font color="green">User Exists</font></div>
    <div class="col-sm-2" id="icn2" style="display: none;">  <span class="glyphicon">&#xe014;</span> <font color="red">User Does Not Exists</font></div>
    </div>
  
     <div class="form-group row">
       <label for="colFormLabel" class="col-md-4 col-form-label-lg"> Date : </label>
    <div class="col-md-7">  
    <input class="form-control" id="date" type="date" name="date">
    </div>
    </div>
   
     <div class="form-group row">
      <label for="colFormLabel" class="col-md-4 col-form-label-lg"> Time : </label>
      <div class="col-md-7">  
     <input class="form-control" id="time" type="time" name="time">
     </div>
   </div>
   
     
  </fieldset>

  </div>
        </div>
        <div class="modal-footer">
       
         <input class="btn btn-primary " type="button" value="Add Task" onclick="addTask()">
          <input type="reset" value="Reset" class="btn btn-default" />
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
       </form>
        
      </div>
    </div>
  </div>
  
  
  
  
  
  
  </div>
  
    <div id="loader" style="display: none;position:fixed"><img alt="Loading ..." src="images/test.gif"></div>
    
    <table class="table table-bordered table-hover" id="mytable">

<thead>
      <tr>
      <th>Task</th>
       <th>Who should do it</th>
       <th>Date</th>
       <th>Time</th>
       <th>Status</th>
       <th></th>
      </tr>
      </thead>
      <tbody>
    <c:forEach items="${todos}" var="todo" begin="1">
        <tr id="${todo.id}">
            <td> <c:out value="${todo.task}"/></td>
           <td> <c:out value="${todo.doer}"/></td>
           <td> <c:out value="${todo.date}"/></td>
             <td> <c:out value="${todo.time}"/></td>
           <td> <c:out value="${todo.done}"/></td>
           <td align="center"> <a href="#" class="btn btn-info a-btn-slide-text" id="editbut" onclick="">
        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
        <span><strong>Edit</strong></span>            
    </a>
    <a href="#" class="btn btn-danger a-btn-slide-text" id="delbut" onclick="deltask(${todo.id})">
       <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        <span><strong>Delete</strong></span>            
    </a>
    
    </td>
        </tr>
    </c:forEach>
  
    </tbody>
</table>

</body>
</html>