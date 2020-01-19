<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="/task-manager/app" />
<% String currentTheme = (String)session.getAttribute("currentTheme");%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="commons/masterHeader.jsp"></jsp:include>
	<link rel="stylesheet" href="${context}/css/dashboard_common.css">
	<link rel="stylesheet" href="${context}/css/user_dashboard.css">
	<link rel="stylesheet" href="${context}/css/app_common.css">
	<link rel="stylesheet" href="${context}/css/documents.css">
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
					<input type="search" class="form-control search" placeholder="Search your documents...">
				</div>
				<jsp:include page="actionMenu.jsp"></jsp:include>
			</div>
			<div id="docs-container">
				<div class="row"></div>
				<div id="no-doc-container">
					<h1 id="no-doc-msg">Nothing Here!!!</h1>
					<div class="text-center">
						<button id="add-first-doc" class="btn btn-primary">Add Now</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="extension">
	<div class="modal" id="new-doc-modal">
    		<div class="modal-dialog modal-dialog-centered modal-lg">
      			<div class="modal-content">
        			<div class="modal-header">
			       		<h4 class="modal-title">Upload a document</h4>
                 		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          					<span aria-hidden="true">&times;</span>
          				</button>
        			</div>
        			<div>
        				<div class="modal-body">
         					<div id="form">
  								<fieldset  class="scheduler-border">
	   								<div class="form-group row">
	  									<div class="col-md-1">
						       				<label for="colFormLabel" class="col-form-label-lg">Filename: </label>
						       			</div>
	    								<div class="col-md-11">
	     									<input class="form-control" id="docname" type="text" name="title" disabled="disabled">
	     								</div>
	    							</div>
	       							<div class="form-group row">
						       			<div class="file-upload">
  											<button class="file-upload-btn btn-primary" type="button" onclick="$('.file-upload-input').trigger( 'click' )">Choose File</button>
  											<div class="image-upload-wrap">
									    		<input class="file-upload-input" type='file' onchange="readURL(this);" accept="*/*" />
											    <div class="drag-text">
											   		<h4>Drag and drop a file or select Choose File</h4>
											    </div>
  											</div>
										  	<div class="file-upload-content">
										    	<!-- <img class="file-upload-image" src="#" alt="your image" /> -->
										    	<div class="image-title-wrap">
										    		<button type="button" onclick="removeUpload()" class="remove-image btn btn-danger btn-block btn-sm">Remove </button>
										    	</div>
										  	</div>
										</div>
	    							</div>
	     							<div class="form-group row">
	      								<div class="col-md-1">
						       				<label for="colFormLabel" class="col-form-label-lg">Tags:</label>
						       			</div>
	    								<div class="col-md-11">
	     									<input class="form-control" id="tags" type="text" name="tags" data-role="tagsinput">
	     								</div>
	   								</div>
  								</fieldset>
  							</div>
       	 				</div>
        				<div class="modal-footer">
         						<button class="btn btn-danger btn-task" id="close-doc-btn" data-dismiss="modal">Close</button>
         						<button class="btn btn-success btn-task" id="add-doc-btn" >Add</button>
	          					<input class="btn btn-warning btn-task" id="reset-doc-btn" type="reset"  value="Reset" />
        				</div>
	       			</div>
      			</div>
    		</div>
  		</div>
	<script src="${context}/js/documents.js"></script>
	<script src="${context}/js/bootstrap-tagsinput.min.js"></script>
	<script src="${context}/js/fontawesome-all.min.js"></script>
</body>
</html>
