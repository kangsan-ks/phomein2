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

	<section id="dBody" class="policy no-visual">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_06.jpg');"></div>
			<h2 class="h2-type">공지 & 언론보도</h2>
			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="policy-con">
					<div class="con-title">
						<h3 class="h3-type">이메일무단수집거부</h3>
					</div>

					<div class="terms-con">
						<h4>정보통신망 이용촉진 및 정보보호 등에 관한 법률</h4>

						<div class="txt-box">
							포메인 홈페이지에 게시된 이메일주소가 자동 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 처벌됨을 유념하시기 바랍니다. <br>
							포메인 홈페이지에 기재된 모든 내용은 저작권법에 의해서 보호됨을 알려드립니다.
						</div>

						<h4>제50조의 2(전자우편주소의 무단 수집행위 등 금지)</h4>
						<ul>
							<li>누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 <br>
							프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.</li>
							<li>누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.</li>
							<li>누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된 전자우편주소임을 알면서 이를 정보 전송에 이용하여서는 아니 된다.</li>

						<h4>제74조(벌칙)</h4>
							<ul>
								<li>다음 각 호의 어느 하나에 해당하는 자는 1년 이하의 징역 또는 1천만원 이하의 벌금에 처한다. <br>
								제50조의 2를 위반하여 전자우편주소를 수집·판매·유통하거나 정보 전송에 이용한 자.</li>
							</ul>
					</div>

				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

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
