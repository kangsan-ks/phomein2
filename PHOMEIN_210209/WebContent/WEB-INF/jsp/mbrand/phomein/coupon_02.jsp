<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>
</head>

<body>
<!-- wrap -->
<div id="wrap">
	<!-- skip nav -->
	<div id="skip_nav">
        <a href="#content">본문 바로가기</a>
    </div>
    <!-- //skip nav -->

	<!-- header -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<div id="gnb">
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	</div> 
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv1_3">
			<h3>상품권</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			CS CENTER : class="sub_visual sv5"
			ETC 	  : class="sub_visual sv6"
		-->
		<!-- //sub visual -->
		
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->

		<!-- content -->
		<div id="content" class="phomein">
 			
 			<div class="select_cate">
				<!-- 셀렉트 박스 -->
				<span class="selectbox">
					<label for="selCate">카테고리 선택</label>
					<select id="selCate" onchange="if (this.value) window.location.href=this.value">
						<option value="/mbrand/phomein/coupon_01.do">상품권 안내</option>
						<option value="" selected>상품권 교환 신청</option>
					</select>
				</span>
				<!-- //셀렉트 박스 -->
			</div>
			
			<div class="certifi_area">
				<!-- 타이틀 영역 -->
				<div class="tit_area">
					<h4>본인 인증</h4>
					<p class="desc">포메인 상품권 교환 신청은 회원가입 없이<br>
휴대폰 인증만으로 확인할 수 있습니다.<br>
기존 회원은 회원 가입 시 등록한 휴대폰 번호를 <br>
입력하시기 바랍니다.</p>
				</div>
				<!-- //타이틀 영역 -->
				<!-- 버튼 영역 -->
				<div class="btn_area">
					<input type="hidden" name="message" id="message" value="${message }"/>
					<form name="form_chk" method="post">
						<input type="hidden" name="m" value="checkplusSerivce">			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="EncodeData" value="${encData }"/>	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<a href="javascript:fnPopup();" class="btn_tyn c_black btn_certifi">휴대폰 본인 인증</a>
					</form>
					<form name="successForm" method="post">
						<input type="hidden" name="name" id="name" value=""/>
						<input type="hidden" name="mobileNo" id="mobileNo" value=""/>
					</form>
				</div>
				<!-- //버튼 영역 -->
			</div>
 			
		</div>
		<!-- //content -->
	
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script>
window.name ="Parent_window";

function setChildValue(name, mobileNo, cardNo) {
	document.getElementById("name").value = name;
	document.getElementById("mobileNo").value = mobileNo;
	document.successForm.action = "/mbrand/phomein/coupon_03.do";
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
