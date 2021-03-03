/*==============================================

    ----------------------------------------------------------------
	* Date			:	2019.01.01
	* Modify		:
	* Name			:	front_ui.js
	----------------------------------------------------------------

	- Description -
	01. front.init()				:	프론트 스크립트 초기실행
	02. front.ready()				:	html 문서 로드 완료시
	03. front.resize()				:	window 크기 변경시
	04. front.scroll()				:	window 스크롤시

==============================================*/


/*===================================
@ front
===================================*/
var front = {

	winW : null,									//윈도우 넓이
	winH : null,									//윈도우 높이
	browser : null,									//브라우저 종류
	sc : null,										//스크롤 상단값

	init : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
		front.browser = navigator.userAgent;

		front.scroll();

		front.common.init();
		front.common.tab();
		front.common.faq();
		front.common.quickTop();
		front.common.slide();
	},

	ready : function(){

	},

	resize : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
	},

	scroll : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
		front.sc = $(document).scrollTop();

		if($('.location-menu').length){
			var locationH = $('.location-menu').offset().top;
			if(front.sc >= locationH-410){
				$('#dHead').addClass('scroll');
			}else {
				$('#dHead').removeClass('scroll');
			}
			if($('#dBody').hasClass('no-visual')){
				$('#dHead').removeClass('scroll');
			}
		}

		var win = $(window),
			section = $('.load-fadein'),
			agt = navigator.userAgent.toLowerCase();

		if(agt.indexOf('msie 9.0') > -1){
			section.addClass('active');
		}else{
			win.on('load scroll', function(){
				var winTop = $(this).scrollTop(),
					winH = $(this).height();

				section.each(function(){
					var tg = $(this),
						tgTop = tg.offset().top + 100;

					if(tgTop <= winTop+winH){
						tg.addClass('active');
					}
				});
			});
		}
	},

	common : {

		init : function(){

			var common = front.common;

			common.gnb.init();

			if($('.accordion-list').length){
				common.accordion.init();
			};

			// 서브비주얼 이펙트
			if($('.visual').length || $('.menu-visual').length){
				$('.visual').addClass('open');
			}else{
				if(!$('#dBody').hasClass('main'))
					$('#dHead').addClass('basic');
			}

			//	서브 로케이션 클릭 이벤트
			if($('.location-menu').length){
				$('.location-menu').find('.nav > ul > li > a').click(function(){
					var _parent		=	$(this).parents('li');
					if(_parent.hasClass('open')){
						_parent.removeClass('open');
						_parent.find('.nav-list').stop(true).slideUp(450);
						common.locationCheck();
					}else{
						_parent.addClass('open');
						_parent.find('.nav-list').stop(true).slideDown(450);
						$('.location-menu').addClass('open');
					}
				});

				$('body').on("click",function(e) {
					if($(e.target).parents('.location-menu .depth01, .location-menu .depth02').length == 0) {
						common.locationClose();
					}
				});
			}

			// 다국어 셀렉트
			$(document).on('click', '.btn-country > a', function(e){
				e.preventDefault();
				if(!$(this).parent().hasClass("on")){
					$(this).parent().addClass("on")
				}else{
					$(this).parent().removeClass("on")
				}
			});

			// 푸터 패밀리사이트 셀렉트
			$(document).on('click', '.family-site > a', function(e){
				e.preventDefault();
				if(!$(this).parent().hasClass("on")){
					$(this).parent().addClass("on")
				}else{
					$(this).parent().removeClass("on")
				}
			});

		},

		// 퀵메뉴
		quickTop : function(){
			var quickMenu = $('.quick-menu');

			$(document).on('scroll', function(){
				var sct = $(this).scrollTop();

				if(sct > 500){
					quickMenu.addClass("on");
				}else{
					quickMenu.removeClass("on");
				}
			});
		},

		gnb : {

			init : function(){

				var time;

				var Header = $('#dHead');
					Gnb = $('#gnb');
					inner = $('#dHead .inner');

				//GNB 마우스 오버 이벤트
				Gnb.on('mouseenter focusin',function(){
					inner.stop(true).animate({height: '350px'}, 400);
					Header.addClass('on');
				});

				//GNB 마우스 아웃 이벤트
				inner.on('mouseleave focusout',function(){
					inner.stop(true).animate({height: '89px'}, 400);

					timeSet();
				});

				function timeSet() {
					timeStop();
					time = setTimeout(function() {
						Header.removeClass('on');
					}, 300);
				}

				function timeStop() {
				  clearTimeout(time);
				}

			},

		},

		// 탑버튼
		moveScroll : function(tgY, speed){
			if(speed == null || speed == 'undefind') speed = 1000;
			$('html, body').stop().animate({'scrollTop':tgY}, {queue:false, duration:speed, easing:'easeOutCubic'});

		},

		//이미지 슬라이드 공동
		 slide : function(){
			if($('.slide-wrap').length <= 0){
				return;
			};

			$('.slide-wrap').slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: false,
				dots: true
			});
		},

		locationCheck : function(){
			var _flag = true;
			$('.location-menu').find('ul > li').each(function(){
				if($(this).hasClass('open'))_flag = false;
			});

			if(_flag){
				$('.location-menu').removeClass('open');
			}
		},

		locationClose : function(){
			$('.location-menu').find('ul > li').each(function(){
				if($(this).hasClass('open')){
					$(this).removeClass('open');
					$(this).find('.nav-list').stop(true).slideUp(450);
				}
			});

			front.common.locationCheck();
		},

		// 탭 메뉴
		tab : function(){

			var tabArea = $('.tabArea');
				tabAreaLi = tabArea.find('li'),
				tabCon = $('.tap-con');

			tabAreaLi.on('click', function(){
				var _this = $(this),
				idx = _this.index();

				_this.addClass('active').siblings().removeClass('active');
				tabCon.eq(idx).addClass('on').siblings().removeClass('on');

				return false;
			});

		},

		// faq
		faq : function(){

			var faqList = $('.faq-list'),
				faqDl = faqList.find('dl');

			faqDl.on('click' , function(){
				var _this = $(this),
				idx = _this.index();

				_this.addClass('active').siblings().removeClass('active');
				if(_this.hasClass('active')){
					_this.find('dd').stop(true).slideToggle(450);
					_this.siblings().find('dd').stop(true).slideUp(450);
				}

				return false;
			});

		},

		getParamater : function(key){
			var url = location.href;
			var spoint = url.indexOf("?");
			var query = url.substring(spoint, url.length);
			var keys = new Array;
			var values = new Array;
			var nextStartPoint = 0;
			while (query.indexOf("&", (nextStartPoint + 1)) > -1) {
				var item = query.substring(nextStartPoint, query.indexOf("&", (nextStartPoint + 1)));
				var p = item.indexOf("=");
				keys[keys.length] = item.substring(1, p);
				values[values.length] = item.substring(p + 1, item.length);
				nextStartPoint = query.indexOf("&", (nextStartPoint + 1));
			}
			item = query.substring(nextStartPoint, query.length);
			p = item.indexOf("=");
			keys[keys.length] = item.substring(1, p);
			values[values.length] = item.substring(p + 1, item.length);
			var value = "";
			for (var i = 0; i < keys.length; i++) {
				if (keys[i] == key) {
					value = values[i];
				}
			}
			return value;
		},

		agentCheck : function(){
			var UserAgent = navigator.userAgent;
			var UserFlag = true;
			if (UserAgent.match(/iPhone|iPad|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) UserFlag = false
			return UserFlag
		}

	},

}
/*===================================
@ init
===================================*/
$(function(){
	front.init();
});


/*===================================
@ document ready
===================================*/
$(document).ready(function () {

});


/*===================================
@ window resize
===================================*/
$(window).resize(function () {
	front.resize();
});


/*===================================
@ window scroll
===================================*/
$(window).scroll(function () {
	front.scroll();
});
