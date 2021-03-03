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
		<div class="sub_visual sv1">
			<h3>DAILYKING</h3>
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
		<div id="content" class="phomein">
			<div class="dailyking">
				<div class="tit_area">
					<h4><span class="blind">DAILYKING INC.</span></h4>
				</div>
				<div class="intro">
					<p class="txt1">
						Founded in 2006, DAILYKING INC. is an incorporated enterprise which settled the rice noodle
						franchise brand 'Phomein’ in Korea and popularized the dining culture of Vietnamese cuisine.
					</p>
					<p class="txt2">
						Under the motto of 'Safe Food Ingredients and Honest Food', DAILYKING INC. has signed
						a business agreement with 'Hyundai Green Food', supplying safe and fresh food ingredients to each franchise stores.
					</p>
					<p class="txt2">
						Also DAILYKING INC. has established ‘PHO SEASON’ which is a rice noodle manufacturing factory in Vietnam in 2015. DAILYKING INC., the inventor of PHO SEASON, has invested 2,000,000 USD for a new machine and technology to produce ‘Fresh Rice Noodles’. In consideration of continuous improvement, we succeeded in producing rice noodles made of clear and transparent fresh rice harvested in Mekong Delta, Vietnam. And we also produce herb-bags for meat broth using 9 kinds of high quality natural spices.
					</p>
					<p class="txt2" style="color:#333;">
						Successful development of Fresh Rice Noodle is the fulfillment of customer promises as well as brand power.<br>
						- Does not contain unnecessary chemical additives other than fresh rice and water.<br>
						- Does not have the particular odor of imported rice noodles mixed with old rice, starch, and flour.<br>
						- Provides the fragrance of freshly cooked new rice, clear and transparent color, and chewy food texture.

					</p>
					<p class="txt2">
						The domestic rice noodle market relies on imported rice noodles mixed with old rice, starch, and flour. However, the concept shift of making rice noodles only with fresh rice and purified water may have seemed reckless to some people or as an unnecessary path of suffering.<br>
						It seems impossible to change what is already there, until you decide to take the first step.

					</p>
					<p class="txt2">
						For DAILYKING INC., however, the establishment of ‘PHO SEASON’ and the production of ‘Fresh Rice Noodle’ were part of a heartfelt journey towards customers to provide ‘safe and honest food‘ as a leader in the rice noodle market.
						You can find Phomein’s ‘Fresh Rice Noodle’, the result of years of challenge, only at Phomein.

					</p>
					<p class="txt2">
						We will lead changes at the center of the rice noodle market without losing the essence of principle
						and honesty so that changes and challenges starting from Phomein.
						We will become a new standard not only in Korea but also in the global rice noodle market.
					</p>
					<div class="con">
						<ul>
							<li>
								<div>
									<strong>味</strong>
									<em>Diverse tastes</em>
									<!-- <p>Pleasure of various selections<br>depending on mood and preference</p> -->
								</div>
							</li>
							<li>
								<div>
									<strong>樂</strong>
									<em>Pleasure</em>
									<!-- <p>It could be enjoyed by everyone regardless<br>of sex or age without burdens</p> -->
								</div>
							</li>
							<li>
								<div>
									<strong>新</strong>
									<em>Newness</em>
									<!-- <p>It always researches and challenges for<br>the newness with no fear</p> -->
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
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
});
</script>
</body>
</html>
