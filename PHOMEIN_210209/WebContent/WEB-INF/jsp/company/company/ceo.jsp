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
			<div class="visual" style="background-image:url('../images/content/sub_visual_01_2_new.jpg');"></div>
			<h2 class="h2-type">CEO 인사말</h2>
			<!-- <span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- ceo-info -->
			<div class="ceo-info">
				<div class="page-logo">
					<p class="tit">CEO <span>인사말</span></p>
					<!-- <p class="txt">고객의 만족을 위해 최선을 다해 노력하겠습니다.</p> -->
				</div>

				<div class="inner02">
					<div class="inner" style="padding: 0;">
						<div class="page-box">
							<!-- <p class="txt01">
								안녕하십니까? <br>
								주식회사 데일리킹 대표 김대일입니다.
							</p> -->
							<p class="txt02">
								<span class="sep">“</span>
								<span>
									<b>어떻게 만들까</b>에 대한<br/>
									고민과 열정으로<br/>
									<b>쌀국수 본질</b>을 좇으며<br/>
									노력하고 있습니다.
								</span>
								<span class="sep">”</span>
							</p>
							<p class="txt03">
								<span>
									<b>
									안녕하십니까?<br/>
									주식회사 데일리킹 대표 김대일입니다.<br/>
									</b>
									<br/>
									지난 한 해 코로나 팬데믹으로 외식업 전체가 힘든 시기를 보냈습니다.<br/>
									모든 자영업자분이 한마음으로 혼신의 노력을 다한 시기가 아니었나 생각해봅니다. <br/>
									<br/>
									최근 다양한 이슈로 건강 및 면역 등 안전한 식재료에 대한 관심과<br/>
									외식 패턴의 변화로 딜리버리 서비스 수요가 급증한 가운데,<br/>
									<br/>
									2014년 최초로 시작한 쌀국수 딜리버리 서비스로 축적해온 노하우와<br/>
									2016년 현대그린푸드 MOU를 통한 위해 상품 차단 시스템으로<br/>
									정직한 먹거리, 완성도 높은 서비스를 실행해온 포메인은<br/>
									위기 속에서도 중심을 잃지 않기 위해 다분한 노력을 기울이고 있습니다.<br/>
									<br/>
									특히 2015년 현지법인 쌀국수 공장 포시즌(PHO SEASON) 설립과 독자기술 연구개발로<br/>
									생산한 국내 최초, 국내 유일 ‘햅쌀면’은 묵은쌀 쌀국수면 수입으로 외산 일색이던<br/>
									위기의 국내 쌀국수 시장에서 견고한 브랜드 경쟁력을 입증하고 있습니다. <br/>
									<br/>
									쌀국수 특유의 면 냄새 없는 향긋함, 독자기술로 완성한 쫀득한 식감까지<br/>
									이제, 포메인의 건강한 ‘햅쌀 쌀국수’와 함께 하시길 바랍니다.<br/>
									<br/>
									2006년 포메인 분당 정자본점을 시작으로  국내 베트남 외식 시장을 선도해온<br/>
									포메인이 올해로 창립 15주년을 맞았습니다.<br/>
									<br/>
									오늘도 우리는 ‘어떻게 팔까’가 아닌 ‘어떻게 만들까’에 대한 고민과 열정으로<br/>
									마케팅이 아닌 ‘쌀국수 본질’을 좇으며 노력하고 있습니다.<br/>
									<br/>
									2021년에도 대한민국 쌀국수를 대표하는 브랜드로<br/>
									국내 쌀국수 시장의 변화와 도전에 앞장서도록 하겠습니다.<br/>
									늘 건강하시길 바랍니다. 감사합니다. <br/>
								</span>
							</p>
							<p class="txt04">㈜데일리킹 대표 김대일 </p>
						</div>
					</div>
				</div>
			</div>
			<!-- //ceo-info -->
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
