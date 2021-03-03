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
			<h2 class="h2-type">現代グリーンフード</h2>
<!-- 			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">

			<div class="rnd-con">
				<div class="con-title">
					<h3 class="h3-type">現代グリーンフード<br>「安全な食材供給MOU」</h3>
				</div>

				<div class="greenfood-box">
					<div class="greenfood-con">
						<p class="txt load-fadein">フォーメインは食薬処の「危害商品遮断システム」を取り揃えた総合食品企業の「現代グリーンフード」と共に元気なテーブルを作って行きます。</p>
						<p class="tit load-fadein">Relief <span>Phomein</span></p>
						<p class="txt2 load-fadein">フォーメインと現代グリーンフードは去る2016年8月「安全な食材供給」に関する業務協約を締結しました。フォーメインは全店食材流通経路の一元化を推進中で、現代グリーンフードを通じ食材が流通される加盟店では、「Relief Phomein」認証マークを確認することができます。</p>
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
</body>
</html>
