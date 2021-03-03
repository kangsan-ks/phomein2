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
 			<input type="hidden" name="message" id="message" value="${message }"/>
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
			
 			<!-- 타이틀 영역 -->
 			<div class="tit_area pb0">
				<h4>마일리지 조회 결과</h4>
				<span class="txt"><strong class="ico_import">*</strong> 는 필수입력/선택 항목입니다.</span>
			</div>
			<!-- //타이틀 영역 -->
			<div class="table_data">
				<dl>
					<dt>이름</dt>
					<dd><strong>${name }</strong></dd>
				</dl>
				<dl>
					<dt>휴대폰 번호</dt>
					<dd><strong>${regMobileNo }</strong></dd>
				</dl>
				<dl>
					<dt>총 마일리지</dt>
					<dd><strong>${mileage }점</strong></dd>
				</dl>
				<dl>
					<dt><span class="ico_import">수량</span></dt>
					<dd>
						<span class="write_form">
							<!-- 셀렉트 박스 -->
							<span class="selectbox w100">
								<label for="selStore">수량 선택</label>
								<select id="couponCnt">
							    	<c:forEach varStatus="status" begin="1" end="100" step="1">
							    		<option value="${status.index }">${status.index }</option>
							        </c:forEach>
							    </select>
							</span>
							<!-- //셀렉트 박스 -->
							<span class="txt">매</span>
						</span>
					</dd>
				</dl>
				<dl>
					<dt><span class="ico_import">주소</span></dt>
					<dd>
						<span class="write_form">
							<span class="zipcode">
								<input type="text" class="text" name="post" id="post" placeholder="우편번호" title="우편번호" readonly="readonly">
								<button type="button" onclick="postFind();" class="btn_search">검색</button>
							</span>
							<input type="text" class="text addr_txt" name="oaddr" id="oaddr" title="신주소" placeholder="신주소" readonly="readonly">
							<input type="text" class="text addr_txt" name="naddr" id="naddr" title="구주소" placeholder="구주소" readonly="readonly">
							<input type="text" class="text addr_txt" name="daddr" id="daddr" title="상세주소" placeholder="상세주소">
						</span>
					</dd>
				</dl>
			</div>
			<div class="txt_list">
				<ul>
					<li><span>마일리지가 10,000점 이상일 경우 포메인 상품권 교환 신청이 가능합니다.</span></li>
					<li><span>포메인 상품권은 우편으로 발송해 드리니 수취하실 수 있는 주소를 정확히 입력하시기 바랍니다.</span></li>
					<li><span>마일리지 조회 문의 : 1899-2422</span></li>
				</ul>
			</div>
			<!-- 버튼 영역 -->
			<div class="btn_area mt20">
				<span class="w50p"><a href="/mbrand/phomein/coupon_02.do" class="btn_tyf c_gray">취소</a></span>
				<span class="w50p"><a href="javascript:;" id="submitCouponBtn" class="btn_tyf c_black">신청하기</a></span>
			</div>
			<!-- //버튼 영역 -->
			
			<form name="successForm">
				<input type="hidden" name="name" id="name" value="${name }"/>
				<input type="hidden" name="mobileNo" id="mobileNo" value="${mobileNo }"/>
				<input type="hidden" name="mileage" id="mileage" value="${mileage }"/>
				<input type="hidden" name="cnt" id="cnt" value=""/>
				<input type="hidden" name="address" id="address" value=""/>
			</form>
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
		     	url: "/mbrand/phomein/coupon_proc.do",
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
		            		location.href="/mbrand/phomein/coupon_01.do";
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
