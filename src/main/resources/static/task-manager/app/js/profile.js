$(document).ready(function() {
	$("#show").hide();
	
	const DOB_INVALID_ERROR = "*Date of birth is not valid";
	const DOB_EMPTY_ERROR = "*Date of birth is required";
	const NAME_EMPTY_ERROR = "*Firts name is required";
	
	$("#first-name").val("TARNIJA");
	$("#last-name").val("SRIVASTAVA");
	$("#day").val("29");
	$("#month").val("July");
	$("#year").val("1994");
	$("#contact").val("+91 8888888888");
	$("#email").val("utkarshrathore529@gmail.com");
	
	let dates = "";
	for(var i=1;i<=31;i++){
		dates+= "<option value='"+i+"'>"+i+"</option>";
	}
	$("#day").append(dates);
	
	let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	let month = "";
	for(var m of months){
		month+= "<option value='"+m+"'>"+m+"</option>";
	}
	$("#month").append(month);
	
	let years = "";
	for(var i=1980;i<=2020;i++){
		years+= "<option value='"+i+"'>"+i+"</option>";
	}
	$("#year").append(years);
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
		    reader.onload = function(e) {
		    	$('#profile-pic').attr('src', e.target.result);
		    }
		    reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInp").change(function() {
		readURL(this);
	});
	
	
	$("#add-image").click(function() {
		$("#imgInp").click();
	});
});