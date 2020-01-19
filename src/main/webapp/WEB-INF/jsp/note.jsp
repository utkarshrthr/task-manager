<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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