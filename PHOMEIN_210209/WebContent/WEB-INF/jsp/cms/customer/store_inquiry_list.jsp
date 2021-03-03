<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>가맹점자의 | 문의 관리 | 포메인 통합관리자</title>
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
				<span>가맹점문의</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">가맹점 문의</h3>

			<form name="searchForm" id="searchForm" action="store_inquiry_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>가맹점 문의 검색 입력 폼</legend>
						<table class="view">
							<caption>가맹점 문의 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">진행상태</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="search_working" value="0" <c:if test="${empty search_working}">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="search_working" value="Y" <c:if test="${search_working == 'Y'}">checked</c:if>><label for="radio0102"><span></span>답변완료</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0103" name="search_working" value="N" <c:if test="${search_working == 'N'}">checked</c:if>><label for="radio0103"><span></span>접수완료</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>
										<input type="text" name="search_name" id="search_name" value="${search_name }" placeholder="이름을 입력하세요" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td>
										<input type="text" name="search_hp" id="search_hp" value="${search_hp }" placeholder="연락처를 ( - ) 없이 입력하세요" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<input type="text" name="search_email" id="search_email" value="${search_email }" placeholder="이메일을 입력하세요" style="width:100%">
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<p class="btn-page-wrap">
						<a href="javascript:;" id="resetBtn" class="btn-01 type-02">초기화</a>
						<a href="javascript:;" id="searchBtn" class="btn-01 type-01">검색</a>
					</p>
				</div>
			</form>

			<div class="default-cell">
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건</div>
				<div class="table-list-data">
					<table class="list">
						<caption>가맹점 문의 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:80px">
							<col style="width:auto">
							<col style="width:120px">
							<col style="width:150px">
							<col style="width:150px">
							<col style="width:150px">
							<col style="width:120px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">이름</th>
								<th scope="col">연락처</th>
								<th scope="col">이메일</th>
								<th scope="col">등록일</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<c:set var="first" value="${paginationInfo.totalRecordCount+1}"/>
								<c:set var="last" value="${(searchVO.pageIndex-1) * searchVO.pageUnit + status.count}"/>
								<td><c:out value="${first - last}" /></td>
								<td class="al-l"><a href="/admin/customer/store_inquiry_view.do?seq=${result.seq }&pageIndex=${paginationInfo.currentPageNo }&search_working=${search_working }&search_name=${search_name }&search_hp=${search_hp }&search_email=${search_email }" class="btn-link">${fnc:xssContents(result.title )}</a></td>
								<td><a href="#">${result.name }</a></td>
								<td><a href="#">${result.hp }</a></td>
								<td><a href="#">${result.email }</a></td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
								<td class="fc01">
									<c:choose>
										<c:when test="${result.answeryn == 'Y'}">
											<span class="fc03">답변완료</span>
										</c:when>
										<c:otherwise>
											<span class="fc01">접수완료</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="7"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
							</c:choose>
							<!-- 
							<tr>
								<td>9</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>8</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>7</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>6</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>5</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>4</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>3</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>2</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="al-l"><a href="#" class="btn-link">가맹점 문의 드립니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td class="fc03">답변완료</td>
							</tr>
							 -->
							
						</tbody>
					</table>
				</div>
				<div class="paging-wrap">
					<div class="paging">
						<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
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
	// 검색
	$("#searchBtn").on("click", function(){
		$("input[name='pageIndex']").val(1);
		$("#searchForm").submit();
	});
	
	// 초기화
	$("#resetBtn").on("click", function(){
		$("input[name='search_cate']").prop("checked", false);
		$("input[name='search_cate']:eq(0)").prop("checked", true);
		$("input[name='search_working']").prop("checked", false);
		$("input[name='search_working']:eq(0)").prop("checked", true);
		$("input[name='search_name']").val("");
		$("input[name='search_hp']").val("");
		$("input[name='search_email']").val("");
		location.replace("./store_inquiry_list.do");
	});
	
});
</script>
</body>
</html>
