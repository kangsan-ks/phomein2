<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>공지사항 | 인트라넷 | 포메인 통합관리자</title>
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
				<span>인트라넷</span>
				<span>공지사항</span>
				<span>목록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title">공지사항</h3>
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
							<col style="width:55px">
							<col style="width:50px">
							<col style="width:auto">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:80px">
							<col style="width:160px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all"  <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col">수정일</th>
								<th scope="col">조회</th>
								<th scope="col">노출여부</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty topList }" >
							<c:forEach items="${topList }" var="result" varStatus="status" >
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="ch_${result.seq }" name="ch_ck" value="${result.seq }" class="${checkedSeqArr }" <c:if test="${fn:contains(checkedSeqArr, result.seq)}">checked</c:if>><label for="ch_${result.seq }"><span></span></label></p></td>
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
								<td>
									<c:choose>
										<c:when test="${ result.useyn == 'Y'}">
									<span class="fc03">[노출]</span>
										</c:when>
										<c:otherwise>
									<span class="fc01">[미노출]</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" onclick="javascript:fnDetailView('./board_view.do', <c:out value="${result.seq }" />); return false;" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" onclick="fnDel('<c:out value="${result.seq }" />'); return false;" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							</c:forEach>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="ch_${result.seq }" name="ch_ck" value="${result.seq }" class="${checkedSeqArr }" <c:if test="${fn:contains(checkedSeqArr, result.seq)}">checked</c:if>><label for="ch_${result.seq }"><span></span></label></p></td>
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
								<td>
									<c:choose>
										<c:when test="${ result.useyn == 'Y'}">
									<span class="fc03">[노출]</span>
										</c:when>
										<c:otherwise>
									<span class="fc01">[미노출]</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" onclick="javascript:fnDetailView('./board_view.do', <c:out value="${result.seq }" />); return false;" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" onclick="fnDel('<c:out value="${result.seq }" />'); return false;" class="btn-01 type-03 round">삭제</a></p>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>8</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
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
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>6</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
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
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>4</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
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
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
								<td><span class="fc01">[미노출]</span></td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>2</td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
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
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td><p class="table-date">2018.12.10<br><span>(23:00:00)</span></p></td>
								<td>10</td>
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
						<a href="#" id="showUseYn" class="btn-01 type-02">선택 노출</a>
						<a href="#" id="hideUseYn" class="btn-01 type-02">선택 미노출</a>
					</p>
					<div class="paging">
						<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
					</div>
					<p class="btn-pos-right">
						<a href="./board_write.do" class="btn-01 type-01">등록</a>
					</p>
				</div>
			</div>

		</section>
		<!-- //contents -->

		<form name="deleteForm" id="deleteForm" method="POST" action="./delete_proc.do">
		<input type="hidden" name="seq" id="seq" value=""/>
		</form>	
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


function fnDel(_seq){
	if(! confirm('해당 정보를 영구 삭제하시겠습니까?')) return;
	var frm = $("form[name=deleteForm]");
	frm.find("input[name='seq']").val( _seq );
	var params = frm.serialize();
	var url = frm.attr("action");
    $.post(
            url,
            params,
            function(data){
            	var data = JSON.parse( data );
                if(data.result == "S" ){     
                	alert("삭제되었습니다.");
                	$("form[name=searchForm]").submit();
                }else{
                	alert("삭제중 오류가 발생했습니다. 관리자에게 문의하세요.");
				}
            }, "json"
       ); 			
}


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

function updateUseYn(useyn) {
	
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
        url: "./update_useyn.do",
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
        			$("form[name=searchForm]").submit();
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

// 선택 노출
$("#showUseYn").on("click", function(){
	updateUseYn('Y');
});

// 선택 미노출
$("#hideUseYn").on("click", function(){
	updateUseYn('N');
});
</script>
</body>
</html>
