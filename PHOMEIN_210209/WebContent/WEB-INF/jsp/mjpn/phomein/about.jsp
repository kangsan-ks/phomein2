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
<%@ include file="/WEB-INF/jsp/mjpn/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpngnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv1">
			<h3>ブランドご紹介</h3>
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
		<%@ include file="/WEB-INF/jsp/mjpn/include/jpnlnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="phomein">
 			<div class="about_title">
				<h4>ライスヌードルはフ<br>ォーメイン</h4>
				<p class="desc">The World’s Best Korean<br>Vietnamese Restaurant Phomein</p>
			</div>
			<div class="about_intro">
				<p class="txt1">
					2006年、亭子本店からスタートしたフォー<br>
					メインの大小様々な瞬間が積もり積もって 
					<strong><span>2021年、<br>より強くなった競争力で<br>今ここに立っています。</span></strong>
				</p>
				<p class="txt2">	
					同種業界の他ブランドが誰彼無しに流行を追う時原則<br>
					と正直さという中心を失わず挑戦し続けること、<br>
					真似は出来ても追いつかれない差を付ける力です。
					<em>今、ここ、どこにもないフォーメイン<br>があなたのそばにいます。</em>
				<p>
				<p class="img"><img src="../common/images/content/img_about_1.jpg" alt=""></p>
			</div>
			<div class="about_menu">
				<span>ベトナム料理、<br><em>31種の感動を盛り込む</em></span>
				<a href="/mjpn/menu/menu_list.do" class="link_menu">メニュー表示</a>
			</div>
		</div>
		<!-- //content -->
	</div> 
	<!-- //container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnfooter.jsp"%>
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
