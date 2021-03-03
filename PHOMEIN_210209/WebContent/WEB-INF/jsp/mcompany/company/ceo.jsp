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
		<div class="sub_visual sv1_3">
			<h3>CEO 인사말</h3>
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
			<div class="ceo_title">
				<h4>CEO <em>인사말</em></h4>
			</div>
			<div class="ceo_intro">
				<h5 style="font-size: 14px; font-weight: 500; margin-bottom: 20px;">
					<em>어떻게 만들까</em>에 대한 고민과 열정으로<br/><em>쌀국수 본질</em>을 좇으며 노력하고 있습니다.
				</h5>
				<p class="txt01">
					안녕하십니까?<br/>
					주식회사 데일리킹 대표 김대일입니다.<br/>
					<br/>
					지난 한 해 코로나 팬데믹으로 외식업 전체가<br/>
					힘든 시기를 보냈습니다.<br/>
					모든 자영업자분이 한마음으로 혼신의 노력을 다한<br/>
					시기가 아니었나 생각해봅니다. <br/>
					<br/>
					최근 다양한 이슈로 건강 및 면역 등 안전한 식재료에 대한 관심과<br/>
					외식 패턴의 변화로 딜리버리 서비스 수요가 급증한 가운데,<br/>
					<br/>
					2014년 최초로 시작한 쌀국수 딜리버리 서비스로<br/>
					축적해온 노하우와 2016년 현대그린푸드 MOU를 통한<br/>
					위해 상품 차단 시스템으로 정직한 먹거리, 완성도 높은 서비스를<br/>
					실행해온 포메인은 위기 속에서도 중심을 잃지 않기 위해<br/>
					다분한 노력을 기울이고 있습니다.<br/>
					<br/>
					특히 2015년 현지법인 쌀국수 공장<br/>
					포시즌(PHO SEASON) 설립과 독자기술 연구개발로 생산한<br/>
					국내 최초, 국내 유일 ‘햅쌀면’은 묵은쌀 쌀국수면 수입으로<br/>
					외산 일색이던 위기의 국내 쌀국수 시장에서<br/>
					견고한 브랜드 경쟁력을 입증하고 있습니다. <br/>
					<br/>
					쌀국수 특유의 면 냄새 없는 향긋함,<br/>
					독자기술로 완성한 쫀득한 식감까지<br/>
					이제, 포메인의 건강한 ‘햅쌀 쌀국수’와 함께 하시길 바랍니다.<br/>
					<br/>
					2006년 포메인 분당 정자본점을 시작으로 <br/>
					국내 베트남 외식 시장을 선도해온 포메인이 <br/>
					올해로 창립 15주년을 맞았습니다.<br/>
					<br/>
					오늘도 우리는<br/>
					‘어떻게 팔까’가 아닌 <br/>
					‘어떻게 만들까’에 대한 고민과 열정으로 <br/>
					마케팅이 아닌 ‘쌀국수 본질’을 좇으며 노력하고 있습니다.<br/>
					<br/>
					2021년에도 대한민국 쌀국수를 대표하는 브랜드로 <br/>
					국내 쌀국수 시장의 변화와 도전에 앞장서도록 하겠습니다.<br/>
					늘 건강하시길 바랍니다. 감사합니다. <br/>
				</p>
				<p class="txt04">㈜데일리킹 대표 김대일 </p>
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
