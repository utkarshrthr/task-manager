$(document).ready(function() {
	
	$(".show-all-container").hide();
	
	$(".task-card").click(function() { 
		$("#new-task-modal").modal('show');
	});
	
	$(".btn.btn-danger.btn-task").click(function() {
		$("#new-task-modal").modal('hide');
	});
	
	$(".btn.btn-success.btn-task").click(function() {
		addTask();
	});
	
});

function addTask(){
	var taskTitle = $("#title").val();
	var description = $("#description").val();
	var assignee = $("#assignee").val();
	var starton = $("#starton").val();
	var doneby = $("#doneby").val();
	var status = $("#status").val();	
	if(($.trim(taskTitle))!="" && ($.trim(description))!="" && ($.trim(assignee))!="" && ($.trim(starton))!="" && ($.trim(doneby))!="" && ($.trim(status))!="") {		
		$.ajax({
			type: "POST",
			url: "/task",
			data: {
				"taskTitle": taskTitle,
				"description": description,
				"assignee": assignee,
				"starton": starton,
				"doneby": doneby,
				"status": status
			},
			success: function(response){
				$("#err").hide();
				var demoTask =  $("#demo-task").clone();
				var t1=demoTask;
				$(t1).attr("id",taskTitle)
				$(t1).find(".task-title").text(taskTitle);
				$(t1).find(".task-desc").text(description);
				$(t1).find(".task-date").text("Done By : "+doneby);
				$(t1).find(".task-category").text('Category');
				$(t1).removeClass("hidden-task");
				t1.insertBefore("#test");
				$("#new-task-modal").modal('hide');
				$("#myForm")[0].reset();
				
				if($(".new-task").length >= 10 ){
					$("#show-all-container-new").show();
				}
				if($(".progress-task").length >= 10 ){
					$("#show-all-container-progress").show();
				}
				if($(".completed-task").length >= 10 ){
					$("#show-all-container-completed").show();
				}
				if($(".delayed-task").length >= 10 ){
					$("#show-all-container-delayed").show();
				}
			 },
			 error: function(e){
    		    alert('Error: ' + e);
    		}
		});
	}
	else {
		$("#err").show();
		$("#err").text("All fields are required !!!!");
	}
}