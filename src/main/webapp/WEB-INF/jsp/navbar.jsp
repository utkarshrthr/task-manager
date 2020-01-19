<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="/task-manager/app" />
<nav class="navbar navbar-toggleable-md navbar-dark bg-faded bg-info">
	<div class="container-fluid">
    	<div class="navbar-header">
     		<a class="navbar-brand" id="site-name" href="${context}/">WebSiteName</a>
    	</div>
    	<ul class="nav navbar-nav">
      		<li id="nav-home" class="nav-item"><a  class="nav-link" href="${context}/">Home</a></li>
      		<li id="nav-login" class="nav-item"><a class="nav-link" href="${context}/login">Login</a></li>
      		<li id="nav-signup" class="nav-item"><a class="nav-link" href="${context}/signup">Register</a></li>
    	</ul> 
  	</div>
</nav>
