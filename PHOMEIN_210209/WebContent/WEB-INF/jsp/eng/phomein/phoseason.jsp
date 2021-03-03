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

	<section id="dBody" class="rnd">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">PHO SEASON</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">

			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type2">PHO SEASON</h3>
				</div>

				<div class="phoseason-box">
					<div class="top-visual-con">
						<div class="phoseason-visual">
							<div><img src="../images/content/phoseason_img_01.jpg" alt=""/></div>
							<div><img src="../images/content/phoseason_img_02.jpg" alt=""/></div>
							<div><img src="../images/content/phoseason_img_03.jpg" alt=""/></div>
						</div>
						<p class="tit load-fadein">PHO SEASON</p>
						<p class="txt load-fadein">PHO SEASON is a rice noodle manufacturing factory established by Phomein in 2015.<br> It produces rice noodles made of clear and transparent fresh rice harvested in Mekong Delta, Vietnam.<br>Also produces Herb-Bags for meat broth using 9 kinds of high quality natural spices.</p>
						<p class="txt load-fadein">Phomein is the only rice noodle brand that developed rice noodles with its own technology in the<br>domestic rice noodle market which has relied on imported rice noodles mixed with old rice, starch and flour.<br>The differentiation of Phomein due to the establishment of PHO SEASON <br>will become a new standard not only in Korea but also in the global rice noodle market.</p>
					</div>

					<div class="inner02">
						<div class="bottom-visual-con">
							<p class="tit load-fadein">From a grain of rice to a bowl of rice noodles.</p>
							<p class="txt load-fadein">In Phomein, you can feel the transparent color of Phomein's fresh rice noodle and the fragrance of freshly cooked new rice,<br>which are completely different from imported rice noodles mixed with old rice, starch and flour.<br>
							In addition, the taste and flavor of thick and deep natural spices are strong competitive power<br>in modern society where ingredients become important.
							</p>

							<div class="phoseason-list">
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_01.png" alt="icon"/></p>
									<p class="tit2">4 Seasons of Freshly Harvested Rice</p>
									<p class="txt2">We receive fresh rice all year round from Vietnam, where it’s known for raising three crops a year. Especially Mekong Delta region has the perfect climate and environment for producing dried rice noodles.</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_02.png" alt="icon"/></p>
									<p class="tit2">Clear Purified Water</p>
									<p class="txt2">In the PHO SEASON rice noodle manufacturing process, water is as important as freshly harvested rice. We use clean water (purified water) that removes about 70 kinds of pollutants such as residual drugs and environmental hormones through the PHO SEASON’s purification technology.</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_03.png" alt="icon"/></p>
									<p class="tit2">New Technology, Machine Drying</p>
									<p class="txt2">Unlike the other obsolete noodle making factories, PHO SEASON has developed the way of drying rice noodles by using its own hygienic drying technology. In this process, the clear and transparent color of the newly harvested rice is saved and the fragrance of freshly cooked rice remains intact.</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_04.png" alt="icon"/></p>
									<p class="tit2">Completion of Noodles,<br> Low-temperature Ripening</p>
									<p class="txt2">The ripening process is directed at low temperature to avoid using unnecessary chemical additives. PHO SEASON’s low-temperature ripening process doubles the appropriate glutinosity, the softness, and the chewiness of noodles.</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_05.png" alt="icon"/></p>
									<p class="tit2">Luxury meat broth, Herb-Bags</p>
									<p class="txt2">Herb-Bags for meat broth using 9 kinds of high quality natural spices continue to improve its quality. It is the Phomein’s secret of maintaining the taste and quality of the best meat broth.</p>
								</div>
							</div>
						</div>
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
