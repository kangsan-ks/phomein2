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
<%@ include file="/WEB-INF/jsp/meng/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/meng/include/engheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/meng/include/enggnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv5">
			<h3>Counseling Request</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			FRANCHISE : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/meng/include/englnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="franchisee">
			<!-- 타이틀 영역 -->
 			<div class="tit_area">
				<h4>Consent to Personal Information Collection and Usage </h4>
				<p class="desc">
					Phomein collects minimal personal information for accurate consultation.<br>
					After checking the contents below, please agree to the provision and use of personal information
				</p>
			</div>
			<!-- //타이틀 영역 -->

			<div class="agree_area">
				<div class="agree_cont">
					<h5>Consent to the provision and use of personal information</h5>
					<p>
						The Company collects and uses the following personal information for consultation<br>
						1. Personal information collection items (required): Name, Email, Contact information <br>
						2. Purpose of collecting and using personal information: Consultation about franchising request  <br>
						3. Retention period of personal information: If the purpose of use is achieved after collecting personal information, it will be destroyed within up to 30 days <br>
						* You have the right not to consent to the provision and use of your personal information, and refusal of consent may limit the use of our services.
					</p>
				</div>
				<form name="submitForm" method="post" action="/meng/franchisee/info.do">
					<span class="checkbox">
						<input type="checkbox" id="check0101" name="chk"><label for="check0101"><span class="fc_2">I agree to personal information collection and utilization</span> (required)</label>
					</span>
				</form>
			</div>
			<!-- 버튼 영역 -->
			<div class="btn_area">
				<a href="javascript:;" class="btn_tyf c_black" id="agreeBtn">ENTER</a>
			</div>
			<!-- //버튼 영역 -->
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/meng/include/engfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#agreeBtn").click(function(){
		if(!$("#check0101").is(":checked")) {
			alert("Agreement to provide personal information for usage");
			return false;
		} else {
			document.submitForm.submit();
		}
	});
});
</script>
</body>
</html>
