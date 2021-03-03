<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인 상품권 신청 | 문의 관리 | 포메인 통합관리자</title>
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
				<span>포메인 상품권신청</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">포메인 상품권 신청</h3>

			<form name="searchForm" id="searchForm" action="coupon_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>포메인 상품권 신청 검색 입력 폼</legend>
						<table class="view">
							<caption>포메인 상품권 신청 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">진행상태</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="search_working" value="0" <c:if test="${empty search_working || search_working == 0}">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="search_working" value="1" <c:if test="${search_working == 1}">checked</c:if>><label for="radio0102"><span></span>신청완료</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0103" name="search_working" value="2" <c:if test="${search_working == 2}">checked</c:if>><label for="radio0103"><span></span>배송완료</label></p></div>
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
						<caption>포인트 통합 신청 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:55px">
							<col style="width:50px">
							<col style="width:100px">
							<col style="width:160px">
							<col style="width:120px">
							<col style="width:120px">
							<col style="width:auto">
							<col style="width:80px">
							<col style="width:120px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all" <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">이름</th>
								<th scope="col">연락처</th>
								<th scope="col">보유<br/>마일리지</th>
								<th scope="col">신청수량</th>
								<th scope="col">배송주소</th>
								<th scope="col">등록일</th>
								<th scope="col">진행상태</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="ch_${result.seq }" name="ch_ck" value="${result.seq }" class="${checkedSeqArr }" <c:if test="${fn:contains(checkedSeqArr, result.seq)}">checked</c:if>><label for="ch_${result.seq }"><span></span></label></p></td>
								<c:set var="first" value="${paginationInfo.totalRecordCount+1}"/>
								<c:set var="last" value="${(searchVO.pageIndex-1) * searchVO.pageUnit + status.count}"/>
								<td><c:out value="${first - last}" /></td>
								<td>${result.name }</td>
								<td>${result.hp }</td>
								<td>${result.point } 점</td>
								<td>${result.qty } 장</td>
								<td>${result.addr }</td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br /><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
								<td class="fc01">
									<c:choose>
										<c:when test="${result.working == 'Y'}">
											<span class="fc01">신청완료</span>
										</c:when>
										<c:otherwise>
											<span class="fc03">배송완료</span>
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
					<p class="btn-pos-left">
						<a href="javascript:;" id="applyBtn" class="btn-01 type-02">선택 배송완료</a>
					</p>
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
	function upateApplyCoupon(applyyn, callback) {
		var checkedSeqArr = new Array(); 
		// 체크 박스 체크된 항목만 선택 배송완료
		$("input[name='ch_ck']:checked").each(function(ch, idx){
			checkedSeqArr.push($(this).val());
		});
		
		if(checkedSeqArr.length == 0) {
			alert('항목을 선택하세요');
			return false;
		}
		
		$.ajax({
            url: "/admin/customer/update_apply_coupon.do",
            type: "POST",
            data: {
            	'checkedSeqArr' : checkedSeqArr,
            	'applyyn' : applyyn
            },
            dataType: 'json',
            cache: false,
            success: function (data) {
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			alert('선택 항목이 배송완료 되었습니다.');
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
	
	// 검색
	$("#searchBtn").on("click", function(){
		$("input[name='pageIndex']").val(1);
		$("#searchForm").submit();
	});
	
	// 초기화
	$("#resetBtn").on("click", function(){
		$("input[name='search_working']").prop("checked", false);
		$("input[name='search_working']:eq(0)").prop("checked", true);
		$("input[name='search_name']").val("");
		$("input[name='search_cardno']").val("");
		$("input[name='search_hp']").val("");
		location.replace("./coupon_list.do");
	});
	
	var hp = $("a[name='hp']").data("hp") + "";
	$("a[name='hp']").text(hp.replace(/(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
	
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
	
	// 선택 배송완료
	$("#applyBtn").on("click", function(){
		upateApplyCoupon('N', callbackFunc);
	});
	
	function callbackFunc() {
		var checkedSeqArr = new Array(); 
		// 체크 박스 체크된 항목만 노출, 미노출 업데이트
		$("input[name='ch_ck']:checked").each(function(ch, idx){
			checkedSeqArr.push($(this).val());
		});
		
        var form = document.createElement("form");
        form.setAttribute("action", "/admin/customer/coupon_list.do");
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
        hiddenField.setAttribute("name", "search_working");
        hiddenField.setAttribute("value", $("input[name='search_working']:checked").val());
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_name");
        hiddenField.setAttribute("value", $("input[name='search_name").val());
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_hp");
        hiddenField.setAttribute("value", $("input[name='search_hp']").val());
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	}
	
});
</script>
</body>
</html>
