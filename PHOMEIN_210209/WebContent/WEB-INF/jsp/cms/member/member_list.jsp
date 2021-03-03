<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>온라인 회원 목록 | 회원 관리 | 포메인 통합 관리</title>
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
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">온라인 회원</h3>

			<div class="table-list-data">
				<fieldset>
					<legend>온라인 회원 검색 입력 폼</legend>
					<table class="view">
						<caption>온라인 회원 검색 기본정보 입력 폼 테이블</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">아이디+이름</th>
								<td>
									<input type="text" name="" id="" placeholder="아이디 또는 이름을 입력하세요" style="width:100%">
								</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="text" name="" id="" placeholder="이메일을 입력하세요" style="width:100%">
								</td>
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td>
									<input type="text" name="" id="" placeholder="연락처을 ( - ) 없이 입력하세요" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-02">초기화</a>
					<a href="#" class="btn-01 type-01">검색</a>
				</p>
			</div>

			<div class="default-cell">
				<div class="table-sort">전체 : <span>20</span>건
					<p class="sort-right">
						<a href="#" class="btn-02 type-01">엑셀 다운로드</a>
					</p>
				</div>
				<div class="table-list-data">
					<table class="list">
						<caption>온라인 회원 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:100px">
							<col style="width:auto">
							<col style="width:200px">
							<col style="width:200px">
							<col style="width:200px">
							<col style="width:180px">
							<col style="width:120px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">연락처</th>
								<th scope="col">이메일</th>
								<th scope="col">등록일</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>10</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>9</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>8</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>7</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>6</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>5</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="#">아이디</a></td>
								<td><a href="#">홍길동</a></td>
								<td>01012345678</td>
								<td>ghdrlfehd@naver.com</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="6"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
						</tbody>
					</table>
				</div>
				<div class="paging-wrap">
					<div class="paging">
						<a href=""><img src="/asset/images/util/paging_first.png" alt="첫번째 목록으로 이동"></a>
						<a href=""><img src="/asset/images/util/paging_prev.png" alt="이전 목록으로 이동"></a>
						<p>
							<a href="">1</a>
							<a href="" class="on">2</a>
							<a href="">3</a>
							<a href="">4</a>
							<a href="">5</a>
							<a href="">6</a>
							<a href="">7</a>
							<a href="">8</a>
							<a href="">9</a>
							<a href="">10</a>
						</p>
						<a href=""><img src="/asset/images/util/paging_next.png" alt="다음 목록으로 이동"></a>
						<a href=""><img src="/asset/images/util/paging_last.png" alt="마지막 목록으로 이동"></a>
					</div>
				</div>
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
