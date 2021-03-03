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

<div id="popHtml"></div>

<!-- wrap -->
<div id="wrap" class="main">

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

	<section id="dBody">

		<!-- full-page -->
		<div class="full-page">
			<div id="fullpage">
				<!-- section 1 -->
				<div id="section1" class="section">
					<div class="top-visual">
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_01.jpg');">
							<div class="info-box">
								<p class="tit">ライスヌードルはフォーメイン</p>
								<p class="txt">The World’s Best Korean Vietnamese Restaurant Phomein</p>
								<p class="visual-dot-nav">ライスヌードルはフォーメイン</p>
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_02.jpg');">
							<div class="info-box">
								<p class="tit">米一粒から格別なフォーメインらしさ</p>
								<p class="txt">新米で直接作った米麺を使ってできれいで健康なライスヌードルをお届けします。</p>
								<p class="visual-dot-nav">米一粒から格別なフォーメインらしさ</p>
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_03.jpg');">
							<div class="info-box">
								<p class="tit">毎日厳しいフォーメインらしさ</p>
								<p class="txt">厳選された天然スパイスを使って毎日お店で14時間煮詰めてとったスープを使用しています。</p>
								<p class="visual-dot-nav">毎日厳しいフォーメインらしさ</p>
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_04.jpg');">
							<div class="info-box">
								<p class="tit">材料から健康なフォーメインらしさ</p>
								<p class="txt">危害商品遮断システムを導入して安全で優秀な品質の食材を供給してもらっています。</p>
								<p class="visual-dot-nav">材料から健康なフォーメインらしさ</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //section 1 -->
				<!-- section 2 -->
				<div id="section2" class="section" style="background-image:url('../images/tmp/main_visual_02.jpg');">
					<div class="sales-volume">
						<p class="label">SINCE 2006</p>
						<p class="tit">
							大韓民国におけるライスヌードル<br>の歴史はフォーメインから
						</p>
						<div class="volume-box">
							<p class="volume">${ mainFieldVO.totalSales }</p>
							<p class="txt">累積販売量</p>
							<p><img src="../images/icon/ico_sales_volume.png" alt=""/></p>
						</div>
					</div>
				</div>
				<!-- //section 2 -->
				<!-- section 3 -->
				<div id="section3" class="section" style="background-image:url('../images/tmp/main_visual_03.jpg');">
					<div class="menu-section">
						<div class="top-box">
							<p class="tit">ベトナム料理、<span>31種の感動を盛り込む</span></p>
							<p class="btn"><a href="/jpn/menu/menu_list.do">PHOMEIN メニュー</a></p>
							<p class="txt">* 店舗によってメニューが異なる場合があります。</p>
						</div>
						<div class="bottom-box">
							<ul>
								<li>
									<p class="img"><img src="../images/icon/ico_menu_info_01.png" alt=""/></p>
									<p class="data"><span class="volume2">${ mainFieldVO.yearCnt }</span><strong>th</strong></p>
									<p class="txt">SINCE 2006</p>
								</li>
								<!--li>
									<p class="img"><img src="../images/icon/ico_menu_info_02.png" alt=""/></p>
									<p class="data"><span class="volume2">${ mainFieldVO.totalStore }</span></p>
									<p class="txt">埋蔵数<span>${ mainFieldVO.storeJpnDt }</span></p>
								</li-->
								<li>
									<p class="img"><img src="../images/icon/ico_menu_info_03.png" alt=""/></p>
									<!-- 20190507 수정 s -->
									<p class="data"><span class="volume2">${ mainFieldVO.revenue }</span><strong>億</strong></p>
									<!-- //20190507 수정 e -->
									<p class="txt">売上高<span>${ mainFieldVO.revenueJpnDt }</span></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //section 3 -->
				<!-- section 4 -->
				<div id="section4" class="section" style="background-image:url('../images/tmp/main_visual_04.jpg');">
					<div class="sns-section">
						<div class="top-box">
							<p class="tit">PHOMEIN<span>SNS</span></p>
						</div>
						<div class="bottom-box">
							<!-- sns-list -->
							<div class="sns-list">
								<!-- img-board-list -->
								<div class="img-board-list type02">
									<ul>
										<c:choose>
											<c:when test="${not empty snsList }" >
												<c:forEach items="${snsList }" var="result" varStatus="status" >
													<c:if test="${status.index < 8 }">
														<li class=<c:if test="${result.cate == '109201' }">"ico-f"</c:if><c:if test="${result.cate == '109202' }">"ico-b"</c:if><c:if test="${result.cate == '109203' }">"ico-i"</c:if> >
															<p class="img"><img alt="" src="${result.pc_thimg }"></p>
															<a href="${result.url}" target="_blank">
<!-- 																<span class="icon"></span> -->
																<span class="txt">${fnc:xssContents(result.title )}</span>
															</a>
														</li>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<!-- //img-board-list -->

								<div class="sns-ico">
									<ul>
										<li class="ico-f"><a href="https://www.facebook.com/phomein" target="_blank"><span>페이스북</span></a></li>
										<li class="ico-i"><a href="https://www.instagram.com/phomeinkr/" target="_blank"><span>인스타그램</span></a></li>
										<li class="ico-b"><a href="https://blog.naver.com/dk_phomein" target="_blank"><span>블로그</span></a></li>
									</ul>
								</div>
							</div>
							<!-- //sns-list -->
						</div>
					</div>
				</div>
				<!-- //section 4 -->
				<!-- section 5 -->
				<div id="section5" class="section" style="background-image:url('../images/tmp/main_visual_05.jpg');">
					<div class="csr-section">
						<div class="top-box">
							<p class="tit"><span>PHOMEIN CSR</span>フォーメインが作りあげる世界</p>
							<p class="txt">冷めない熱い真心で暖かい今日、暖かい世界を作り上げます。</p>
						</div>
						<div class="bottom-box">
							<a href="/jpn/phomein/phoever.do">
								<p class="img"><img src="../images/icon/ico_csr.png" alt=""></p>
							</a>
						</div>
					</div>
				</div>
				<!-- //section 5 -->
				<!-- section 6 -->
				<div id="section6" class="section" style="background-image:url('../images/tmp/main_visual_06.jpg');">
					<div class="commuity-section">
						<div class="top-box">
							<p class="label-top"><span class="label">インテリア</span></p>
							<p class="tit">Phomeinの哲学と成功ノウハウで、安定した起業を支援します。</p>
							<div class="store-box">
								<div class="slider slide-wrap">
									<div class="list" style="background-image:url('../images/content/main_interior_01.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_02.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_03.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_04.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_05.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_06.jpg');"></div>
									<div class="list" style="background-image:url('../images/content/main_interior_07.jpg');"></div>
								</div>
							</div>
							<!-- <c:choose>
								<c:when test="${not empty resultList }" >
									<c:forEach items="${resultList }" var="result" varStatus="status" >
										<c:if test="${status.index < 1 }">
										<div class="store-box">
											<div class="list slide-wrap">
												<c:if test="${not empty result.f_file6 }"><div><img src="${result.f_file6 }" alt=""/></div></c:if>
												<c:if test="${not empty result.f_file7 }"><div><img src="${result.f_file7 }" alt=""/></div></c:if>
												<c:if test="${not empty result.f_file8 }"><div><img src="${result.f_file8 }" alt=""/></div></c:if>
											</div>
											<span class="name">${result.name }</span>
										</div>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose> -->
 						</div>
						<div class="bottom-box">
							<div class="event-box" style="background-image:url('../images/tmp/main_cscenter.jpg');">
								<a href="/jpn/community/cs_terms.do">
									<div class="con">
										<span class="label">顧客問い合わせ</span>
										<p class="tit">お客様のご質問に迅速にお答えできるよう、<br>常に準備に万全を期しています。</p>
									</div>
								</a>
							</div>
							<div class="franchisee-box" style="background-image:url('../images/tmp/main_franchisee.jpg');">
								<a href="/jpn/franchisee/terms.do">
									<div class="con">
										<span class="label">加盟店</span>
										<p class="img"><img src="../images/content/main_franchisee_02.png" alt="phomein"/></p>
										<p class="tit">加盟相談申請</p>
										<p class="txt">電話番号 : 1899-2422(番号 1)  /  031-780-1500 (直通) <br>Eメール : help@phomein.com</p>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<!-- //section 6 -->
				<!-- section 7 -->
				<div id="section7" class="section fp-auto-height">
					<!-- dFoot -->
					<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
					<!--// dFoot -->
				</div>
				<!-- //section 7 -->
			</div>

			<!-- right-nav -->
			<ul class="right-nav">
				<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
				<li data-menuanchor="secondPage"><a href="#secondPage"><span>BRAND</span></a></li>
				<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>MENU</span></a></li>
				<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>SNS</span></a></li>
				<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>CSR</span></a></li>
				<li data-menuanchor="sixthPage"><a href="#sixthPage"><span>FRANCHISE</span></a></li>
			</ul>
			<!-- right-nav -->

		</div>
		<!-- //full-page -->

	</section>
	<!--// dBody -->
</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script src="../common/js/jquery.fullpage.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="../common/js/jquery.counterup.min.js"></script>
<script>
	// 메인 풀페이지
	 $(document).ready(function() {
		$('#fullpage').fullpage({
			anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'fifthPage', 'sixthPage'],
			menu: '.right-nav',
			afterLoad: function(anchorLink, index){
				if(index == 2){
					$('.volume').counterUp({delay: 10,time: 600});
				}
				if(index == 3){
					$('.volume2').counterUp({delay: 10,time: 600});
				}
			}
		});
	});

	//첫 페이지 슬라이드
 	var winW = $(window).width(),
		winH = $(window).height(),
		topVisual = $('.top-visual'),
		list = topVisual.find('.list');

	list.css({width: winW+'px', height: winH+'px'});

 	topVisual.slick({
		arrows: false,
		dots: true,
		customPaging: function(slider, i) {
			var tit = $(slider.$slides[i]).find('.visual-dot-nav').html();
			return '<div class="pager-tit" class=' + i + '>'+ tit + '</div>';
		},
		fade: true,
		slidesToShow: 1,
		autoplay: true,
		autoplaySpeed: 9000,
		pauseOnHover:false,
		pauseOnFocus:false
	});

	$('.slick-dots > li').on('mouseenter', function(){
		var idx = $(this).index();
		topVisual.slick('slickGoTo', idx);
		topVisual.slick('slickSetOption', 'autoplay', false).slick('slickPause');
	}).on('mouseleave', function(){
		topVisual.slick('slickSetOption', 'autoplay', true).slick('slickPlay');
	});

	// section6 인테리러 슬라이드 높이 값
	function storeBox(){
		var section = $('#section6').offset().top;
		var top = $('.event-box').offset().top;
		$('.store-box .list').height(top - section);
	};

 	//ie 모션 생략
	var agt = navigator.userAgent.toLowerCase();
	function msieScroll(){
		if(agt.indexOf('msie 9.0') > -1){
			$('.section').addClass('on');
		}
	};

	$(function(){
		msieScroll();
		storeBox();
	});

	function toggleCheckbox(_target) {
		var _t = $(_target);
		setCookie("notToday" + _t.data("seq") + "",'Y', 1);
		_t.parents(".common-pop").hide();
	}

	function btnClose(_target) {
		var _t = $(_target);
		_t.parents(".common-pop").hide();
	}

	function setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
	}

	function getCookie(name) {
		var cName = name + "=";
		var x = 0;

		while ( x <= document.cookie.length ) {
		    var y = (x+cName.length);
		    if ( document.cookie.substring( x, y ) == cName ) {
		        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
		            endOfCookie = document.cookie.length;
		        return unescape( document.cookie.substring( y, endOfCookie ) );
		    }

		    x = document.cookie.indexOf( " ", x ) + 1;
		    if ( x == 0 )
		    	break;
		}
		return "";
	}

	// 팝업 관리
	$.ajax({
        url: "/jpn/main/show_popup.do",
        type: "POST",
        data: {},
        dataType: 'json',
        success: function (data) {
   		 	if(data.resultList.length > 0) {
				var $popHtml = '';
   		 		$.each(data.resultList, function(key, index){
					if(getCookie("notToday" + data.resultList[key].seq + "") != "Y"){
						$popHtml += '<div class="common-pop" style="top:'+ data.resultList[key].viewtop +'px;left:' + data.resultList[key].viewleft + 'px;">';
						$popHtml += 		'<div class="pop-con">';
						$popHtml += 			'<a href="' + data.resultList[key].pc_url + '">';
						$popHtml += 				'<img src="' + data.resultList[key].pc_img + '" alt="'+ data.resultList[key].pc_alt +'"/>';
						$popHtml += 			'</a>';
						$popHtml += 		'</div>';
						$popHtml += 		'<div class="today-close">';
						$popHtml += 			'<p class="chk-type01"><input type="checkbox" id="today" onchange="toggleCheckbox(this)" name="check" data-seq="' + data.resultList[key].seq + '"><label for="today"><span></span>오늘 하루 보지 않기</label></p>';
						$popHtml += 			'<a href="javascript:;" onclick="btnClose(this)" class="btn-close">닫기</a>';
						$popHtml += 		'</div>';
						$popHtml += '</div>';
					}
				});

   		 		$("#popHtml").html($popHtml);
        	}
        },
        error: function (xhr, status, error) {
        	if (xhr.status == 500) {
        		alert('Internal error: ' + xhr.responseText);
            } else {
                alert('Unexpected error.');
            }
        }
	});
</script>
</body>
</html>
