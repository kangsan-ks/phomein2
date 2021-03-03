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
			<input type="hidden" name="message" id="message" value="${message }"/>
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
						<h3 class="h3-type fc01">마일리지 통합 신청</h3>
						<span class="txt">조회된 마일리지는 다음과 같습니다.</span>
					</div>

					<div class="table-list-data mt60">
						<fieldset>
							<legend>마일리지 조회 결과 폼</legend>
							<table class="view">
								<caption>마일리지 조회 결과 폼 테이블</caption>
								<colgroup>
									<col style="width:230px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">조회한 마일리지 카드번호</th>
										<td>${regCardNo } / ${cardMileage }점</td>
									</tr>
									<tr>
										<th scope="row">인증한 휴대폰번호</th>
										<td>${regMobileNo } / ${mileage }점</td>
									</tr>
									<tr class="bg-col">
										<th scope="row">합계</th>
										<td>${cardMileage + mileage }점</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>

					<ul class="txt-list mt30">
						<li>담당자가 신청 내역을 확인 및 승인 후 마일리지 통합이 완료됩니다.</li>
						<li>마일리지 통합 완료 후에는 매장에서 휴대폰 번호로 간편하게 마일리지를 사용하실 수 있습니다.</li>
						<li>마일리지 통합 신청 문의 : 1899-2422 </li>
					</ul>

					<!-- btn-box -->
					<div class="btn-box mt80">
						<a href="/brand/phomein/mileage_03.do" class="btn-01 type-02">취소</a>
						<a href="javascript:;" id="submitMileageBtn" class="btn-01 type-01">마일리지 통합 신청</a>
					</div>
					<!-- //btn-box -->
					
					<form name="successForm">
						<input type="hidden" name="name" id="name" value="${name }"/>
						<input type="hidden" name="cardNo" id="cardNo" value="${cardNo }"/>
						<input type="hidden" name="mobileNo" id="mobileNo" value="${mobileNo }"/>
						<input type="hidden" name="cardMileage" id="cardMileage" value="${cardMileage }"/>
						<input type="hidden" name="mileage" id="mileage" value="${mileage }"/>
						<input type="hidden" name="totMileage" id="totMileage" value="${cardMileage + mileage }"/>
					</form>
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

$(function(){	
	// 에러 메시지 처리
	/*
	if($("#message").val() != '') {
		alert($("#message").val());
		return false;
	}
	*/
	
	$("#submitMileageBtn").on("click", function(){
		if (confirm("마일리지 통합 신청을 하시겠습니까?")) {
			$.ajax({
		     	url: "/brand/phomein/mileage_proc.do",
		        type: "POST",
		        data: {
		            'name' : $("#name").val(),
		            'cardNo' : $("#cardNo").val(),
		            'mobileNo' : $("#mobileNo").val(),
		            'cardMileage' : $("#cardMileage").val(),
		            'mileage' : $("#mileage").val(),
		            'totMileage' : $("#totMileage").val()
		        },
		        dataType: 'json',
		        success: function (data) {
		            if(!!data.result) {
		            	if(data.result == 'SUCCESS') {
		            		alert('마일리지 통합 신청이 정상적으로 완료되었습니다.');
		            		location.href="/brand/phomein/mileage_01.do";
		            	}
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
		}
	});
});

</script>
</body>
</html>
