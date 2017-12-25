
function click_upload(str){
	document.getElementById(str).click();
};



var loadFile1 = function(event) {
	 var reader = new FileReader();
	    reader.onload = function(){
	      var fileSize = document.getElementById("upload1").files[0].size;
	      if(fileSize>0){
	    	  document.getElementById("form_banner").submit();
	      }
	    };
	    reader.readAsDataURL(event.target.files[0]);
};
var loadFile2 = function(event) {
	 var reader = new FileReader();
	    reader.onload = function(){
	      var fileSize = document.getElementById("upload2").files[0].size;
	      if(fileSize>0){
	    	  document.getElementById("form_banner").submit();
	      }
	    };
	    reader.readAsDataURL(event.target.files[0]);
};
var loadFile3 = function(event) {
	 var reader = new FileReader();
	    reader.onload = function(){
	      var fileSize = document.getElementById("upload3").files[0].size;
	      if(fileSize>0){
	    	  document.getElementById("form_banner").submit();
	      }
	    };
	    reader.readAsDataURL(event.target.files[0]);
};

setTimeout(function(){
	var img1 = document.getElementById('image1'); 
	console.log($("#image1").width()+' x '+$("#image1").height());
	document.getElementById('size1').innerText=$("#image1").width()+' x '+$("#image1").height();
	}, 50);

setTimeout(function(){
	var img1 = document.getElementById('image2'); 
	console.log($("#image2").width()+' x '+$("#image2").height());
	document.getElementById('size2').innerText=$("#image2").width()+' x '+$("#image2").height();
	}, 50);

setTimeout(function(){
	var img1 = document.getElementById('image3'); 
	console.log($("#image3").width()+' x '+$("#image3").height());
	document.getElementById('size3').innerText=$("#image3").width()+' x '+$("#image3").height();
	}, 50);
