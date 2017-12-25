var submit_payment=0;
function updatePaymentMethodName(name){
		$("#payment_method_name").val(name);
	}

function choseCoupon(price,str){
	$("#price").val(price);
	$('#goodname').val(str);
}

window.onload = function() {
	var payment_id=getCookie("payment_id");
	var coupon_id=getCookie("coupon_id");
	if(payment_id != 'null' && coupon_id!= 'null'){
		document.getElementById(payment_id).click();
		document.getElementById(coupon_id).click();
		eraseCookie("payment_id");
		eraseCookie("coupon_id");
	}
	};

function chosePaymentMethod(id){
	$('#paymethod').val(id);
	document.getElementById("warnning_IE").style.display = 'none';
	document.getElementById("PGIOscreen").style.display = 'inline';
	console.log(submit_payment);
	
	if(submit_payment){
		var price=$('#price').val();
		setCookie("payment_id", 'payment_method_'+id);
		setCookie("coupon_id", 'coupon_'+price);
		location.reload();
	}
	if(id==34){
		$('#paymethod').val("card");
	}else if(id==35){
		$('#paymethod').val("801");
	}else if(id==36){
		$('#paymethod').val("4");
	}else if(id==39){
		$('#paymethod').val("7");
	}
}

function setCookie(cname, cvalue) {
    var d = new Date();
    d.setTime(d.getTime() + (60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}
function eraseCookie(c_name) {
	setCookie(c_name, null);
}

function submitPGIO() {    
	var form = $("#form_required_payment");
	var radioList = form.find(".wb-radio.required:visible");
	var index=0;
	radioList.each(function() {
      var radioChecked = $(this).find("[type='radio']:checked");
      if (!radioChecked.length) {
        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
      }
    });
	 
	 $("#form_required_payment").find(".wb-radio.required").each(function() {
	    var thisRadioList = $(this);
	    thisRadioList.on("change", "[type='radio']", function() {
	      if ($(this).is(":checked")) {
	        thisRadioList.removeClass("required-validate-false").css("border", "");
	      }
	    });
	  });
	 radioList.each(function() {
	      var radioChecked = $(this).find("[type='radio']:checked");
	      if (!radioChecked.length) {
	        index=1;
	      }
	    });
	 var payment_method=document.getElementById("paymethod").value;
	 if(payment_method=='card' || payment_method==4){
		 var Browser = navigator.userAgent;
			if ((Browser.indexOf('MSIE')>= 0 || Browser.indexOf('Trident/') >= 0) && index===0){
				document.getElementById("warnning_IE").style.display = 'none';  
				document.getElementById("PGIOscreen").style.display = 'block';
				doTransaction(document.PGIOForm);
				submit_payment=1;
			    window.trams.popup.open('#show_form_payment');
			}else{
				document.getElementById("warnning_IE").style.display = 'block';  
				document.getElementById("PGIOscreen").style.display = 'none';
				 
				window.trams.popup.open('#show_form_payment');
			}
	 }else{
		 if(index===0){
			 document.getElementById("warnning_IE").style.display = 'none';  
			 document.getElementById("PGIOscreen").style.display = 'block';
			 submit_payment=1;
			 doTransaction(document.PGIOForm);
			    window.trams.popup.open('#show_form_payment');
		 }
	 }
	
    
}