<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
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
			<h2 class="h2-type">포메인</h2>
			<!-- <span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
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
						<p class="txt01 load-fadein">올해 15주년을 맞이한 포메인은 한국인의 입맛에 맞는 레시피 개발로<br>국내 베트남 쌀국수 대중화를 이끈 대한민국 대표 쌀국수 전문 브랜드입니다.</p>
						<p class="txt02 load-fadein">국내 130여 개의 매장을 보유한 포메인은 현대그린푸드와의 ‘안전한 식자재 공급’ MOU 체결, <br>베트남 현지 법인 공장 포시즌(PHO SEASON) 설립을 통한 햅쌀 쌀국수 개발 및 제조로 <br>‘안전한 식재료∙정직한 먹거리’ 약속을 지켜가고 있습니다.</p>
						<p class="img"><img src="../images/content/brand_menu_img.jpg" alt="쌀국수 이미지" class="load-fadein"/></p>
					</div>
				</div>
			</div>
			<!-- //brand-info -->
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
