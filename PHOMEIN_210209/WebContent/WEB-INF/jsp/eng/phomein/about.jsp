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

	<section id="dBody" class="phomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">About Phomein</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- brand-info -->
			<div class="brand-info">
				<div class="page-logo">
					<p class="tit">The Best <br>Rice Noodle Restaurant Phomein</p>
					<p class="txt">The World’s Best Korean Vietnamese Restaurant Phomein</p>
					<p class="img"><img src="../images/common/brand_info_logo.png" alt="logo"/></p>
				</div>
				<!-- 20190225 수정 -->
				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">Starting at Jeongja Restaurant in 2006,<br>Phomein has had many experiences, big and small.</p>
						<p class="txt02 load-fadein">With stronger competitiveness in 2021,<br><span>Phomein has accomplished great growth.</span></p>
						<p class="txt03 load-fadein">All menus of Phomein use “freshly harvested rice noodles” self-made at the<br>rice noodle manufacturing factory “PHO SEASON’ in Vietnam. In a rice noodle market relying on imported rice <br>noodles made of old rice, you can meet the clean and healthy “Fresh Rice Noodles” only at Phomein.
						<br><br>Wholesome rice noodles made from freshly harvested rice 365 days a year to<br>luxurious meat broth further deepened with quality improvement<br><span style="color:#222; font-size:21px;">Phomein is it for rice noodles.</span></p>
						<p class="txt03 load-fadein">Other brands in the foodservice industry are busy chasing trends without exception.<br>On the basis of principles and honesty, Phomein has taken challenges and strengthened its competitiveness.<br>Thanks to these efforts, Phomein possesses unrivalled competitiveness as of now.</p>
						<p class="txt04 load-fadein">Now and here, the one and only Phomein is with you.</p>
						<p class="img"><img src="../images/content/brand_menu_img.jpg" alt="쌀국수 이미지" class="load-fadein"/></p>
					</div>
				</div>
				<!-- //20190225 수정 -->
				<div class="all-menu">
					<p class="txt"><em>31</em> kinds of Vietnamese dishes, <span>give you impression.</span></p>
					<a href="/eng/menu/menu_list.do" class="btn-all-menu">ALL MENU VIEW</a>
				</div>
			</div>
			<!-- //brand-info -->
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
</body>
</html>