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
					<li><a href="/brand/phomein/coupon_01.do">상품권 안내</a></li>
					<li class="actived"><a href="#">상품권 교환 신청</a></li>
				</ul>
			</div>
			<!-- //page-tab -->
			<!-- verify-box -->
			<div class="inner02">
				<div class="verify-box">
					<div class="tit">본인 인증</div>
					<div class="txt">포메인 상품권 교환 신청은 회원가입 없이 휴대폰 인증만으로 확인할 수 있습니다.<br>기존 회원은 회원 가입 시 등록한 휴대폰 번호를 입력하시기 바랍니다.</div>
					<input type="hidden" name="message" id="message" value="${message }"/>
					<form name="form_chk" method="post">
						<input type="hidden" name="m" value="checkplusSerivce">			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="EncodeData" value="${encData }"/>	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<a href="javascript:fnPopup();" class="btn btn-01 type-01">휴대폰 본인 인증</a>
					</form>
					<form name="successForm" method="post">
						<input type="hidden" name="name" id="name" value=""/>
						<input type="hidden" name="mobileNo" id="mobileNo" value=""/>
					</form>
				</div>
			</div>
			<!-- //verify-box -->
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
<script>
window.name ="Parent_window";

function setChildValue(name, mobileNo, cardNo) {
	document.getElementById("name").value = name;
	document.getElementById("mobileNo").value = mobileNo;
	document.successForm.action = "/brand/phomein/coupon_03.do";
	document.successForm.submit();
}

function fnPopup(){
	window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
	document.form_chk.target = "popupChk";
	document.form_chk.submit();
}

$(function(){
	// 에러 메시지 처리
	/*
	if($("#message").val() != '') {
		alert($("#message").val());
		return false;
	}
	*/
});

</script>
</body>
</html>
