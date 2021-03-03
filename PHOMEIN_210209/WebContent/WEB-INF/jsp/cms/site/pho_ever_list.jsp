<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<title>사회공헌 관리 목록 | 사이트 관리 | 포메인 통합 관리</title>
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
				<span>사이트 관리</span>
				<span>사회공헌 관리</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">사회공헌 관리</h3>

			<form name="searchForm" id="searchForm" action="pho_ever_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>사회공헌 검색 입력 폼</legend>
						<table class="view">
							<caption>사회공헌 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="search_useyn" value="0" <c:if test="${empty search_useyn || search_useyn == 0}">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="search_useyn" value="1" <c:if test="${search_useyn == 1}">checked</c:if>><label for="radio0102"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0103" name="search_useyn" value="2" <c:if test="${search_useyn == 2}">checked</c:if>><label for="radio0103"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">제목+내용</th>
									<td>
										<input type="text" name="search_title" id="search_title" value="${search_title }" placeholder="제목 또는 내용을 입력하세요" style="width:100%">
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
				<input type="hidden" name="all_cnt" value="${pagePerCount }" />
				<div class="table-list-data">
					<table class="list">
						<caption>제품 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:50px">
							<col style="width:55px">
							<col style="width:120px">
							<col style="width:auto">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:180px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all" <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">이미지</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col">변경일</th>
								<th scope="col">노출여부</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
								<tr>
									<td><p class="check-type01 single"><input type="checkbox" id="ch_${result.seq }" name="ch_ck" value="${result.seq }" <c:if test="${fn:contains(checkedSeqArr, result.seq)}">checked</c:if>><label for="ch_${result.seq }"><span></span></label></p></td>
									<c:set var="first" value="${paginationInfo.totalRecordCount+1}"/>
									<c:set var="last" value="${(searchVO.pageIndex-1) * searchVO.pageUnit + status.count}"/>
									<td><c:out value="${first - last}" /></td>
									<td><span class="list-img"><img src="${result.pc_thimg }" alt="${result.pc_alt }"></span></td>
									<td class="al-l"><a href="javascript:;" name="view_${seq }" data-seq="${result.seq }" data-type="udt" data-page="${pageIndex }" data-search_useyn="${search_useyn }" data-search_title="${search_title }" class="btn-link">${result.title }</a></td>
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
										<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="regTime"/>
										<c:out value="${regDttmp }" />
										<br><span>(<c:out value="${regTime }"/>)</span>
										</p>								
									</td>
									<td>
										<c:choose>
											<c:when test="${result.useyn == 'Y'}">
												<span class="fc03">[노출]</span>
											</c:when>
											<c:otherwise>
												<span class="fc01">[미노출]</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<div class="table-btns row">
											<p><a href="javascript:;" name="view_${result.seq }" data-seq="${result.seq }" data-type="udt" data-page="${pageIndex }" data-search_useyn="${search_useyn }" data-search_title="${search_title }" class="btn-01 type-02 round">수정</a></p>
											<p><a href="javascript:;" id="delete_${result.seq }" data-seq="${result.seq }" class="btn-01 type-03 round">삭제</a></p>
										</div>
									</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="8"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
						</c:choose>
						<!-- 
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0101" name="c01"><label for="c0101"><span></span></label></p></td>
								<td>10</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a><span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">[노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>9</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0101" name="c01"><label for="c0101"><span></span></label></p></td>
								<td>8</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">[노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>7</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0101" name="c01"><label for="c0101"><span></span></label></p></td>
								<td>6</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">[노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>5</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0101" name="c01"><label for="c0101"><span></span></label></p></td>
								<td>4</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">[노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>3</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0101" name="c01"><label for="c0101"><span></span></label></p></td>
								<td>2</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc03">[노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>1</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							-->
						</tbody>
					</table>
				</div>
				<div class="paging-wrap">
					<p class="btn-pos-left">
						<a href="javascript:;" id="showUseYn" class="btn-01 type-02">선택 노출</a>
						<a href="javascript:;" id="hideUseYn" class="btn-01 type-02">선택 미노출</a>
					</p>
					<div class="paging">
					<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
					<!-- 
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
						<a href=""><img src="/asset/images/util/paging_last.png" alt="마지막 목록으로 이동"></a> -->
					</div>
					<p class="btn-pos-right">
						<a href="javascript:;" class="btn-01 type-01" name="view_${seq }" data-seq="${seq }" data-type="reg" data-page="${pageIndex }">등록</a>
					</p>
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
	function updateUseYn(useyn, callback) {
		var checkedSeqArr = new Array(); 
		// 체크 박스 체크된 항목만 선택 노출, 미노출
		$("input[name='ch_ck']:checked").each(function(ch, idx){
			checkedSeqArr.push($(this).val());
		});
		
		if(checkedSeqArr.length == 0) {
			alert('항목을 선택하세요');
			return false;
		}
		
		$.ajax({
            url: "/admin/site/update_useyn_pho_ever.do",
            type: "POST",
            data: {
            	'checkedSeqArr' : checkedSeqArr,
            	'useyn' : useyn
            },
            dataType: 'json',
            cache: false,
            success: function (data) {
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			if(useyn == "Y") {
            				alert('선택 항목이 노출 되었습니다.');
            			} else {
            				alert('선택 항목이 비노출 되었습니다.');
            			}
            			callback.call();
            		}
            	}
            },
            error: function (xhr, status, error) {
            	if (xhr.status == 500) {
            		alert('Internal error: ' + xhr.responseText);
                } else {
                    alert('Unexpected error.');
                }
            }
        });
	}
	
	function callbackFunc() {
		var checkedSeqArr = new Array(); 
		// 체크 박스 체크된 항목만 노출, 미노출 업데이트
		$("input[name='ch_ck']:checked").each(function(ch, idx){
			checkedSeqArr.push($(this).val());
		});
		
        var form = document.createElement("form");
        form.setAttribute("action", "/admin/site/pho_ever_list.do");
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "checkedSeqArr");
        hiddenField.setAttribute("value", checkedSeqArr);
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "pageIndex");
        hiddenField.setAttribute("value", $("input[name='pageIndex']").val());
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_useyn");
        hiddenField.setAttribute("value", $("input[name='search_useyn']:checked").val());
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_title");
        hiddenField.setAttribute("value", $("input[name='search_title']").val());
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	}
	
	// 수정, 등록
	$("a[name^='view_']").on("click", function(){
        var form = document.createElement("form");
        form.setAttribute("action", "/admin/site/pho_ever_view.do");
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
        hiddenField.setAttribute("name", "search_useyn");
        hiddenField.setAttribute("value", !!$(this).data("search_useyn") ? $(this).data("search_useyn") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_title");
        hiddenField.setAttribute("value", !!$(this).data("search_title") ? $(this).data("search_title") : '');
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	});
	
	// 삭제
	$("a[id^='delete_']").on("click", function(){
        var seq = $(this).data("seq");
        
        if (confirm('항목을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: "/admin/site/pho_ever_delete.do",
	            type: "POST",
	            data: {'seq' : seq},
	            dataType: 'json',
	            cache: false,
	            success: function (data) {
	            	if(!!data.result) {
	            		if(data.result == 'SUCCESS') {
	            			alert('삭제되었습니다.');
	            			location.reload();
	            		}
	            	}
	            	
	            },
	            error: function (xhr, status, error) {
	            	if (xhr.status == 500) {
	            		alert('Internal error: ' + xhr.responseText);
	                } else {
	                    alert('Unexpected error.');
	                }
	            }
	        });
	    }
	});
	
	// 초기화
	$("#resetBtn").on("click", function(){
		$("input[name='search_useyn']").prop("checked", false);
		$("input[name='search_useyn']:eq(0)").prop("checked", true);
		$("input[name='search_title']").val("");
		location.replace("./pho_ever_list.do");
	});
	
	// 검색
	$("#searchBtn").on("click", function(){
		$("input[name='pageIndex']").val(1);
		$("#searchForm").submit();
	});
	
	// 체크박스
	// 전체
	$("input[name='ch_all']").on("click", function(){
		if($("input[name='ch_all']").prop("checked"))
			$("input[name='ch_ck']").each(function(ch, idx){
				$(this).prop("checked", true);
			});
		else
			$("input[name='ch_ck']").each(function(ch, idx){
				$(this).prop("checked", false);
			});
	});
	
	// 개별
	$("input[name='ch_ck']").on("click", function(){
		if($("input[name='ch_ck']:checked").length == $("input[name='all_cnt']").val())
			$("input[name='ch_all']").prop("checked", true);
		else
			$("input[name='ch_all']").prop("checked", false);
	});

	// 선택 노출
	$("#showUseYn").on("click", function(){
		updateUseYn('Y', callbackFunc);
	});
	
	// 선택 미노출
	$("#hideUseYn").on("click", function(){
		updateUseYn('N', callbackFunc);
	});
});
</script>
</body>
</html>
