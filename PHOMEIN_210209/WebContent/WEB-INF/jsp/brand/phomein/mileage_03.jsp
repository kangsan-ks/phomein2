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
			<span class="txt">포메인의 멤버쉽 서비스를 소개합니다.<br>간편 조회로 편하게 포메인 마일리지 서비스를 만나보세요.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<!-- page-tab -->
				<div class="page-tab">
					<ul>
						<li><a href="/brand/phomein/member_ship.do">멤버십 안내</a></li>
						<li><a href="/brand/phomein/mileage_01.do">마일리지 조회</a></li>
						<li class="actived"><a href="#">마일리지 통합</a></li>
					</ul>
				</div>
				<!-- //page-tab -->
				<!-- data-con -->
				<div class="data-con">
					<div class="con-title">
						<h3 class="h3-type fc01">기존 카드 마일리지 조회</h3>
						<span class="txt">보유하고 계신 플라스틱 카드 정보를 입력 후 현재 마일리지를<br> 확인하시기 바랍니다.</span>
					</div>

					<div class="table-list-data mt60">
						<div class="text-info"><span class="need"></span>는 필수입력 항목입니다.</div>
						<fieldset>
							<legend>마일리지 카드번호 입력 폼</legend>
							<table class="view">
								<caption>마일리지 카드번호 입력 폼 테이블</caption>
								<colgroup>
									<col style="width:230px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr class="bg-col">
										<th scope="row"><span class="need"></span> 마일리지 카드번호</th>
										<td>
											<div class="card-num-input">
												<div class="cell">
													<input type="text" name="card-num-01" id="card-num-01" class="onlyNumber" value="" maxlength=4 style="width:95px" title="카드번호 첫번째 4자리">
												</div>
												<div class="cell">
													<input type="text" name="card-num-02" id="card-num-02" class="onlyNumber" value=""  maxlength=4 style="width:95px" title="카드번호 두번째 4자리">
												</div>
												<div class="cell">
													<input type="text" name="card-num-03" id="card-num-03" class="onlyNumber" value=""  maxlength=4 style="width:95px" title="카드번호 세번째 4자리">
												</div>
												<div class="cell">
													<input type="text" name="card-num-04" id="card-num-04" class="onlyNumber" value=""  maxlength=4 style="width:95px" title="카드번호 네번째 4자리">
												</div>
												<a href="javascript:;" id="searchMileageBtn" class="btn-02 type-02">조회</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>

					<ul class="txt-list mt30">
						<li>마일리지 확인 후 본인인증을 통하여 마일리지를 통합 신청을 하실 수 있습니다.</li>
					</ul>

					<input type="hidden" name="message" id="message" value="${message }"/>
					<input type="hidden" name="pointMileage" id="pointMileage" value=""/>

					<div id="successCertify" style="display:none;">
						<div class="txt-box mt30">
							<p>입력된 카드드번호에 대한 마일리지는 <span id="point"></span> 점 입니다.</p>
						</div>

						<!-- btn-box -->
						<div class="btn-box mt80">
							<form name="form_chk" method="post">
								<input type="hidden" name="m" value="checkplusSerivce">			<!-- 필수 데이타로, 누락하시면 안됩니다. -->
								<input type="hidden" name="EncodeData" value="${encData }"/>	<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
								<a href="javascript:fnPopup();" class="btn btn-01 type-01">휴대폰 본인 인증</a>
							</form>
							<form name="successForm" method="post">
								<input type="hidden" name="name" id="name" value=""/>
								<input type="hidden" name="cardNo" id="cardNo" value=""/>
								<input type="hidden" name="cardMileage" id="cardMileage" value=""/>
								<input type="hidden" name="mobileNo" id="mobileNo" value=""/>
							</form>
						</div>
						<!-- //btn-box -->
					</div>
				</div>
				<!-- //data-con -->

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
	document.successForm.action = "/brand/phomein/mileage_04.do";
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

	$("#searchMileageBtn").on("click", function(){
		if($("#card-num-01").val() == "" || $("#card-num-02").val() == "" || $("#card-num-03").val() == "" || $("#card-num-04").val() == "") {
			alert("카드번호를 입력하세요");
			return false;
		}
		var cardNo = $("#card-num-01").val() + $("#card-num-02").val() + $("#card-num-03").val() + $("#card-num-04").val();
		$.ajax({
            url: "/brand/phomein/get_card_to_mileage.do",
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
