<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>관리자관리 | 사이트관리 | 포메인 통합관리자</title>
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
		  	$('form').each(function(){
				this.reset();
			 });
		  	location.replace("./manager_list.do");
			//fnPaging(1);
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
				<span>사이트관리</span>
				<span>관리자관리</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">관리자 관리</h3>
			<form name="searchForm" id="searchForm" method="get" action="./manager_list.do">
				<input type="hidden" name="seq" value=""/>
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value=""/>
				<input type="hidden" name="searchKeyword" id="searchKeyword" value=""/>
				<input type="hidden" name="searchConditionTemp" id="searchConditionTemp" value="0"/>
				<input type="hidden" name="checkedSeqArr" id="checkedSeqArr" value=""/>
			<div class="table-list-data">
				<fieldset>
					<legend>관리자 관리 검색 입력 폼</legend>
					<table class="view">
						<caption>관리자 관리 검색 기본정보 입력 폼 테이블</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상태여부</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="0" <c:if test="${searchVO.useyn == null || searchVO.useyn == '' || searchVO.useyn == '0'}"> checked</c:if> ><label for="radio0101"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="1" <c:if test="${searchVO.useyn == '1'}"> checked</c:if> ><label for="radio0102"><span></span>활성</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0103" name="useyn" value="2" <c:if test="${searchVO.useyn == '2'}"> checked</c:if> ><label for="radio0103"><span></span>비활성</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">계정타입</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0201" name="admintype" value="0" <c:if test="${searchVO.admintype == null || searchVO.admintype == '' || searchVO.admintype == '0'}"> checked</c:if> ><label for="radio0201"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0202" name="admintype" value="1" <c:if test="${searchVO.admintype == '1'}"> checked</c:if> ><label for="radio0202"><span></span>통합관리자</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0203" name="admintype" value="2" <c:if test="${searchVO.admintype == '2'}"> checked</c:if> ><label for="radio0203"><span></span>매장관리자</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">매장명</th>
								<td>
									<input type="text" name="store" id="store" value="${searchVO.store }" placeholder="매장명을 입력하세요" style="width:100%">
								</td>
							</tr>
							<tr>
								<th scope="row">부서</th>
								<td>
									<div class="mulity-check-radio">
										<c:forEach var="codeResult" items="${ fnc:codeListSub('112') }" varStatus="status">
			                        		<div>
			                        			<p class="radio-type01">
			                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="bu" value="<c:out value="${codeResult.code}"/>" <c:if test="${searchVO.bu == codeResult.code}">checked</c:if> />
			                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
			                        			</p>
			                        		</div>
			                        	</c:forEach> 
										<%-- 
										<div><p class="radio-type01"><input type="radio" id="radio0301" name="bu" value="112201" <c:if test="${searchVO.bu == '112201'}"> checked</c:if> ><label for="radio0301"><span></span>본사물품관리자</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0302" name="bu" value="112202" <c:if test="${searchVO.bu == '112202'}"> checked</c:if> ><label for="radio0302"><span></span>경영지원실</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0303" name="bu" value="112203" <c:if test="${searchVO.bu == '112203'}"> checked</c:if> ><label for="radio0303"><span></span>디자인실</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0304" name="bu" value="112204" <c:if test="${searchVO.bu == '112204'}"> checked</c:if> ><label for="radio0304"><span></span>홍보실</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0305" name="bu" value="112205" <c:if test="${searchVO.bu == '112205'}"> checked</c:if> ><label for="radio0305"><span></span>외부업체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0306" name="bu" value="112206" <c:if test="${searchVO.bu == '112206'}"> checked</c:if> ><label for="radio0306"><span></span>기타</label></p></div>
										 --%>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">이름+아이디</th>
								<td>
									<input type="text" name="searchKeywordTemp" id="searchKeywordTemp" value="${searchVO.searchKeyword }" placeholder="이름 또는 아이디을 입력하세요" style="width:100%">
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
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건
					<p class="sort-right">
						<!-- <a href="#" class="btn-02 type-01">엑셀 다운로드</a> -->
					</p>
				</div>
				<div class="table-list-data">
					<table class="list">
						<caption>관리자 관리 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:55px">
							<col style="width:50px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:120px">
							<col style="width:80px">
							<col style="width:160px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all"  <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">계정타입</th>
								<th scope="col">부서</th>
								<th scope="col">매장명</th>
								<th scope="col">이름</th>
								<th scope="col">아이디</th>
								<th scope="col">연락처</th>
								<th scope="col">최근접속정보</th>
								<th scope="col">상태여부</th>
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
									<c:choose>
										<c:when test="${result.admintype == '111201' }">통합관리자</c:when>
										<c:when test="${result.admintype == '111202' }">매장관리자</c:when>
									</c:choose>
								</td>
								<td class="al-l">
									<c:out value="${fnc:codeValue(result.bu) }" />
								</td>
								<td class="al-l">${result.store }</td>
								<td class="al-l">
										<a href="#" onclick="javascript:fnDetailView('./manager_view.do', <c:out value="${result.seq }" />); return false;"  class="btn-link">${result.name}</a>
										<!-- <span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span> -->
								</td>
								<td><a href="#">${result.adminid }</a></td>
								<td>${result.hp1 }-${result.hp2 }-${result.hp3 }</td>
								<td><p class="table-date">
									<fmt:parseDate value="${result.logindt}" var="logindt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${logindt}" pattern='yyyy.MM.dd' var="loginDttmp"/>
									<fmt:formatDate value="${logindt}" pattern='HH:mm:ss' var="loginTime"/>
									<c:out value="${loginDttmp }" />
									<br><span>(<c:out value="${loginTime}"/>)</span></p>
								</td>
								<td>
									<c:choose>
										<c:when test="${ result.useyn == 'Y'}">
									<span class="fc03"><a href="#">활성</a></span>
										</c:when>
										<c:otherwise>
									<span class="fc01"><a href="#">비활성</a></span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" onclick="javascript:fnDetailView('./manager_view.do', <c:out value="${result.seq }" />); return false;" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" onclick="fnDel('<c:out value="${result.seq }" />'); return false;" class="btn-01 type-03 round">삭제</a></p>
									</div>
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
													
						</tbody>
					</table>
				</div>
				<div class="paging-wrap">
					<p class="btn-pos-left">
						<a href="#" id="showUseYn" class="btn-01 type-02">선택 활성</a>
						<a href="#" id="hideUseYn" class="btn-01 type-02">선택 비활성</a>
					</p>
					<div class="paging">
						<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
					</div>
					<p class="btn-pos-right">
						<a href="./manager_write.do" class="btn-01 type-01">등록</a>
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
