$(document).ready(function() {
	$("#show").attr("data-target", "#new-doc-modal");
	
	$("#add-doc-btn").click(function() {
		addDoc();
	});
	
	$("#add-first-doc").click(function() {
		$("#new-doc-modal").modal("show");
	});

	$('.image-upload-wrap').bind('dragover', function () {
		$('.image-upload-wrap').addClass('image-dropping');
	});

	$('.image-upload-wrap').bind('dragleave', function () {
		$('.image-upload-wrap').removeClass('image-dropping');
	});
	
	checkDocs();
});

function checkDocs() {
	if($(".doc").length > 0) {
		$("#no-doc-container").css("display","none");
	}
	else 
		$("#no-doc-container").css("display","block");
}

function readURL(input) {
	if (input.files && input.files[0]) {
 		$('.file-upload-content').show();
		$(".image-upload-wrap, .file-upload-btn").hide();
	    var filename = input.files[0].name;
	    filename = filename.split(".");
	    var extension = filename.pop();
	    $("#extension").val(extension);
	    filename = filename.join(".");
	    $("#docname").val(filename);
	    $("#docname").removeAttr("disabled");
	    $("#filetype").val(input.files[0].type);
		$("#filesize").val((input.files[0].size/1024));
	} 
	else {
		removeUpload();
	}
}

function removeUpload() {
	$('.file-upload-input').replaceWith($('.file-upload-input').clone());
	$('.file-upload-content').hide();
	$('.image-upload-wrap').show();
	$(".file-upload-btn").show();
    $("#docname").val("");
    $("#docname").attr("disabled", "disabled");
    $("#extension").val("");
    $("#filesize").val("");
    $("#filetype").val("");
}

function showDocInfo(obj){
	$(obj).parent().find(".doc-info-data").slideDown();
}

function hideDocInfo(obj) {
	$(obj).parent().parent().slideUp();
}

const COMPRESSED_FORMATS = ["rar", "zip", "tar", "7z", "jar"];
const AUDIO_FORMATS = ["mp3", "wav", "m4a", "wmv"];
const CODE_FORMATS = ["css", "js", "java", "html", "jsp"];
const PDF_FORMATS = ["pdf"];
const VIDEO_FORMATS = ["mp4", "3gp", "mkv", "avi", "mpeg"];
const IMAGE_FORMATS = ["png", "jpeg", "jpg"];
const DOC_FORMATS = ["doc", "docx"];
const PPT_FORMATS = ["ppt", "pptx"];
const TEXT_FORMATS = ["txt"];


function deleteDoc(obj){
	$(obj).parent().remove();
	checkDocs();
}
		
function addDoc(){
	var filename = $("#docname").val();
	var extension = $("#extension").val();
	var filetype = $("#filetype").val();
	var filesize = $("#filesize").val()
	var uploadedon = new Date().toLocaleDateString();
	var modifiedon = new Date().toLocaleDateString();
	var docicon = "alt";
	[]
	if(COMPRESSED_FORMATS.includes(extension.toLowerCase())){
		docicon = "archive";
	}
	else if(AUDIO_FORMATS.includes(extension.toLowerCase())){
		docicon = "audio";
	}
	else if(CODE_FORMATS.includes(extension.toLowerCase())){
		docicon = "code";
	}
	else if(PDF_FORMATS.includes(extension.toLowerCase())){
		docicon = "pdf";
	}
	else if(VIDEO_FORMATS.includes(extension.toLowerCase())){
		docicon = "video";
	}
	else if(PPT_FORMATS.includes(extension.toLowerCase())){
		docicon = "powerpoint";
	}
	else if(DOC_FORMATS.includes(extension.toLowerCase())){
		docicon = "word";
	}
	else if(IMAGE_FORMATS.includes(extension.toLowerCase())){
		docicon = "image";
	}
	
	var doc = "<div class='col-md-2 doc'>";
	doc += "<div class='doc-info-data'>";
	doc += "<span class='doc-info-data-close'> ";
	doc += "<i class='fa fa-times' onclick='hideDocInfo(this)' aria-hidden='true'></i>";
	doc += "</span>";
	doc += "<p class='ellipsis' style='width:95%;'> <b>Name:</b> "+filename+"</p>";
	doc += "<p> <b>Size:</b> "+filesize+"</p>";
	doc += "<p> <b>Format:</b> "+extension.toUpperCase()+"</p>";
	doc += "<p> <b>Uploaded On:</b> "+uploadedon+"</p>";
	doc += "<p> <b>Modified On:</b> "+modifiedon+"</p></div>";
	doc += "<span class='doc-info' onclick='showDocInfo(this)'>";
	doc += "<i class='fa fa-info-circle' aria-hidden='true'></i>";
	doc += "</span>";
	doc += "<span class='doc-delete' onclick='deleteDoc(this)'>";
	doc += "<i class='fa fa-trash-alt' aria-hidden='true'></i>";
	doc += "</span>";
	doc += "<span class='doc-format'>";
	doc += "<i class='fa fa-file-"+docicon+"' aria-hidden='true'></i>";
	doc += "</span>";
	doc += "<p class='doc-name text-left ellipsis'> "+filename;
	doc += "<span class='doc-download'>";
	doc += "<i class='fa fa-download' aria-hidden='true'></i>";
	doc += "</span>";
	doc += "</p>";
	doc += "</div>";
	
	$("#docs-container .row").last().append(doc);
	removeUpload();
	$("#close-doc-btn").click();
	checkDocs();	
}		







