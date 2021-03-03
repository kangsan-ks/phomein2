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
		<div class="sub_visual sv1_2">
			<h3>멤버십</h3>
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
						<option value="/mbrand/phomein/member_ship.do">멤버십 안내</option>
						<option value="/mbrand/phomein/mileage_01.do">마일리지 조회</option>
						<option value="" selected>마일리지 통합</option>
					</select>
				</span>
				<!-- //셀렉트 박스 -->
			</div>

 			<!-- 타이틀 영역 -->
 			<div class="tit_area pb0">
				<h4>기존 카드 마일리지 조회</h4>
				<p class="desc">보유하고 계신 플라스틱 카드 정보를 입력 후<br>
현재 마일리지를 확인하시기 바랍니다.</p>
				<span class="txt"><strong class="ico_import">*</strong> 는 필수입력 항목입니다.</span>
			</div>
			<!-- //타이틀 영역 -->
			<div class="table_data">
				<dl class="bg">
					<dt class="card_num">
						<span class="ico_import">마일리지 카드번호</span>
						<span class="write_form">
							<input type="text" class="text onlyNumber" id="card-num-01" maxlength="4" value="" title="카드번호 앞자리">
							<span class="txt">-</span>
							<input type="text" class="text onlyNumber" id="card-num-02" maxlength="4" value="" title="카드번호 두번째자리">
							<span class="txt">-</span>
							<input type="text" class="text onlyNumber" id="card-num-03" maxlength="4" value="" title="카드번호 세번째자리">
							<span class="txt">-</span>
							<input type="text" class="text onlyNumber" id="card-num-04" maxlength="4" value="" title="카드번호 끝자리">
						</span>
						<a href="javascript:;" id="searchMileageBtn" class="btn_tyf c_gray btn_check">조회</a>
					</dt>
				</dl>
			</div>
			<div class="txt_list mt10">
				<ul>
					<li><span>마일리지 확인 후 본인인증을 통하여 마일리지를 통합 신청을 하실 수 있습니다.</span></li>
				</ul>
			</div>

			<input type="hidden" name="message" id="message" value="${message }"/>
			<input type="hidden" name="pointMileage" id="pointMileage" value=""/>

			<!-- 조회 완료 후 노출 -->
			<div id="successCertify" style="display:none;">
				<div class="card_check_result">
					입력된 카드번호에 대한 마일리지는<br><span id="point"></span> 점 입니다.
				</div>
				<div class="btn_area mt35">
					<form name="form_chk" method="post">
						<input type="hidden" name="m" value="checkplusSerivce">			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
						<input type="hidden" name="EncodeData" value="${encData }"/>	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
						<a href="javascript:fnPopup();" class="btn_tyf c_black">휴대폰 본인 인증</a>
					</form>
					<form name="successForm" method="post">
						<input type="hidden" name="name" id="name" value=""/>
						<input type="hidden" name="cardNo" id="cardNo" value=""/>
						<input type="hidden" name="cardMileage" id="cardMileage" value=""/>
						<input type="hidden" name="mobileNo" id="mobileNo" value=""/>
					</form>
				</div>
			</div>
			<!-- //조회 완료 후 노출 -->

		</div>
		<!-- //content -->
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script>

$(".onlyNumber").on("keyup", function(){
	$(this).val($(this).val().replace(/\D/g, ""));
});

window.name ="Parent_window";

function setChildValue(name, mobileNo) {
	document.getElementById("name").value = name;
	document.getElementById("cardNo").value = $("#card-num-01").val() + $("#card-num-02").val() + $("#card-num-03").val() + $("#card-num-04").val();
	document.getElementById("cardMileage").value = $("#pointMileage").val();
	document.getElementById("mobileNo").value = mobileNo;
	document.successForm.action = "/mbrand/phomein/mileage_04.do";
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
	if($("#message").val() != '') {
		alert($("#message").val());
		return false;
	}

	$("#searchMileageBtn").on("click", function(){
		if($("#card-num-01").val() == "" || $("#card-num-02").val() == "" || $("#card-num-03").val() == "" || $("#card-num-04").val() == "") {
			alert("카드번호를 입력하세요");
			return false;
		}
		var cardNo = $("#card-num-01").val() + $("#card-num-02").val() + $("#card-num-03").val() + $("#card-num-04").val();
		$.ajax({
            url: "/mbrand/phomein/get_card_to_mileage.do",
            type: "POST",
            data: {'cardNo' : cardNo},
            dataType: 'json',
            success: function (data) {
            	if(!!data.result) {
            		if(data.result.message != "") {
            			alert(data.result.message);
            			$("#successCertify").hide();
            			return false;
            		}
            		$("#pointMileage").val(data.result.cardMileage);
            		$("#point").text('[' + data.result.cardMileage + ']');
            		$("#successCertify").show();
            	}
            },
            error: function (xhr, status, error) {
            	if (xhr.status == 500) {
            		alert('Internal error: ' + xhr.responseText);
                } else {
                    alert('Unexpected error.');
                }
            }
		});
	});
});

</script>
</body>
</html>
