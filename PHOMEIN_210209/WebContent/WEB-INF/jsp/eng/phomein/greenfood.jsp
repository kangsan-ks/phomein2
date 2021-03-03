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
			<h2 class="h2-type">Hyundai Green Food MOU</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">

			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type">'Safe food Ingredients supply MOU' <br>with Hyundai Green Food</h3>
				</div>

				<div class="greenfood-box">
					<div class="greenfood-con">
						<p class="txt load-fadein">Phomein will make a healthy table with 'Hyundai Green Food', a comprehensive food company equipped with a ‘hazardous product blocking system’ of the Ministry of Food and Drug Safety.</p>
						<p class="tit load-fadein">Relief <span>Phomein</span></p>
						<p class="txt2 load-fadein">Phomein and Hyundai Green Food signed a business agreement on the supply of safe food ingredients in August 2016. Phomein is promoting the unification of distribution channels for all franchises, and you can check the 'Relief Phomein' certification mark at franchises that receive food ingredients through Hyundai Green Food.<br><br>'Safe food Ingredients and Honest food’<br>It is a product certified with a scientific food safety system of Phomein and Hyundai Green Food for the safety of production and distribution processes.</p>
					</div>
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
<script>
	$('.phoseason-visual').slick({
		dots: true,
		prevArrow: false,
		nextArrow: false,
		autoplay:true,
		autoplaySpeed:3000,
		fade: true
	});
	//20190315 수정 e

	$('.phoseason-list').slick({
		centerMode: true,
		infinite: true,
		centerPadding: '0px',
		slidesToShow: 3,
		variableWidth: false,
		customPaging: function(slider, i) {
			var tit = $(slider.$slides[i]).find('.img').html();
			return '<div class="pager-tit" class=' + i + '>'+ tit + '</div>';
		},
		dots: true
	});
</script>
</body>
</html>
