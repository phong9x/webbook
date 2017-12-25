(function($) {
  if (!$(".required").length) return;

  var popupInputAllRequiredThings = $("#popupInputAllRequiredThings");

  $("#form_required").on("submit", function() {
    var form = $(this);
    var inputbox = form.find(".textbox-required.required:visible");
    var textField = form.find(".text-field.required:visible");
    var select = form.find(".wb-select.required:visible select");//<option disabled="disabled" selected="selected">선택</option>
    var checkboxList = form.find(".wb-checkbox.required:visible");
    var radioList = form.find(".wb-radio.required:visible");
    var fileUpload = form.find(".file-upload.required:visible");
    
    inputbox.each(function() {
      $(this).val() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
    });

    textField.each(function() {
      $(this).text() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
    });

    select.each(function() {
    	console.log($(this).val());
    	
      if ($(this).val() == null) {
        $(this).addClass("required-validate-false");
        $(this).parent().css("border", "1px solid #ff0000");
      }
    });

    checkboxList.each(function() {
      var checkboxChecked = $(this).find("[type='checkbox']:checked");

      if (!checkboxChecked.length) {
        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
      }
    });

    radioList.each(function() {
      var radioChecked = $(this).find("[type='radio']:checked");

      if (!radioChecked.length) {
        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
      }
    });

    fileUpload.each(function() {
      var inputFile = $(this).find(".input-file");
      var borderBox = $(this).find(".border-box");

      if (inputFile.val() === "") {
        $(this).addClass("required-validate-false");
        borderBox.css("border", "1px solid #ff0000");
      }
    });
   var index=0;
    if (form.find(".required-validate-false").length) {
      window.trams.popup.open('#popupRequiredEveryThing');
      popupInputAllRequiredThings.modal("show");
      index++;
      return false;
    }
    if(index==0){
    	if($("#rule").length > 0){
    		if($("#rule:checked").length == 0){
        		$("#popupRequiredTerm").modal("show");
        		 return false;
        	}
    	}
    	
    }
  });

  $("form").on("keyup", ".textbox-required.required", function() {
    if ($(this).val() != null) {
      $(this).removeClass("required-validate-false").css("border", "");
    }
  });

  $("form").on("keyup", ".text-field.required", function() {
    if ($(this).text() != "") {
      $(this).removeClass("required-validate-false").css("border", "");
    }
  });

  $("form").on("change", ".wb-select.required select", function() {
    if ($(this).val().length >= 1) {
      $(this).removeClass("required-validate-false");
      $(this).parent().css("border", "");
    }
  });

  $("form").find(".wb-checkbox.required").each(function() {
    var thisCheckboxList = $(this);

    thisCheckboxList.on("change", "[type='checkbox']", function() {
      if ($(this).is(":checked")) {
        thisCheckboxList.removeClass("required-validate-false").css("border", "");
      }
    });
  });

  $("form").find(".wb-radio.required").each(function() {
    var thisRadioList = $(this);

    thisRadioList.on("change", "[type='radio']", function() {
      if ($(this).is(":checked")) {
        thisRadioList.removeClass("required-validate-false").css("border", "");
      }
    });
  });

  $("form").find(".file-upload.required").each(function() {
    var thisFileUpload = $(this);
    var inputFile = thisFileUpload.find(".input-file");
    var borderBox = thisFileUpload.find(".border-box");

    thisFileUpload.on("change", inputFile, function() {
      if (inputFile.val() !== "") {
        thisFileUpload.removeClass("required-validate-false");
        borderBox.css("border", "");
      }
    });
  });

  
	      
	  
  
  var scrollView = function(scrollToThis) {
    if (!scrollToThis.length) return;

    $('html, body').animate({
      scrollTop: scrollToThis.offset().top
    }, 500);
  };

  
  popupInputAllRequiredThings.on('hidden.bs.modal', function(e) {
    scrollView($("[class*='validate-false']"));
  });
})(jQuery);

(function($) {
	  if (!$(".required").length) return;

	  var popupInputAllRequiredThings = $("#popupRequiredEveryThingSignup");

	  $("#form_signup").on("submit", function() {
	    var form = $(this);
	    var inputbox = form.find(".textbox-required.required:visible");
	    var textField = form.find(".text-field.required:visible");
	    var select = form.find("select.required:visible");
	    var checkboxList = form.find(".wb-checkbox-list.required:visible");
	    var radioList = form.find(".wb-radio.required:visible");
	    var fileUpload = form.find(".file-upload.required:visible");

	    inputbox.each(function() {
	      $(this).val() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
	    });

	    textField.each(function() {
	      $(this).text() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
	    });

	    select.each(function() {
	      if ($(this).val() === null) {
	        $(this).addClass("required-validate-false");
	        $(this).parent().css("border", "1px solid #ff0000");
	      }
	    });

	    checkboxList.each(function() {
	      var checkboxChecked = $(this).find("[type='checkbox']:checked");

	      if (!checkboxChecked.length) {
	        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
	      }
	    });

	    radioList.each(function() {
	      var radioChecked = $(this).find("[type='radio']:checked");

	      if (!radioChecked.length) {
	        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
	      }
	    });

	    fileUpload.each(function() {
	      var inputFile = $(this).find(".input-file");
	      var borderBox = $(this).find(".border-box");

	      if (inputFile.val() === "") {
	        $(this).addClass("required-validate-false");
	        borderBox.css("border", "1px solid #ff0000");
	      }
	    });

	    if (form.find(".required-validate-false").length) {
	      window.trams.popup.open('#popupRequiredEveryThingSignup');;
	      return false;
	    }

	    
	  });

	  $("form").on("keyup", ".textbox-required.required", function() {
	    if ($(this).val() != null) {
	      $(this).removeClass("required-validate-false").css("border", "");
	    }
	  });

	  $("form").on("keyup", ".text-field.required", function() {
	    if ($(this).text() != "") {
	      $(this).removeClass("required-validate-false").css("border", "");
	    }
	  });

	  $("form").on("change", "wb-select.required", function() {
	    if ($(this).val().length >= 1) {
	      $(this).removeClass("required-validate-false");
	      $(this).parent().css("border", "");
	    }
	  });

	  $("form").find(".wb-checkbox-list.required").each(function() {
	    var thisCheckboxList = $(this);

	    thisCheckboxList.on("change", "[type='checkbox']", function() {
	      if ($(this).is(":checked")) {
	        thisCheckboxList.removeClass("required-validate-false").css("border", "");
	      }
	    });
	  });

	  $("form").find(".wb-radio.required").each(function() {
	    var thisRadioList = $(this);

	    thisRadioList.on("change", "[type='radio']", function() {
	      if ($(this).is(":checked")) {
	        thisRadioList.removeClass("required-validate-false").css("border", "");
	      }
	    });
	  });

	  $("form").find(".file-upload.required").each(function() {
	    var thisFileUpload = $(this);
	    var inputFile = thisFileUpload.find(".input-file");
	    var borderBox = thisFileUpload.find(".border-box");

	    thisFileUpload.on("change", inputFile, function() {
	      if (inputFile.val() !== "") {
	        thisFileUpload.removeClass("required-validate-false");
	        borderBox.css("border", "");
	      }
	    });
	  });

	  var scrollView = function(scrollToThis) {
	    if (!scrollToThis.length) return;

	    $('html, body').animate({
	      scrollTop: scrollToThis.offset().top
	    }, 500);
	  };

	  
	  
	  popupInputAllRequiredThings.on('hidden.bs.modal', function(e) {
	    scrollView($("[class*='validate-false']"));
	  });
	})(jQuery);





(function($) {
	  if (!$(".required").length) return;
	  var popupInputAllRequiredThings = $("#popupInputAllRequiredThings");
	  $("#form_required_popup_comment").on("submit", function() {
	    var form = $(this);
	    var inputbox = form.find(".textbox-required.required:visible");
	    var textField = form.find(".text-field.required:visible");
	    var select = form.find(".wb-select.required:visible select");
	    var checkboxList = form.find(".wb-checkbox.required:visible");
	    var radioList = form.find(".wb-radio.required:visible");
	    var fileUpload = form.find(".file-upload.required:visible");

	    inputbox.each(function() {
	      $(this).val() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
	    });

	    textField.each(function() {
	      $(this).text() === "" ? $(this).addClass("required-validate-false").css("border", "1px solid #ff0000") : $(this).removeClass("required-validate-false").css("border", "")
	    });

	    select.each(function() {
	    	console.log($(this).val());
	      if ($(this).val() == null) {
	        $(this).addClass("required-validate-false");
	        $(this).parent().css("border", "1px solid #ff0000");
	      }
	    });

	    checkboxList.each(function() {
	      var checkboxChecked = $(this).find("[type='checkbox']:checked");

	      if (!checkboxChecked.length) {
	        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
	      }
	    });

	    radioList.each(function() {
	      var radioChecked = $(this).find("[type='radio']:checked");

	      if (!radioChecked.length) {
	        $(this).addClass("required-validate-false").css("border", "1px solid #ff0000");
	      }
	    });

	    fileUpload.each(function() {
	      var inputFile = $(this).find(".input-file");
	      var borderBox = $(this).find(".border-box");

	      if (inputFile.val() === "") {
	        $(this).addClass("required-validate-false");
	        borderBox.css("border", "1px solid #ff0000");
	      }
	    });

	    if (form.find(".required-validate-false").length) {
	      window.trams.popup.open('#popupRequiredEveryThing');
	      return false;
	    }
	  });

	  $("form").on("keyup", ".textbox-required.required", function() {
	    if ($(this).val() != null) {
	      $(this).removeClass("required-validate-false").css("border", "");
	    }
	  });

	  $("form").on("keyup", ".text-field.required", function() {
	    if ($(this).text() != "") {
	      $(this).removeClass("required-validate-false").css("border", "");
	    }
	  });

	  $("form").on("change", ".wb-select.required select", function() {
	    if ($(this).val().length >= 1) {
	      $(this).removeClass("required-validate-false");
	      $(this).parent().css("border", "");
	    }
	  });

	  $("form").find(".wb-checkbox.required").each(function() {
	    var thisCheckboxList = $(this);

	    thisCheckboxList.on("change", "[type='checkbox']", function() {
	      if ($(this).is(":checked")) {
	        thisCheckboxList.removeClass("required-validate-false").css("border", "");
	      }
	    });
	  });

	  $("form").find(".wb-radio.required").each(function() {
	    var thisRadioList = $(this);

	    thisRadioList.on("change", "[type='radio']", function() {
	      if ($(this).is(":checked")) {
	        thisRadioList.removeClass("required-validate-false").css("border", "");
	      }
	    });
	  });

	  $("form").find(".file-upload.required").each(function() {
	    var thisFileUpload = $(this);
	    var inputFile = thisFileUpload.find(".input-file");
	    var borderBox = thisFileUpload.find(".border-box");

	    thisFileUpload.on("change", inputFile, function() {
	      if (inputFile.val() !== "") {
	        thisFileUpload.removeClass("required-validate-false");
	        borderBox.css("border", "");
	      }
	    });
	  });

	  var scrollView = function(scrollToThis) {
	    if (!scrollToThis.length) return;

	    $('html, body').animate({
	      scrollTop: scrollToThis.offset().top
	    }, 500);
	  };

	  popupInputAllRequiredThings.on('hidden.bs.modal', function(e) {
	    scrollView($("[class*='validate-false']"));
	  });
	})(jQuery);
function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}