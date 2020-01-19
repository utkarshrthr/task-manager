$(document).ready(function(){
	$("#icn").css("display", "hidden");
	$("#icn2").css("display", "hidden");
	
	 $("#email").on("input", function(){
		 $("#icn").hide();
		 $("#icn2").hide();
		 $("#npass").hide();
    	 $("#npass2").hide();
		 $("#but").prop('disabled', true);
	 });
	
});
var typingTimer;                
var doneTypingInterval = 5000;  

$('#email').keyup(function(){
    clearTimeout(typingTimer);
    if ($('#email').val()) {
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    }
});
var ques;
var ans;
function doneTyping() {
	 if( ($.trim($("#email").val()))!="" ){
			var email = $('#email').val();
			 $.ajax({
				 type: "POST",
			        url: "/verify/",
			        data: "email=" + email,
			        success: function(response){
			        	
			        	
			        	console.log(response.message);
			        	
				        if(response.message==="User Exists"){
				        	console.log(response.question);
				        	console.log(response.answer);
				        	$("#icn").css("display", "block");
				        	$("#icn2").hide();
				        	$("#but").prop('disabled', false);
				        	ques=response.question;
				        	ans=response.answer;
				        }
				        else{
				        	 $("#icn2").css("display", "block");
				        	 $("#icn").hide();
				        	 $("#npass").hide();
				        	 $("#npass2").hide();
				        	 $("#sec").hide();
				        	
				        	 $("#subm").hide();
				        	 $("#but").show();
				        	 $("#but").prop("disabled",true);
				        
				        }
			        },
					 error: function(e){
		    		    alert('Error: ' + e);
		    		}

				 });
			 }
	 else{
		 
	 }
}
var ques;

function showForm() {
	$("#sb").prop("disabled",true);
	$("#ans").val("");
	$("#sec").css("display","inline-flex");
	$("#ques").text("Security Question : "+ques);
	$("#npass").css("display","inline-flex");
	$("#npass2").css("display","inline-flex");
	$("#subm").css("display","block");
	$("#but").hide();
	$("#p1").val("");
	$("#p2").val("");
	$("#sb").prop('disabled', true);
	$("#p1").prop('disabled', true);
	$("#p2").prop('disabled', true);
	$("#icn3").css("display", "none");
	$("#icn4").css("display", "none");
	$("#icn5").css("display", "none");
	$("#icn6").css("display", "none");
	$("#icn7").css("display", "none");
	$("#icn8").css("display", "none");
	
}

function answer(){
	$("#sb").prop("disabled",true);
	$("#icn7").hide();
	$("#icn8").hide();
	$("#icn5").hide();
	$("#icn6").hide();
	if($("#ans").val()!=""){
	if($("#ans").val()===ans){
		$("#icn3").css("display", "block");
		$("#icn4").hide();
		$("#p1").prop('disabled', false);
		//$("#p2").prop('disabled', false);
	}
	else{
		$("#icn4").css("display", "block");
		$("#icn3").hide();
		$("#p1").prop('disabled', true);
		$("#p2").prop('disabled', true);
		$("#p2").val("");
		$("#p1").val("");
	}
	}
	else{
		$("#icn3").hide();
		$("#icn4").hide();
	}
}
function pas(){
	
	$("#sb").prop("disabled",true);
	$("#icn7").hide();
	$("#icn8").hide();
	if($("#p1").val()!=""){
	if($("#p1").val().length<8){
		$("#icn6").css("display","block");
		$("#icn6 font").text("Password length must be greater than 8");
		$("#icn5").hide();
		$("#p2").val("");
		$("#p2").prop('disabled', true);
	}
	else{
		$("#p2").prop('disabled', false);
		$("#icn5").css("display","block");
		$("#icn6").hide();
	}
	}
	else{
		$("#icn5").hide();
		$("#icn6").hide();
	}
}
function matchpas(){
	$("#sb").prop("disabled",true);
	if($("#p2").val()!=""){
		if($("#p2").val()==$("#p1").val()){
			$("#icn7").css("display","block");
			$("#icn8").hide();
			$("#sb").prop("disabled",false);
		}
		else{
			$("#icn8").css("display","block");
			$("#icn7").hide();
			$("#sb").prop("disabled",true);
		}
	}
	else{
		$("#icn7").hide();
		$("#icn8").hide();
	}
}

	
