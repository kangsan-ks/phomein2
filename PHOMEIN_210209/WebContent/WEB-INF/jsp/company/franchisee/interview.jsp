<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/company/include/companyheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_03_04.jpg');"></div>
			<h2 class="h2-type">우수매장 인터뷰</h2>
<!-- 			<span class="txt">11년의 노하우, 포메인과 함께라면 행복한 미래를 꿈꾸셔도 좋습니다.<br>밝은 미래, 행복한 포메人</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">

			<div class="interview-con">
				<div class="con-title">
					<!-- 20190225 수정 -->
					<h3 class="h3-type">PHOMEIN BEST STORE</h3>
					<p class="txt load-fadein active">가장 가까운 곳에서 점주님들의 이야기를 듣고 신뢰로 함께 성장합니다.</p>
					<!-- //20190225 수정 -->
				</div>

				<div class="page-box">
					<!-- 20190225 수정 -->
					<p class="txt01">우수 매장 인증제도</p>
					<p class="txt02">포메인의 ‘안전한 식재료·정직한 먹거리’ 원칙 실현 기여도 외<br>연간 기준별 고득점을 획득한 매장을 대상으로 선정</p>
					<!-- //20190225 수정 -->
				</div>

				<c:choose>
				<c:when test="${not empty resultList }" >
				<!-- interview-list -->
				<div class="interview-list">
					<div class="inner">
						<!-- img-board-list -->
						<div class="img-board-list type02">
							<ul>
								<c:forEach items="${resultList }" var="result" varStatus="status" >
								<li>
									<p class="img"><img src="${result.pc_thimg }" alt="${result.pc_alt }" width="340px" height="380px" /></p>
									<a href="javascript:;" class="interview_con">
										<span class="detail-tit">${result.store }</span>
										<span class="detail-name">${result.title }</span>
										<span class="detail-txt">${result.pc_contents }</span>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
						<!-- //img-board-list -->
					</div>
				</div>
				<!-- //interview-list -->
				</c:when>
				<c:otherwise></c:otherwise>
				</c:choose>

			</div>

		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/company/include/companyfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
