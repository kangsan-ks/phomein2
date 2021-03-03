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
<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv1">
			<h3>브랜드 소개</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			CS CENTER : class="sub_visual sv5"
			ETC 	  : class="sub_visual sv6"
		-->
		<!-- //sub visual -->

		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->

		<!-- content -->
		<div id="content" class="phomein">
			<div class="video_con" style="text-align:center; margin-bottom:30px;">
				<iframe width="330" height="200" src="https://www.youtube.com/embed/ez0V9lfBnBU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
 			<div class="about_title">
				<h4>쌀국수는 <em>포메인</em></h4>
				<p class="desc">The World’s Best Korean<br>Vietnamese Restaurant Phomein</p>
			</div>
			<div class="about_intro">
				<p class="txt1">
					2006년 정자본점으로 시작된 포메인의<br>크고 작은 순간들이 모여
					<strong><span>2021년,<br>더욱 단단해진 경쟁력으로</span><em>지금 이 자리에 서 있습니다.</em></strong>
				</p>
				<p class="txt2">
					포메인 전 메뉴는 (주)데일리킹이 베트남 현지법인으로 설립한 <br>쌀국수 공장‘포시즌(PHO SEASON)’에서 직접 만든 ‘햅쌀 쌀국수면’을<br>사용합니다. 수년간의 연구개발로 탄생한 ‘햅쌀 쌀국수면’은<br>독자적인 저온 숙성 · 기계 건조 기술로 화학 첨가물 없이<br>햅쌀과 물만을 사용하여 햅쌀밥의 향긋한 향과 맑고 투명한 빛깔,<br>쫀득한 식감을 완성하였습니다. 묵은쌀로 만든 수입 쌀국수면에 <br>의존한 쌀국수 시장에서 ‘햅쌀 쌀국수면’의<br>깨끗함과 건강함은 오직 포메인에서 만날 수 있습니다.<br><br>1년 365일 햅쌀로 만들어 건강한 쌀국수면과품질개선으로<br> 더 깊어진 명품 육수까지
					<em style="padding-bottom:0;">쌀국수는 포메인입니다.</em>
				<p>
				<p class="txt2">
					동종업계의 타 브랜드가 너 나 할 것 없이 유행을 좇을 때 <br>
					원칙과 정직함이라는 중심을 잃지 않고 도전을 이어나가는 것,<br>
					따라 할 수는 있어도 따라올 수 없는 <br>
					차이를 만드는 힘입니다.
					<em>지금, 여기, 어디에도 없는 포메인이<br>당신의 곁에 있습니다.</em>
				<p>
				<p class="img"><img src="../common/images/content/img_about_1.jpg" alt=""></p>
			</div>
			<div class="about_menu">
				<span>베트남 요리,<br><em>31가지 감동을 담다!</em></span>
				<a href="/mbrand/menu/menu_list.do" class="link_menu">전체메뉴 보기</a>
			</div>
		</div>

		<!-- //content -->
		</div>

	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
</body>
</html>
