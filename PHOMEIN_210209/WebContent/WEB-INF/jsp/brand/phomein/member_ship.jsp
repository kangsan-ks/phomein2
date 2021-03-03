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
			<div class="visual" style="background-image:url('../images/content/sub_visual_01_2.jpg');"></div>
			<h2 class="h2-type">멤버십</h2>
			<span class="txt">포메인의 멤버십 서비스를 소개합니다.<br>간편 조회로 편하게 포메인 마일리지 서비스를 만나보세요.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- page-tab -->
			<div class="page-tab">
				<ul>
					<li class="actived"><a href="#">멤버십 안내</a></li>
					<li><a href="/brand/phomein/mileage_01.do">마일리지 조회</a></li>
					<li><a href="/brand/phomein/mileage_03.do">마일리지 통합</a></li>
				</ul>
			</div>
			<!-- //page-tab -->

			<div class="member-info">
				<div class="inner02">
					<div class="point-info">
						<div class="info-box">
							<p class="img"><img src="../images/content/member_img_01.png" alt="핸드폰 이미지" class="load-fadein"/></p>
							<p class="tit load-fadein">포메인 멤버십 등록</p>
							<p class="txt load-fadein">포메인 전 매장에서 휴대전화번호 입력을 통해 간편하게 <br>멤버십 등록이 가능합니다.</p>
							<p class="img2"><img src="../images/content/member_img_02.png" alt="매장 아이콘 이미지" class="load-fadein"/></p>
						</div>
					</div>
				</div>

				<div class="save-use">
					<h4>적립 및 사용</h4>
					<ul>
						<li>
							<p class="tit">
								<strong>적립</strong>
								<span>결제 금액 1% 적립</span>
							</p>
							<p class="txt">전 메뉴 결제 금액의 1%가 적립됩니다. 추후 적립은 <br>영수증 소지 시 3일 이내에 해당 매장에서 신청 가능합니다.</p>
						</li>
						<li>
							<p class="tit">
								<strong>사용</strong>
								<span>2,000마일리지 적립 시<br>500마일리지 사용가능</span>
							</p>
							<p class="txt">2,000 마일리지 이상 적립 시 500 마일리지 단위로 사용 <br>가능합니다. 마일리지는 결제 시 사용 가능하며, 무단도용 사용을 <br>방지하기 위해 본인 인증  SMS 절차를 거쳐 사용 할 수 있습니다. <br>(멤버십 등록 휴대전화 필참)</p>
						</li>
						<li>
							<p class="tit">
								<strong>조회</strong>
								<a href="/brand/phomein/mileage_01.do" class="btn">마일리지 조회</a>
							</p>
							<p class="txt">마일리지 적립 즉시 카카오톡, SMS로 당일 적립 마일리지, <br>누적 마일리지 현황이 발송되며 홈페이지에서도 조회 가능합니다.</p>
						</li>
						<li>
							<p class="tit">
								<strong>상품권 교환</strong>
								<a href="/brand/phomein/coupon_02.do" class="btn">상품권 교환 신청</a>
							</p>
							<p class="txt">1만 마일리지를 사용하여 포메인 상품권 1만원권으로<br>교환이 가능 합니다. </p>
						</li>
					</ul>
				</div>

				<div class="guid-info">
					<h4>마일리지 이관</h4>
					<ul>
						<li>기존 미등록 포인트카드는 <마일리지 통합> 기능을 통하여 합산 가능 합니다.<a href="/brand/phomein/mileage_03.do" class="btn">마일리지 통합하기 신청</a></li>
						<li>본인의 마일리지를 타인에게 이관 할 수 없습니다.</li>
					</ul>

					<h4>유의사항</h4>
					<ul>
						<li>유효기간 : 마일리지의 유효기간은 적립 년도 기준, 3년이 되는 해 12월 31일 24시에 일괄 소멸됩니다. <br>예 ) 2018년 7월 2일 적립 마일리지 > 2021년 12월 31일 24시 일괄 소멸</li>
						<li>타 쿠폰이나 할인 서비스와 중복 사용 불가 합니다.</li>
						<li>배달서비스 이용 시 마일리지 적립/사용이 제한됩니다.</li>
					</ul>

					<h4>기타</h4>
					<ul>
						<li>멤버십 관련 오류 및 문의사항은 아래 온라인 접수 또는 본사로 문의해 주시기 바랍니다.</li>
						<li>대표번호 031-780-1561~3, 5</li>
					</ul>
				</div>
			</div>

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
