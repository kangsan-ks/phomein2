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

	<section id="dBody" class="rnd">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_02_1.jpg');"></div>
			<h2 class="h2-type">현대그린푸드MOU</h2>
			<span class="txt">포메인은 ‘안전한 식재료∙정직한 먹거리’를 약속하며<br>포메인만의 특별한 차이를 만들어갑니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">

			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type">현대그린푸드<br>‘안전한 식자재 공급 MOU’</h3>
				</div>

				<div class="greenfood-box">
					<div class="greenfood-con">
						<p class="txt load-fadein">포메인은 식약처의 <br>‘위해상품 차단 시스템’ 을 갖춘 종합식품기업<br>‘현대그린푸드’와 함께 건강한 테이블을 만들어 갑니다.</p>
						<p class="tit load-fadein">Relief <span>Phomein</span></p>
						<p class="txt2 load-fadein">포메인과 현대그린푸드는 지난 2016년 8월<br>‘안전한 식자재 공급’ 에 대한 업무협약을 체결하였습니다.<br><br>포메인은 전 가맹점 식자재 유통 경로 일원화를 추진 중이며, <br>현대그린푸드를 통해 식자재를 유통 받는 가맹점에서는<br>‘Relief Phomein’ 인증 마크를 확인할 수 있습니다.</p>
					</div>
				</div>
				
				<div class="con-title">
					<div class="inner">
						<h3 class="h3-type" style="margin: 40px 0;">포메인, 현대그린푸드와 ‘안전한 식자재 공급’ MOU 체결</h3>
						<div class="img_box">
							<img src="/company/images/content/greenfood_01_new.png" alt=""  style=""/>
						</div>
						<p class="txt load-fadein active" style="font-size: 12px;">오흥용 현대그린푸드 대표이사(사진 왼쪽) / 김대일 ㈜데일리킹 대표이사(사진 오른쪽)</p>
						<p class="txt load-fadein active" style="text-align:left;">
							2016년 국내 베트남 쌀국수 업계 1위 브랜드 포메인이 종합식품기업 현대그린푸드와 함께 ‘안전하고 우수한 품질의 식자재 공급’을 위한 업무협약(MOU)을 체결했다고 밝혔다.
							<br/><br/>
							현대그린푸드는 이번 업무협약을 통해 연간 100억원 규모의 식자재를 포메인 가맹점에 공급할 예정이다.
							<br/><br/>
							포메인은 식품 원자재의 안전성을 높이기 위해 ‘위해상품 판매차단시스템’을 도입한 식품 안전 우수기업인 현대그린푸드와 협약을 맺고, 120여 개 가맹점에 일반 식자재 공급 일원화를 추진한다. 이로써 현대그린푸드를 통해 포메인에 유통되는 식자재 중 불량하다고 판단되거나, 위해 성분이 검출된 상품은 물류센터, 배송 차량, 각 가맹점 등에서 거점별로 실시간 원천 차단이 가능해진다.
							<br/><br/>
							현대그린푸드는 선진화된 위생시스템을 바탕으로 기존 산업체·​병원 급식 업체에 안전성이 검증된 상품을 공급해 왔으며, 이번 포메인과의 MOU 체결로 외식 프랜차이즈 업체로까지 그 영역을 확대하게 됐다.
						</p>
					</div>
				</div>
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
<script type="text/javascript">
$(function(){
});
</script>
</body>
</html>
