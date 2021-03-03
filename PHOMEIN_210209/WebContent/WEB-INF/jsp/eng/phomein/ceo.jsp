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
			<h2 class="h2-type">CEO</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- ceo-info -->
			<div class="ceo-info">
				<div class="page-logo">
					<p class="tit">CEO</p>
					<!-- <p class="txt">We will do our best to satisfy our customers.</p> -->
				</div>

				<div class="inner02">
					<div class="page-box">
						<p class="txt01">
							Hello<br>
							I am Kim Dae-il, CEO of DAILYKING INC.<br>
							Thank you for visiting Phomein.<br>
						</p>
						<p class="txt02">
							<span>Welcoming the 15th year as of today,<br>We will continue to keep our own principles.</span>
						</p>
						<p class="txt03">
							<span>
								Since opening of the Head Store in Jeongja in 2006, we have fulfilled our promise of ‘Safe Food Ingredients and Honest Food’. We have steadily worked to honor it with the establishment of &lt;PHO SEASON&gt;, a rice noodle manufacturing factory in Vietnam and business agreement with &lt;Hyundai Green Food&gt;, a comprehensive food company which introduced the hazardous product blocking system in 2016. <br><br>

								As the result of 'our own principle', you will be able to meet Fresh Rice Noodles only at all franchise stores of Phomein in 2019. In the rice noodle market that depends on imported rice noodles mixed with old rice. Making a bowl of rice noodles only with fresh rice requires care and sincerity which heightened as the cooking process became more delicate.<br><br>

								Please experience the appropriate glutinosity, the softness, and the chewiness of Phomein’s Fresh Rice Noodles which were born with Phomein’s exclusive low-temperature ripening technique. This process helps to avoid using unnecessary chemical additives.<br><br>

								Even with our reputation of being the best for a long time, we promise to serve fresh ingredients and healthy table every day without losing modesty. Thank you.
							</span>
						</p>
						<p class="txt04">CEO of DAILYKING INC. Kim Dae-il</p>
					</div>
				</div>
			</div>
			<!-- //ceo-info -->
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
