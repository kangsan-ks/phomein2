<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>

<style>
.video_con {width: 100%; margin:0 auto; height: 580px; text-align:center; border-bottom:1px solid #ddd; margin-bottom:30px;}	
</style>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

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
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="cphomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">브랜드 소개</h2>
			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="video_con">
				<iframe width="800" height="515" src="https://www.youtube.com/embed/ez0V9lfBnBU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<!-- brand-info -->
			<div class="brand-info">
				<div class="page-logo">
					<p class="tit">쌀국수는 <span>포메인</span></p>
					<p class="txt">The World’s Best Korean Vietnamese Restaurant Phomein</p>
					<p class="img"><img src="../images/common/brand_info_logo.png" alt="logo"/></p>
				</div>
				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">2006년 정자본점으로 시작된 포메인의 <br>크고 작은 순간들이 모여</p>
						<p class="txt02 load-fadein">2021년, 더욱 단단해진 경쟁력으로 <span>지금 이 자리에 서 있습니다.</span></p>
						<p class="txt03 load-fadein">포메인 전 메뉴는 (주)데일리킹이 베트남 현지법인으로 설립한<br>쌀국수 공장 ‘포시즌(PHO SEASON)’에서 직접 만든 ‘햅쌀 쌀국수면’을 사용합니다. <br>수년간의 연구개발로 탄생한 ‘햅쌀 쌀국수면’은 독자적인 저온 숙성·기계 건조 기술로 화학 첨가물 없이<br> 햅쌀과 물만을 사용하여 햅쌀밥의 향긋한 향과 맑고 투명한 빛깔, 쫀득한 식감을 완성하였습니다. <br>묵은쌀로 만든 수입 쌀국수면에 의존한 쌀국수 시장에서 ‘햅쌀 쌀국수면’의<br>깨끗함과 건강함은 오직 포메인에서 만날 수 있습니다.<br><br>1년 365일 햅쌀로 만들어 건강한 쌀국수면과 품질개선으로 더 깊어진 명품 육수까지<br><span style="color:#222; font-size:21px;">쌀국수는 포메인입니다.</span></p>
						<p class="txt03 load-fadein">동종업계의 타 브랜드가 너 나 할 것 없이 유행을 좇을 때 <br>원칙과 정직함이라는 중심을 잃지 않고 도전을 이어나가는 것, <br>따라 할 수는 있어도 따라올 수 없는 <br>차이를 만드는 힘입니다.</p>
						<p class="txt04 load-fadein">지금, 여기, 어디에도 없는 포메인이 당신의 곁에 있습니다.</p>
						<p class="img"><img src="../images/content/brand_menu_img.jpg" alt="쌀국수 이미지" class="load-fadein"/></p>
					</div>
				</div>
				<div class="all-menu">
					<p class="txt">베트남 요리, <span><em>32</em>가지 감동을 담다!</span></p>
					<a href="/brand/menu/menu_list.do" class="btn-all-menu">전체메뉴 보기</a>
				</div>
			</div>
			<!-- //brand-info -->
		</div>
		<!-- //contents -->
	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인, 매장찾기 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
</body>
</html>
