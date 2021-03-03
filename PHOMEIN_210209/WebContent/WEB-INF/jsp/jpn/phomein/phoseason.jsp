<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="phomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">フォーシーズン(PHO SEASON)</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type2">PHO SEASON</h3>
				</div>

				<div class="phoseason-box">
					<div class="top-visual-con">
						<div class="phoseason-visual">
							<div><img src="../images/content/phoseason_img_01.jpg" alt=""/></div>
							<div><img src="../images/content/phoseason_img_02.jpg" alt=""/></div>
							<div><img src="../images/content/phoseason_img_03.jpg" alt=""/></div>
						</div>
						<p class="tit load-fadein">フォーシーズン(PHO SEASON)は、</p>
						<p class="txt load-fadein">2015年フォーメインで設立したベトナム現地ライスヌードル製造工場で、<br>
							ベトナムのMekong delta地域で収獲される清くて透明な新米で作ったライスヌードル麺と、<br>
							9種の上級天然香辛料を使った肉水用ハーブバッグ(Herb-Bags)を生産しています。</p>
						<p class="txt load-fadein">海外ライスヌードル麺の工産品に依存してきた国内ライスヌードル市場で、<br>
							ライスヌードルブランドが自体の技術開発でライスヌードル麺を生産したことはフォーメインが唯一です。<br>フォーシーズンの設立によるフォーメインの差別化は、国内だけではなく世界ライスヌードル市場の新しい基準になります。</p>
					</div>

					<div class="inner02">
						<div class="bottom-visual-con">
							<p class="tit load-fadein">米一粒からライスヌードル一丁まで</p>
							<p class="txt load-fadein">ポメインでは古米と澱粉または小麦粉を混合して作った既存のライスヌードル麺とは全く違った<br>
								フォーメイン新米ライスヌードル麺の透明な色回りと炊き上げたままの新米ご飯の香が感じられます。<br>また、深くて濃い天然香辛料の香と味は、食材料が重要になった現代社会に強力な競争力になります。
							</p>

							<div class="phoseason-list">
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_01.png" alt="icon"/></p>
									<p class="tit2">1年4季節、新米</p>
									<p class="txt2">ライスヌードル乾麺の生産に相応しい気候と環境であるベトナム、特に3模作が可能なMekong delta地域より1年始終新鮮な米が供給されます。フォーメインライスヌードル麺は、古米ではない新米のみを使ってライスヌードル乾麺を作ります。</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_02.png" alt="icon"/></p>
									<p class="tit2">とても清い、精製水</p>
									<p class="txt2">フォーメインライスヌードル麺の製造過程で新米ほど重要な水もフォーシーズンの精製技術を通じ残留医薬品と環境ホルモンなど70種余りに汚染物質を除去したきれいな水(精製水)を使います。</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_03.png" alt="icon"/></p>
									<p class="tit2">独自技術、機械乾燥</p>
									<p class="txt2">老後化された他のライスヌードル工場とは違い、フォーメインが独自で開発した機械乾燥技術で衛生的な乾燥が行われます。この過程で白く透明な色回りは生かしながらも新米ご飯の香りをそっくり盛り出します。</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_04.png" alt="icon"/></p>
									<p class="tit2">麺の完成、低温熟成</p>
									<p class="txt2">不要な化学添加物を使わないために低温で熟成過程を通します。適当な粘りと柔らかさ、麺の弾力性を2倍も引き上げてくれるフォーメインの技術が集約されています。</p>
								</div>
								<div>
									<p class="img"><img src="../images/content/ico_phoseason_05.png" alt="icon"/></p>
									<p class="tit2">名品肉水、ハーブバッグ</p>
									<p class="txt2">9種の上級天然香辛料を使った肉水用ハーブバッグ(Herb-Bags)は、持続的な品質改善の再整備を実施します。フォーメイン最上の肉水味と質を維持する秘訣です。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<!-- 20190429 추가 s -->
<script>
	$('.phoseason-visual').slick({
		dots: true,
		prevArrow: false,
		nextArrow: false,
		autoplay:true,
		autoplaySpeed:3000,
		fade: true
	});

	$('.phoseason-list').slick({
		centerMode: true,
		infinite: true,
		centerPadding: '0px',
		slidesToShow: 3,
		variableWidth: false,
		customPaging: function(slider, i) {
			var tit = $(slider.$slides[i]).find('.img').html();
			return '<div class="pager-tit" class=' + i + '>'+ tit + '</div>';
		},
		dots: true
	});
</script>
<!-- //20190429 추가 e -->
</body>
</html>
