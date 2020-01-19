$(document).ready(function(){

	$('#myModal').on('hidden.bs.modal', function () {
		 $('#myForm')[0].reset();
		 $("#err").hide();
	})
	
	var today = new Date().toISOString().split('T')[0];
	document.getElementsByName("date")[0].setAttribute('min', today)
});


var ajaxLoadTimeout;
function addTask(){
	var task=$("#task").val();
	var doer=$("#doer").val();
	var date=$("#date").val();
	var time=$("#time").val();
	if(($.trim(task))!="" && ($.trim(doer))!="" && ($.trim(date))!="" && ($.trim(time))!="")
		{
		$.ajax({
			 type: "POST",
			 url: "/addTodo",
			 data: "task=" + task+"&doer=" + doer+"&date=" + date+"&time=" + time,
			 success: function(response){	
				 $("#myModal").modal("hide");
				
				//console.log(response.data);
			var	markup = "<tr id=\""+response.data+"\"><td>"+task+"</td><td>"+doer+"</td><td>"+date+"</td><td>"+time+"</td><td>"+false+"</td><td align=\"center\"> <a href=\"#\" class=\"btn btn-info a-btn-slide-text\" id=\"editbut\" onclick=\"\">"
        +"<span class=\"glyphicon glyphicon-edit\" aria-hidden=\"true\"></span>"
        +"<span><strong>Edit</strong></span>"       
    +"</a>&nbsp;"
    +"<a href=\"#\" class=\"btn btn-danger a-btn-slide-text\" id=\"delbut\" onclick=\"deltask("+response.data+")\">"
       +"<span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>"
        +"<span><strong>Delete</strong></span>"            
    +"</a>"
    
    +"</td></tr>";
			var tableBody = $("table tbody"); 
			tableBody.fadeOut(1000).delay(1).queue(function() {
				tableBody.fadeIn(2000).append(markup);
				$(this).dequeue();
			});
			
			 },
			 error: function(e){
	    		    alert('Error: ' + e);
	    		}
			 
		});
		}
	else{
		$("#err").text("All fields are required");
	}
}

function deltask(t1){
	if(($.trim(t1))!=""){
		$.ajax({
			type:"DELETE",
			url: "/task",
			data:{
				"task": t1
			},
			success:function(response){
				console.log(response.output);
				var tableBody = $("table tbody"); 
				
				
			
				tableBody.fadeOut(1000).delay(1).queue(function() {
					$("#"+t1).remove();
					tableBody.fadeIn(2000);
					
					$(this).dequeue();
				});
			},
		error: function(e){
		    alert('Error: ' + e);
		}
		});
	}
}
