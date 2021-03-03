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
			<h2 class="h2-type">ブランドご紹介</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- brand-info -->
			<div class="brand-info">
				<div class="page-logo">
					<p class="tit">ライスヌードルはフ<br>ォーメイン</p>
					<p class="txt">The World’s Best Korean Vietnamese Restaurant Phomein</p>
					<p class="img"><img src="../images/common/brand_info_logo.png" alt="logo"/></p>
				</div>
				<!-- 20190225 수정 -->
				<div class="inner02">
					<div class="page-box">
						<p class="txt01 load-fadein">2006年、亭子本店からスタートしたフォーメインの<br>
大小様々な瞬間が積もり積もって</p>
						<p class="txt02 load-fadein">2021年、より強くなった競争力で<br>
今ここに立っています。</p>
						<p class="txt03 load-fadein">同種業界の他ブランドが誰彼無しに流行を追う時<br>
原則と正直さという中心を失わず挑戦し続けること、<br>
真似は出来ても追いつかれない差を付ける力です。</p>
						<p class="txt04 load-fadein">今、ここ、どこにもないフォーメインがあなたのそばにいます。</p>
						<p class="img"><img src="../images/content/brand_menu_img.jpg" alt="쌀국수 이미지" class="load-fadein"/></p>
					</div>
				</div>
				<!-- //20190225 수정 -->
				<div class="all-menu">
					<p class="txt">ベトナム料理、<span><em>31</em>種の感動を盛り込む</span></p>
					<a href="/jpn/menu/menu_list.do" class="btn-all-menu">メニュー表示</a>
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