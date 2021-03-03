 $(document).ready(function() {
	$('#fullpage').fullpage({
		anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'fifthPage', 'sixthPage', 'seventhPage'],
		menu: '.right-nav',
		afterLoad: function(anchorLink, index){
			if(index == 2){
				$('.volume').counterUp({delay: 10,time: 500});
			}
			if(index == 3){
				$('.volume2').counterUp({delay: 10,time: 500});
			}
		}
	});
	// Swiper
	function mSwiper() {
		var mSwiper = new Swiper('.swiper', {
			wrapperClass: 'swiper_wrap',
			slideClass: 'swiper_slide',
			slidesPerView: 1,
			effect: "fade",
			loop: true,
			speed: 500,
			autoplay: {
				delay: 4000,
				disableOnInteraction: false
			},
			pagination: {
				el: '.swiper_pagination',
				clickable: true,
			},
		});
	}
	if( $(".swiper .swiper_slide").length > 1 ){
		mSwiper();
		//$('.swiper_slide .cont').css({height: '75%'});
	}
});











