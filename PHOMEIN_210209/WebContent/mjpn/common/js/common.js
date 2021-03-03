// gnb
function gnbOpen(){
	var win = $(window),
		body = $('html, body'),
		gnb = $('#gnb'),
		gnbH = $('.gnb_head'),
		gnbC = $('.gnb_container'),
		btnMenu = $('#header .btn_allmenu');
	btnMenu.on('click', function(){
		posY = $(window).scrollTop();
		if (!body.hasClass('lock')) {
			body.addClass('lock').css({'overflow':'hidden','height':'100%'}).bind('touchmove', function(e){e.preventDefault()});
			gnb.bind('touchmove', function(e){e.stopPropagation()});
		}
		$('#wrap').css({'top':-posY});
	});
	function closeNav(){
		body.removeClass('lock').css({'overflow':'','height':''}).unbind('touchmove');
		$('#wrap').css({'top':0});
		posY = $(window).scrollTop(posY);
	}
	gnb.click(function(e) {
		if (!gnbH.is(e.target) && gnbH.has(e.target).length === 0 && !gnbC.is(e.target) && gnbC.has(e.target).length === 0){
			closeNav();
		}
	});
}

// gnb nav
function gnbNav(){
	var gnbBtn = $('#gnb .gnb_menu > ul > li > a');
	gnbBtn.siblings('ul').hide();
	$('#gnb .gnb_menu > ul > li.on > ul').show();
	gnbBtn.on('click', function(){
        var target = $(this).siblings('ul');
        if($(this).parent().hasClass('on')){
            $(this).parent().removeClass('on');
            $(target).slideUp();
        }else{
            $(this).parent().addClass('on').siblings().removeClass('on');;
            $(this).parent().siblings().children('ul').slideUp();
            $(target).slideDown();
        }
        return false;
    });
}

// header scroll
function hdScroll(){
	$(window).scroll( function(){
		var header = $('#header'),
			scrTop = $(window).scrollTop();
		(scrTop > 0) ? header.addClass('fix') : header.removeClass('fix');
	});
}

// sub page lnb
function lnbNav(){
	var lnbDep = $('.lnb .dep'),
		lnbBtn = $('.lnb .dep > a');
	lnbBtn.click(function(){
		$(this).parent().toggleClass('on');
		$(this).siblings().slideToggle(200);
		return false;
	});
	lnbDep.mouseleave(function(){
		if ( $(this).find('.dep_list').css('display') == 'block' ) {
			$(this).removeClass('on');
			$(this).find('.dep_list').slideUp(200);
		}
	});
}

// category nav
function cateNav(){
	var settings = {
		wrapperClass: 'nav_cate_wrap',
		slideClass: 'nav_cate_btn',
		slidesPerView: 'auto',
		slideToClickedSlide: true,
		freeMode: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	},
  	cateSwiper = new Swiper('.nav_cate.swiper', settings);
	$('.nav_cate .nav_cate_btn').on('click', function(){
		$(this).siblings('.nav_cate_btn').removeClass('on');
		$(this).addClass('on');
	});
	$(window).resize(function(){
		cateSwiper.destroy(false,false);
		cateSwiper = new Swiper('.nav_cate.swiper', settings);
	});
};

// Swiper
function defaultSwiper() {
	function dfSwiper() {
		var dfSwiper = new Swiper('.swiper', {
			wrapperClass: 'swiper_wrap',
			slideClass: 'swiper_slide',
			slidesPerView: 1,
			loop: true,
			pagination: {
				el: '.swiper_pagination',
				clickable: true,
			},
			navigation: {
				nextEl: '.swiper_btn_next',
				prevEl: '.swiper_btn_prev',
			},
		});
	}
	if( $(".swiper .swiper_slide").length > 1 ){
		dfSwiper();
	}
}

// layer popup
function layerOpen(id){	//레이어 팝업 열기
	var Win = $(window),
		dim = $('.dim'),
		layerId = $('#'+id);
	layerId.addClass('open');
	layerId.css("top", Math.max(0, ((Win.height() - layerId.outerHeight()) / 2) + Win.scrollTop()) + "px");
	//layerId.css("top", (Win.scrollTop() + 88));
	dim.show();
	dim.on('click', function(){
		dim.hide();
		layerId.removeClass('open');
	});
	defaultSwiper();
}

function layerClose(id) {  //레이어 팝업 닫기
	var dim = $('.dim'),
		layerPop = $('.layer_pop'),
		layerId = $('#'+id);
	(layerId.length) ? layerId.removeClass('open') : layerPop.removeClass('open');
	dim.hide();
};

// 20190326 추가 s
var pop = {

	/*==========================================
	/	@ 팝업 오픈
	/	front.pop.open(아이디값) 으로 팝업 오픈
	==========================================*/
	open : function(_id){
		var target = $('#'+_id);
		//target.stop(true).fadeIn(400);
		target.addClass('open');
		target.find('.layer-pop-parent').scrollTop(0);
		if(target.hasClass('small'))target.scrollTop(0);
		$('html').addClass('fix');
	},

	close : function(_t){

		var _target = $(_t).parents('.layer-pop-wrap');
		//_target.stop(true).fadeOut(400);
		_target.removeClass('open');
		$('html').removeClass('fix');

		return false;

	}

};
// 20190326 추가 e

$(function(){
	// 공통 아코디언
	$('.ac_list').on('click', '.ac_tit', function(){
		var target = $(this).next('.ac_cont');
		if($(this).hasClass('on')){
			$(this).removeClass('on');
			$(target).removeClass('on').slideUp();
		}else{
			$(this).parent().siblings().children('.ac_tit').removeClass('on');
			$(this).addClass('on');
			$(this).parent().siblings().children('.ac_cont').removeClass('on').slideUp();
			$(target).addClass('on').slideDown();
		}
		return false;
	});
	gnbOpen();
	gnbNav();
	hdScroll();
	lnbNav();
});











