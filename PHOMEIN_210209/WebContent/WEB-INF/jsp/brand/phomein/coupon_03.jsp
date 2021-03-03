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
			<input type="hidden" name="message" id="message" value="${message }"/>
			<div class="inner">

				<!-- page-tab -->
				<div class="page-tab">
					<ul>
						<li><a href="/brand/phomein/coupon_01.do">상품권 안내</a></li>
						<li class="actived"><a href="#">상품권 교환 신청</a></li>
					</ul>
				</div>
				<!-- //page-tab -->
				<!-- data-con -->
				<div class="data-con">
					<div class="con-title">
						<h3 class="h3-type fc01">마일리지 조회 결과</h3>
					</div>

					<div class="table-list-data mt60">
						<div class="text-info"><span class="need"></span>는 필수입력/선택 항목입니다.</div>
						<fieldset>
							<legend>마일리지 조회 결과 폼</legend>
							<table class="view">
								<caption>마일리지 조회 결과 폼 테이블</caption>
								<colgroup>
									<col style="width:190px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">이름</th>
										<td>${name }</td>
									</tr>
									<tr>
										<th scope="row">휴대폰 번호</th>
										<td>${regMobileNo }</td>
									</tr>
									<tr>
										<th scope="row">총 마일리지</th>
										<td>${mileage }점</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> 수량</th>
										<td>
											<div class="multi-input-wrap">
												<div>
							                        <select id="couponCnt">
							                        	<c:forEach varStatus="status" begin="1" end="100" step="1">
							                            	<option value="${status.index }">${status.index }</option>
							                            </c:forEach>
							                        </select>
							                    </div>
							                    <span class="txt">매</span>
							                </div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> 주소</th>
										<td>
											<div class="address-wrap" style="width:660px;">
												<p class="zip-code"><input type="text" name="post" id="post" title="우편번호 입력" placeholder="우편번호" readonly><a href="javascript:;" onclick="postFind();" class="btn btn-03 type-02">우편번호 검색</a></p>
												<p class="cell"><input type="text" name="oaddr" id="oaddr" title="신 주소 입력" placeholder="신주소" readonly></p>
												<p class="cell"><input type="text" name="naddr" id="naddr" title="구 주소 입력" placeholder="구주소" readonly></p>
												<p class="cell"><input type="text" name="daddr" id="daddr" title="상세 주소 입력" placeholder="상세주소"></p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>

					<ul class="txt-list mt30">
						<li>마일리지가 10,000점 이상일 경우 포메인 상품권 교환 신청이 가능합니다.</li>
						<li>포메인 상품권은 우편으로 발송해 드리니 수취하실 수 있는 주소를 정확히 입력하시기 바랍니다.</li>
						<li>상품권 교환 신청 문의 : 1899-2422 </li>
					</ul>

					<!-- btn-box -->
					<div class="btn-box mt80">
						<a href="/brand/phomein/coupon_02.do" class="btn-01 type-02">취소</a>
						<a href="javascript:;" id="submitCouponBtn" class="btn-01 type-01">신청</a>
					</div>
					<!-- //btn-box -->
					
					<form name="successForm">
						<input type="hidden" name="name" id="name" value="${name }"/>
						<input type="hidden" name="mobileNo" id="mobileNo" value="${mobileNo }"/>
						<input type="hidden" name="mileage" id="mileage" value="${mileage }"/>
						<input type="hidden" name="cnt" id="cnt" value=""/>
						<input type="hidden" name="address" id="address" value=""/>
					</form>
				</div>
				<!-- data-con -->

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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

function postFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("oaddr").value = roadAddr;
            document.getElementById("naddr").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("daddr").value = extraRoadAddr;
            } else {
                document.getElementById("daddr").value = '';
            }
            
            /*
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            */
        }
    }).open();
    
}

$(function(){	
	// 에러 메시지 처리
	/*
	if($("#message").val() != '') {
		alert($("#message").val());
		return false;
	}
	*/
	
	$("#submitCouponBtn").on("click", function(){
		if($("#couponCnt option:selected").val() == "") {
			alert('수량을 입력하세요');
			return false;
		}
		if($("#post").val() == "" || $("#oaddr").val() == "" || $("#naddr").val() == "" || $("#daddr").val() == "") {
			alert('주소를 입력하세요');
			return false;
		}
		if(10000 * parseInt($("#couponCnt option:selected").val()) > parseInt($("#mileage").val())) {
			alert('교환하고자하는 상품권의 수량을 확인해주세요');
			return false;
		}
		if (confirm("상품권 교환 신청을 하시겠습니까?")) {
			$.ajax({
		     	url: "/brand/phomein/coupon_proc.do",
		        type: "POST",
		        data: {
		            'name' : $("#name").val(),
		            'mobileNo' : $("#mobileNo").val(),
		            'mileage' : $("#mileage").val(),
		            'cnt' : $("#couponCnt option:selected").val(),
		           	'address' : $("#oaddr").val() + $("#naddr").val() + $("#daddr").val()
		        },
		        dataType: 'json',
		        success: function (data) {
		            if(!!data.result) {
		            	if(data.result == 'SUCCESS') {
		            		alert('상품권 교환 신청이 정상적으로 완료되었습니다.');
		            		location.href="/brand/phomein/coupon_01.do";
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
