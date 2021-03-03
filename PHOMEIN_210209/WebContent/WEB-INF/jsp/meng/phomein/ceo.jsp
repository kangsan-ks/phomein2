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
			<h3>CEO</h3>
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
 			<div class="ceo_title">
				<h4>CEO</h4>
				<!-- <p class="desc">고객의 만족을 위해 <br>최선을 다해 노력하겠습니다.</p> -->
			</div>
			<div class="ceo_intro">
				<p class="txt01">
					Hello<br>
					I am Kim Dae-il, CEO of DAILYKING INC.<br>
					Thank you for visiting Phomein.<br>
				</p>
				<p class="txt02">
					<span>Welcoming the 15th year<br>as of today, We will continue to keep our own principles.</span>
				</p>
				<p class="txt03">
					<span>
						Since opening of the Head Store in Jeongja in 2006, we have fulfilled our promise of ‘Safe Food Ingredients and Honest Food’. We have steadily worked to honor it with the establishment of &lt;PHO SEASON&gt;>, a rice noodle manufacturing factory in Vietnam and business agreement with &lt;Hyundai Green Food&gt;, a comprehensive food company which introduced the hazardous product blocking system in 2016.<br><br>

						As the result of 'our own principle', you will be able to meet Fresh Rice Noodles only at all franchise stores of Phomein in 2019. In the rice noodle market that depends on imported rice noodles mixed with old rice. Making a bowl of rice noodles only with fresh rice requires care and sincerity which heightened as the cooking process became more delicate.<br><br>

						Please experience the appropriate glutinosity, the softness, and the chewiness of Phomein’s Fresh Rice Noodles which were born with Phomein’s exclusive low-temperature ripening technique. This process helps to avoid using unnecessary chemical additives.
						<br><br>

						Even with our reputation of being the best for a long time, we promise to serve fresh ingredients and healthy table every day without losing modesty. Thank you.
					</span>
				</p>
				<p class="txt04">CEO of DAILYKING INC. Kim Dae-il</p>
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
