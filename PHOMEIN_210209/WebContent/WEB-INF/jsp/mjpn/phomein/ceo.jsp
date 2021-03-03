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
		<%@ include file="/WEB-INF/jsp/mjpn/include/jpnlnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="phomein">
 			<div class="ceo_title">
				<h4>CEO</h4>
				<!-- <p class="desc">고객의 만족을 위해 <br>최선을 다해 노력하겠습니다.</p> -->
			</div>
			<div class="ceo_intro">
				<p class="txt01">
					こんにちは。<br>
						株式会社デイリーキングの代表、キム・デイルです。<br>
						フォーメインをアクセスして頂き、有難うございます。<br>
					</p>
				<p class="txt02">
					<span>15年目の本日、<br> 今も私たちだけの原則は失いません。</span>
				</p>
				<p class="txt03">
					<span>
						2006年亭子本店を開店後、「安全な食材の正直な食べ物」という原則で、これまでその約束を実践してきました。2015年ベトナム現地法人ライスヌードル製造工場の<フォーシーズン(PHO SEASON>の設立と、2016年危害商品遮断システムを導入している総合食品企業の<現代グリーンフード>との業務協約で絶えずに引き続いています。<br><br>

						また、「私たちだけの原則」の結実で、2019年よりフォーメインの全店でのみ新米ライスヌードルが味わえようになりました。古米で作った輸入ライスヌードル麺に依存したライスヌードル市場で、新米だけでライスヌードル一丁を作ること、料理過程が厳しくなっただけもっと濃くなった真心と本気を込めています。<br><br>

						ライスヌードル特有の麺の匂いがなくこぎれいに、フォーメインだけの低温熟成技術でしこしこするフォーメイン新米ライスヌードル麺を味わってみてください。<br><br>

						長年の時間、最高という名声の前でも謙遜さを失わずに、毎日新鮮な材料と元気な食卓を約束します。有難うございます。
					</span>
				</p>
				<p class="txt04">㈱デイリーキング代表、キム・デイル(署名)</p>
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
