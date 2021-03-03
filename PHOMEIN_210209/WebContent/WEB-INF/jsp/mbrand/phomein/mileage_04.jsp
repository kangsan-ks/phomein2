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
 			<input type="hidden" name="message" id="message" value="${message }"/>
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
 			<div class="tit_area">
				<h4>마일리지 통합 신청</h4>
				<p class="desc">조회된 마일리지는 다음과 같습니다.</p>
			</div>
			<!-- //타이틀 영역 -->
			<div class="table_data">
				<dl>
					<dt class="row2">조회한 마일리지<br>카드번호</dt>
					<dd><strong>${regCardNo }<br>${cardMileage }점</strong></dd>
				</dl>
				<dl>
					<dt class="row2">인증한<br>휴대폰 번호</dt>
					<dd><strong>${regMobileNo }<br>${mileage }점</strong></dd>
				</dl>
				<dl class="bg">
					<dt>합계</dt>
					<dd><strong><em class="sum">${cardMileage + mileage }</em>점</strong></dd>
				</dl>
			</div>
			<div class="txt_list">
				<ul>
					<li><span>담당자가 신청 내역을 확인 및 승인 후 마일리지 통합이 완료됩니다.</span></li>
					<li><span>마일리지 통합 완료 후에는 매장에서 휴대폰 번호로 간편하게 마일리지를 사용하실 수 있습니다.</span></li>
					<li><span>마일리지 조회 문의 : 1899-2422</span></li>
				</ul>
			</div>
			<!-- 버튼 영역 -->
			<div class="btn_area mt20">
				<a href="javascript:;" id="submitMileageBtn" class="btn_tyf c_black">상품권 교환 신청</a>
			</div>
			<!-- //버튼 영역 -->
			
			<form name="successForm">
				<input type="hidden" name="name" id="name" value="${name }"/>
				<input type="hidden" name="cardNo" id="cardNo" value="${cardNo }"/>
				<input type="hidden" name="mobileNo" id="mobileNo" value="${mobileNo }"/>
				<input type="hidden" name="cardMileage" id="cardMileage" value="${cardMileage }"/>
				<input type="hidden" name="mileage" id="mileage" value="${mileage }"/>
				<input type="hidden" name="totMileage" id="totMileage" value="${cardMileage + mileage }"/>
			</form>
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
		     	url: "/mbrand/phomein/mileage_proc.do",
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
		            		location.href="/mbrand/phomein/mileage_01.do";
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
