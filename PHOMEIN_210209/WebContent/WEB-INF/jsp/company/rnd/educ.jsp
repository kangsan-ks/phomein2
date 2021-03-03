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

	<section id="dBody" class="cphomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_02_2.jpg');"></div>
			<h2 class="h2-type">교육시스템</h2>
			<span class="txt">포메인은 ‘안전한 식재료∙정직한 먹거리’를 약속하며<br>포메인만의 특별한 차이를 만들어갑니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">

			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type load-fadein">체계적이고 확실한 커리큘럼, 전문교육장 운영</h3>
					<p class="txt load-fadein">포메인은 신규 창업자 및 가맹점주들이 안정적인 매장 운영을 바탕으로 고객들에게 건강한 테이블을 전할 수 있도록 <br>[분당 정자본점]에 동종업계 최초로 전문교육장을 마련하여 체계적인 커리큘럼에<br>따른 매장 운영 교육을 진행하고 있습니다.</p>
				</div>

				<!-- educ-box -->
				<div class="inner02">
					<div class="educ-box">
						<p class="tit load-fadein">체계적인 교육, 15년의 노하우 전수</p>
						<!-- <p class="txt load-fadein">㈜데일리킹 전문교육장에서는 메뉴 조리법은 물론 식자재 및 주방 위생 관리법, 고객 응대,<br>POS 사용, 식자재 발주 등 매장 운영에 있어 필요한 모든 사항을 배우고 익힐 수 있습니다.<br>교육이 끝난 후에도 담당 슈퍼바이저와의 지속적인 사후관리로 믿고 함께할 수 있는 상생을 실천합니다.<br><br>또한 전문교육장에서는 트렌드 분석과 R&D 전문인력의 체계적인 신메뉴 개발로 꾸준한 매출 증대를 도모합니다. </p> -->
						<p class="txt load-fadein">㈜데일리킹 전문교육장에서는 메뉴 조리법은 물론 식자재 및 주방 위생 관리법, 고객 응대 등<br/>매장 운영에 있어 필요한 모든 사항을 배우고 익힐 수 있습니다.<br/>교육이 끝난 후에도 담당 슈퍼바이저와의 지속적인 사후관리로 믿고 함께할 수 있는 상생을 실천합니다.<br/>또한 전문교육장에서는 트렌드 분석과 R&D 전문인력의 체계적인 신메뉴 개발로 꾸준한 매출 증대를 도모합니다.</p>
						<div class="educ-visual">
							<div><img src="../images/content/educ_img_01.jpg" alt=""/></div>
							<div><img src="../images/content/educ_img_02.jpg" alt=""/></div>
							<div><img src="../images/content/educ_img_03.jpg" alt=""/></div>
							<div><img src="../images/content/educ_img_04.jpg" alt=""/></div>
						</div>
					</div>
				</div>
				<!-- //educ-box -->
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
	$('.educ-visual').slick({
		centerMode: true,
		infinite: true,
		centerPadding: '0px',
		slidesToShow: 3,
		variableWidth: false,
		dots: true
	});
</script>
</body>
</html>
