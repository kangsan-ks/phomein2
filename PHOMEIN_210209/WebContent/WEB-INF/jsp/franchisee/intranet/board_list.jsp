<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>매장 공지 목록 | 인트라넷 | 포메인 가맹점 관리</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
	<script type="text/javascript">
	// <![CDATA[  
	            
        function fnDetailView(_url, _seq) {
       	    var frm = document.searchForm;
			$("input[name='seq']").val( _seq );
			frm.action = _url;
			frm.method = "get";
			frm.submit();
		}
	    
	    $(document).ready(function(){

	    });
	    
		function fnSearchForm() {

			$('#searchCondition').val($('#searchConditionTemp').val());
			$('#searchKeyword').val($('#searchKeywordTemp').val());

			var searchKeyword = $('input[name=searchKeyword]').val();
			fnPaging(1);
		}
		
		function fnReset(){
			$('#searchKeyword').val('');
			fnPaging(1);
		}

     // ]]>
     </script>
</head>
<body>

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<header id="dHead">
		<!-- header-wrap -->
		<%@ include file="/WEB-INF/jsp/include/storeheader.jspf"%>
		<!-- //header-wrap -->
	</header>
	<!--// dHead -->


	<!-- dBody -->
	<section id="dBody">
		<!-- lnb -->
		<jsp:include page="/store/include/storelnb.do" />
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">
			<!-- location -->
			<p class="location">
				<span>인트라넷</span>
				<span>매장 공지</span>
				<span>목록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title">매장 공지</h3>
			<form name="searchForm" id="searchForm" method="get" action="./board_list.do">
				<input type="hidden" name="seq" value=""/>
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value=""/>
				<input type="hidden" name="searchKeyword" id="searchKeyword" value=""/>
				<input type="hidden" name="searchConditionTemp" id="searchConditionTemp" value="0"/>
				<input type="hidden" name="checkedSeqArr" id="checkedSeqArr" value=""/>
			<div class="table-list-data">
				<fieldset>
					<legend>매장 공지 검색 입력 폼</legend>
					<table class="view">
						<caption>매장 공지 검색 기본정보 입력 폼 테이블</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">제목+내용</th>
								<td>
									<input type="text" name="searchKeywordTemp" id="searchKeywordTemp" value="${searchVO.searchKeyword }" placeholder="제목 또는 내용을 입력하세요" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
				<p class="btn-page-wrap">
					<a href="#" onclick="fnReset();" class="btn-01 type-02">초기화</a>
					<a href="#" onclick="fnSearchForm();" class="btn-01 type-01">검색</a>
				</p>
			</div>
			</form>
			
			<div class="default-cell">
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건</div>
				<div class="table-list-data">
					<table class="list">
						<caption>매장 공지 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:100px">
							<col style="width:auto">
							<col style="width:140px">
							<col style="width:140px">
							<col style="width:100px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col">수정일</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty topList }" >
							<c:forEach items="${topList }" var="result" varStatus="status" >
							<tr>
								<td class="fc01">[알림]</td>
								<td class="al-l">
									<a href="#" onclick="javascript:fnDetailView('board_view.do', <c:out value="${result.seq }" />); return false;" class="btn-link">${fnc:xssContents(result.title )}</a>
									<!-- <span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span> -->
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
									<p class="table-date">
									<fmt:parseDate value="${result.moddt}" var="modDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${modDt}" pattern='yyyy.MM.dd' var="modDttmp"/>
									<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="modTime"/>
									<c:out value="${modDttmp }" />
									<br><span>(<c:out value="${modTime }"/>)</span></p>
								</td>
								<td>${result.hitcnt }</td>
							</tr>
							</c:forEach>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td><c:out	value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}" /></td>
								<td class="al-l"><a href="#" onclick="javascript:fnDetailView('./board_view.do', <c:out value="${result.seq }" />); return false;" class="btn-link">${fnc:xssContents(result.title )}</a></td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.moddt}" var="modDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${modDt}" pattern='yyyy.MM.dd' var="modDttmp"/>
									<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="modTime"/>
									<c:out value="${modDttmp }" />
									<br><span>(<c:out value="${modTime }"/>)</span></p>
								</td>
								<td>${result.hitcnt }</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="5"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
							</c:choose>
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

});
</script>
</body>
</html>
