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
		var mSwiper = new Swiper('#section1 .swiper', {
			wrapperClass: 'swiper_wrap',
			slideClass: 'swiper_slide',
			slidesPerView: 1,
			effect: "fade",
			loop: true,
			speed: 300,
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
	if( $("#section1 .swiper .swiper_slide").length > 1 ){
		mSwiper();
	}
	// 점주 Swiper
	function storeSwiper() {
		var storeSwiper = new Swiper('#section4 .swiper', {
			wrapperClass: 'swiper_wrap',
			slideClass: 'swiper_slide',
			slidesPerView: 1,
			effect: "fade",
			loop: true,
			speed: 0,
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
	if( $("#section4 .swiper .swiper_slide").length > 1 ){
		storeSwiper();
	}

});

