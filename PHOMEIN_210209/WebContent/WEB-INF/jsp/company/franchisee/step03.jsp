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
					<li><a href="/company/franchisee/step02.do">창업지원시스템</a></li>
					<li class="actived"><a href="#">개설절차</a></li>
				</ul>
			</div>
			<!-- //page-tab -->

			<!-- step-con -->
			<div class="step-con">
				<!-- step-list -->
				<div class="inner02">
					<div class="step-list">
						<h4>가맹 절차</h4>
						<ul>
							<li>
								<span>1</span>
								<p class="img"><img src="../images/content/ico_step_list_01.png" alt="icon"/></p>
								<p class="tit">가맹 문의</p>
								<p class="txt">창업 문의 상담 신청<br>전반적인 사업 설명</p>
							</li>
							<li>
								<span>2</span>
								<p class="img"><img src="../images/content/ico_step_list_02.png" alt="icon"/></p>
								<p class="tit">시장 조사</p>
								<p class="txt">가맹점 후보지 선정</p>
							</li>
							<li>
								<span>3</span>
								<p class="img"><img src="../images/content/ico_step_list_03.png" alt="icon"/></p>
								<p class="tit">입점지 선정</p>
								<p class="txt">상권, 입지,사업<br>타당성 분석</p>
							</li>
							<li>
								<span>4</span>
								<p class="img"><img src="../images/content/ico_step_list_04.png" alt="icon"/></p>
								<p class="tit">가맹 계약</p>
								<p class="txt">정보공개서 제공<br>가맹 계약 체결</p>
							</li>
						</ul>
						<ul>
							<li>
								<span>5</span>
								<p class="img"><img src="../images/content/ico_step_list_05.png" alt="ico"/></p>
								<p class="tit">인력 채용</p>
								<p class="txt">주방/홀 직원 채용</p>
							</li>
							<li>
								<span>6</span>
								<p class="img"><img src="../images/content/ico_step_list_06.png" alt="icon"/></p>
								<p class="tit">매장 시설 공사</p>
								<p class="txt">인테리어/간판/<br>주방설비 계약 및 공사</p>
							</li>
							<li>
								<span>7</span>
								<p class="img"><img src="../images/content/ico_step_list_07.png" alt="icon"/></p>
								<p class="tit">본점 교육</p>
								<p class="txt">이론, 실습, 현장 교육<br>(분당 정자본점 전문교육장)</p>
							</li>
							<li>
								<span>8</span>
								<p class="img"><img src="../images/content/ico_step_list_08.png" alt="icon"/></p>
								<p class="tit">영업 준비</p>
								<p class="txt">물품 공급/<br>인∙허가 증명서 발급/<br>전체 점검</p>
							</li>
						</ul>
						<ul>
							<li>
								<span>9</span>
								<p class="img"><img src="../images/content/ico_step_list_09.png" alt="icon"/></p>
								<p class="tit">개점</p>
								<p class="txt">온∙오프라인 홍보<br>오픈 이벤트 진행</p>
							</li>
							<li>
								<span>10</span>
								<p class="img"><img src="../images/content/ico_step_list_10.png" alt="icon"/></p>
								<p class="tit">사후 관리</p>
								<p class="txt">안정적인 물품 공급<br>슈퍼바이저 지원</p>
							</li>
							<li style="padding-top:0; ">
								<a href="http://www.phomein.com/company/franchisee/terms.do" style="display:block; width: 100%; height: 100%; padding-top:40px;">
									<p class="tit" style="font-size:23px; margin-top:0;">가맹 상담</p>
									<p style="display:inline-block; font-size:15px; margin-top:20px; padding:6px 18px; background-color:#525252; color:#fff; border-radius:4px;">바로가기</p>
									<p class="txt" style="font-size:18px; margin-top:20px;">대표 전화<br>1899-2422</p>
								</a>
							</li>
						</ul>
<!-- 						<div class="txt-info">
							<p class="tit">대한민국 쌀국수 전문 브렌드 포메인</p>
							<p class="txt">동종업계 내 전체 매장 수 1위</p>
						</div> -->
					</div>
				</div>
				<!-- //step-list -->
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
