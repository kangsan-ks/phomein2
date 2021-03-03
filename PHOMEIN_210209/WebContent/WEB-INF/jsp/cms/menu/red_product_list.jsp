<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<title>제품관리 | 메뉴관리 | 포메인 통합관리자</title>
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
				<span>메뉴관리</span>
				<span>제품관리</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">제품관리(RED)</h3>

			<form name="searchForm" id="searchForm" action="red_product_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>제품 검색 입력 폼</legend>
						<table class="view">
							<caption>제품 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" style="background:#FCD9DB">노출여부</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="search_useyn" value="0" <c:if test="${empty search_useyn || search_useyn == 0}">checked</c:if>><label for="radio0101"><span></span>전체</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="search_useyn" value="1" <c:if test="${search_useyn == 1}">checked</c:if>><label for="radio0102"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0103" name="search_useyn" value="2" <c:if test="${search_useyn == 2}">checked</c:if>><label for="radio0103"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background:#FCD9DB">사용범위</th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="search_site_ck" value="0" <c:if test="${empty search_site_ck || search_site_ck == 0}">checked</c:if>><label for="radio0201"><span></span>전체</label></p></div>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('101') }" varStatus="status">
											<c:if test="${codeResult.code == '101201'}">
				                        		<div>
				                        			<p class="radio-type01">
				                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="search_site_ck" value="<c:out value="${codeResult.code}"/>" <c:if test="${search_site_ck == codeResult.code}">checked</c:if> />
				                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
				                        			</p>
				                        		</div>
				                        	</c:if>
				                        	</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background:#FCD9DB">제품명</th>
									<td>
										<input type="text" name="search_name" id="search_name" value="${search_name }" placeholder="제품명을 입력하세요" style="width:100%">
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
						<!-- <a href="javascript:;" id="excelDownBtn" data-page="${pageIndex }" data-search_useyn="${search_useyn }" data-search_site_ck="${search_site_ck }" data-search_name="${search_name }" class="btn-02 type-01">엑셀 다운로드</a> -->
					</p>
				</div>
				<input type="hidden" name="all_cnt" value="${pagePerCount }" />
				<div class="table-list-data">
					<table class="list">
						<caption>제품 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:50px">
							<col style="width:50px">
							<col style="width:80px">
							<col style="width:100px">
							<col style="width:120px">
							<col style="width:auto">
							<col style="width:90px">
							<col style="width:90px">
							<col style="width:60px">
							<col style="width:160px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" style="background:#FCD9DB"><p class="check-type01 single"><input type="checkbox" id="c0100" name="ch_all" <c:if test="${checkedSeqArrCnt eq pagePerCount}">checked</c:if>><label for="c0100"><span></span></label></p></th>
								<th scope="col" style="background:#FCD9DB">번호</th>
								<th scope="col" style="background:#FCD9DB">사용범위</th>
								<th scope="col" style="background:#FCD9DB">이미지</th>
								<th scope="col" style="background:#FCD9DB">카테고리</th>
								<th scope="col" style="background:#FCD9DB">제품명</th>
								<th scope="col" style="background:#FCD9DB">등록일</th>
								<th scope="col" style="background:#FCD9DB">변경일</th>
								<th scope="col" style="background:#FCD9DB">노출여부</th>
								<th scope="col" style="background:#FCD9DB">관리</th>
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
								<td>
									<c:if test="${result.kr_ck == 'Y' }"><div>국문사이트</div></c:if>								
									<c:if test="${result.en_ck == 'Y' }"><div>영문사이트</div></c:if>								
									<c:if test="${result.jp_ck == 'Y' }"><div>일문사이트</div></c:if>
								</td>
								<td>
									<span class="list-img"><img src="${result.f_file1 }" alt="제품 이미지"></span>								
								</td>
								<td>${result.kr_code }</td>
								<td class="al-l">
									<a href="javascript:;" class="btn-link"  name="view_${seq }" data-seq="${result.seq }" data-type="udt" data-page="${pageIndex }" data-search_useyn="${search_useyn }" data-search_site_ck="${search_site_ck }" data-search_name="${search_name }"> ${fnc:xssContents(result.name )} </a>
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
									<br><span>(<c:out value="${modTime }"/>)</span>
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
										<p><a href="javascript:;" name="view_${seq }" data-seq="${result.seq }" data-type="udt" data-page="${pageIndex }" data-search_useyn="${search_useyn }" data-search_site_ck="${search_site_ck }" data-search_name="${search_name }" class="btn-01 type-02 round">수정</a></p>
										<p><a href="javascript:;" id="delete_${result.seq }" data-seq="${result.seq }" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<tr>
								<td colspan="10"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
						</c:choose>
							<!-- 
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>9</td>
								<td>영문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">프리미엄 소고기 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0103" name="c01"><label for="c0103"><span></span></label></p></td>
								<td>8</td>
								<td>국문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">10 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0104" name="c01"><label for="c0104"><span></span></label></p></td>
								<td>7</td>
								<td>영문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">프리미엄 소고기 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0105" name="c01"><label for="c0105"><span></span></label></p></td>
								<td>6</td>
								<td>국문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">10 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0106" name="c01"><label for="c0106"><span></span></label></p></td>
								<td>5</td>
								<td>영문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">프리미엄 소고기 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0107" name="c01"><label for="c0107"><span></span></label></p></td>
								<td>4</td>
								<td>국문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">10 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0108" name="c01"><label for="c0108"><span></span></label></p></td>
								<td>3</td>
								<td>영문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">프리미엄 소고기 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0109" name="c01"><label for="c0109"><span></span></label></p></td>
								<td>2</td>
								<td>국문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">10 쌀국수</a></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0110" name="c01"><label for="c0110"><span></span></label></p></td>
								<td>1</td>
								<td>영문사이트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_700x700.png" alt="제품 이미지"></span></td>
								<td>중분류명 > 소분류명</td>
								<td class="al-l"><a href="#" class="btn-link">프리미엄 소고기 쌀국수</a></td>
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
						<!-- <a href=""><img src="/asset/images/util/paging_first.png" alt="첫번째 목록으로 이동"></a>
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
            url: "/admin/menu/red_update_useyn_product.do",
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
        form.setAttribute("action", "/admin/menu/red_product_list.do");
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
        hiddenField.setAttribute("name", "search_site_ck");
        hiddenField.setAttribute("value", $("input[name='search_site_ck']:checked").val());
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_name");
        hiddenField.setAttribute("value", $("input[name='search_name']").val());
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	}
	
	// 수정, 등록
	$("a[name^='view_']").on("click", function(){
        var form = document.createElement("form");
        form.setAttribute("action", "/admin/menu/red_product_view.do");
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
        hiddenField.setAttribute("name", "search_site_ck");
        hiddenField.setAttribute("value", !!$(this).data("search_site_ck") ? $(this).data("search_site_ck") : '');
        form.appendChild(hiddenField);
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "search_name");
        hiddenField.setAttribute("value", !!$(this).data("search_name") ? $(this).data("search_name") : '');
        form.appendChild(hiddenField);
        document.body.appendChild(form);
        form.submit();
	});
	
	// 삭제
	$("a[id^='delete_']").on("click", function(){
        var seq = $(this).data("seq");
        
        if (confirm('항목을 삭제하시겠습니까?')) {
	        $.ajax({
	            url: "/admin/menu/red_product_delete.do",
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
		$("input[name='search_site_ck']").prop("checked", false);
		$("input[name='search_site_ck']:eq(0)").prop("checked", true);
		$("input[name='search_name']").val("");
		location.replace("./red_product_list.do");
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
