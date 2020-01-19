let currentNote = null;
let currentId = 0;

$.fn.extend({
	toggleHtml: function(a, b){
        return this.html(this.html() == b ? a : b);
    }
});

$(document).ready(function() {

	$("#show, #add-first-note").removeAttr("data-target");
	
	$("#add-first-note, #show").click(function() {
		$(".modal-title").text("Create a new Note");
		$("#add-note-btn").text("Add");
		$("#reset-note-btn").show();
		$("#new-task-modal").modal('show');
	});
 
	$("#add-note-btn").click(function() {
		var noteTitle = $("#title").val();
		var noteContent = $("#note-content").val();
		var tags = [];
		$(".bootstrap-tagsinput").find(".tag").each(function(){
			tags.push($(this).text());
		});

		$.ajax({
			url:"../notes",
			type: "POST",
			data:{
				title:noteTitle,
				content:noteContent,
				tags:tags
			},
			success:function(response){
				$("#notes-container").append(response);
				clearModal();
				$("#no-note-container").hide();
			},
			error: function (xhr, ajaxOptions, thrownError) {
				clearModal();
				console.error("Error occured while adding Note:")
		        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
		        console.error(xhr.responseJSON.message);
			}
		});
		$("#close-note-btn").click();
	});
	
	$(".bootstrap-tagsinput input").eq(0).keypress(function(e) {
		if(e.keyCode === 8) {
			$(".bootstrap-tagsinput").find(".tag").last().remove();
		}
	});
	
	$("#new-task-modal").on('hide.bs.modal', function(){
		clearModal();
	});
});

function deleteNote(obj, noteId) {
	
	$.ajax({
		url:"../notes",
		type: "DELETE",
		data:{
			noteId:noteId
		},
		success:function(response){
			if(response.trim() === "DELETED"){
				$(obj).parent().remove();
				if($("#note-container .note").length === 0) {
					$("#no-note-container").show();
				}
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.error("Error occured while deleting Note:")
	        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
	        console.error(xhr.responseJSON.message);
	      }
	});
}

function editNote(obj, noteId) {

	currentId = noteId;
	currentNote = obj;
	
	var noteTitle = $(obj).parent().find(".note-title").text().trim();
	var noteContent = $(obj).parent().find(".note-content").text().trim();
	
	$("#title").val(noteTitle);
	$("#note-content").val(noteContent);
	
	$(obj).parent().find(".note-tags .tag").each(function(){
		var tag = "<span class='tag label label-info'>"+$(this).text().trim()+"<span onclick='removeTag(this)' data-role='remove'></span></span>";
		$(".bootstrap-tagsinput").prepend(tag);
	});
	$(".modal-title").text("Edit Note");
	$("#add-note-btn").text("Update");
	$("#reset-note-btn").hide();
	$("#new-task-modal").modal('show');
}

function removeTag(obj){
	$(obj).parent().remove();
}

function updateNote() {
	
	var noteTitle = $("#title").val();
	var noteContent = $("#note-content").val();
	var tags = [];
	$(".bootstrap-tagsinput").find(".tag").each(function(){
		tags.push($(this).text());
	});

	$.ajax({
		url:"../notes",
		type: "PUT",
		data:{
			title:noteTitle,
			content:noteContent,
			tags:tags,
			noteId: currentId
		},
		success:function(response){
			if(response.trim() === "UPDATED"){
				$(currentNote).parent('.note').find(".note-title").text(noteTitle);
				$(currentNote).parent('.note').find(".note-content").text(noteContent);
				tags.forEach(function(t) {
					$(currentNote).parent().find(".note-tags").append("<span class='tag'>"+t+"</span>");		
				});
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
			console.error("Error occured while adding Note:")
	        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
	        console.error(xhr.responseJSON.message);
		}
	});
	clearModal();
	$("#close-note-btn").click(); 
}

function clearModal(){
	$("#title").val('');
	$("#note-content").val('');
	$(".bootstrap-tagsinput").find(".tag.label.label-info").remove();
	$(".bootstrap-tagsinput").find(".tag").each(function(){
		$(this).text();
	});
}

function toggleFullScreen(obj) {
	$(obj).parent().parent().toggleClass("read-mode");
	$(obj).find("b").toggleHtml('&nbsp;&nbsp;&nbsp;More', '&nbsp;&nbsp;&nbsp;Less');
}