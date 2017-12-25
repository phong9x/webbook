//===============================
//FEATURE SLIDE
//===============================
(function($) {
	var shouldNotDo = 
		$(document).width() < window.wb.breakPoint.md
		|| !$(".wb-feature-slide").length;

	// console.log(shouldNotDo);

	if(shouldNotDo) { return; } 
		

	var classRight = ".wb-feature-slide-control-right";
	var classLeft = ".wb-feature-slide-control-left";
	var classwrapper = ".wb-feature-slide-wrapper";

	var classIndicator = ".wb-dot";

	var scrollAmount = 957;
	var $sliders = $(".wb-feature-slide");

	$sliders.each(function() {
		var $this = $(this),
			$wrapper = $this.find(classwrapper).first(),
			$right = $this.find(classRight).first(),

			$left = $this.find(classLeft).first(),
			$indicators = $this.find(classIndicator);

		var isAnimated = true,
			scrollOrigin = 0,
			currentPage = 1,

			currentScrollPos = 0,
			pages = 3,
			scrollTime = '500';

		$right.on("click", function() {
			if(!isAnimated) return;

			var pageToGo = currentPage + 1;
			pageToGo = (pageToGo > pages)? 1 : pageToGo;

			scrollToPage(pageToGo);
		});


		$left.on("click", function() {
			if(!isAnimated) return;

			var pageToGo = currentPage - 1;
			pageToGo = (pageToGo <= 0)? pages : pageToGo;

			scrollToPage(pageToGo);
		});


		function onScrollEnd() { 
		   isAnimated = true;

		   $indicators.filter(".active").removeClass("active");
		   $($indicators.get(currentPage - 1)).addClass("active");
		}

		function scrollToPage(page) {

			isAnimated = false;
			currentScrollPos = scrollAmount * (page - 1);

			$wrapper.first().animate({
				scrollLeft: currentScrollPos }, 
				scrollTime, 'swing', 
				onScrollEnd);

			currentPage = page;
		}
	});

})(jQuery);


//===============================
//OFF CANVAS
//===============================
(function($) {
	if(!$("#off-canvas-trigger").length) return;

	$("body").on("click", "#off-canvas-trigger", function() {
		$(".wb-canvas-wrapper").toggleClass("active");
	});
})(jQuery);


//===============================
//GO TOP
//===============================
(function($) {
	$("body").on("click", ".wb-gotop", function(){ 
        $('html,body').animate({ scrollTop: 0 }, 'swing');
        return false; 
    });
})(jQuery);

//===============================
//MOBILE BANNER SLIDER
//===============================
(function($) {
	$('.wbm-banner-slider').slick({
		arrows: false,
		dots: true,
		// swipeToSlide: true
	});
})(jQuery);


//===============================
//EDITOR
//===============================
(function($) {
	$('textarea.editor').ckeditor({
		// skin: 'flat'
	});
})(jQuery);



