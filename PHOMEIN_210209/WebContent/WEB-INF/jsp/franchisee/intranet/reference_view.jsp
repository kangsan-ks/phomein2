<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>자료실 상세 | 인트라넷 | 포메인 가맹점 관리</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
</head>
<body>

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<header id="dHead">
		<!-- header-wrap -->
		<%@ include file="/WEB-INF/jsp/include/storeheader.jspf"%>
		<!-- //header-wrap -->
	</header>
	<!--// dHead -->


	<!-- dBody -->
	<section id="dBody">
		<!-- lnb -->
		<jsp:include page="/store/include/storelnb.do" />
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">

			<!-- location -->
			<p class="location">
				<span>인트라넷</span>
				<span>자료실</span>
				<span>상세</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">자료실</h3>
			<form name="searchForm" id="searchForm" method="get" action="./reference_list.do" >
				<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
				<input type="hidden" name="searchCondition" id="searchCondition" value="" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
			</form>
			<div class="default-cell">
				<h4 class="sub-title">자료실 상세<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<div class="table-list-data">
					<fieldset>
						<legend>자료실 상세 기본정보 입력 폼</legend>
						<table class="view">
							<caption>자료실 상세 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목 <span class="need"></span></th>
									<td><c:out value="${result.title }"/></td>
								</tr>
								<tr>
									<th scope="row">내용 <span class="need"></span></th>
									<td>${fnc:xssContents(result.contents) }</td>
								</tr>
								<tr>
									<th scope="row">첨부파일 <span class="need"></span></th>
									<td>
										<ul class="file-list">
										<c:if test="${result.filename1 != ''}">
											<li><a href="/download.do?path=${result.filename1}&fileName=${result.orgfilename1 }">${result.orgfilename1 }</a></li>
										</c:if>
										<c:if test="${result.filename2 != ''}">
											<li><a href="/download.do?path=${result.filename2}&fileName=${result.orgfilename2 }">${result.orgfilename2 }</a></li>
										</c:if>
										<c:if test="${result.filename3 != ''}">
											<li><a href="/download.do?path=${result.filename3}&fileName=${result.orgfilename3 }">${result.orgfilename3 }</a></li>
										</c:if>
										<c:if test="${result.filename4 != ''}">
											<li><a href="/download.do?path=${result.filename4}&fileName=${result.orgfilename4 }">${result.orgfilename4 }</a></li>
										</c:if>
										<c:if test="${result.filename5 != ''}">
											<li><a href="/download.do?path=${result.filename5}&fileName=${result.orgfilename5 }">${result.orgfilename5 }</a></li>
										</c:if>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<a href="#" onclick="goList();" class="btn-01 type-02">목록</a>
				</p>
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
	$(".datepicker").datepicker({
		showOn:"both",
		buttonImage:"/asset/images/datepicker/btn_datepicker.png",
		buttonImageOnly:true,
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});
});



function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}

</script>
</body>
</html>
