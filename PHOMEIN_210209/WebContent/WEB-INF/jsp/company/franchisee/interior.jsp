<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

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
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_03_03.jpg');"></div>
			<h2 class="h2-type">인테리어</h2>
<!-- 			<span class="txt">11년의 노하우, 포메인과 함께라면 행복한 미래를 꿈꾸셔도 좋습니다.<br>밝은 미래, 행복한 포메人</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="interior-con">
				<div class="con-title">
					<!-- 20190225 수정 -->
					<h3 class="h3-type">Modern & Minimal</h3>
					<p class="txt">포메인은 불필요한 요소를 최소화하여 간결하고 깔끔한 느낌의 공간을 추구하며,<br>밝고 따뜻한 컬러의 사용으로 식사 시 편안한 분위기를 조성합니다.</p>
					<!-- //20190225 수정 -->
				</div>
				<c:choose>
					<c:when test="${not empty resultList }" >
					<!-- 20190225 수정 -->
					<!-- interior-box -->
					<div class="inner02 mt80">
						<div class="interior-box">
							<div class="interior-visual">
								<ul class="slider slider-for">
									<c:forEach items="${resultList }" var="result" varStatus="status" >
									<li>
										<div class="slider-in">
											<c:if test="${not empty result.f_file6 }"><div><img src="${result.f_file6 }" alt=""/></div></c:if>
											<c:if test="${not empty result.f_file7 }"><div><img src="${result.f_file7 }" alt=""/></div></c:if>
											<c:if test="${not empty result.f_file8 }"><div><img src="${result.f_file8 }" alt=""/></div></c:if>
										</div>
										<span><strong>${result.name }</strong></span>
									</li>
									</c:forEach>
								</ul>
								<div class="interior-list">
									<ul class="slider slider-nav">
										<c:forEach items="${resultList }" var="result" varStatus="status" >
											<li><div class="img"><img src="${result.f_file6 }" alt=""/><span><strong>${result.name }</strong></span></div></li>
										</c:forEach>
									</ul>
									<div class="slider-progress">
										<div class="progress"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //interior-box -->
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/company/include/companyfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script>
$(function(){
	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
	});

	$('.slider-in').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		infinite: false,
		fade: true,
		dots: true
	});

	$('.slider-nav').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		infinite: false,
		dots: true,
		focusOnSelect: true
	});

	$('.slider-nav .slick-prev').click(function() {
		progressbar();
		return false;
	});

	$('.slider-nav .slick-next').click(function() {
		progressbar();
		return false;
	});

	$('.slider-nav .slick-slide').click(function() {
		progressbar();
		return false;
	});

	var bar = $('.slider-progress .progress'),
		active = $('.slider-nav .slick-dots .slick-active'),
		w = active.width();

	bar.css({width: w+'px'});

	function progressbar() {
		var x = $('.slider-nav .slick-dots .slick-active').position();
		var n = x.left+w;
		bar.animate({
			width: n+'px'
		});
	}
});
</script>
</body>
</html>
