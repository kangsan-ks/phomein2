<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>고객의소리 | 문의 관리 | 포메인 통합관리자</title>
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
				<span>문의관리</span>
				<span>고객의소리</span>
				<span>상세/답변</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">고객의 소리</h3>

			<div class="default-cell">
				<h4 class="sub-title">고객의 소리 상세/답변</h4>
				<div class="table-list-data">
					<fieldset>
						<legend>고객의 소리 상세/답변 기본정보 테이블</legend>
						<table class="view">
							<caption>고객의 소리 상세/답변 기본정보 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">문의구분</th>
									<td>매장서비스</td>
								</tr>
								<tr>
									<th scope="row">방문매장 / 방문일</th>
									<td>매장명 / 2018-12-05</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>010-1234-5678</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>test1234@nate.com</td>
								</tr>
								<tr>
									<th scope="row">회신요청</th>
									<td>이메일</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td>지점 관리에 더 신경 쓰셔야 할거 같습니다.</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>내용내용<br>내용내용</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<ul class="file-list">
											<li><a href="">파일명1.확장자명</a></li>
											<li><a href="">파일명1.확장자명</a></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<h4 class="sub-title mt40">진행상태</h4>
				<div class="table-list-data">
					<fieldset>
						<legend>고객의 소리 답변 진행상태 테이블</legend>
						<table class="view">
							<caption>고객의 소리 답변 진행상태 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">진행상태</th>
									<td>답변완료</td>
								</tr>
								<!-- 이메일 회신 요청 일 경우 -->
								<tr>
									<th scope="row">회신방법</th>
									<td>이메일</td>
								</tr>
								<!-- //이메일 회신 요청 일 경우 -->
								<!-- 유선 회신 요청 일 경우 -->
								<tr>
									<th scope="row">회신방법</th>
									<td>유선</td>
								</tr>
								<!-- //유선 회신 요청 일 경우 -->
								<tr>
									<th scope="row">답변내용</th>
									<td>내용내용</td>
								</tr>
								<tr>
									<th scope="row">답변일</th>
									<td><p class="table-date">2018.12.10 <span>(23:00:00)</span></p></td>
								</tr>
								<tr>
									<th scope="row">답변작성</th>
									<td>Admin1234</td>
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
