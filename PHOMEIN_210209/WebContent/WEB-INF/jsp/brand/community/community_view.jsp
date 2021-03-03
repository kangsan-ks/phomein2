<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title><c:if test="${searchVO.boardType == 'notice'}">공지 & 언론보도 리스트</c:if><c:if test="${searchVO.boardType == 'event'}"> EVENT</c:if> | Community | 포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="community">

		<c:if test="${searchVO.boardType == 'notice'}">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual" style="background-image:url('/brand/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">공지 & 언론보도</h2>
				<span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span>
			</div>
			<!-- //page-title -->
		</c:if>
		<c:if test="${searchVO.boardType == 'event'}">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual" style="background-image:url('/brand/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">EVENT</h2>
				<span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span>
			</div>
			<!-- //page-title -->
		</c:if>

		<!-- location-menu -->
		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>
		<!-- //location-menu -->

		<!-- contents -->
		<c:if test="${searchVO.boardType == 'notice'}">
			<div id="contents" class="content">
				<div class="inner">
					<!-- view-con -->
					<div class="view-con">
	
						<div class="view-top">
							<h3>
								<span class="ico-stamp">
								<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
		                      		<c:if test="${result.cate == codeResult.code}">${codeResult.name}</c:if>
		                      	</c:forEach>
								</span>${result.title}
							</h3>
							<ul class="info">
								<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
								<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
								<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
								<li class="ico-date">${regDttmp} ${regTime }</li>
									<c:if test="${not empty result.filename1}">
										<li class="ico-download">
											<a href="javascript:void(0);" onclick="fileDownload('${result.filename1 }');">첨부파일다운로드</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename2}">
										<li class="ico-download">
											<a href="javascript:void(0);" onclick="fileDownload('${result.filename2 }');">첨부파일다운로드</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename3}">
										<li class="ico-download">
											<a href="javascript:void(0);" onclick="fileDownload('${result.filename3 }');">첨부파일다운로드</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename4}">
										<li class="ico-download">
											<a href="javascript:void(0);" onclick="fileDownload('${result.filename4 }');">첨부파일다운로드</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename5}">
										<li class="ico-download">
											<a href="javascript:void(0);" onclick="fileDownload('${result.filename5 }');">첨부파일다운로드</a>
										</li>
									</c:if>
								<c:if test="${not empty result.source }">
								<%-- <li class="ico-link">${result.source}</li> --%>
								</c:if>
								<li class="ico-link"><a href="${result.url}" target="_blank">관련URL</a></li>
							</ul>
						</div>
	
						<div class="editer-con">
							${result.pc_contents}
						</div>
	
						<!-- page-control -->
						<div class="page-control">
								<c:if test="${not empty nextResult }" >
									<a href="/brand/community/notice/community_view.do?seq=${nextResult.seq }" class="prev"><span>이전글</span>${nextResult.title }</a>
								</c:if>
								<c:if test="${empty nextResult }" >
									<a href="javascript:void(0);" class="prev"><span>이전글</span>이전글이 없습니다.</a>
								</c:if>
								<c:if test="${not empty preResult }" >
									<a href="/brand/community/notice/community_view.do?seq=${preResult.seq }" class="next"><span>다음글</span>${preResult.title }</a>
								</c:if>
								<c:if test="${empty preResult }" >
									<a href="javascript:void(0);" class="next"><span>다음글</span>다음글이 없습니다.</a>
								</c:if>
						</div>
						<!-- //page-control -->
					</div>
					<!-- //view-con -->
					<div class="btn-box mt80">
						<a href="/brand/community/notice/community_list.do" class="btn-02 type-01">목록보기</a>
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${searchVO.boardType == 'event'}">
			<div id="contents" class="content">
				<div class="inner">
					<!-- view-con -->
					<div class="view-con">
	
						<div class="view-top">
							<h3>
								<c:if test="${result.store != null}"><span class="ico-stamp">${result.store }</span></c:if>${result.title }
							</h3>
							<ul class="info">
								<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
								<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
								<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
								<li class="ico-date">${regDttmp} ${regTime }</li>
								<c:if test="${not empty result.filename1}">
										<li class="ico-download">
											<a href="result.filename1">result.filename1</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename2}">
										<li class="ico-download">
											<a href="result.filename2">result.filename2</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename3}">
										<li class="ico-download">
											<a href="result.filename3">result.filename3</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename4}">
										<li class="ico-download">
											<a href="result.filename4">result.filename4</a>
										</li>
									</c:if>
									<c:if test="${not empty result.filename5}">
									<	li class="ico-download">
											<a href="result.filename5">result.filename5</a>
										</li>
									</c:if>
								<li class="ico-link"><a href="${result.url }"  target="_blank">${result.url }</a></li>
							</ul>
						</div>
	
						<div class="editer-con">
							${result.pc_contents }
						</div>
	
						<!-- page-control -->
						<div class="page-control">
							<c:if test="${not empty nextResult }" >
								<a href="/brand/community/event/community_view.do?seq=${nextResult.seq }" class="prev"><span>이전글</span>${nextResult.title }</a>
							</c:if>
							<c:if test="${empty nextResult }" >
								<a href="javascript:void(0);" class="prev"><span>이전글</span>이전글이 없습니다.</a>
							</c:if>
							<c:if test="${not empty preResult }" >
								<a href="/brand/community/event/community_view.do?seq=${preResult.seq }" class="next"><span>다음글</span>${preResult.title }</a>
							</c:if>
							<c:if test="${empty preResult }" >
								<a href="javascript:void(0);" class="next"><span>다음글</span>다음글이 없습니다.</a>
							</c:if>
						</div>
						<!-- //page-control -->
					</div>
					<!-- //view-con -->
	
					<div class="btn-box mt80">
						<a href="/brand/community/event/community_list.do" class="btn-02 type-01">목록보기</a>
					</div>
				</div>
			</div>
		</c:if>
		<!-- //contents -->
	</section>
	<!--// dBody -->
	
	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인, 매장찾기 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->
	
	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
	<!--// dFoot -->
	<iframe id="hiddenDownloader" style='visibility:hidden' src="" width="1" height="1"></iframe>
	<textarea id="textarea_area" style="display:none;" rows="" cols=""></textarea>

</div>
<!-- //wrap -->

<script src="/brand/common/js/front_ui.js"></script>
<script>
function fileDownload(fileUrl) {
	var fileName = fileUrl.split('/');
	location.href="/download.do?path="+fileUrl+"&fileName="+fileName[5];
}
</script>
</body>
</html>
