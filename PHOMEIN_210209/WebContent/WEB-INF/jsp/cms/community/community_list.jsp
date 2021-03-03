<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>
	<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도 | 게시판관리 | 포메인 통합관리자</c:if>
	<c:if test="${searchVO.boardType == 'event'}">이벤트 | 게시판관리 | 포메인 통합관리자</c:if>
	<c:if test="${searchVO.boardType == 'sns'}">포메인SN | 게시판관리 | 포메인 통합관리자</c:if>
</title>
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
				<span>게시판관리</span>
				<span>
					<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
					<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
					<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if>
				</span>
				<span>목록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title">
				<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
				<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
				<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if>
			</h3>

			<div class="table-list-data">
				<form name="searchForm" id="searchForm" method="post" action="/admin/community/${searchVO.boardType}/community_list.do">
				<input type="hidden" name="seq" id="seq" value=""/>
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value=""/>
				<input type="hidden" name="searchKeyword" id="searchKeyword" value=""/>
				<fieldset>
					<legend>
						<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도 검색 입력 폼</c:if>
						<c:if test="${searchVO.boardType == 'event'}">이벤트 검색 입력 폼</c:if>
						<c:if test="${searchVO.boardType == 'sns'}">포메인 SNS 검색 입력 폼</c:if>
					</legend>
					<table class="view">
						<caption>
							<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도 검색 기본정보 입력 폼 테이블</c:if>
							<c:if test="${searchVO.boardType == 'event'}">이벤트 검색 기본정보 입력 폼 테이블</c:if>
							<c:if test="${searchVO.boardType == 'sns'}">포메인 SNS 검색 기본정보 입력 폼 테이블</c:if>
						</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">노출여부</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value='' <c:if test="${searchVO.useyn == '' }">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value='Y' <c:if test="${searchVO.useyn == 'Y' }">checked</c:if>><label for="radio0102"><span></span>노출</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0103" name="useyn" value='N' <c:if test="${searchVO.useyn == 'N' }">checked</c:if>><label for="radio0103"><span></span>미노출</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">구분</th>
								<td>
									<div class="mulity-check-radio">
										<c:if test="${searchVO.boardType == 'notice'}">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="cate" value="" <c:if test="${searchVO.cate == '' }">checked</c:if>><label for="radio0201"><span></span>전체</label></p></div>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
				                        		<div>
				                        			<p class="radio-type01">
				                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${searchVO.cate == codeResult.code}">checked</c:if> />
				                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
				                        			</p>
				                        		</div>
				                        	</c:forEach>
										</c:if>
										<c:if test="${searchVO.boardType == 'event'}">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="cate" value="" <c:if test="${searchVO.cate == '' }">checked</c:if>><label for="radio0201"><span></span>전체</label></p></div>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('108') }" varStatus="status">
				                        		<div>
				                        			<p class="radio-type01">
				                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${searchVO.cate == codeResult.code}">checked</c:if> />
				                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
				                        			</p>
				                        		</div>
				                        	</c:forEach>
										</c:if>
										<c:if test="${searchVO.boardType == 'sns'}">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="cate" value="" <c:if test="${searchVO.cate == '' }">checked</c:if>><label for="radio0201"><span></span>전체</label></p></div>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('109') }" varStatus="status">
				                        		<div>
				                        			<p class="radio-type01">
				                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${searchVO.cate == codeResult.code}">checked</c:if> />
				                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
				                        			</p>
				                        		</div>
				                        	</c:forEach>
										</c:if>
									</div>
								</td>
							</tr>
							<c:if test="${searchVO.boardType == 'event'}">
								<tr>
									<th scope="row">진행상태</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input name="event_progress" id="radio0301" value="" type="radio" <c:if test="${searchVO.event_progress == ''}">checked</c:if>><label for="radio0301"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input name="event_progress" id="radio0302" type="radio" value="P" <c:if test="${searchVO.event_progress == 'P'}">checked</c:if>><label for="radio0302"><span></span>진행중</label></p></div>
											<div><p class="radio-type01"><input name="event_progress" id="radio0303" type="radio" value="E" <c:if test="${searchVO.event_progress == 'E'}">checked</c:if>><label for="radio0303"><span></span>종료</label></p></div>
										</div>
									</td>
								</tr>
							</c:if>
							<tr>
								<c:if test="${searchVO.boardType == 'notice'}">
									<th scope="row">제목+내용</th>
								</c:if>
								<c:if test="${searchVO.boardType == 'event' || searchVO.boardType == 'sns'}">
									<th scope="row">제목</th>
								</c:if>
								<td>
									<c:if test="${searchVO.boardType == 'notice'}">
										<input type="hidden" name="searchConditionTemp" id="searchConditionTemp" value="0">
									</c:if>
									<c:if test="${searchVO.boardType == 'event' || searchVO.boardType == 'sns'}">
										<input type="hidden" name="searchConditionTemp" id="searchConditionTemp" value="1">
									</c:if>
									<input type="text" name="searchKeywordTemp" id="searchKeywordTemp" value="${searchVO.searchKeyword }" placeholder="제목 또는 내용을 입력하세요" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
				<p class="btn-page-wrap">
					<a href="javascript:void(0)" onclick="fnReset();" class="btn-01 type-02">초기화</a>
					<a href="javascript:void(0)" onclick="fnSearchForm();" class="btn-01 type-01">검색</a>
				</p>
				</form>
			</div>

			<div class="default-cell">
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건</div>
				<div class="table-list-data">
					<table class="list">
						<caption>공지&언론보도 리스트 테이블 표</caption>
						<colgroup>
							<c:if test="${searchVO.boardType == 'notice' || searchVO.boardType == 'sns'}">
								<col style="width:55px">
								<col style="width:50px">
								<col style="width:100px">
								<col style="width:100px">
								<col style="width:auto">
								<col style="width:90px">
								<col style="width:90px">
								<col style="width:60px">
								<col style="width:60px">
								<col style="width:160px">
							</c:if>
							<c:if test="${searchVO.boardType == 'event'}">
								<col style="width:50px">
								<col style="width:50px">
								<col style="width:100px">
								<col style="width:100px">
								<col style="width:auto">
								<col style="width:90px">
								<col style="width:60px">
								<col style="width:90px">
								<col style="width:90px">
								<col style="width:60px">
								<col style="width:160px">
							</c:if>
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all"  <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">섬네일이미지</th>
								<th scope="col">제목</th>
								<c:if test="${searchVO.boardType == 'event'}">
									<th scope="col">기간</th>
								</c:if>
								<th scope="col">등록일</th>
								<th scope="col">수정일</th>
								<th scope="col">조회</th>
								<th scope="col">노출여부</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty resultList }" >
									<c:forEach items="${resultList }" var="result" varStatus="status" >
										<tr>
											<td><p class="check-type01 single"><input type="checkbox" id="ch_${result.seq }" name="ch_ck" value="${result.seq }" class="${checkedSeqArr }" <c:if test="${fn:contains(checkedSeqArr, result.seq)}">checked</c:if>><label for="ch_${result.seq }"><span></span></label></p></td>
											<td><c:out	value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}" /></td>
											<td>
												<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
					                        		<c:if test="${result.cate == codeResult.code}"><c:out value="${codeResult.name}"/></c:if>
					                        	</c:forEach>
					                        	<c:forEach var="codeResult" items="${ fnc:codeListSub('108') }" varStatus="status">
					                        		<c:if test="${result.cate == codeResult.code}"><c:out value="${codeResult.name}"/></c:if>
					                        	</c:forEach>
					                        	<c:forEach var="codeResult" items="${ fnc:codeListSub('109') }" varStatus="status">
					                        		<c:if test="${result.cate == codeResult.code}"><c:out value="${codeResult.name}"/></c:if>
					                        	</c:forEach>
											</td>
											<td><span class="list-img"><img src="${result.pc_thimg }" onerror="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
											<td class="al-l"><a href="javascript:void(0);" onclick="javascript:fnDetailView('/admin/community/${searchVO.boardType}/community_write.do', <c:out value="${result.seq }" />); return false;" class="btn-link">${fnc:xssContents(result.title )}</a><span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span></td>
											<c:if test="${searchVO.boardType == 'event'}">
												<td><c:out value="${result.startdt }"/> ~ <br><c:out value="${result.enddt }"/></td>
											</c:if>
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
												<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="regTime"/>
												<c:out value="${modDttmp }" />
												<br><span>(<c:out value="${regTime }"/>)</span></p>
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
													<p><a href="#" onclick="javascript:fnDetailView('/admin/community/${searchVO.boardType}/community_write.do', <c:out value="${result.seq }" />); return false;" class="btn-01 type-02 round">수정</a></p>
													<p><a href="#" onclick="fnDel('<c:out value="${result.seq }" />'); return false;" class="btn-01 type-03 round">삭제</a></p>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<!-- 등록된 게심물이 없을 경우 -->
									<tr>
										<c:if test="${searchVO.boardType == 'notice' || searchVO.boardType == 'sns'}">
											<td colspan="10"><p class="none-data">등록된 게시물이 없습니다</p></td>
										</c:if>
										<c:if test="${searchVO.boardType == 'event'}">
											<td colspan="11"><p class="none-data">등록된 게시물이 없습니다</p></td>
										</c:if>
									</tr>
									<!-- //등록된 게심물이 없을 경우 -->
								</c:otherwise>
							</c:choose>
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
						<a href="/admin/community/${searchVO.boardType}/community_write.do" class="btn-01 type-01">등록</a>
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
<form name="deleteForm" id="deleteForm" method="POST" action="/admin/community/${searchVO.boardType}/delete_proc.do">
	<input type="hidden" name="seq" id="seq" value=""/>
</form>	
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){

});

function fnDetailView(_url, _seq) {
	var frm =  $("form[name=searchForm]");
	frm.find("input[name='seq']").val( _seq );
	frm.attr("action" ,  _url);
	frm.attr("method" , "post");
	frm.submit();
}

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

function fnReset(){
	$('#searchKeyword').val('');
	$('#searchKeywordTemp').val('');
	$('#radio0101').trigger('click');
	$('#radio0201').trigger('click');
	$('#radio0301').trigger('click');
	location.replace("./community_list.do");
}

function fnSearchForm() {
	$('#searchCondition').val($('#searchConditionTemp').val());
	$('#searchKeyword').val($('#searchKeywordTemp').val());

	$('#searchForm').submit();
	
}

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
