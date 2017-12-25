function display_basic_image(){
	var root=document.getElementById("root_url").value;
	var url=$('input[name="radio_basic_url"]:checked').val();
	var basic=document.getElementById("choosen_basic_image").checked;
	if($("#choosen_basic_image").is(':checked')){
		document.getElementById("cover_image_display").src=root+""+url;
	}

};


//function check_rule(){
//	if($("#rule:checked").length == 0){
//		$("#popupRequiredTerm").modal("show");
//	}else{
//		$('#form_required').submit();
//	}
//	};


function countChar(){
	  var len=$("#content").val().length;
	    if(len > 10000){
	        var text = $("#content").val();
	        var sub=$("#content").val(text.substr(0, 10000));   
	        $('#count').text(sub.val().length);
	    }else{
	    	$('#count').text(len);
	    }
	};

function click_upload(){
	document.getElementById("file").click();
}(jQuery);;
function enable_upload_image(){
	$('#button_choose_image_default').prop( "disabled", true );
	document.getElementById("direct_url").disabled = false;
	document.getElementById("button_for_upload").disabled = false;
	document.getElementById("direct_url").value = "";
	
};

function disable_upload_image(){
	$('input[name="radio_basic_url"]').prop( "checked", true );
	$('#button_choose_image_default').prop( "disabled", false );
	var root=document.getElementById("root_url").value;
	document.getElementById("direct_url").disabled = true;
	document.getElementById("button_for_upload").disabled = true;
	document.getElementById("direct_url").disabled = "";
	document.getElementById("file").value="";	
	document.getElementById("direct_url").value = "";
};

function show_window(){
	$('input[name="radio_basic_url"]').prop( "checked", true );
	var root=document.getElementById("root_url").value;
	window.trams.popup.open('#book-image-picker')
	document.getElementById("direct_url").disabled = true;
	document.getElementById("button_for_upload").disabled = true;
	document.getElementById("direct_url").disabled = "";
	document.getElementById("file").value="";	
	document.getElementById("direct_url").value = "";
};

function choosen_basic_image(){
	
	window.trams.popup.close('#book-image-picker');
	var root=document.getElementById("root_url").value;
	var url=$('input[name="radio_basic_url"]:checked').val();
	document.getElementById("basic_url").value=url;
	if($("#choosen_basic_image").is(':checked')){
		document.getElementById("cover_image_display").src=root+""+url;
	}
};


var loadFile = function(event) {
	if($("#choosen_direct_image").is(':checked')){
		 var reader = new FileReader();
		    reader.onload = function(){
		      var output = document.getElementById("cover_image_display");
		      var filename = document.getElementById("file").value;
		      var fileSize = document.getElementById("file").files[0].size;
		      var lastIndex = filename.lastIndexOf("\\");
		      if (lastIndex >= 0) {
		          filename = filename.substring(lastIndex + 1);
		      }
		      
		      output.src = reader.result;
		      if(fileSize>2097152){
		    	  $('#popupInputAllRequiredImage').modal('show');
		    	  document.getElementById("direct_url").value = "";
		      }else{
		    	  document.getElementById("direct_url").value = filename;
		      }
		    };
		    reader.readAsDataURL(event.target.files[0]);   
	}
};

function show_hide_comment() {
	if(document.getElementById('comment').style.display=='none') { 
        document.getElementById('comment').style.display='block'; 
        document.getElementById("button_show_hide_comment").innerHTML='리뷰 기본 보기';
    }else{
    	document.getElementById('comment').style.display = 'none';
    	document.getElementById("button_show_hide_comment").innerHTML='리뷰더보기';
    }
	
}

var fontSize = 1;
$( document ).ready(function() {
    if ($('.mobile').css('display') == 'block') {
    	fontSize = 1.5;
    }else{
    	fontSize = 1;
    }
});


function zoom_in_text() {
    fontSize += 0.1;
    $(".episode_content").css('font-size',fontSize + "em");
    if ($('.visible-sm').css('display') == 'block') {
    	auto_grow( $(".mobile")[0] );
    }else{
    	auto_grow( $(".web")[0] );
    }
    
}
function zoom_out_text() {
    fontSize -= 0.1;
    $(".episode_content").css('font-size',fontSize + "em");
    if ($('.visible-sm').css('display') == 'block') {
    	auto_grow( $(".mobile")[0] );
    }else{
    	auto_grow( $(".web")[0] );
    }
    
}

function scrollUp() {
	 window.scrollBy(0, -500);
}
function scrollDown() {
	 window.scrollBy(0, 500);
}
function previous_page(){
	document.getElementById('content').style.display = "block";
	if ($('.visible-sm').css('display') == 'block') {
    	auto_grow( $(".mobile")[0] );
    }else{
    	auto_grow( $(".web")[0] );
    }
}
function next_page(){
	var ok=document.getElementById("content").value;
	if(document.getElementById("content").value!="" && document.getElementById("content2").value!=null){  
		document.getElementById('content').style.display = "block";
		if ($('.visible-sm').css('display') == 'block') {
	    	auto_grow( $(".mobile")[0] );
	    }else{
	    	auto_grow( $(".web")[0] );
	    }
	}
	
}

function update_bookmark(id){
	var url = root_url+"api/update_bookmark";
	$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				if(data.code == 0){
					$("#bookmark").attr("src",root_url+"theme/assets/img/bookmark-inactive.png");
					
				}else if(data.code == 2){
					$("#bookmark").attr("src",root_url+"theme/assets/img/bookmark.png");
					$('#popup_add_bookmark').modal('show');
				} 
			}
		});
}

function update_recommendation(id){
	var url = root_url+"api/update_recommendation";
		$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				if(data.code == 0){
					$("#recommendation").html(data.message);
				}else if(data.code == 2){
					$("#recommendation").html(data.message);
				} 
			}
		});
}


function create_comment(id){
	var url = root_url+"api/create_comment";
	var content=$("#comment_content").val();
		$.ajax({
			type: "GET",
			url: url,
			data: {id:id,content:content},
			success: function(response)
			{
				if(response.code == 0){
					
					str="";
					str+="<div id='delete_comment_"+response.data.id+"' class='wb-comment-item'>";
                	str+="<div class='row'>";
                  		str+="<div class='col-xs-8'>";
                    		str+="<div><span class='wb-f16 wb-mr18'>"+response.message+"</span><span class='wb-color-gray'>"+response.data.typeKey;
							str+="</span><jsp:text/></div>";
                    		str+="<div class='wb-f16 wb-mr18 wb-mt6 wb-color-gray' id='comment_content_id_"+response.data.id+"'>"+response.data.comment+"</div>";
                  			str+="<textarea name='edit_comment_board' id='edit_comment_id_"+response.data.id+"' class='wb-area wb-area-style1 edit-comment'>"+response.data.comment+"</textarea>";
                  		str+="</div>";
                  		str+="<div class='col-xs-4 wb-comment-side'>";
                    		str+="<div id='comment_tool_"+response.data.id+"'>";
                  				str+="<button type='button' class='brb wb-rbtn' onclick='edit_comment("+response.data.id+")'>수정</button>";
                  				str+="<button type='button' onclick='delete_comment_episode("+response.data.id+","+id+")'  class='brb wb-rbtn-bold '  >삭제</button>";
	            			str+="</div>";
                			str+="<div class='edit_tool' id='edit_tool_"+response.data.id+"'>";
	              			str+="	<button type='button' class='brb wb-rbtn' onclick='cancel_edit_comment("+response.data.id+")'>취소</button>";
	              			str+="	<button type='button' class='brb wb-rbtn-bold' onclick='save_comment("+response.data.id+")'>저장</button>";
	            			str+="</div>";
                  		str+="</div>";
                	str+="</div>";
              		str+="</div>";
              		$("#add_coment").html(str+$("#add_coment").html());
              		$("#comment_content").val("");
				}else {
					$("#add_coment").innerHTML("");
				} 
			}
		});
}
function delete_comment(comment_id,episode_id){

	
	var url = root_url+"api/delete_comment";
	var content=$("#comment_content").val();
		$.ajax({
			type: "GET",
			url: url,
			data: {comment_id:comment_id,episode_id:episode_id},
			success: function(response)
			{
				if(response.code == 0){
              		$("#delete_comment_"+comment_id).hide();
				}
			}
		});
}
function update_interested(id){
	var url = root_url+"api/update_interested";

		$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				if(data.code == 0){
					$("#interested").html(data.message);
					$('#popup_delete_interested_book').modal('show');
					}else if(data.code == 2){
						$("#interested").html(data.message);	
						$('#popup_add_interested_book').modal('show');
				} 
			}
		});
}





function report(id){
	var url = root_url+"api/report";
		$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				if(data.code == 0){
					$("#interested").html("<a href='javascript:;' onclick='add_interested("+id+")'>" +
							"<button type='button' class='wb-btn-ex1 gray'> <img src='"+root_url+"theme/assets/img/w-star.png' alt='white heart' class='wb-mr6'/>" +
							"<span >관심작 등록</span>" +
							"<jsp:text/></button>");
				}else if(data.code == 2){
					$("#interested").html("<a href='javascript:;' onclick='delete_interested("+id+")'>" +
							"<button type='button' class='wb-btn-ex1 gray'> <img src='"+root_url+"theme/assets/img/w-star.png' alt='white heart' class='wb-mr6'/>" +
							"<span >취소 관심작 등록</span>" +
							"<jsp:text/></button>");
				} 
			}
		});
}
 

