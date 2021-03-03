<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/eng/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/eng/include/engheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_05.jpg');"></div>
			<h2 class="h2-type">Counseling Request</h2>
<!-- 			<span class="txt">11년의 노하우, 포메인과 함께라면 행복한 미래를 꿈꾸셔도 좋습니다.<br>밝은 미래, 행복한 포메人</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="cs-con">
					<div class="con-title">
						<h3 class="h3-type">Consent to Personal Information Collection and Usage </h3>
						<span class="txt">Phomein collects minimal personal information for accurate consultation. <br>After checking the contents below, please agree to the provision and use of personal information</span>
					</div>

					<div class="agree-con">
						<div class="con-box">
							<h4>Consent to the provision and use of personal information</h4>
							<p>
								The Company collects and uses the following personal information for consultation <br>
								1. Personal information collection items (required): Name, Email, Contact information <br>
								2. Purpose of collecting and using personal information: Consultation about franchising request <br>
								3. Retention period of personal information: If the purpose of use is achieved after collecting personal information, it will be destroyed within up to 30 days<br>
								* You have the right not to consent to the provision and use of your personal information, and refusal of consent may limit the use of our services.
							</p>
						</div>
					</div>
					<form name="submitForm" method="post" action="/eng/franchisee/info.do">
						<p class="chk-type01"><input type="checkbox" id="check0101" name="chk"><label for="check0101"><span></span>I agree to personal information collection and utilization<strong>(required)</strong></label></p>
					</form>

					<!-- btn-box -->
					<div class="btn-box mt50">
						<a href="javascript:;" class="btn-01 type-01" id="agreeBtn">ENTER</a>
					</div>
					<!-- //btn-box -->
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/eng/include/engfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
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
