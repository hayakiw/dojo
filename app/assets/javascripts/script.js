// scroll
$(function(){
	var $anchors = $(" a.scroll[href^='#']");
	$anchors.each(function(){
		var $anchor   = $(this);
		var anchorID  = $anchor.attr("href");
		var $target   = $(anchorID);
		$anchor.click(function(e){
			var targetPositionTop = $target.offset().top;
			$('html, body').stop().animate({
				scrollTop: targetPositionTop
			}, 500);
			return false;
		});
	});
});

// modal addition
$(function(){
	$(document).on('click',"div.fancybox-close,div#fancybox-overlay",function(){
		$("body").removeClass("modal");
	});
	$("body div.wrapper a.open").on('click',function(){
		$("body").addClass("modal");
	});
});

// fancybox
$(window).resize(function() {
});

// menu accordion
$(function () {
	$(".menuButton").on("click", function() {
		$("ul.nav").toggleClass("active");
		$(this).toggleClass("active");
		$(".menuButton div.label").toggleClass("open");
	});
});

$(window).on("resize",function(){
	var w = $(window).width();
	if (w >= 640) {

	}
});
