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

	<section id="dBody" class="company">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01_3.jpg');"></div>
			<h2 class="h2-type">오시는 길</h2>
			<!-- <span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">

			<div class="con-title">
				<h3 class="h3-type">오시는 길</h3>
			</div>

			<div class="location-box">
				<div class="map">
					<!-- 구글 지도 영역 -->
					<img src="../images/tmp/@map_img.jpg" alt="지도"/>
					<!-- //구글 지도 영역 -->
				</div>

				<div class="location-info">
					<table>
						<caption></caption>
						<colgroup>
						<col style="width:190px">
						<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"> 대표번호</th>
								<td>1899-2422</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td>경기도 성남시 분당구 황새울로 216 휴맥스빌리지 4층 ㈜데일리킹</td>
							</tr>
							<tr>
								<th scope="row">교통편</th>
								<td>
									<p><span>지하철 : </span>수내역 3번 출구 도보 약 2분</p>
									<p><span>버스 : </span>수내역.롯데백화점 하차<br>
										일반 17, 33, 52, 55-1, 250, 300, 380, 390, 520<br>
										직행 102, 1241, 5500-1, 7007-1, 9414, G8110, 8106, 8109</p>
									<p><span>자동차 : </span>네비게이션 이용 시 ‘데일리킹’ 또는 ‘휴맥스빌리지’ 검색  (휴맥스빌리지 건물 주차 가능)</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
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
$(function(){
});
</script>
</body>
</html>
