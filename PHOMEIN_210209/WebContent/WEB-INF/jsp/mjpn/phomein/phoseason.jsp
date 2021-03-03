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
			<h3>フォーシーズン</h3>
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
		<div id="content" class="rnd">
 			<div class="phoseason">
				<div class="tit_area">
					<h4>フォーシーズン </h4>
				</div>
				<div class="intro">
					<strong>フォーシーズン </strong>
					<p>
						2015年フォーメインで設立したベトナム現地ライスヌードル製造工場で、 ベトナムのMekong delta地域で収獲される清くて透明な新米で作ったライスヌードル麺と、 9種の上級天然香辛料を使った肉水用ハーブバッグ(Herb-Bags)を生産しています。
					</p>
					<p>
						海外ライスヌードル麺の工産品に依存してきた国内ライスヌードル市場で、ライスヌードルブランドが自体の技術開発でライスヌードル麺を生産したことはフォーメインが唯一です。フォーシーズンの設立によるフォーメインの差別化は、国内だけではなく世界ライスヌードル市場の新しい基準になります。
					</p>
				</div>
				<div class="cont">
					<strong>米一粒からライスヌードル一丁まで</strong>
					<p>
						ポメインでは古米と澱粉または小麦粉を混合して作った既存のライスヌードル麺とは全く違ったフォーメイン新米ライスヌードル麺の透明な色回りと炊き上げたままの新米ご飯の香が感じられます。また、深くて濃い天然香辛料の香と味は、食材料が重要になった現代社会に強力な競争力になります。
					</p>
					<ul>
						<li>
							<div>
								<strong>1年4季節、新米</strong>
								<p>
									ライスヌードル乾麺の生産に相応しい気候と環境であるベトナム、特に3模作が可能なMekong delta地域より1年始終新鮮な米が供給されます。フォーメインライスヌードル麺は、古米ではない新米のみを使ってライスヌードル乾麺を作ります。
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>とても清い、精製水</strong>
								<p>
									フォーメインライスヌードル麺の製造過程で新米ほど重要な水もフォーシーズンの精製技術を通じ残留医薬品と環境ホルモンなど70種余りに汚染物質を除去したきれいな水(精製水)を使います。
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>独自技術、機械乾燥</strong>
								<p>
									老後化された他のライスヌードル工場とは違い、フォーメインが独自で開発した機械乾燥技術で衛生的な乾燥が行われます。この過程で白く透明な色回りは生かしながらも新米ご飯の香りをそっくり盛り出します。
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>麺の完成、低温熟成</strong>
								<p>
									不要な化学添加物を使わないために低温で熟成過程を通します。適当な粘りと柔らかさ、麺の弾力性を2倍も引き上げてくれるフォーメインの技術が集約されています。
								</p>
							</div>
						</li>
						<li>
							<div>
								<strong>名品肉水、ハーブバッグ</strong>
								<p>
									9種の上級天然香辛料を使った肉水用ハーブバッグ(Herb-Bags)は、持続的な品質改善の再整備を実施します。フォーメイン最上の肉水味と質を維持する秘訣です。
								</p>
							</div>
						</li>
					</ul>
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
