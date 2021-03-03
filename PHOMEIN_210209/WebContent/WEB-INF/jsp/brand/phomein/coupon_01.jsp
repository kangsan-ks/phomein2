<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>

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
			<div class="visual" style="background-image:url('../images/content/sub_visual_01_3.jpg');"></div>
			<h2 class="h2-type">상품권</h2>
			<span class="txt">사은품, 이벤트 등 특별한 날에 포메인 상품권과 함께하세요.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- page-tab -->
			<div class="page-tab">
				<ul>
					<li class="actived"><a href="#">상품권 안내</a></li>
					<li><a href="/brand/phomein/coupon_02.do">상품권 교환 신청</a></li>
				</ul>
			</div>
			<!-- //page-tab -->
			<!-- coupon-info -->
			<div class="coupon-info">
				<!-- purchase -->
				<div class="inner02">
					<div class="purchase">
						<h4>구매방법</h4>
						<ul>
							<li>
								<p class="img"><img src="../images/content/purchase_img_01.png" alt="아이콘1" /></p>
								<p class="tit">현금 구매</p>
								<p class="txt">포메인 고객센터를 통해 가능합니다. </p>
								<p class="tel">문의 전화 : 1899-2422</p>
							</li>
							<li>
								<p class="img"><img src="../images/content/purchase_img_02.png" alt="아이콘2" /></p>
								<p class="tit">마일리지 구매</p>
								<p class="txt">마일리지가 10,000점 이상일 경우 교환 가능하며<br>마일리지 전환을 통한 상품권 구매는<br>포메인 홈페이지에서 온라인 신청서 작성 후 가능합니다. </p>
							</li>
						</ul>
					</div>
				</div>
				<!-- //purchase -->

				<div class="mileag-procedure">
					<h4><span>마일리지</span> 구매 절차</h4>
					<ul>
						<li>
							<p class="img"><img src="../images/content/mileag_procedure_01.png" alt="아이콘1" /></p>
							<p class="tit">포메인<br>홈페이지 접속</p>
						</li>
						<li>
							<p class="img"><img src="../images/content/mileag_procedure_02.png" alt="아이콘2" /></p>
							<p class="tit">휴대폰 본인인증 후<br>온라인 신청서 작성</p>
						</li>
						<li>
							<p class="img"><img src="../images/content/mileag_procedure_03.png" alt="아이콘3" /></p>
							<p class="tit">우편 발송 & 수취</p>
						</li>
						<li>
							<p class="img"><img src="../images/content/mileag_procedure_04.png" alt="아이콘4" /></p>
							<p class="tit">상품권 사용</p>
						</li>
					</ul>
					<a href="/brand/phomein/coupon_02.do" class="btn btn-01 type-01">상품권 교환 신청</a>
				</div>

				<div class="point-guide">
					<h4>포메인 상품권 사용 안내</h4>
					<ul class="txt-list">
						<li>본 상품권은 포메인 전 매장에서 현금과 동일하게 사용 가능하며 타 상품권과 동시 사용이 가능합니다.</li>
						<li>본 상품권의 유효기간은 상품권의 뒷면을 확인해 주시기 바랍니다.</li>
						<li>본 상품권은 현금으로 교환하실 수 없습니다.</li>
						<li>권면금액의 80% 이상 사용 시 현금 잔액을 돌려받을 수 있습니다.</li>
						<li>수취하신 상품권의 도난, 분실, 훼손 등에 대해서는 당사에서 책임지지 않습니다.</li>
					</ul>
				</div>

			</div>
			<!-- //coupon-info -->
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
