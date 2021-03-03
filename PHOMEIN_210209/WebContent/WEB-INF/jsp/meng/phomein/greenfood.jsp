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
		<!-- content -->
		<div id="content" class="rnd">
 			<div class="mou">
				<div class="tit_area">
					<h4>'Safe food Ingredients supply MOU' <br>with Hyundai Green Food</h4>
				</div>
				<div class="content">
					<p class="txt1">
						'Phomein will make a healthy table with 'Hyundai Green Food', a comprehensive food company equipped with a ‘hazardous product blocking system’ of the Ministry of Food and Drug Safety
					</p>
					<p class="txt2">
						<strong>Relief Phomein</strong>
						<span>
							Phomein and Hyundai Green Food signed a business agreement on the supply of safe food ingredients in August 2016.
							Phomein is promoting the unification of distribution channels for all franchises, and you can check the 'Relief Phomein' certification mark at franchises that receive food ingredients through Hyundai Green Food.
						</span>
						<span>
							'Safe food Ingredients and Honest food’<br>
							It is a product certified with a scientific food safety system of Phomein and Hyundai Green Food for the safety of production and distribution processes.

						</span>
					</p>
					<p class="img"><img src="../common/images/content/mark_mou.png" alt="Relief Phomein 인증마크"></p>
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
