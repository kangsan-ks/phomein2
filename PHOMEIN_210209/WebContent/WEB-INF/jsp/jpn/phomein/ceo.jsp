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
			<h2 class="h2-type">CEO</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- ceo-info -->
			<div class="ceo-info">
				<div class="page-logo">
					<p class="tit">CEO</p>
					<!-- <p class="txt">We will do our best to satisfy our customers.</p> -->
				</div>

				<div class="inner02">
					<div class="page-box">
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
			</div>
			<!-- //ceo-info -->
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
</body>
</html>
