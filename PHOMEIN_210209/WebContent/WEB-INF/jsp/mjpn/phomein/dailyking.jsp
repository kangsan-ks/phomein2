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
			<h3>㈱デイリーキング</h3>
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
			<div class="dailyking">
				<div class="tit_area">
					<h4><span class="blind">DAILYKING INC.</span></h4>
				</div>
				<div class="intro">
					<p class="txt1">
						㈱デイリーキングは2006年に設立、韓国内にライスヌードルのフランチャイズブランドである「フォーメイン」を定着させて、ベトナム料理の外食文化を大衆化させた法人企業です。
					</p>
					<p class="txt2">
						「安全な食材の正直な食べ物」という理念の下で、2015年ベトナム現地法人ライスヌードル工場「フォーシーズン(PHO SEASON)」を設立して新米ライスヌードル麺と上級香辛料を使った肉水用ハーブバッグ(Herb Bags)の開発に成功しました。
					</p>
					<p class="txt2">
						これからもフォーメインから始まる変化と挑戦がライスヌードル市場の基準になれるように原則と正直という本質を失わずに、ライスヌードル市場の中心にて変化を善導します。
					</p>
					<div class="con">
						<ul>
							<li>
								<div>
									<strong>味</strong>
									<em>多彩な味</em>
									<!-- <p>気分や好みに合わせて選ぶ楽しみがあります。</p> -->
								</div>
							</li>
							<li>
								<div>
									<strong>樂</strong>
									<em>楽しみ</em>
									<!-- <p>老若男女を問わず、誰でも気軽にお楽しみいただけます。</p> -->
								</div>
							</li>
							<li>
								<div>
									<strong>新</strong>
									<em>新しさ</em>
									<!-- <p>新しさについて常に研究し、果敢に挑戦します。</p> -->
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
