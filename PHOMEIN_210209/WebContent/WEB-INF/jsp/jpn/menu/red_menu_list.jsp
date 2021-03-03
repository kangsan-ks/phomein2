<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="menu">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_02.jpg');"></div>
			<h2 class="h2-type">メニュー</h2>
<!-- 			<span class="txt">특별하지 않은 포메인은 없습니다. 조금 더 특별한 포메인을 소개합니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="search-option">
					<div class="option">
						<P class="all-menu"><a id="reset_btn" name="reset_btn" class="btn-03 type-01">ALL MENU</a></p>
					</div>
					<div class="option">
						<p class="chk-type01"><input type="checkbox" id="check0201" name="best_ck" value="Y"><label for="check0201"><span></span>BEST</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0202" name="hot_ck" value="Y"><label for="check0202"><span></span>SPICY</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0203" name="new_ck" value="Y"><label for="check0203"><span></span>NEW</label></p>
					</div>
					<div class="option">
						<c:forEach items="${jpcodes }" var="result" varStatus="status">
							<c:if test="${result.code != '102207' && result.code != '102202' }">
							<p class="chk-type01"><input type="checkbox" id="${result.code }" name="menu_ck" value="${result.code }"><label for="${result.code }"><span></span>${result.name }</label></p>
							</c:if>
						</c:forEach>
					</div>
				</div>

				<div class="menu-con">
					<!-- menu-board-list -->
					<div class="menu-board-list">
						<ul class="list_menu">
							<c:choose>
								<c:when test="${not empty resultList }" >
								<c:forEach items="${resultList }" var="result" varStatus="status" >
									<li>
										<a href="javascript:;" onclick="openLayer(${result.seq});">
											<div class="img"><img src="${result.f_file1 }" alt=""/></div>
											<div class="icon">
												<c:if test="${result.best_ck == 'Y' }"><span class="best">BEST</span></c:if>
												<c:if test="${result.new_ck == 'Y' }"><span class="new">NEW</span></c:if>
												<c:if test="${result.hot_ck == 'Y' }"><span class="hot">HOT</span></c:if>
											</div>
											<div class="name">
												<p class="ko-name">${result.jp_name }</p>
												<p class="en-name">${result.en_name }</p>
											</div>
											<div class="info">
												<p class="ko-name">${result.jp_name }</p>
												<p class="en-name">${result.en_name }</p>
												<p class="txt">${result.jp_menu }</p>
											</div>
										</a>
									</li>
								</c:forEach>
								<li class="tackout">
									<div class="img"><img src="../images/menu/tackout_service_1000x1000_red.png" alt=""/></div>
									<div class="name">
										<p class="ko-name">TAKE OUT SERVICE</p>
										<!-- <p class="ko-name">테이크아웃 서비스</p> -->
										<!-- <p class="en-name">TACKOUT SERVICE</p> -->
									</div>
								</li>
								</c:when>
								<c:otherwise>
									<!-- 20190220 수정 -->
									<li class="no-con">
										<p>検索された内容がありません。</p>
									</li>
									<!-- //20190220 수정 -->
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- //menu-board-list -->
				</div>

			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<div class="menu-view-pop" style="display:none;">
</div>

<script src="../common/js/front_ui.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>
<script src="../common/js/swiper.js"></script>
<script type="text/javascript">

	var agt = navigator.userAgent.toLowerCase();

	//상세 팝업 이미지 슬라이드
	function menuSlide(){
		var mySwiper = new Swiper('.swiper-container', {
			loop: false,
			speed: (agt.indexOf('msie 9.0') > -1) ? 0 : 500,
			simulateTouch: (agt.indexOf('msie 9.0') > -1) ? false : true,
			centeredSlides: true,
			spaceBetween: -350,
			onSlideChangeStart: function (swiper) {
	            console.log('slide change start - before');
	            console.log(swiper);
	            console.log(swiper.activeIndex);
	            //before Event use it for your purpose
	        },
	        onSlideChangeEnd: function (swiper) {
	            console.log('slide change end - after');
	            console.log(swiper);
	            console.log(swiper.activeIndex);
	            //after Event use it for your purpose
	            var $data = $(".swiper-slide")[swiper.activeIndex];
				var jp_name = $data.data("jp_name");
				var en_name = $data.data("en_name");
				var jp_menu = $data.data("jp_menu");
				var s_price = $data.data("s_price");
				var l_price = $data.data("l_price");
				var c_price = $data.data("c_price");
				var c_yn = $data.data("c_yn");

				//$(".us-name").text(jp_name);
				//$(".kr-name").text(jp_name);
				//$(".en-menu").text(jp_menu);
				$(".kr-name").text(jp_name + ' / ');
				$(".us-name").text(en_name);
				$(".en-menu").text(jp_menu);

				if(c_yn == "Y") {
					$(".price").html('<p><span><strong class="price_s"></strong>' + Number(s_price).toLocaleString() + 'WON</span><span><strong class="price_l"></strong>' + Number(l_price).toLocaleString() + 'WON</span></p>');
				} else if (c_yn == "N") {
					$(".price").html('<p><span>' + Number(c_price).toLocaleString() + 'WON</span></p>');
				}

				return false;
	        }
		});

		$('.menu-view-pop').find('.btn-prev').click(function(){
			mySwiper.swipePrev();
		});

		$('.menu-view-pop').find('.btn-next').click(function(){
			mySwiper.swipeNext();
		});
	};

	// 메뉴 클릭 시 상세 팝업 오픈
	function openLayer(seq) {
		$.ajax({
	     	url: "/jpn/menu/get_red_menu_view_ajax.do",
	        type: "POST",
	        data: {
	        	'seq' : seq
	        },
	        dataType: 'json',
	        success: function (data) {
	        	var tmplVal = new Object();
	    	    tmplVal.jpcodes = data.jpcodes;
	    	    tmplVal.resultView = data.resultView;
	    	    tmplVal.jpmenuList = data.jpmenuList;
	    	    $(".menu-view-pop").html($("#menuViewTmpl").tmpl(tmplVal));
	    	    menuSlide();

	    	    //숫자 타입에서 쓸 수 있도록 format() 함수 추가
	    		Number.prototype.format = function(){
	    		    if(this==0) return 0;

	    		    var reg = /(^[+-]?\d+)(\d{3})/;
	    		    var n = (this + '');

	    		    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	    		    return n;
	    		};

	    		// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	    		String.prototype.format = function(){
	    		    var num = parseFloat(this);
	    		    if( isNaN(num) ) return "0";

	    		    return num.format();
	    		};

	    		jQuery('.format-money').text(function() {
	    		    jQuery(this).text(
	    		        jQuery(this).text().format() + 'WON'
	    		    );
	    		});

	    		jQuery('.format-money-s').text(function() {
	    		    jQuery(this).html(
	    		        '<strong class="price_s"></strong>' + jQuery(this).text().format() + 'WON'
	    		    );
	    		});

	    		jQuery('.format-money-l').text(function() {
	    		    jQuery(this).html(
	    		        '<strong class="price_l"></strong>' + jQuery(this).text().format() + 'WON'
	    		    );
	    		});
	        },
	        error: function (xhr, status, error) {
	            if (xhr.status == 500) {
	            	alert('Internal error: ' + xhr.responseText);
	            } else {
	                alert('Unexpected error.');
	            }
	        }
	    });

		$('.menu-view-pop').stop(true).fadeIn(400);
		$('html').addClass('fix');

		return false;
	};

	// 상세 팝업 닫기
	function fnClose() {
		$('.menu-view-pop').stop(true).fadeOut(400);
		$('html').removeClass('fix');

		//return false;
		return;
	};

	// 메뉴 인덱스 값으로 호출
	function menuDetailPopActive(idx){
		$('.menu-view').slick('slickGoTo', idx);
	};


	// 개별
	$("input[name*='_ck']").on('click',function(){
		var idx = 0;
		$("input[name*='_ck']").each(function(){
			if($(this).is(":checked")) {
				idx++;
			}
		});
		if($("input[name*='_ck']").length == idx)
			$("input[name='checkAll']").prop("checked", true);
		else
			$("input[name='checkAll']").prop("checked", false);

		makeMenuList();
	});
	// 전체
	$("#reset_btn").on('click',function(){
		$("input[name*='_ck']").each(function() {
			$(this).prop('checked', false);
		});
		
		var menu_ck_arr = new Array();
		$("input[name='menu_ck']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				menu_ck_arr.push($this.val());
			}
		});
		
		var option = {
		     	url: "/jpn/menu/get_red_menu_list_ajax.do",
		        type: "POST",
		        data: {
		        	'best_ck' : 'Y',
		        	'hot_ck' : 'Y',
		        	'new_ck' : 'Y',
		            'menu_ck' : menu_ck_arr,
		            'all_ck' : 'Y'
		        },
		        dataType: 'json',
		        success: function (data) {
		        	var tmplVal = new Object();
		    	    tmplVal.jsonArr = data.result;
		    	    $("#totCnt").text(data.result.length + '개');
		    	    $(".list_menu").html($("#menuListTmpl").tmpl(tmplVal));
		        },
		        error: function (xhr, status, error) {
		            if (xhr.status == 500) {
		            	alert('Internal error: ' + xhr.responseText);
		            } else {
		                alert('Unexpected error.');
		            }
		        }
		};
		makeMenuList(option);
	});
	
	function makeMenuList(option) {
		var all_ck = "N";
		$("input[name='checkAll']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				all_ck = "Y";
			}
		});

		var best_ck = "N";
		$("input[name='best_ck']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				best_ck = $this.val();
			}
		});
		var hot_ck = "N";
		$("input[name='hot_ck']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				hot_ck = $this.val();
			}
		});
		var new_ck = "N";
		$("input[name='new_ck']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				new_ck = $this.val();
			}
		});
		var menu_ck_arr = new Array();
		$("input[name='menu_ck']").each(function(){
			var $this = $(this);
			if($this.is(":checked")) {
				menu_ck_arr.push($this.val());
			}
		});

		if(menu_ck_arr.length == 0) {
			if(all_ck == 'Y' || best_ck == 'Y' || hot_ck == 'Y' || new_ck == 'Y') {
				$("input[name='menu_ck']").each(function(){
					var $this = $(this);
					menu_ck_arr.push($this.val());
				});
			}
		}
		
		if (option === null || option === undefined) {
			var ckFlag = true;
			$("input[name*='_ck']").each(function(){
				if($(this).is(":checked")) {
					ckFlag = false;
				}
			});
			if (ckFlag) {
				best_ck = 'Y',
				hot_ck = 'Y',
				new_ck = 'Y',
				all_ck = 'Y'
			}
			option = {
			     	url: "/jpn/menu/get_red_menu_list_ajax.do",
			        type: "POST",
			        data: {
			        	'best_ck' : best_ck,
			        	'hot_ck' : hot_ck,
			        	'new_ck' : new_ck,
			            'menu_ck' : menu_ck_arr,
			            'all_ck' : all_ck
			        },
			        dataType: 'json',
			        success: function (data) {
			        	var tmplVal = new Object();
			    	    tmplVal.jsonArr = data.result;
			    	    $("#totCnt").text(data.result.length + '개');
			    	    $(".list_menu").html($("#menuListTmpl").tmpl(tmplVal));
			        },
			        error: function (xhr, status, error) {
			            if (xhr.status == 500) {
			            	alert('Internal error: ' + xhr.responseText);
			            } else {
			                alert('Unexpected error.');
			            }
			        }
		    };
		}

		$.ajax(option);
	}


	/*
	$("input[name='searchCondition']").on('click',function(){
		if($(this).is(":checked")) {
		    var tmplVal = makeJSON();
		    console.log( "[mirinae.maru] tmplVal : " + JSON.stringify(tmplVal) );
		    $("#menuListTmpl").tmpl(tmplVal).appendTo(".menu-board-list");
		} else {
			alert($(this).val());
		}
	});

	function makeJSON() {
	    var jsonArr = [ "한글", "b", "c"];
	    var tmplVal = new Object();
	    tmplVal.jsonArr = jsonArr;

	    return tmplVal;
	}
	*/

</script>

<script id="menuListTmpl" type="text/x-tmpl">
	{{if jsonArr.length > 0}}
	{{each(key,item) jsonArr}}
		<li>
			<a href="javascript:;" onclick="openLayer('{{= item.seq}}');">
				<div class="img"><img src="{{= item.f_file1}}" alt=""/></div>
				<div class="icon">
					{{if item.best_ck == "Y"}}
                    	<span class="best">BEST</span>
                    {{/if}}
					{{if item.new_ck == "Y"}}
                    	<span class="new">NEW</span>
                    {{/if}}
					{{if item.hot_ck == "Y"}}
                    	<span class="hot">HOT</span>
                    {{/if}}
				</div>
				<div class="name">
					<p class="ko-name">{{= item.jp_name}}</p>
					<p class="en-name">${result.en_name }</p>
				</div>
				<div class="info">
					<p class="ko-name">{{= item.jp_name}}</p>
					<p class="en-name">${result.en_name }</p>
					<p class="txt">{{= item.jp_menu}}</p>
				</div>
			</a>
		</li>
	{{/each}}
	<li class="tackout">
		<div class="img"><img src="../images/menu/tackout_service_1000x1000_red.png" alt=""/></div>
		<div class="name">
			<p class="ko-name">테이크아웃 서비스</p>
			<p class="en-name">TACKOUT SERVICE</p>
		</div>
	</li>
	{{/if}}
	{{if jsonArr.length == 0}}
		<li class="no-con">
			<p>検索された内容がありません。</p>
		</li>
	{{/if}}
</script>

<script id="menuViewTmpl" type="text/x-tmpl">
	<div class="menu-tap">
		<ul>
			{{each(key,item) jpcodes}}
{{if item.code != '102207' && item.code != '102202'}}
				<li class="{{if item.code == resultView.jp_code}}actived{{/if}}"><a {{if item.jpmenucode != ''}}onclick="openLayer('{{= item.jpmenucode}}');"{{/if}}>{{= item.name}}</a></li>
{{/if}}
			{{/each}}
		</ul>
		<a href="javascript:fnClose();" class="btn-pop-close"></a>
	</div>
	<!-- //menu-tap -->
	<!-- view-con -->
	<div class="view-con">
		<!-- menu-swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				{{each(key,item) jpmenuList}}
				<div class="swiper-slide" data-jp_name="{{= item.jp_name}}"  data-en_name="{{= item.en_name}}" data-jp_menu="{{= item.jp_menu}}" data-s_price="{{= item.s_price}}" data-l_price="{{= item.l_price}}" data-c_price="{{= item.c_price}}" data-c_yn="{{= item.c_yn}}">
					<div class="img">
           		    	<img src="{{= item.f_file1}}">
					</div>
					<div class="info">{{= item.jp_name}}</div>
				</div>
				{{/each}}
			</div>
			<div class="swiper-pagination"></div>
			<div class="control-btn">
				<a class="btn-prev"></a>
				<a class="btn-next"></a>
			</div>
		</div>
		<!-- //menu-swiper -->
		<div class="menu-info">
			<div class="info">
				<div class="name">
					<p>
						<span class="kr-name">{{= resultView.jp_name}} / </span>
						<span class="us-name">{{= resultView.en_name}}</span>
					</p>
					<p class="txt en-menu">{{= resultView.jp_menu}}</p>
				</div>
<!--
				<div class="price">
					{{if resultView.c_yn == "Y"}}
					<p>
						<span class="format-money-s">{{= resultView.s_price}}</span>
						<span class="format-money-l">{{= resultView.l_price}}</span>
					</p>
					{{/if}}
					{{if resultView.c_yn == "N"}}
					<p>
						<span class="format-money">{{= resultView.c_price}}</span>
					</p>
					{{/if}}
					<p class="txt">* 店舗によってメニューが異なる場合があります。</p>
				</div>
-->
			</div>
		</div>
	</div>
</script>
</body>
</html>
