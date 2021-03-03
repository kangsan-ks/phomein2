<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>온라인 회원 상세 | 회원 관리 | 포메인 통합 관리</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
</head>
<body>

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<header id="dHead">
		<!-- header-wrap -->
		<%@ include file="/WEB-INF/jsp/include/header.jspf"%>
		<!-- //header-wrap -->
	</header>
	<!--// dHead -->


	<!-- dBody -->
	<section id="dBody">
		<!-- lnb -->
		<jsp:include page="/admin/include/lnb.do" />
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">
			<!-- location -->
			<p class="location">
				<span>회원 관리</span>
				<span>온라인 회원</span>
				<span>상세</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">온라인 회원</h3>

			<div class="default-cell">
				<h4 class="sub-title">온라인 회원 상세</h4>
				<div class="table-list-data">
					<fieldset>
						<legend>온라인 회원 상세 기본정보 테이블</legend>
						<table class="view">
							<caption>온라인 회원상세 기본정보 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">IDX</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">아이디</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">생일</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">양/음</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">시도</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">구군</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">매장 IDX</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">아이핀</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">등록일</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">마지막 로그인</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">상태</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">이메일 수신</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">SMS 수신</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">마일리지 카드</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-02">목록</a>
				</p>
			</div>
		</section>
		<!-- //contents -->


		<!-- dFoot -->
		<footer id="dFoot"><div class="copy">Copyright ⓒ 2018 DAILYKING INC. All rights reserved.</div></footer>
		<!-- //dFoot -->
	</section>
	<!--// dBody -->
</div>
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){

});
</script>
</body>
</html>
