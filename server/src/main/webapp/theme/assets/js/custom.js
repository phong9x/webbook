
$(document).ready(function() {	


  (function() {
	    if (!$(".webbook_editor").length) return;
	    $('.webbook_editor').trumbowyg({
	        lang: 'ko',
	        // Redefine the button pane
	        btns: ['viewHTML',
	            '|', 'formatting',
	            '|', 'btnGrp-semantic',
	            '|', 'link',
	            '|', 'base64',
	            '|', 'btnGrp-justify',
	            '|', 'btnGrp-lists',
	            '|', 'horizontalRule'
	        ]
	    });
	})();
});

//$('#webbook_editor').change(function(){
//   
//});
//


