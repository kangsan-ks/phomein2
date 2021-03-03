<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>
</head>
<body>
<!-- wrap -->
<div id="wrap">
	<!-- skip nav -->
	<div id="skip_nav">
        <a href="#content">본문 바로가기</a>
    </div>
    <!-- //skip nav -->
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<c:if test="${searchVO.boardType == 'notice'}">
			<div class="sub_visual sv4">
				<h3>공지 &amp; 언론보도</h3>
			</div>
		</c:if>
		<c:if test="${searchVO.boardType == 'event'}">
			<div class="sub_visual sv4">
				<h3>EVENT</h3>
			</div>
		</c:if>
		<c:if test="${searchVO.boardType == 'sns'}">
			<h3>SNS</h3>
		</c:if>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			CS CENTER : class="sub_visual sv5"
			ETC 	  : class="sub_visual sv6"
		-->
		<!-- //sub visual -->
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<c:if test="${searchVO.boardType == 'notice'}">
			<div id="content" class="community">
				<!-- 상세 영역 -->
				<div class="detail_area">
					<div class="detail_head">
						<span class="flag">
							<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
	                      		<c:if test="${result.cate == codeResult.code}">${codeResult.name}</c:if>
	                      	</c:forEach>
						</span>
						<span class="tit">${result.title}</span>
						<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
						<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
						<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
						<span class="date">${regDttmp} ${regTime }</span>
					</div>
					<div class="detail_link">
						<c:if test="${not empty result.filename1}">
							<span class="file">
								<a href="javascript:void(0);" onclick="fileDownload('${result.filename1 }');">첨부파일다운로드</a>
							</span>
						</c:if>
						<c:if test="${not empty result.filename2}">
							<span class="file">
								<a href="javascript:void(0);" onclick="fileDownload('${result.filename2 }');">첨부파일다운로드</a>
							</span>
						</c:if>
						<c:if test="${not empty result.filename3}">
							<span class="file">
								<a href="javascript:void(0);" onclick="fileDownload('${result.filename3 }');">첨부파일다운로드</a>
							</span>
						</c:if>
						<c:if test="${not empty result.filename4}">
							<span class="file">
								<a href="javascript:void(0);" onclick="fileDownload('${result.filename4 }');">첨부파일다운로드</a>
							</span>
						</c:if>
						<c:if test="${not empty result.filename5}">
							<span class="file">
								<a href="javascript:void(0);" onclick="fileDownload('${result.filename5 }');">첨부파일다운로드</a>
							</span>
						</c:if>
						<c:if test="${not empty result.source }">
							<%-- <span class="link">${result.source}	</span> --%>
						</c:if>
						<c:if test="${not empty result.url }">
							<span class="link">
								<a href="${result.url}">관련URL</a>	
							</span>
						</c:if>
						
					</div>
					<div class="detail_body">
						${result.m_contents}
					</div>
					<div class="list_pg">
						<c:if test="${not empty nextResult }" >
							<a href="/mbrand/community/notice/community_view.do?seq=${nextResult.seq }" class="btn_prev">이전글</a>
						</c:if>
						<c:if test="${empty nextResult }" >
							<a href="javascript:void(0);" class="btn_prev">이전글</a>
						</c:if>
						<c:if test="${not empty preResult }" >
							<a href="/mbrand/community/notice/community_view.do?seq=${preResult.seq }" class="btn_next">다음글</a>
						</c:if>
						<c:if test="${empty preResult }" >
							<a href="javascript:void(0);" class="btn_next">다음글</a>
						</c:if>
					</div>
					<!-- 버튼 영역 -->
					<div class="btn_area">
						<a href="/mbrand/community/notice/community_list.do" class="btn_tyf c_black">목록보기</a>
					</div>
					<!-- //버튼 영역 -->
				</div>
				<!-- //상세 영역 -->
			</div>
		</c:if>
		<c:if test="${searchVO.boardType == 'event'}">
			<div id="content" class="community">
				<!-- 상세 영역 -->
				<div class="detail_area">
					<div class="detail_head">
						<c:if test="${result.store != null}"><span class="flag">${result.store }</span></c:if>
						<span class="tit">${result.title }</span>
						<span class="date"><c:out value="${result.startdt }" /> ~ <c:out value="${result.enddt }" /></span>
					</div>
					<div class="detail_body">
						${result.m_contents}
					</div>
					<div class="list_pg">
						<c:if test="${not empty nextResult }" >
							<a href="/mbrand/community/event/community_view.do?seq=${nextResult.seq }" class="btn_prev">이전글</a>
						</c:if>
						<c:if test="${empty nextResult }" >
							<a href="javascript:void(0);" class="btn_prev">이전글</a>
						</c:if>
						<c:if test="${not empty preResult }" >
							<a href="/mbrand/community/event/community_view.do?seq=${preResult.seq }" class="btn_next">다음글</a>
						</c:if>
						<c:if test="${empty preResult }" >
							<a href="javascript:void(0);" class="btn_next">다음글</a>
						</c:if>
					</div>
					<!-- 버튼 영역 -->
					<div class="btn_area">
						<a href="/mbrand/community/event/community_list.do" class="btn_tyf c_black">목록보기</a>
					</div>
					<!-- //버튼 영역 -->
				</div>
			</div>
			<!-- //상세 영역 -->
		</c:if>	
		<!-- //content -->
	</div> 
	<!-- //container -->
	<!-- footer -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->
</div>
<!-- //wrap -->
<script src="/mbrand/common/js/jquery-1.12.4.min.js"></script>
<script src="/mbrand/common/js/swiper.min.js"></script>
<script src="/mbrand/common/js/common.js"></script>
<script>
function fileDownload(fileUrl) {
	var fileName = fileUrl.split('/');
	location.href="/download.do?path="+fileUrl+"&fileName="+fileName[5];
}
</script>
</body>
</html>
