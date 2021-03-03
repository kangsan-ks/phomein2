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
			<h3>PHO SEASON</h3>
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
		<div id="content" class="rnd">
		<!-- content -->
			<!-- 20190430 수정 s -->
			<div class="phoseason">
				<div class="tit_area">
					<h4>PHO SEASON</h4>
				</div>
				<div class="intro">
					<strong>PHO SEASON</strong>
					<p>
						PHO SEASON is a rice noodle manufacturing factory established by Phomein in 2015.
						It produces rice noodles made of clear and transparent fresh rice harvested in Mekong Delta, Vietnam.
						Also produces Herb-Bags for meat broth using 9 kinds of high quality natural spices.
					</p>
					<p>
						Phomein is the only rice noodle brand that developed rice noodles with its own technology in the
						domestic rice noodle market which has relied on imported rice noodles mixed with old rice, starch and flour.
						The differentiation of Phomein due to the establishment of PHO SEASON
						will become a new standard not only in Korea but also in the global rice noodle market.
					</p>
				</div>
				<div class="cont">
					<strong>From a grain of rice to a bowl of rice noodles.</strong>
					<p>
						In Phomein, you can feel the transparent color of Phomein's fresh rice noodle and the fragrance of freshly cooked new rice, which are completely different from imported rice noodles mixed with old rice, starch and flour.
						<br>In addition, the taste and flavor of thick and deep natural spices are strong competitive power
						in modern society where ingredients become important.
					</p>
					<ul>
						<li>
							<div>
								<strong>4 Seasons of Freshly Harvested Rice</strong>
								<p>
									We receive fresh rice all year round from Vietnam, where it’s known for raising three crops a year. Especially Mekong Delta region has the perfect climate and environment for producing dried rice noodles.
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>Clear Purified Water</strong>
								<p>
									In the PHO SEASON rice noodle manufacturing process, water is as important as freshly harvested rice. We use clean water (purified water) that removes about 70 kinds of pollutants such as residual drugs and environmental hormones through the PHO SEASON’s purification technology.
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>New Technology, Machine Drying</strong>
								<p>
									Unlike the other obsolete noodle making factories, PHO SEASON has developed the way of drying rice noodles by using its own hygienic drying technology. In this process, the clear and transparent color of the newly harvested rice is saved and the fragrance of freshly cooked rice remains intact.
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>Completion of Noodles, Low-temperature Ripening</strong>
								<p>
									The ripening process is directed at low temperature to avoid using unnecessary chemical additives. PHO SEASON’s low-temperature ripening process doubles the appropriate glutinosity, the softness, and the chewiness of noodles.
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>Luxury meat broth, Herb-Bags</strong>
								<p>
									Herb-Bags for meat broth using 9 kinds of high quality natural spices continue to improve its quality. It is the Phomein’s secret of maintaining the taste and quality of the best meat broth.
								</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- //20190430 수정 e -->
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
