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

	<section id="dBody" class="company">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">패밀리브랜드</h2>
		<!--	<span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">
			<!-- brownsugar-info -->
			<div class="brownsugar-info">
				<div class="page-logo">
					<p class="tit load-fadein">브라운슈거</p>
					<p class="txt load-fadein">The Original American Brunch Restaurant</p>
					<p class="img"><img src="../images/content/brownsugar_logo.png" alt="brownsugar logo" class="load-fadein"/></p>
				</div>
				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">BROWN SUGAR</p>
						<p class="txt02 load-fadein">The Original American Brunch Restaurant</p>
						<p class="txt03 load-fadein">㈜데일리킹은 홈메이드 방식의 건강한 요리와 폴바셋 커피가 있는 미국 정통 브런치 레스토랑<br>데일리킹스 브라운슈거를 운영하고 있습니다.</p>
						<p class="btn"><a href="http://www.dailykingsbrownsugar.com/bs02/main/main.php" target="_blank">사이트 바로가기</a></p>
					</div>
				</div>
				<p class="img"><img src="../images/content/brownsugar_img_01.jpg" alt="" /></p>
			</div>
			<!-- //brownsugar-info -->
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
<script type="text/javascript">
$(function(){
});
</script>
</body>
</html>
