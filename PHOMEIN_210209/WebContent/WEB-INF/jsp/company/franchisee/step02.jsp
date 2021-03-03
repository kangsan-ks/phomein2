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
					<li><a href="/company/franchisee/step01.do">브랜드 파워</a></li>
					<li class="actived"><a href="#">창업지원시스템</a></li>
					<li><a href="/company/franchisee/step03.do">개설절차</a></li>
				</ul>
			</div>
			<!-- //page-tab -->

			<!-- step-con -->
			<div class="step-con">
				<!-- system-list -->
				<div class="inner02">
					<div class="system-list">
						<ul>
							<li>
								<div class="img-box">
									<span>1</span>
									<p class="img"><img src="../images/content/system_list_img_01.png" alt=""/></p>
									<p class="tit">전문가<br>상권 분석</p>
									<p class="txt">본사 점포개발팀의 철저한<br>상권 조사 및 분석을 통한<br>가맹점 입지 제안</p>
								</div>
							</li>
							<!--li>
								<div class="img-box">
									<span>2</span>
									<p class="img"><img src="../images/content/system_list_img_02.png" alt=""/></p>
									<p class="tit">신한은행<br>프랜차이즈론</p>
									<p class="txt">창업 자금 대출(최대 7천만 원) 및<br> 우대 금융 서비스 제공</p>
								</div>
							</li-->
							<li>
								<div class="img-box">
									<span>2</span>
									<p class="img"><img src="../images/content/system_list_img_03.png" alt=""/></p>
									<p class="tit">전문교육장<br>운영</p>
									<p class="txt">[분당 정자본점] 내 전문교육장에서의<br>점주 및 실무자 운영 교육 진행</p>
								</div>
							</li>
							<li>
								<div class="img-box">
									<span>3</span>
									<p class="img"><img src="../images/content/system_list_img_04.png" alt=""/></p>
									<p class="tit">체계적인<br>사후 관리</p>
									<p class="txt">전문 지식을 갖춘 본사 슈퍼바이저의<br>정기적인 가맹점 방문 및<br>매장 현황 분석/진단</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<!-- //system-list -->

<!-- 				<div class="best-system">
					<p class="txt">대한민국 쌀국수 전문 브렌드 포메인</p>
					<p class="tit">7년연속 가맹점 월평균 매출액 1위! </p>
				</div> -->
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
