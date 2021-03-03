<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>
<style>
	.sns-section .bottom-box .sns-list .sns-ico ul li.ico-y a {background-position:-193px 0; width: 30px;}
	.sns-section .bottom-box:after{display:none !important;}
	.sns-section .bottom-box {position:absolute; bottom:0; left:0; width:100%; height:64%; text-align:center; opacity:0; transition:all 5s ease;}
	.sns-section .top-box {position:absolute; top:18%; left:50%; width:1200px; margin-left:-600px; text-align:center; box-sizing:border-box; opacity:0; transform:translate(0px, -100px); transition:all 1.2s ease;}
</style>
<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<div id="popHtml"></div>

<!-- wrap -->
<div id="wrap" class="main">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		06. etc						:	푸터 컨텐츠
	-->

	<section id="dBody">

		<!-- full-page -->
		<div class="full-page">
			<div id="fullpage" class="fullpage-wrapper" style="height: 100%; position: relative; touch-action: none; transition: all 700ms ease 0s; transform: translate3d(0px, -3156px, 0px);">
				<!-- section 1 -->
				<div id="section1" class="section">
					<div class="top-visual">
						
						<div class="list" style="background-image:url('../images/tmp/main_visual_0.png');">
							<div class="info-box">
								<p class="tit"><span>소규모 프리미엄 쌀국수 브랜드</span>포메인 RED 런칭</p>
								<p class="txt main_txt">
								<span><b style="color:#ab3221;">R</b>ice noodle <b style="color:#ab3221;">E</b>xpress <b style="color:#ab3221;">D</b>elivery</span>
								
								</p>
								<a href="http://www.phomein.com/company/franchisee/red.do" style="display:inline-block; margin-top:50px; padding:13px 24px; background-color:#8a382c; color:#fff; font-size:16px;">브랜드 스토리 확인</a>

								<p class="visual-dot-nav">소자본 창업<br>포메인 RED</p>
							</div>
						</div>

						<div class="list" style="background-image:url('../images/tmp/main_visual_01_02.jpg');">
							<div class="info-box">
								<p class="tit"><span>포메인,</span>햅쌀로 자가제면 自家製麵</p>
								<p class="txt main_txt">
								<span>갓 지은 햅쌀밥의 향</span>
								<span class="bar">&nbsp;&nbsp; | &nbsp;&nbsp;</span>
								<span>맑고 투명한 빛깔</span>
								<span class="bar">&nbsp;&nbsp; | &nbsp;&nbsp;</span>
								<span>부드럽고 쫀득한 식감</span>
								</p>
								<p class="txt" style="font-weight:lighter; font-size:18px; line-height:35px; margin-top:35px;">1년 365일 햅쌀로 직접 만들어 건강한 쌀국수면과 품질개선으로 더 깊어진 명품 육수까지 -<br> 쌀국수는 포메인입니다.</p>
								<p class="visual-dot-nav">쌀국수는<br>포메인</p>
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_01.jpg');">
							<div class="info-box">
								<p class="tit"><span>쌀 한 톨부터 다른</span>포메인다움</p>
								<p class="txt">햅쌀로 직접 만든 쌀국수면으로 깨끗하고 건강한 쌀국수를 선사합니다.</p>
								<!-- <p class="visual-dot-nav">매일매일 까다로운 <br>포메인다움</p> -->
								<!-- 20190318 수정 s -->
								<p class="visual-dot-nav">쌀 한 톨부터 다른<br>포메인다움</p>
								<!-- //20190318 수정 e -->
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_03.jpg');">
							<div class="info-box">
								<p class="tit"><span>매일매일 까다로운</span>포메인다움</p>
								<p class="txt">엄선한 9가지 상급 천연 향신료로 매일 매장에서 직접 끓여낸 명품 육수를 사용합니다.</p>
								<p class="visual-dot-nav">매일매일 까다로운<br>포메인다움</p>
							</div>
						</div>
						<div class="list" style="background-image:url('../images/tmp/main_visual_01_04.jpg');">
							<div class="info-box">
								<p class="tit"><span>재료부터 건강한</span>포메인다움</p>
								<p class="txt">위해 상품차단 시스템으로 안전하고 우수한 품질의 식자재를 공급 받습니다.</p>
								<p class="visual-dot-nav">재료부터 건강한<br>포메인다움</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //section 1 -->
				<!-- section 2 -->
				<div id="section2" class="section" style="background-image:url('../images/tmp/main_visual_02.jpg');">
					<div class="sales-volume">
						<p class="label">SINCE 2006</p>
						<p class="tit">대한민국 쌀국수의 역사, <br>포메인으로부터.</p>
						<div class="volume-box">
							<p class="volume">${ mainFieldVO.totalSales }</p>
							<p class="txt">쌀국수 누적 판매량</p>
							<p><img src="../images/icon/ico_sales_volume.png" alt=""/></p>
						</div>
					</div>
				</div>
				<!-- //section 2 -->
				<!-- section 3 -->
				<div id="section3" class="section" style="background-image:url('../images/tmp/main_visual_03.jpg');">
					<div class="menu-section">
						<div class="top-box">
							<p class="tit">베트남 요리,<span>32가지 감동을 담다.</span></p>
							<p class="btn"><a href="/brand/menu/menu_list.do">포메인 전체메뉴 보기</a></p>
							<p class="txt">* 매장별로 판매 메뉴는 상이 할 수 있습니다.</p>
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
									<p class="txt">매장 수<span>${ mainFieldVO.storeBrandDt }</span></p>
								</li-->
								<!--<li>
									<p class="img"><img src="../images/icon/ico_menu_info_03.png" alt=""/></p>
									-->
									<!-- 20190507 수정 s -->
									<!--
									<p class="data"><span class="volume2">${ mainFieldVO.revenue }</span><strong>억</strong></p>
									<!-- //20190507 수정 e -->
									<!--
									<p class="txt">매출액<span>${ mainFieldVO.revenueBrandDt }</span></p>
									-->
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //section 3 -->
				<!-- section 4 -->
				<div id="section4" class="section" style="background-image:url('../images/tmp/main_visual_04.jpg');">
					<div class="service-section">
						<div class="top-box">
							<p class="txt">ENJOY SERVICE</p>
							<p class="tit">당신의 모든 순간<span>포메인</span></p>
						</div>
						<div class="bottom-box">
							<div class="left">
								<a href="http://www.phomein.com/brand/community/notice/community_view.do?seq=86">
									<span class="img01"><img src="../images/icon/ico_phone_01.png" alt=""/></span>
									<span class="img02"><img src="../images/icon/ico_phone_02.png" alt=""/></span>
									<p class="txt">포메인 <strong>카카오톡 선물하기</strong></p>
								</a>
							</div>
							<div class="right">
								<span class="img01"><a href="/brand/store/store_list.do"><img src="../images/icon/ico_moto_01.png" alt=""/></a></span>
								<span class="img02"><img src="../images/icon/ico_moto_02.png" alt=""/></span>
								<span class="img03"><img src="../images/icon/ico_moto_03.png" alt=""/></span>
								<p class="txt">포메인 <strong>딜리버리 매장</strong></p>
							</div>
						</div>
					</div>
				</div>
				<!-- //section 4 -->
				<!-- section 5 -->
				<div id="section5" class="section" style="background-image:url('../images/tmp/main_visual_05_new.jpg');">
					<div class="csr-section">
						<div class="top-box">
							<p class="tit"><span>PHOMEIN CSR</span>포메인이 만드는 세상</p>
							<p class="txt">식지 않는 뜨거운 진심으로 따뜻한 오늘, 따뜻한 세상을 만듭니다.</p>
						</div>
						<div class="bottom-box">
						<p class="img"><a href="/brand/phomein/phoever.do"><img src="../images/icon/ico_csr.png" alt=""/></a></p>
						</div>
					</div>
				</div>
				<!-- //section 5 -->
				<!-- section 6 -->
				<div id="section6" class="section" style="background-image:url('../images/tmp/main_visual_06.jpg');">
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
										<li class="ico-y"><a href="https://www.youtube.com/channel/UCWAJe4McbHlhQc_CcHc8Qmw" target="_blank"><span>유튜브</span></a></li>
										<li class="ico-i"><a href="https://www.instagram.com/phomeinkr/" target="_blank"><span>인스타그램</span></a></li>
										<li class="ico-b"><a href="https://blog.naver.com/dk_phomein" target="_blank"><span>블로그</span></a></li>
									</ul>
								</div>
							</div>
							<!-- //sns-list -->
						</div>
					</div>
				</div>
				<!-- //section 6 -->
				<!-- section 7 -->
				<div id="section7" class="section" style="background-image:url('../images/tmp/main_visual_07.jpg');">
					<div class="commuity-section">
						<div class="top-box">
							<div class="news-box">
								<span class="label">NEWS</span>
								<ul>
									<c:choose>
										<c:when test="${not empty noticeList }" >
											<c:forEach items="${noticeList }" var="result" varStatus="status">
												<c:if test="${status.index < 4 }">
													<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
													<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
													<li><a href="/brand/community/notice/community_view.do?seq=${result.seq }"><span><c:out value="${regDttmp }" /></span>${fnc:xssContents(result.title )}</a></li>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
						<div class="bottom-box">
							<a href="/brand/community/event/community_list.do">
							<div class="event-box" style="background-image:url('../images/tmp/@img_main_event.jpg');">
								<div class="con">
									<span class="label">EVENT</span>
									<c:choose>
										<c:when test="${not empty eventList }" >
											<c:forEach items="${eventList }" var="result" varStatus="status">
												<c:if test="${status.index < 1 }">
													<p class="tit">${fnc:xssContents(result.title )}</p>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							</a>
							<a href="/company/franchisee/terms.do" target="_blank">
							<div class="franchisee-box" style="background-image:url('../images/content/main_franchisee.jpg');">
								<div class="con">
									<span class="label">FRANCHISE</span>
									<p class="img"><img src="../images/content/main_franchisee_02.png" alt="phomein"/></p>
									<p class="tit">가맹 문의</p>
									<!--p class="txt">대표번호 : 1899-2422(연결 1)  /  031-780-1500 (직통) <br>이메일 : help@phomein.com</p-->
									<table cellpadding="0" cellspacing="0" style="margin-top:20px;">
										<tbody>
											<tr>
												<td>
													<span style="display:block; background-color:#fff; color:#222; font-weight:500; text-align:center; padding:2px 10px;">전화 가맹 문의</span>
												</td>
												<td style="padding-bottom:17px;">
													<p class="txt" style="margin-top:0; margin-left:20px;">· 대표번호 : 1899-2422(연결 1) · 직통 번호 : 031-780-1500 <br>* 전화 상담 가능 시간 : 평일 8:50AM~18:00PM(점심시간 11:50AM~13:00PM)</p>
												</td>
											</tr>
											<tr>
												<td>
													<span style="display:block; background-color:#fff; color:#222; font-weight:500; text-align:center; padding:2px 10px;">온라인 가맹 문의</span>
												</td>
												<td style="padding-bottom:10px;">
													<p class="txt" style="margin-top:0; margin-left:20px;">기업 사이트 > 가맹 개설정보 > 가맹상담 신청 게시판 접수<br>* 온라인 가맹 문의는 365일 상시 가능합니다.</p>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<p style="color:#fff;">* 접수된 문의는 담당자 배정 후 상담이 진행됩니다. * 어떤 문의든 신속하고 친절한 상담을 약속드립니다.</p>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							</a>
						</div>
					</div>
				</div>
				<!-- //section 7 -->
				<!-- section 8 -->
				<div id="section8" class="section fp-auto-height">
					<!-- dFoot -->
					<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
					<!--// dFoot -->
				</div>
				<!-- //section 8 -->
			</div>
			<!-- right-nav -->
			<!-- 20190318 수정 s -->
			<ul class="right-nav">
				<li data-menuanchor="firstPage"><a href="#firstPage"><span>홈</span></a></li>
				<li data-menuanchor="secondPage"><a href="#secondPage"><span>브랜드</span></a></li>
				<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>메뉴</span></a></li>
				<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>서비스</span></a></li>
				<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>사회공헌</span></a></li>
				<li data-menuanchor="sixthPage"><a href="#sixthPage"><span>SNS</span></a></li>
				<li data-menuanchor="seventhPage"><a href="#seventhPage"><span>커뮤니티</span></a></li>
			</ul>
			<!-- //20190318 수정 e -->
			<!-- <ul class="right-nav">
				<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
				<li data-menuanchor="secondPage"><a href="#secondPage"><span>브랜드</span></a></li>
				<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>메뉴</span></a></li>
				<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>서비스</span></a></li>
				<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>CSR</span></a></li>
				<li data-menuanchor="sixthPage"><a href="#sixthPage"><span>SNS</span></a></li>
				<li data-menuanchor="seventhPage"><a href="#seventhPage"><span>커뮤니티</span></a></li>
			</ul> -->
			<!-- right-nav -->
			</div>
		</div>
		<!-- //full-page -->

	</section>

	<!--// dBody -->
</div>
<!-- //wrap -->

<script src="/brand/common/js/front_ui.js"></script>
<script src="/brand/common/js/jquery.fullpage.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="/brand/common/js/jquery.counterup.min.js"></script>
<script>
	// 메인 풀페이지
	 $(document).ready(function() {
		$('#fullpage').fullpage({
			anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'fifthPage', 'sixthPage', 'seventhPage'],
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

	$('.slick-dots > li').on('mouseenter', function(){
		var idx = $(this).index();
		topVisual.slick('slickGoTo', idx);
		topVisual.slick('slickSetOption', 'autoplay', false).slick('slickPause');
	}).on('mouseleave', function(){
		topVisual.slick('slickSetOption', 'autoplay', true).slick('slickPlay');
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

 	//sns 슬라이더
 	var swiper = new Swiper('.sns_slider', {
      slidesPerView: 5,
      spaceBetween: 19,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
      },
    });
	
 // 20190318 추가 s
	$('.slick-dots > li').on('mouseenter', function(){
		var idx = $(this).index();
		topVisual.slick('slickGoTo', idx);
		topVisual.slick('slickSetOption', 'autoplay', false).slick('slickPause');
	}).on('mouseleave', function(){
		topVisual.slick('slickSetOption', 'autoplay', true).slick('slickPlay');
	});
// 20190318 추가 e

 	//ie 모션 생략
	var agt = navigator.userAgent.toLowerCase();
	function msieScroll(){
		if(agt.indexOf('msie 9.0') > -1){
			$('.section').addClass('on');
		}
	};

	$(function(){
		msieScroll();
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
        url: "/brand/main/show_popup.do",
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
						$popHtml += 				'<img src="' + data.resultList[key].pc_img + '" width="'+data.resultList[key].popupsizew+'px;" height="'+data.resultList[key].popupsizeh+'px;" alt="'+ data.resultList[key].pc_alt +'"/>';
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

	// 200512 수정 s
	$(window).on('resize' , function(){
		//console.log('resize');
		var winW = $(window).width(),
		winH = $(window).height(),
		topVisual = $('.top-visual'),
		list = topVisual.find('.list');

		list.css({width: winW+'px', height: winH+'px'});
	});
	// 200512 수정 e
</script>
</body>
</html>
