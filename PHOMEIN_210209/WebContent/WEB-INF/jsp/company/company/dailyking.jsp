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
			<div class="visual" style="background-image:url('/company/images/content/sub_visual_01_1_new.jpg');"></div>
			<h2 class="h2-type">㈜데일리킹</h2>
			<!-- <span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- brand-info -->
			<div class="dailyking-info">
				<div class="page-logo">
					<p class="img"><img src="/company/images/common/dailyking_logo.png" alt="dailyking logo" class="load-fadein"/></p>
				</div>

				<div class="inner02">
					<div class="page-box">
						<p class="txt01">
							<!-- ㈜데일리킹은 2006년 설립되어 국내에 쌀국수 프랜차이즈 브랜드<br>‘포메인’을 정착시키고, 베트남 요리 외식 문화를 대중화시킨 법인 기업입니다. -->
							㈜데일리킹은 2006년 설립되어 국내에 쌀국수 프랜차이즈 브랜드<br/>‘포메인’과 ‘포메인 레드’를 운영 중인 외식 프랜차이즈 전문 기업입니다.
						</p>
						<p class="txt02">
							㈜데일리킹은 ‘안전한 식재료 정직한 먹거리’ 이념 하에 ‘현대그린푸드’와 업무협약을 체결,<br>각 가맹점에 안전하고 신선한 식자재를 공급하고 있습니다.
						</p>
						<p class="txt02">
							또한 2015년 베트남 현지법인 쌀국수 공장 ‘포시즌(PHO SEASON)을 설립하여<br>
							9가지 상급 천연 향신료를 사용한 육수용 허브백(Herb-Bags) 생산, 수년간의 연구개발 끝에 ‘햅쌀 쌀국수면’ 개발에 성공했습니다.<br>
							묵은쌀로 만든 수입 쌀국수면에 의존한 쌀국수 시장에서 ‘햅쌀 쌀국수면’이 가지는 깨끗함과 건강함은<br>
							브랜드 파워인 동시에 고객 약속의 결실입니다.
						</p>

						<div class="rice-noodle">
							<p class="tit">포메인 ‘햅쌀 쌀국수면’은</p>
							<ul>
								<li>
									<p class="img"><img src="/company/images/content/dailyking_img_01.png" alt=""/></p>
									<p class="txt">햅쌀과 물 외에 불필요한 화학 첨가물을<br>첨가하지 않았습니다.</p>
								</li>
								<li>
									<p class="img"><img src="/company/images/content/dailyking_img_02.png" alt=""/></p>
									<p class="txt">묵은쌀, 전분, 밀가루를 혼합한<br>수입 쌀국수면에서 나는 특유의 잡냄새가 없습니다.</p>
								</li>
								<li>
									<p class="img"><img src="/company/images/content/dailyking_img_03.png" alt=""/></p>
									<p class="txt">갓 지은 햅쌀밥의 향, 맑고 투명한 빛깔,<br>쫀득한 식감을 즐길 수 있습니다.</p>
								</li>
							</ul>
						</div>

						<p class="txt02">
							아무도 가려고 하지 않는 길이라도 꼭 가야 할 길이 있습니다.<br>
							묵은쌀과 전분, 밀가루를 혼합해 만든 수입 쌀국수면을 사용하는 국내 쌀국수 시장에서 햅쌀과 정제수만으로 쌀국수면을 만든다는<br>
							발상의 전환은 누군가에게는 무모해 보였을지도, 누군가에게는 불필요한 고난의 길이었을지도 모릅니다. <br><br>
							
							그러나 ㈜데일리킹에 있어 ‘포시즌(PHO SEASON)’ 설립과 ‘햅쌀 쌀국수면’ 생산은 쌀국수 시장 선두주자로서의<br>
							책임감과 ‘안전하고 정직한 먹거리’를 제공하겠다는 고객들을 향한 진심이 담긴 여정이었습니다.<br><br>
							수년간의 도전의 결실, 포메인 ‘햅쌀 쌀국수면’은 오직 포메인에서 만날 수 있습니다.<br><br>
							앞으로도 포메인으로부터 시작되는 변화와 도전이 쌀국수 시장의 기준이 될 수 있도록 원칙과 정직함이라는<br>
							본질을 잃지 않고 쌀국수 시장의 중심에서 변화를 선도하겠습니다.
						</p>

						<div class="pho-season">
							<p class="txt"><span>안전한 식재료 정직한 먹거리, </span>포시즌(PHO SEASON)</p>
							<a href="/company/rnd/phoseason.do" class="btn-pho-season">포시즌 자세히 보기</a>
						</div>
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

<script src="/company/common/js/front_ui.js"></script>
<script type="text/javascript">
$(function(){
});
</script>
</body>
</html>
