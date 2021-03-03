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
			<h3>About phomein</h3>
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
 			<div class="about_title">
				<h4>The Best Rice <br>Noodle Restaurant<br><em>Phomein</em></h4>
				<p class="desc">The World’s Best Korean<br>Vietnamese Restaurant Phomein</p>
			</div>
			<div class="about_intro">
				<p class="txt1">
					Starting at Jeongja Restaurant in 2006,<br>
					Phomein has had many <br>
					experiences, big and small. 
					<strong><span>With stronger<br>competitiveness in 2021,</span><em>Phomein has accomplished<br> great growth. </em></strong>
				</p>
				<p class="txt2">	
					All menus of Phomein use <br>“freshly harvested rice noodles” self-made at the
					rice noodle<br>  manufacturing factory “PHO SEASON’ in Vietnam.<br>In a rice noodle market relying on imported<br>  rice noodles made of old rice, you can meet the<br> clean and healthy “Fresh Rice Noodles” only at Phomein.<br><br>
					Wholesome rice noodles made from freshly<br> harvested rice 365 days a year to
					luxurious meat<br> broth further deepened with quality improvement<br>
					<em style="padding-top:0;">Phomein is it for rice noodles.</em><br><br>
					Other brands in the foodservice industry are busy <br>chasing trends without exception.
					On the basis of principles<br> and honesty, Phomein has taken challenges and strengthened<br> its competitiveness.
					Thanks to these efforts, Phomein possesses <br>unrivalled competitiveness as of now.


	

					<em>Now and here, the one and only Phomein is with you.</em>
				<p>
				<p class="img"><img src="../common/images/content/img_about_1.jpg" alt=""></p>
			</div>
			<div class="about_menu">
				<span>31 kinds of<br>Vietnamese dishes<br><em>give you impression.</em></span>
				<a href="/meng/menu/menu_list.do" class="link_menu">ALL MENU VIEW</a>
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
