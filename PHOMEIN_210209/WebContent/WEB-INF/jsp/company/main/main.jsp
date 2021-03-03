<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
<style>
	
</style>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<div id="popHtml"></div>

<!-- wrap -->
<div id="wrap" class="main">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/company/include/companyheader.jsp"%>
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
			<div id="fullpage">
				<!-- section 1 -->
				<div id="section1" class="section">
					<div class="top-visual">
						<div class="list" style="background-image:url('/company/images/tmp/main_visual_01.jpg');">
							<div class="info-box">
								<p class="tit"><span>SINCE 2006</span>대한민국 쌀국수의 기준</p>
								<p class="txt">흔들림 없는 브랜드 가치로 가장 포메인다운 길을 걸어갑니다.</p>
							</div>
						</div>
						<div class="list" style="background-image:url('/company/images/tmp/main_visual_01_02.jpg');">
							<div class="info-box">
								<p class="tit"><span>트렌디한 가치 창출로</span>성장하는 수익성</p>
								<p class="txt">시대를 반영한 경쟁력으로 높은 수익률을 보장합니다.</p>
							</div>
						</div>
						<div class="list" style="background-image:url('/company/images/tmp/main_visual_01_03.jpg');">
							<div class="info-box">
								<p class="tit"><span>쌀국수 시장을 선도하는</span>변화의 중심</p>
								<p class="txt">메뉴부터 서비스까지 차별화된 포메인만의 전략으로 시장을 선도합니다.</p>
							</div>
						</div>
					</div>
				</div>
				<!-- //section 1 -->
				<!-- section 2 -->
				<div id="section2" class="section" style="background-color:#323242;">
					<div class="franchisee-section">
						<div class="top-box">
							<p class="tit"><!--span>포메인</span-->가맹 개설</p>
							<p class="txt">2006년 [분당 정자본점]을 시작으로 가맹 사업을 시작한 포메인은 한국인의 입맛에 맞는 <br>레시피 개발로 국내 베트남 쌀국수 대중화를 이끈 대한민국 대표 쌀국수 전문 브랜드입니다. </p>
						</div>
						<div class="bottom-box">
							<ul>
								<li>
									<p class="tit">가맹 상담 신청</p>
									<p class="img"><img src="/company/images/content/ico_franchisee_01.png" alt=""/></p>
									<p class="round-btn"><a href="/company/franchisee/terms.do"><span>자세히 보기</span></a></p>
								</li>
								<li>
									<p class="tit">가맹 안내</p>
									<p class="img"><img src="/company/images/content/ico_franchisee_02.png" alt=""/></p>
									<p class="round-btn"><a href="/company/franchisee/step01.do"><span>자세히 보기</span></a></p>
								</li>
								<!-- 
								<li>
									<p class="tit">가맹 비용</p>
									<p class="img"><img src="/company/images/content/ico_franchisee_03.png" alt=""/></p>
									<p class="round-btn"><a href="/company/franchisee/estimate.do"><span>자세히 보기</span></a></p>
								</li> -->
							</ul>
						</div>
					</div>
				</div>
				<!-- //section 2 -->
				<!-- section 3 -->
				<div id="section3" class="section" style="background-image:url('/company/images/tmp/main_visual_03.jpg');">
					<div class="rnd-section">
						<div class="top-box">
							<p class="tit"><!--span>포메인</span-->연구<em>.</em>개발</p>
							<p class="txt">‘안전한 식재료 정직한 먹거리’를 약속하며 포메인만의 특별한 차이를 만들어갑니다.</p>
						</div>
						<div class="bottom-box">
							<ul>
								<li>
									<p class="img"><img src="/company/images/content/ico_rnd_01.png" alt=""/></p>
									<p class="tit">포시즌</p>
									<p class="txt">더욱 완벽한 명품(名品)<br>쌀국수를 위한 새로운 도약</p>
									<p class="round-btn"><a href="/company/rnd/phoseason.do"><span>자세히 보기</span></a></p>
								</li>
								<li>
									<p class="img"><img src="/company/images/content/ico_rnd_02.png" alt=""/></p>
									<p class="tit">현대그린푸드MOU</p>
									<p class="txt">건강한 테이블 제공을 위한<br>포메인의 첫걸음</p>
									<p class="round-btn"><a href="/company/rnd/greenfood.do"><span>자세히 보기</span></a></p>
								</li>
								<li>
									<p class="img"><img src="/company/images/content/ico_rnd_03.png" alt=""/></p>
									<p class="tit">전문교육장</p>
									<p class="txt">포메인 운영 노하우<br>완전 교육 시스템</p>
									<p class="round-btn"><a href="/company/rnd/educ.do"><span>자세히 보기</span></a></p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- //section 3 -->
				<c:choose>
				<c:when test="${not empty resultList }" >
					<!-- section 4 -->
					<div id="section4" class="section" style="background-image:url('/company/images/tmp/main_visual_04.jpg');">
						<div class="service-section">
							<div class="top-box">
								<p class="tit"><span>PHOMEIN BEST STORE</span>포메인을 빛낸 주인공</p>
								<p class="txt">가장 가까운 곳에서<br>점주님들의 이야기를 듣고, 신뢰로 함께 성장합니다.</p>
							</div>
							<div class="bottom-box">
								<div class="interview-info slide-wrap">
									<c:forEach items="${resultList }" var="result" varStatus="status" >
										<div class="list">
											<div class="img"><img src="${result.main_thimg }" alt="main img"></div>
											<div class="info">
												<p class="tit">
													<span class="detail-name">${result.title }</span>
													<span class="detail-tit">${result.store }</span>
												</p>
												<p class="detail-txt">${result.pc_contents }</p>
												<p class="round-btn"><a href="/company/franchisee/interview.do"><span>인터뷰 더보기</span></a></p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- //section 4 -->
				</c:when>
				<c:otherwise></c:otherwise>
				</c:choose>
				<!-- section 5 -->
				<div id="section5" class="section" style="background-image:url('/company/images/tmp/main_visual_05.jpg');">
					<div class="sns-section">
						<div class="top-box">
							<p class="tit"><span>PHOMEIN CSR</span>포메인이 만드는 세상</p>
							<p class="txt">식지 않는 뜨거운 진심으로 따뜻한 오늘, 따뜻한 세상을 만듭니다.</p>
						</div>
						<div class="bottom-box">
							<p class="img"><a href="/company/csr/phoever.do"><img src="/company/images/icon/ico_csr.png" alt=""/></a></p>
						</div>
					</div>
				</div>
				<!-- //section 5 -->
				<!-- section 6 -->
				<div id="section7" class="section fp-auto-height">
					<!-- dFoot -->
					<!-- dFoot -->
					<%@ include file="/WEB-INF/jsp/company/include/companyfooter.jsp"%>
					<!--// dFoot -->
					<!--// dFoot -->
				</div>
				<!-- //section 6 -->
			</div>

			<!-- right-nav -->
			<!-- 20190318 수정 s -->
			<ul class="right-nav">
				<li data-menuanchor="firstPage"><a href="#firstPage"><span>홈</span></a></li>
				<li data-menuanchor="secondPage"><a href="#secondPage"><span>가맹 개설</span></a></li>
				<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>연구 . 개발</span></a></li>
				<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>인터뷰</span></a></li>
				<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>사회공헌</span></a></li>
			</ul>
			<!-- //20190318 수정 e -->
			<!-- <ul class="right-nav">
				<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
				<li data-menuanchor="secondPage"><a href="#secondPage"><span>가맹 개설</span></a></li>
				<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>연구 . 개발</span></a></li>
				<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>인터뷰</span></a></li>
				<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>사회공헌</span></a></li>
			</ul> -->
			<!-- right-nav -->

			</div>
		</div>
		<!-- //full-page -->

	</section>
	<!--// dBody -->
</div>
<!-- //wrap -->

<script src="/company/common/js/front_ui.js"></script>
<script src="/company/common/js/jquery.fullpage.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="/company/common/js/jquery.counterup.min.js"></script>
<script>
	// 메인 풀페이지
	 $(document).ready(function() {
		$('#fullpage').fullpage({
			anchors:['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'fifthPage'],
			menu: '.right-nav'
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
			var tit = $(slider.$slides[i]).find('.tit').html();
			return '<div class="pager-tit" class=' + i + '>'+ tit + '</div>';
		},
		fade: true,
		slidesToShow: 1,
		autoplay: true,
		autoplaySpeed: 7000,
		pauseOnHover:false,
		pauseOnFocus:false
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
        url: "/company/main/show_popup.do",
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

</script>
</body>
</html>
