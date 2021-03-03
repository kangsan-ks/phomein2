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
			<div class="visual" style="background-image:url('../images/content/sub_visual_03_1.jpg');"></div>
			<h2 class="h2-type">가맹안내</h2>
			<span class="txt">포메인의 철학과 성공 노하우로 안정적인 창업을 지원합니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- page-tab -->
			<div class="page-tab">
				<ul>
					<li class="actived"><a href="#">브랜드 파워</a></li>
					<li><a href="/company/franchisee/step02.do">창업지원시스템</a></li>
					<li><a href="/company/franchisee/step03.do">개설절차</a></li>
				</ul>
			</div>
			<!-- //page-tab -->

			<!-- step-con -->
			<div class="step-con">
				<!-- top-visual-con -->
				<div class="inner02">
					<div class="top-visual-con">
						<p class="tit load-fadein">대한민국 대표<span>쌀국수 전문 브랜드입니다.</span></p>
						<p class="txt load-fadein">2006년 [분당 정자본점]을 시작으로 가맹 사업을 시작한 포메인은 <br>한국인의 입맛에 맞는 레시피 개발로 국내 베트남 쌀국수 대중화를 이끌고 있습니다.</p>
						<p class="tit2 load-fadein">SINCE 2006 <span>대한민국 쌀국수의 기준</span></p>
						<p class="txt2 load-fadein">포메인은 지난 15년간 동종업계 타 브랜드들과의 ‘협력적 경쟁’을 통해 나 홀로 성장이 아닌<br>동반성장을 이끌어 낸 대한민국 대표 쌀국수 브랜드입니다. </p>
					</div>
				</div>
				<!-- //top-visual-con -->

				<!-- history -->
				<div class="history">
					<h4>대표연혁</h4>
					<ul>
						<li class="load-fadein"><span>2019.11</span>소규모 프리미엄 쌀국수 브랜드 포메인 RED(Rice noodle Express Delivery)<br/>강남 도곡 1호점 런칭을 시작으로 가맹사업 시작</li>
						<li class="load-fadein"><span>2019.04</span>세계 최초 햅쌀 쌀국수 자체 생산 및 포메인 전 매장 독점 납품</li>
						<li class="load-fadein"><span>2019.04</span>푸드뱅크, 1억 8천만 상당 햅쌀 쌀국수면 기부</li>
						<!-- <li class="load-fadein"><span>2018.06</span>(사)글로벌비전, 직업체험 멘토링 ‘PHO EVER 2018’ 진행</li>
						<li class="load-fadein"><span>2018.01</span>자체 개발 ‘배달 전용 패키지’ 특허 등록</li> -->
						<li class="load-fadein"><span>2017.12</span>가맹점 다점포율 29% 달성<br/>*다점포율: 1명의 가맹점주가 여러 개의 매장을 운영하는 비율<br/>포메인 가맹점 연간 총매출 780억 달성</li>
						<!-- <li class="load-fadein"><span>2017.12</span>포메인 가맹점 연간 총매출 780억 달성</li> -->
						<li class="load-fadein"><span>2017.09</span>포시즌(PHO SEASON)<br/>햅쌀 쌀국수 개발 성공 · 천연 향신료 허브백(Herb-Bags) 생산</li>
						<li class="load-fadein"><span>2016.09</span>포메인 누적 고객 방문자 수 5천만 명 달성</li>
						<li class="load-fadein"><span>2016.08</span>현대그린푸드 ‘안전한 식자재 공급’ MOU 체결</li>
						<li class="load-fadein"><span>2015.11</span>베트남 현지 법인 포시즌(PHO SEASON) 공장 준공</li>						
						<li class="load-fadein"><span>2014.12</span>업계 최초 쌀국수 딜리버리 서비스 시행</li>
						<li class="load-fadein"><span>2014.04</span>업계 최초 모바일 커머스 플랫폼 ‘카카오톡 선물하기’ 입점</li>
						<li class="load-fadein"><span>2013.10</span>한국표준협회 선정 [2013 프랜차이즈 만족지수(KS-FSI)쌀국수 부문 1위]</li>
						<li class="load-fadein"><span>2013.03</span>‘납세자의 날’ 모범 납세자 선정, 국세청장 표창 수상</li>
						<!-- <li class="load-fadein"><span>2012.11</span>신한은행 ‘가맹점주를 위한 프랜차이즈론’ 협약 체결 </li> -->
						<li class="load-fadein"><span>2011.12</span>포메인 정자본점 확장 리뉴얼 및 R&D 연구소 신설</li>
						<li class="load-fadein"><span>2009.10</span>SK나이츠 프로농구단 5년 연속 후원(2009년~2013년)</li>
						<li class="load-fadein"><span>2006.05</span>포메인 분당 정자본점 오픈(직영점 운영중)<br/>㈜데일리킹 설립</li>
						<!-- <li class="load-fadein"><span>2006.05</span>㈜데일리킹 설립</li> -->
					</ul>
				</div>
				<!-- //history -->

				<!-- bottom-visual-con -->
				<div class="inner02">
					<div class="bottom-visual-con">
						<div class="visual-con">
							<p class="tit">포메인, 트렌디한 가치 창출로 성장하는 수익성</p>
							<p class="txt">포메인은 시대를 반영한 경쟁력으로 안정적인 수익률과<br>탄탄한 브랜드 파워를 창출합니다.</p>
						</div>

						<div class="top-honor">
							<ul>
								<li>
									<p class="tit">7년 연속 가맹점<br>월평균 매출액 1위</p>
									<p class="txt">포메인은 동종업계 가맹점 월평균 매출액 1위,<br>6년 평균 약 760억의 매출을 유지하며 흔들림 없는<br>경쟁력을 입증하고 있습니다.</p>
									<p class="txt">※ 2018. 6 자료 기준</p>
								</li>
								<li>
									<p class="tit">동종업계 내<br>전체 매장 수 1위</p>
									<p class="txt">포메인은 가맹사업  5년 만에 100개 매장 달성,<br>현재는 쌀국수 브랜드 중 최다 매장을<br>보유하고 있습니다.</p>
									<p class="txt">※ 2018. 6 자료 기준</p>
								</li>
								<li>
									<p class="tit">동종업계 내<br>수도권 시장 점유율 1위 </p>
									<p class="txt">수도권 점유율 1위를 유지하며, <br>부산-경주 등 전국적으로 가맹 사업을 <br>확장하고 있습니다.</p>
									<p class="txt">※ 2018. 12 자료 기준</p>
								</li>
							</ul>
<!-- 							<p class="txt2">※ 2018. 6 자료 기준 / 저가형 쌀국수 브랜드 제외 기준</p> -->
						</div>

						<div class="news-opst">
							<p class="tit">포메인, 쌀국수 시장을 선도하는 변화의 중심</p>
							<p class="txt">포메인은 메뉴부터 서비스까지 차별화된 전략으로 시장을 선도하는<br>탄탄한 입지와 높은 수익 안정성을 보유하고 있습니다.</p>

							<div class="opst-visual slide-wrap">
								<div>
									<p class="info">
										<span class="data-tit">현대그린푸드<br>‘안전한 식자재 공급’ MOU</span>
										<span class="data-txt">
											포메인은 ‘위해상품 차단 시스템’을 갖춘 종합식품기업 <br>
											‘현대그린푸드’와 업무협약을 체결하여 각 가맹점에 안전한 <br>
											식자재를 공급하고 있습니다. <br>
											‘건강한 테이블’제공에 대한 인증으로 현대그린푸드를 통해 <br>
											식자재를 유통 받는 가맹점에는 ‘Relief Phomein’<br>
											인증 마크가 부착되어 있습니다.
										</span>
									</p>
									<p class="img"><img src="../images/content/news_opst_img_540x400_01.jpg" alt=""/></p>
								</div>
								<div>
									<p class="info">
										<span class="data-tit">베트남 현지 법인<br>포시즌(PHO SEASON)</span>
										<span class="data-txt">
											포메인은 ‘안전한 식재료 정직한 먹거리’라는 이념 아래 <br>
											베트남 현지 법인 포시즌을 설립하였습니다. <br>
											그곳에서 우리는 독자적인 연구개발로 쌀국수면과 육수용 <br>
											허브백(Herb Bags)을 자체 생산하고 있습니다.
										</span>
									</p>
									<p class="img"><img src="../images/content/news_opst_img_540x400_02.jpg" alt=""/></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //bottom-visual-con -->
			</div>
			<!-- step-con -->
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
</body>
</html>
