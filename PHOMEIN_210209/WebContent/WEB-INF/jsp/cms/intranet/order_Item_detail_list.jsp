<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"></fmt:parseNumber>

<!doctype html>
<html lang="ko">
<head>
<title>본사 물품 신청 내역 목록 | 인트라넷 | 포메인 통합 관리</title>
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
		  	location.replace("./order_item_detail_list.do");
			//fnPaging(1);
		}
		
		function fnDeleteItemOrder(seq) {
			if (!confirm('해당 정보를 영구 삭제하시겠습니까?')) {
				return false;
			}
			
			var options = {
				url: './order_delete.do',
				type: 'post',
				dataType: 'json',
				data: {
					"seq": seq
				},
				success: function(objResponse, statusText, xhr, $from) {
					var obj = JSON.parse( objResponse );
					if (statusText == "success") {
						if (obj["result"] == 'S') {
							alert("삭제가 완료 되었습니다.");
							fnReset();
						} else {
							alert("데이터 전송 중 오류가 발생하였습니다.");
						}
					} else { 
						alert("데이터 전송 중 오류가 발생하였습니다 .");
					}
				},
				error: function(e) {}
			};
			
			$.ajax(options);
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
				<span>본사 물품 신청 내역</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">본사 물품 신청 내역</h3>
			<form name="searchForm" id="searchForm" method="get" action="./order_item_detail_list.do">
				<input type="hidden" name="seq" value=""/>
				<input type="hidden" name="pageIndex" value="${searchVO.pageIndex }"/>
				<input type="hidden" name="searchCondition" id="searchCondition" value=""/>
				<input type="hidden" name="searchKeyword" id="searchKeyword" value=""/>
				<input type="hidden" name="searchConditionTemp" id="searchConditionTemp" value="1"/>
			<div class="table-list-data">
				<fieldset>
					<legend>본사 물품 신청 내역 검색 입력 폼</legend>
					<table class="view">
						<caption>본사 물품 신청 내역 검색 기본정보 입력 폼 테이블</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">기간</th>
								<td>
									<div class="date-input-wrap">
										<div class="cell"><p class="date-input"><input type="text" name="searchStDt" id="searchStDt" class="datepicker" style="width:130px;" value="${ searchVO.searchStDt }"></p></div>
										<div class="cell"><p class="date-input"><input type="text" name="searchEdDt" id="searchEdDt" class="datepicker" style="width:130px;" value="${ searchVO.searchEdDt }"></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">매장명</th>
								<td>
									<input type="text" name="storename" id="storename" value="${searchVO.storename }" placeholder="제목을 입력하세요" style="width:100%" value="${ searchVO.storename }">
								</td>
							</tr>
							<tr>
								<th scope="row">상품명</th>
								<td>
									<input type="text" name="options" id="options" placeholder="상품명을 입력하세요" style="width:100%;" value="${ searchVO.options }">
								</td>
							</tr>
							<tr style="display:none;">
								<th scope="row">입금자명</th>
								<td>
									<input type="text" name="name" id="name" placeholder="입금자명을 입력하세요" style="width:100%">
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
						<caption>제품 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:55px">
							<col style="width:200px">
							<!-- <col style="width:100px"> -->
							<col style="width:auto;">
							<col style="width:150px">
							<col style="width:150px">
							<!-- <col style="width:90px">
							<col style="width:100px"> -->
							<col style="width:100px">
							<col style="width:100px">
							<col style="width:100px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">매장명</th>
								<!-- <th scope="col">주문수량</th> -->
								<th scope="col">상품명</th>
								<th scope="col">수량</th>
								<th scope="col">총 합계금액</th>
								<!-- <th scope="col">입금자명</th>
								<th scope="col">입금예정일</th> -->
								<th scope="col">등록일</th>
								<th scope="col">진행 상태</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td><c:out	value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}" /></td>
								<td><!--  class="al-l" -->${result.storename}</td>
								<%-- <td>항목 : ${result.gubun} 개<br>종류 : ${result.kind} 개</td> --%>
								<td >
									
									<a href="#" onclick="javascript:fnDetailView('./order_item_detail_view.do', <c:out value="${result.seq }" />); return false;" 
										class="btn-link">
										<c:forEach items="${result.productList}" var="product">
											${product.options}<br/>				
										</c:forEach>
										
										<%-- ${fnc:xssContents(result.title )} <span class="fc01">(${result.cnt})</span> --%></a>
									
									<fmt:parseDate value="${result.regdt}" var="chg_dttm" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber value="${chg_dttm.time / (1000*60*60*24)}" integerOnly="true" var="chgDttm"></fmt:parseNumber>
									<c:if test="${today - chgDttm le 7}">
									<span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span>
									</c:if>
								</td>
								<td>
									<c:forEach items="${result.productList}" var="product">
											${product.ea} 개<br/>				
									</c:forEach>
								</td>
								<td>
									
									<fmt:formatNumber value="${result.totalprice}" pattern="#,###" />원
									
								</td>
								<%--<td>${result.name}</td>
								<td>${result.paydt}</td>--%>
								<td><p class="table-date">
									<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)
									</span></p>
								</td>
								<td>
									<c:choose>
										<c:when test="${ result.status == 'O'}">
									<span class="fc01">진행중</span>
										</c:when>
										<c:otherwise>
									<span class="fc03">제작완료</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<p>
										<a href="javascript:;" id="seq" name="seq" class="btn-02 type-03 round" onclick="fnDeleteItemOrder(${ result.seq });">삭제</a>
									</p>
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
