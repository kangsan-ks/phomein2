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
			<h2 class="h2-type">DAILYKING</h2>
<!-- 			<span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- brand-info -->
			<div class="dailyking-info">
				<div class="page-logo">
					<p class="img"><img src="../images/common/dailyking_logo.png" alt="dailyking logo" class="load-fadein"/></p>
				</div>

				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">
							㈱デイリーキングは2006年に設立、韓国内にライスヌードルのフランチャイズブランドで<br>ある「フォーメイン」を定着させて、ベトナム料理の外食文化を大衆化させた法人企業です。
						</p>
						<p class="txt02 load-fadein">
							「安全な食材の正直な食べ物」という理念の下で、2015年ベトナム現地法人ライスヌードル工場「フォーシーズン(PHO SEASON)」<br>を設立して新米ライスヌードル麺と上級香辛料を使った肉水用ハーブバッグ(Herb Bags)の開発に成功しました。
						</p>
						<p class="txt02 load-fadein">
							これからもフォーメインから始まる変化と挑戦がライスヌードル市場の基準になれるように<br>原則と正直という本質を失わずに、ライスヌードル市場の中心にて変化を善導します。
						</p>
						<div class="keyword">
							<ul>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_01.jpg" alt=""/></p>
									<p class="txt">
										<span>多彩な味</span>
										<!-- <strong>気分や好みに合わせて選ぶ楽しみがあります。</strong> -->
									</p>
								</li>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_02.jpg" alt=""/></p>
									<p class="txt">
										<span>楽しみ</span>
										<!-- <strong>老若男女を問わず、誰でも気軽にお楽しみいただけます。</strong> -->
									</p>
								</li>
								<li class="load-fadein">
									<p class="img"><img src="../images/content/img_keyword_03.jpg" alt=""/></p>
									<p class="txt">
										<span>新しさ</span>
										<!-- <strong>新しさについて常に研究し、果敢に挑戦します。</strong> -->
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- //brand-info -->
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
