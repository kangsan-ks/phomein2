<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>이벤트 | 게시판관리 | 포메인 통합관리자</title>
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
				<span>이벤트</span>
				<span>목록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title">이벤트</h3>

			<div class="table-list-data">
				<fieldset>
					<legend>이벤트 검색 입력 폼</legend>
					<table class="view">
						<caption>이벤트 검색 기본정보 입력 폼 테이블</caption>
						<colgroup>
							<col style="width:160px">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">노출여부</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0101" name="radio01" checked><label for="radio0101"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0102" name="radio01"><label for="radio0102"><span></span>노출</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0103" name="radio01"><label for="radio0103"><span></span>미노출</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">구분</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0201" name="radio02" checked><label for="radio0201"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0202" name="radio02"><label for="radio0202"><span></span>매장이벤트</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0203" name="radio02"><label for="radio0203"><span></span>공식이벤트</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">진행상태</th>
								<td>
									<div class="mulity-check-radio">
										<div><p class="radio-type01"><input type="radio" id="radio0301" name="radio03" checked><label for="radio0301"><span></span>전체</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0302" name="radio03"><label for="radio0302"><span></span>진행중</label></p></div>
										<div><p class="radio-type01"><input type="radio" id="radio0303" name="radio03"><label for="radio0303"><span></span>종료</label></p></div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row">제목</th>
								<td>
									<input type="text" name="" id="" placeholder="제목을 입력하세요" style="width:100%">
								</td>
							</tr>
						</tbody>
					</table>
				</fieldset>
				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-02">초기화</a>
					<a href="#" class="btn-01 type-01">검색</a>
				</p>
			</div>

			<div class="default-cell">
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건</div>
				<div class="table-list-data">
					<table class="list">
						<caption>이벤트 리스트 테이블 표</caption>
						<colgroup>
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
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p class="check-type01 single"><input type="checkbox" id="c0100" name="c01"><label for="c0100"><span></span></label></p></th>
								<th scope="col">번호</th>
								<th scope="col">구분</th>
								<th scope="col">섬네일이미지</th>
								<th scope="col">제목</th>
								<th scope="col">기간</th>
								<th scope="col">진행상태</th>
								<th scope="col">등록일</th>
								<th scope="col">수정일</th>
								<th scope="col">노출여부</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td><c:out	value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}" /></td>
								<td>
									<c:choose>
										<c:when test="${ result.cate == 'inevent' }">매장이벤트</c:when>									
										<c:when test="${ result.cate == 'outevent' }">공식이벤트</c:when>																	
									</c:choose>
									<br/>
										<c:out value="${result.store }"/>
								</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">${fnc:xssContents(result.title )}</a><span class="ico-new"><img src="/asset/images/icon/icon_new.png" alt="New"></span></td>
								<td><c:out value="${result.startdt }"/> ~ <br><c:out value="${result.enddt }"/></td>
								<td>
									
									<c:choose>
										<c:when test="${ result.working == 'Y' }"><span class="fc03">진행중</span></c:when>									
										<c:when test="${ result.working == 'N' }"><span class="fc03">진행중</span></c:when>																	
									</c:choose>
								
								</td>
								<td>
									<p class="table-date">
									<fmt:parseDate value="${result.REGDT}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
									<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
								<td>
									<p class="table-date"><fmt:parseDate value="${result.MODDT}" var="modDt" pattern='yyyy-MM-dd HH:mm:ss'/>
									<fmt:formatDate value="${modDt}" pattern='yyyy.MM.dd' var="modDttmp"/>
									<fmt:formatDate value="${modDt}" pattern='HH:mm:ss' var="regTime"/>
									<c:out value="${regDttmp }" />
									<br><span>(<c:out value="${regTime }"/>)</span></p>
								</td>
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
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
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
							<!-- 
							<tr>
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>9</td>
								<td>공식이벤트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">공식이벤트 제목 입니다. 공식이벤트 제목 입니다. 공식이벤트 제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc01">종료</span></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>8</td>
								<td>매장이벤트<br>천안분당점</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc03">진행중</span></td>
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
								<td>공식이벤트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc01">종료</span></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>6</td>
								<td>매장이벤트<br>천안분당점</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc03">진행중</span></td>
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
								<td>공식이벤트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc01">종료</span></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>4</td>
								<td>매장이벤트<br>천안분당점</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc03">진행중</span></td>
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
								<td>공식이벤트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc01">종료</span></td>
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
								<td><p class="check-type01 single"><input type="checkbox" id="c0102" name="c01"><label for="c0102"><span></span></label></p></td>
								<td>2</td>
								<td>매장이벤트<br>천안분당점</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc03">진행중</span></td>
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
								<td>공식이벤트</td>
								<td><span class="list-img"><img src="/asset/images/tmp/@img_800x800.jpg" alt="제품 이미지"></span></td>
								<td class="al-l"><a href="#" class="btn-link">제목 입니다.</a></td>
								<td>2018.12.10 ~ <br>2018.12.10</td>
								<td><span class="fc01">종료</span></td>
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
						<a href="#" class="btn-01 type-02">선택 노출</a>
						<a href="#" class="btn-01 type-02">선택 미노출</a>
					</p>
					<div class="paging">
						<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
					</div>
					<p class="btn-pos-right">
						<a href="#" class="btn-01 type-01">등록</a>
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

});
</script>
</body>
</html>
