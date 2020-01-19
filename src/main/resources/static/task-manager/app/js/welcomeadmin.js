function getDetail(userId){
	$.ajax({
		type:"POST",
		url:"/admin/user",
		data:{
			"id":userId
		},
		success:function(response){
			$("#detname").text(response.name);
			$("#detemail").text(response.email);
			$("#detcount").text(response.taskcount);
			$("#detrole").text(response.role);
		},
		error: function (xhr, ajaxOptions, thrownError) {
			clearModal();
			console.error("Error occured while getting User Details:")
	        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
	        console.error(xhr.responseJSON.message);
		}
	});
}

function deluserconf(u){
	$("#confdel").text("All task assigned to this user will be assigned to you. Are you sure you want to delete user?")
	$("#confbut").attr("onclick","deluser("+u+")");
}

function deluser(userId){
	$.ajax({
		type:"DELETE",
		url:"/admin/user",
		data:{
			"id":userId
		},
		success:function(response){
			$("#delconfirm").modal("hide");
			var tableBody = $("#t1 tbody"); 
			tableBody.fadeOut(1000).delay(1).queue(function() {
				$("#"+userId).remove();
				tableBody.fadeIn(2000);
				$(this).dequeue();
			});
		},
		error: function (xhr, ajaxOptions, thrownError) {
			clearModal();
			console.error("Error occured while deleting User Details:")
	        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
	        console.error(xhr.responseJSON.message);
		}
	});
}