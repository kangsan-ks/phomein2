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
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">고객의 소리</h3>

			<form name="searchForm" id="searchForm" action="customer_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>고객의 소리 검색 입력 폼</legend>
						<table class="view">
							<caption>고객의 소리 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="search_cate" value="" <c:if test="${empty search_cate || search_cate == ''}">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('110') }" varStatus="status">
				                        		<div>
				                        			<p class="radio-type01">
				                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="search_cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${search_cate == codeResult.code}">checked</c:if> />
				                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
				                        			</p>
				                        		</div>
				                        	</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">진행상태</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="search_working" value="0" <c:if test="${empty search_working || search_working == 0}">checked</c:if>><label for="radio0201"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="search_working" value="2" <c:if test="${search_working == 2}">checked</c:if>><label for="radio0202"><span></span>답변완료</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0203" name="search_working" value="1" <c:if test="${search_working == 1}">checked</c:if>><label for="radio0203"><span></span>접수완료</label></p></div>
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
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건
					<p class="sort-right">
						<a href="javascript:;" class="btn-02 type-01">기존 게시글 확인</a>
					</p>
				</div>
				<div class="table-list-data">
					<table class="list">
						<caption>제품 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:50px">
							<col style="width:100px">
							<col style="width:auto">
							<col style="width:60px">
							<col style="width:100px">
							<col style="width:140px">
							<col style="width:60px">
							<col style="width:90px">
							<col style="width:90px">
							<col style="width:60px">
							<col style="width:100px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">문의구분</th>
								<th scope="col">제목</th>
								<th scope="col">이름</th>
								<th scope="col">연락처</th>
								<th scope="col">이메일</th>
								<th scope="col">회신요청</th>
								<th scope="col">등록일</th>
								<th scope="col">변경일</th>
								<th scope="col">진행상태</th>
								<th scope="col">회신하기</th>
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
								<td>
									<c:if test="${result.cate == null }">다국어</c:if>
									<c:forEach var="codeResult" items="${ fnc:codeListSub('110') }" varStatus="status">
										<c:if test="${result.cate == codeResult.code}"><c:out value="${codeResult.name}"/></c:if>
									</c:forEach>
								</td>
								<td class="al-l"><a href="/admin/customer/customer_view.do?seq=${result.seq }&pageIndex=${paginationInfo.currentPageNo }&type=reg&search_cate=${search_cate }&search_working=${search_working }&search_name=${search_name }&search_hp=${search_hp }&search_email=${search_email }" class="btn-link">${fnc:xssContents(result.title)}</a></td>
								<td><a href="#">${result.name }</a></td>
								<td><a href="#">${result.hp }</a></td>
								<td><a href="#">${result.email }</a></td>
								<td>
									<c:choose>
										<c:when test="${result.feedkind == 'mobile'}">유선</c:when>									
										<c:when test="${result.feedkind == 'email'}">이메일</c:when>																
									</c:choose>
									</td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
								<td>
									<p class="table-date"><fmt:parseDate value="${result.moddt}" var="modDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${modDt}" pattern='yyyy.MM.dd' var="modDttmp"/>
									<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="modTime"/>
									<c:out value="${modDttmp }" />
									<br><span>(<c:out value="${modTime }"/>)</span></p>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.answeryn == 'Y'}">
											<span class="fc03">답변완료</span>
										</c:when>
										<c:otherwise>
											<span class="fc01">접수완료</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.answeryn == 'Y'}">
										</c:when>
										<c:otherwise>
											<div class="table-btns row">
												<p><a href="javascript:;" id="answerBtn_${result.seq }" data-seq="${result.seq }" data-page="${pageIndex }" data-type="udt" data-search_cate="${search_cate }" data-search_working="${search_working }" data-search_name="${search_name }" data-search_hp="${search_hp }" data-search_email="${search_email }" class="btn-01 type-03 round">답변하기</a></p>
											</div>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="11"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
							</c:choose>
							<!-- 
							<tr>
								<td>9</td>
								<td>홈페이지</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>유선</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">접수완료</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">답변하기</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>8</td>
								<td>이벤트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>이메일</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">접수완료</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">답변하기</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>7</td>
								<td>마일리지/포인트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>유선</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">답변완료</span></td>
								<td></td>
							</tr>
							<tr>
								<td>6</td>
								<td>매장서비스</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>이메일</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">답변완료</span></td>
								<td></td>
							</tr>
							<tr>
								<td>5</td>
								<td>홈페이지</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>유선</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">접수완료</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">답변하기</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>4</td>
								<td>이벤트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>이메일</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">접수완료</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">답변하기</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>3</td>
								<td>마일리지/포인트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>유선</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">답변완료</span></td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td>이벤트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>이메일</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">접수완료</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">답변하기</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td>마일리지/포인트</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><a href="#">홍길동</a></td>
								<td><a href="#">01012345678</a></td>
								<td><a href="#">ghdrlfehd@naver.com</a></td>
								<td>유선</td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">답변완료</span></td>
								<td></td>
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
	// 답변하기
	$("a[id^='answerBtn_']").on("click", function(){
        var form = document.createElement("form");
        form.setAttribute("action", "/admin/customer/customer_view.do");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "seq");
        hiddenField.setAttribute("value", $(this).data("seq"));
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "pageIndex");
        hiddenField.setAttribute("value", $(this).data("page"));
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "type");
        hiddenField.setAttribute("value", $(this).data("type"));
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_cate");
        hiddenField.setAttribute("value", !!$(this).data("search_cate") ? $(this).data("search_cate") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_working");
        hiddenField.setAttribute("value", !!$(this).data("search_working") ? $(this).data("search_working") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_name");
        hiddenField.setAttribute("value", !!$(this).data("search_name") ? $(this).data("search_name") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_hp");
        hiddenField.setAttribute("value", !!$(this).data("search_hp") ? $(this).data("search_hp") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_email");
        hiddenField.setAttribute("value", !!$(this).data("search_email") ? $(this).data("search_email") : '');
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	});
	
	// 검색
	$("#searchBtn").on("click", function(){
		$("input[name='pageIndex']").val(1);
		$("#searchForm").submit();
	});
	
	// 초기화
	$("#resetBtn").on("click", function(){
		$("input[name='search_cate]").prop("checked", false);
		$("input[name='search_cate']:eq(0)").prop("checked", true);
		$("input[name='search_working']").prop("checked", false);
		$("input[name='search_working']:eq(0)").prop("checked", true);
		$("input[name='search_name']").val("");
		$("input[name='search_hp']").val("");
		$("input[name='search_email']").val("");
		location.replace("./customer_list.do");
	});
	
});
</script>
</body>
</html>
