$(document).ready(function() {
	var isLight = true;
	$("#show").hide();
	
	if($("#dark-theme").length >0 ){
		$(".slider").css({
			"left": "34px"
		});
		$(".switch").css({
			"background-color": "#333",
			"box-shadow":"0px 0px 3px 1px rgba(255,255,251,1)"
		});
		
		isLight = false;
		$(".current-theme").text("Dark Mode");
	}
	
	
	$(".slider, .switch").click(function(e) {
		if(isLight){
			$(".slider").css({
				"left": "34px"
			});
			$(".switch").css({
				"background-color": "#333",
				"box-shadow":"0px 0px 3px 1px rgba(255,255,251,1)"
			});
			
			isLight = false;
			$(".current-theme").text("Dark Mode");
			changeTheme("dark");
		}
		else {
			$(".slider").css({
				"left": "2px"
			});
			$(".switch").css({
				"background-color": "#6495ed",
				"box-shadow":"box-shadow: 0px 0px 1px 1px rgba(0,0,255,0.5)"
			});
			isLight = true;
			$(".current-theme").text("Light Mode");
			changeTheme("light");
		}
		e.stopPropagation();
	})
	
});

function changeTheme(theme) {
	$.ajax({
		url:"../settings/theme?theme="+theme,
		success:function(){
			if(theme.trim().toLowerCase() === "dark") {
				var style = document.createElement("link");
				style.rel = "stylesheet";
				style.id = "dark-theme";
				style.href = "../css/app-dark-theme.css";
				document.getElementsByTagName("head")[0].appendChild(style);
			}
			else if(theme.trim().toLowerCase() === "light"){
				document.getElementById("dark-theme").remove();
			}
		}
	})
}
