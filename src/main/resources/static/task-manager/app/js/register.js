//const EMAIL_PATTERN = /^[a-zA-Z]{2,}[_.a-zA-Z0-9]*[a-zA-Z0-9]+@[a-zA-Z]{2,}\.{1}[a-z]{2,}$/;
const EMAIL_PATTERN = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

$(document).ready(function(){
	$("#nav-signup").addClass("active");
	
	$('#security-question').change(function(){
		if($('#security-question option:selected').text() != "Choose here"){
			$("#icn9").hide();
		    $('#labelsel').text($('select option:selected').text())
	        $('#labelsel').show();
	        $('#sel').show();
	     }
	     else {
	    	 $('#labelsel').hide();
		     $('#sel').hide();
	     }
	});
	$("#sel").on("input", function(){
		$("#icn10").hide();
	});
});

var typingTimer; 
var doneTypingInterval = 5000;  

$('#username').keyup(function(){
    clearTimeout(typingTimer);
    if ($('#username').val()) {
        typingTimer = setTimeout(checkIfUserExistsByUsername, doneTypingInterval);
    }
});

function checkIfUserExistsByUsername(){
	if( ($.trim($("#username").val()))!="" ){
		var username = $('#username').val();
		$.ajax({
			type: "POST",
		    url: "/task-manager/app/user/verify/username",
		    data: {
		    	"username":username
		    },
		    success: function(response){
			    if(response.message==="User Exists"){
			    	$("#icn2").show();
			    	$("#icn").hide();
			    	$("#icn2 font").text("User Already Exists. Try another name");
			    }
			    else {
			    	if(($.trim($("#username").val())).length<3 || ($.trim($("#username").val())).length>12) {
			    		$("#icn2").show();
			    		$("#icn").hide();
			    		$("#icn2 font").text("Username length must be greter than 2 and less than 12");
			    	}
			    	else {
			    		$("#icn").show();
			    		$("#icn2").hide();
			    	}
			    }
		    },
		    error: function (xhr, ajaxOptions, thrownError) {
				console.error("Error occured while verifying username:")
		        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
		        console.error(xhr.responseJSON.message);
			}
		});
	 }
	 else {
		 $("#icn").hide();
		 $("#icn2").hide();
	 }
}

function checkemail() {
	var email = $('#user_email').val();
	if($.trim(email)!==""){
		if(validateEmail(email)){
			$("#icn3").show();
    		$("#icn4").hide();
			$.ajax({
				type: "POST",
		        url: "/task-manager/app/user/verify/email",
		        data:{
		        	"email": email
		        },
		        success: function(response){
			        if(response.message==="User Exists"){
			        	$("#icn4").show();
			        	$("#icn3").hide();
			        	$("#icn4 font").text("User Already Exists.");
			        }
		        },
		        error: function (xhr, ajaxOptions, thrownError) {
					console.error("Error occured while verifying user-mail:")
			        console.error(xhr.responseJSON.status, xhr.responseJSON.error);
			        console.error(xhr.responseJSON.message);
				}
			});
		}
		else {
    		$("#icn4").show();
        	$("#icn3").hide();
        	$("#icn4 font").text("Not a valid email");
		}
	}
	else {
		$("#icn3").hide();
		$("#icn4").hide();
	}
}

function validateEmail(email) {
	return EMAIL_PATTERN.test(email);
}

function pas() {
	var password = $("#pass").val();
	$("#repass").val("");
	$("#icn7").hide();
	$("#icn8").hide();
	if($.trim(password) !== ""){
		if($.trim(password).length<8){
			$("#icn6").show();
			$("#icn6 font").text("Password length must be greater than 8.Spaces not allowed");
			$("#icn5").hide();
		}
		else {
			$("#icn5").show();
			$("#icn6").hide();
		}
	}
	else {
		 $("#icn5").hide();
		 $("#icn6").hide();
	}
}

function AvoidSpace(event) {
    var k = event ? event.which : window.event.keyCode;
    if (k == 32){ 
    	return false;
    }
	return true;
}

function matchpas(){
	if(($.trim($("#repass").val()))!=""){
		if($("#repass").val()==$("#pass").val()){
			$("#icn7").show();
			$("#icn8").hide();
		}
		else {
			$("#icn8").show();
			$("#icn7").hide();
		}
	}
	else {
		$("#icn7").hide();
		$("#icn8").hide();
	}
}

function checkPass(){
	if( ($.trim($("#pass").val()))==="" || $("#icn6").is(":visible") ){
		$("#pass").focus();
	}
}

function mySubmitFunction(e){
	if(($.trim($("#username").val()))==="") {
		$("#icn2").show();
		$("#icn2 font").text("This field is required");
		e.preventDefault();
	}	
	if(($.trim($("#user_email").val()))===""){
		$("#icn4").show();
		$("#icn4 font").text("This field is required");
		e.preventDefault();
	}
	if(($.trim($("#pass").val()))===""){
		$("#icn6").show();
		$("#icn6 font").text("This field is required");
		e.preventDefault();
	}
	if(($.trim($("#repass").val()))===""){
		$("#icn8").show();
		$("#icn8 font").text("This field is required");
		e.preventDefault();
	}
	if ($("#security-question").val() === null) {
		$("#icn9").show();
		e.preventDefault();
	}
	else {
		if (($.trim($("#sel").val()))==="") {
			$("#icn10").show();
			e.preventDefault();
		}
	}
	if($("#icn2").is(":visible")||$("#icn4").is(":visible")||$("#icn6").is(":visible")||$("#icn8").is(":visible")||$("#icn9").is(":visible")||$("#icn10").is(":visible")) {
		$("#err").text("Please fill all the fields correctly");
		e.preventDefault();
	}
}