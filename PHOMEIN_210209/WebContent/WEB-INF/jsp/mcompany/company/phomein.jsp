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
<%@ include file="/WEB-INF/jsp/mcompany/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companygnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv1_0">
			<h3>포메인</h3>
		</div>
		<!-- 상단비쥬얼 영역
			회사소개	: class="sub_visual sv1"
			연구개발	: class="sub_visual sv2"
			가맹개설정보 : class="sub_visual sv3"
			사회공헌 	: class="sub_visual sv4"
			POLICY	   : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mcompany/include/companylnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="company">
			<div class="video_con" style="text-align:center; margin-bottom:30px;">
				<iframe width="330" height="200" src="https://www.youtube.com/embed/ez0V9lfBnBU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="phomein_title">
				<h4>쌀국수는 <em>포메인</em></h4>
				<p class="desc">The World’s Best Korean<br>Vietnamese Restaurant Phomein</p>
			</div>
			<div class="phomein_intro">
				<p class="txt1">
					올해 15주년을 맞이한 포메인은<br>
					한국인의 입맛에 맞는 레시피 개발로<br>
					국내 베트남 쌀국수 대중화를 이끈<br>
					대한민국 대표 쌀국수 전문 브랜드입니다.
				</p>
				<p class="txt2">	
					국내 130여 개의 매장을 보유한 포메인은<br>
					현대그린푸드와의 ‘안전한 식자재 공급’ MOU 체결,<br>
					베트남 현지 법인 공장 포시즌(PHO SEASON)<br>
					설립을 통한 햅쌀 쌀국수 개발 및 제조로<br>
					‘안전한 식재료 정직한 먹거리’ 약속을 지켜가고 있습니다.
				<p>
				<p class="img"><img src="../common/images/content/img_phomein.jpg" alt=""></p>
			</div>
 		</div>
		<!-- //content -->
	</div> 
	<!-- //container -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyfooter.jsp"%>
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
