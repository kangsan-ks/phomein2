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
		00. main					:	메인`
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="cs_center">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_05.jpg');"></div>
			<h2 class="h2-type">고객의 소리</h2>
			<span class="txt">고객님께서 궁금하신 점을 <br>빠르고 친절하게 답변해드릴 수 있도록 늘 준비하고 있습니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="cs-con">
					<div class="con-title">
						<h3 class="h3-type">개인정보 수집 및 이용동의</h3>
						<span class="txt">포메인은 정확한 상담 처리를 위해 최소한의 개인정보를 수집하고 있습니다. <br>아래의 내용을 확인하신 후 개인정보 제공 및 활용에 동의하여 주시기 바랍니다. </span>
					</div>

					<div class="agree-con">
						<div class="con-box">
							<h4>개인정보 제공 및 활용에 대한 동의</h4>
							<p>본 회사는 상담을 위해 아래의 개인정보를 수집 및 이용하고 있습니다.<br>
							1. 개인정보 수집항목 (필수): 이름, 이메일, 연락처<br>
							2. 개인정보 수집 및 이용목적: 고객의 소리에 대한 상담<br>
							3. 개인정보 보유기간 : 개인정보 수집 후 이용목적이 달성되면 최대 30일 내 정보 파기<br>
							* 귀하는 개인정보 제공 및 활용에 대해 동의하지 않을 권리가 있으며, 동의 거부 시 서비스 이용에 제한이 있을 수 있습니다.</p>
						</div>
					</div>
					<form name="submitForm" method="post" action="/brand/cs_center/cs_info.do">
						<p class="chk-type01"><input type="checkbox" id="check0101" name="chk"><label for="check0101"><span></span>개인정보 수집 및 이용에 동의합니다.<strong>(필수동의)</strong></label></p>
					</form>
					<!-- btn-box -->
					<div class="btn-box mt50">
						<a href="javascript:;" class="btn-01 type-01" id="agreeBtn">확인</a>
					</div>
					<!-- //btn-box -->
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
<script type="text/javascript">
$(function(){
	$("#agreeBtn").click(function(){
		if(!$("#check0101").is(":checked")) {
			alert("개인정보 수집 및 이용에 동의하세요");
			return false;
		} else {
			document.submitForm.submit();
		}
	});
});
</script>
</body>
</html>
