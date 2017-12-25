
function post_data(){
	 var content = $('.trumbowyg-editor').html();
	 $("#content").val(content);
	 //alert($("#content").val());
	    $('#form_post').submit();
}
function post_data_edit_admin(){
	 var content = $('.trumbowyg-editor').html();
	 $("#content").val(content);
	 $("#edit").val(1);
	 //alert($("#content").val());
	 $("#popupConfirmEdit").modal("show");
	   
}

function required_post_form(){
	var title=document.getElementById("title").value;	
	 var content = $('.trumbowyg-editor').html();
	 $("#content").val(content);
	      if(title=='' || $('#content').val()==''){
	    	  $('#popupPostInputAllRequiredText').modal('show');
	  		}else{
	    	  $('#frmFreeboard').submit();
	      }
	
};


var loadFile1 = function(event) {
	 var reader = new FileReader();
	    reader.onload = function(){
	      var fileSize = document.getElementById("input_file_1").files[0].size;
	      var max_size=3*1024*1024;
	      if(fileSize>max_size){
	    	  document.getElementById("message1").innerHTML='첨부파일은 3MB이하 등록될 수 있습니다';
	    	  document.getElementById("message1").style.color = "red";
	    	  document.getElementById("file1display").innerHTML='';
	    	  document.getElementById("button_submit_post").disabled = true;
	      }else if(fileSize<=0){
	    	  document.getElementById("message1").innerHTML='선택된 파일 없음';
	    	  document.getElementById("button_submit_post").disabled = false;
	      }else{
	    	  document.getElementById("message1").innerHTML='';
	    	  document.getElementById("button_submit_post").disabled = false;
	      }
	    };
	    reader.readAsDataURL(event.target.files[0]);

};

var loadFile2 = function(event) {
	 var reader = new FileReader();
	    reader.onload = function(){
	      var fileSize = document.getElementById("input_file_2").files[0].size;
	      var max_size=3*1024*1024;
	      console.log(fileSize);
	      if(fileSize>max_size){
	    	  document.getElementById("message2").innerHTML='첨부파일은 3MB이하 등록될 수 있습니다';
	    	  document.getElementById("file2display").innerHTML='';
	    	  document.getElementById("message2").style.color = "red";
	    	  document.getElementById("button_submit_post").disabled = true;
	    	  
	      }else if(fileSize<=0){
	    	  document.getElementById("message2").innerHTML='선택된 파일 없음';
	    	  document.getElementById("button_submit_post").disabled = false;
	      }else{
	    	  document.getElementById("message2").innerHTML='';
	    	  document.getElementById("button_submit_post").disabled = false;
	      }
	    };
	    reader.readAsDataURL(event.target.files[0]);

};


 

