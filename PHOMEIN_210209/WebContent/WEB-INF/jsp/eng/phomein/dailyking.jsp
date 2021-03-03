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
			<h2 class="h2-type">DAILYKING</h2>
<!-- 			<span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- brand-info -->
			<div class="dailyking-info">
				<div class="page-logo">
					<p class="img"><img src="../images/common/dailyking_logo.png" alt="dailyking logo" class="load-fadein"/></p>
				</div>

				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">
							Founded in 2006, DAILYKING INC. is an incorporated enterprise which settled the rice noodle<br> 
							franchise brand 'Phomein’ in Korea and popularized the dining culture of Vietnamese cuisine.
						</p>
						<p class="txt02 load-fadein">
							Under the motto of 'Safe Food Ingredients and Honest Food', DAILYKING INC. has signed <br>a business agreement with 'Hyundai Green Food', supplying safe and fresh food ingredients to each franchise stores.

						</p>
						<p class="txt02 load-fadein">
							Also DAILYKING INC. has established ‘PHO SEASON’ which is a rice noodle manufacturing factory in Vietnam in 2015. <br>DAILYKING INC., the inventor of PHO SEASON, has invested 2,000,000 USD for a new machine and technology to produce<br> ‘Fresh Rice Noodles’. In consideration of continuous improvement, we succeeded in producing rice noodles made of clear<br> and transparent fresh rice harvested in Mekong Delta, Vietnam. And we also produce herb-bags for meat broth using<br> 9 kinds of high quality natural spices.
						</p>
						<p class="txt02 load-fadein" style="color:#333;">
							Successful development of Fresh Rice Noodle is the fulfillment of customer promises as well as brand power.<br>
							- Does not contain unnecessary chemical additives other than fresh rice and water.<br>
							- Does not have the particular odor of imported rice noodles mixed with old rice, starch, and flour.<br>
							- Provides the fragrance of freshly cooked new rice, clear and transparent color, and chewy food texture.
						</p>
						<p class="txt02 load-fadein">
							The domestic rice noodle market relies on imported rice noodles mixed with old rice, starch, and flour.<br>  However, the concept shift of making rice noodles only with fresh rice and purified water may have seemed reckless <br>to some people or as an unnecessary path of suffering.<br>It seems impossible to change what is already there, until you decide to take the first step.
						</p>
						<p class="txt02 load-fadein">
							For DAILYKING INC., however, the establishment of ‘PHO SEASON’ and the production of ‘Fresh Rice Noodle’ were part of<br>a heartfelt journey towards customers to provide ‘safe and honest food‘ as a leader in the rice noodle market.<br>You can find Phomein’s ‘Fresh Rice Noodle’, the result of years of challenge, only at Phomein.
						</p>
						<p class="txt02 load-fadein">
							We will lead changes at the center of the rice noodle market without losing the essence of principle<br>and honesty so that changes and challenges starting from Phomein.<br>We will become a new standard not only in Korea but also in the global rice noodle market.
						</p>
						<div class="keyword">
							<ul>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_01.jpg" alt=""/></p>
									<p class="txt">
										<span>Diverse tastes</span>
										<!-- <strong>Pleasure of various selections<br />depending on mood and preference</strong> -->
									</p>
								</li>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_02.jpg" alt=""/></p>
									<p class="txt">
										<span>Pleasure</span>
										<!-- <strong>It could be enjoyed by everyone regardless<br />of sex or age without burdens.</strong> -->
									</p>
								</li>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_03.jpg" alt=""/></p>
									<p class="txt">
										<span>Newness</span>
										<!-- <strong>It always researches and challenges for<br />the newness with no fear.</strong> -->
									</p>
								</li>
							</ul>
						</div>
					</div>
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
