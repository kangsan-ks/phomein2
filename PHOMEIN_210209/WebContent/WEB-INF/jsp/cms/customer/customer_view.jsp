<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>고객의소리 | 문의 관리 | 포메인 통합관리자</title>
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
				<span>고객의소리</span>
				<span>상세/답변</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">고객의 소리</h3>

			<div class="default-cell">
				<h4 class="sub-title">고객의 소리 상세/답변</h4>
				
				<div class="table-list-data">
					<fieldset>
						<legend>고객의 소리 상세/답변 기본정보 테이블</legend>
						<table class="view">
							<caption>고객의 소리 상세/답변 기본정보 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">문의구분</th>
									<td>
										<c:if test="${resultView.cate == null }">다국어</c:if>
										<c:forEach var="codeResult" items="${ fnc:codeListSub('110') }" varStatus="status">
											<c:if test="${resultView.cate == codeResult.code}"><c:out value="${codeResult.name}"/></c:if>
										</c:forEach>
									</td>
								</tr>
								<c:if test="${resultView.cate == '110201'}">
									<tr>
										<th scope="row">방문매장 / 방문일</th>
										<td>
										${resultView.visitstore } / 
										<fmt:parseDate value="${resultView.visitdate}" var="visitdate" pattern='yyyy-MM-dd HH:mm:ss'/>
										<fmt:formatDate value="${visitdate}" pattern='yyyy-MM-dd' var="visitDttmp"/>
										<c:out value="${visitDttmp }" />
										</td>
									</tr>
								</c:if>
								<tr>
									<th scope="row">이름</th>
									<td>${resultView.name }</td>
								</tr>
								<tr>
									<th scope="row">연락처</th>
									<td id="hp_pattern">${resultView.hp }</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>${resultView.email }</td>
								</tr>
								<tr>
									<th scope="row">회신요청</th>
									<td>
										<c:choose>
											<c:when test="${resultView.feedkind == 'mobile'}">유선</c:when>									
											<c:when test="${resultView.feedkind == 'email'}">이메일</c:when>																
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td>${resultView.title }</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td>${resultView.contents }</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<ul class="file-list">
											<c:if test="${not empty resultView.filename1}">
											<li>
												<a href="javascript:;" style="cursor:pointer;" onclick="fileDownload('${resultView.filename1 }');">
													<c:set var="splitStr" value="${fn:split(resultView.filename1, '/') }" />
													${splitStr[3]}
												</a>
											</li>
											</c:if>
											<c:if test="${not empty resultView.filename2}">
											<li>
												<a href="javascript:;" style="cursor:pointer;" onclick="fileDownload('${resultView.filename2 }');">
													<c:set var="splitStr" value="${fn:split(resultView.filename2, '/') }" />
													${splitStr[3]}
												</a>
											</li>
											</c:if>
											<c:if test="${not empty resultView.filename3}">
											<li>
												<a href="javascript:;" style="cursor:pointer;" onclick="fileDownload('${resultView.filename3 }');">
													<c:set var="splitStr" value="${fn:split(resultView.filename3, '/') }" />
													${splitStr[3]}
												</a>
											</li>
											</c:if>
											<c:if test="${not empty resultView.filename4}">
											<li>
												<a href="javascript:;" style="cursor:pointer;" onclick="fileDownload('${resultView.filename4 }');">
													<c:set var="splitStr" value="${fn:split(resultView.filename4, '/') }" />
													${splitStr[3]}
												</a>
											</li>
											</c:if>
											<c:if test="${not empty resultView.filename5}">
											<li>
												<a href="javascript:;" style="cursor:pointer;" onclick="fileDownload('${resultView.filename5 }');">
													<c:set var="splitStr" value="${fn:split(resultView.filename5, '/') }" />
													${splitStr[3]}
												</a>
											</li>
											</c:if>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<h4 class="sub-title mt40">진행상태<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				
				<input type="hidden" name="seq" id="seq" value="${seq }" />
				<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
				<input type="hidden" name="type" id="type" value="${type }" />
				<input type="hidden" name="search_cate" id="search_cate" value="${search_cate }" />
				<input type="hidden" name="search_working" id="search_working" value="${search_working }" />
				<input type="hidden" name="search_name" id="search_name" value="${search_name }" />
				<input type="hidden" name="search_hp" id="search_hp" value="${search_hp }" />
				<input type="hidden" name="search_email" id="search_email" value="${search_email }" />
				<div class="table-list-data">
					<fieldset>
						<legend>고객의 소리 답변 진행상태 테이블</legend>
						<table class="view">
							<caption>고객의 소리 답변 진행상태 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">진행상태</th>
									<td class="fc01">
										<c:choose>
											<c:when test="${resultView.working == 'Y'}">접수완료</c:when>									
											<c:when test="${resultView.working == 'N'}">답변완료</c:when>																
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">회신방법</th>
									<td>
										<c:choose>
											<c:when test="${resultView.feedkind == 'mobile'}">유선</c:when>									
											<c:when test="${resultView.feedkind == 'email'}">이메일</c:when>																
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">답변내용 <span class="need"></span></th>
									<td>
										<c:if test="${type == 'udt'}">
											<textarea name="answer" id="answer">${resultView.answer }</textarea>
											<span class="input-block-info">- 등록된 답변 내용은 이메일로 자동 발송 됩니다.</span>
										</c:if>
										<c:if test="${empty type || type == 'reg'}">
											${resultView.answer }
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">답변일</th>
									<td>
										<p class="table-date">
										<fmt:parseDate value="${resultView.nowdt}" var="nowdt" pattern='yyyy-MM-dd HH:mm:ss'/>
										<fmt:formatDate value="${nowdt}" pattern='yyyy.MM.dd' var="nowDttmp"/>
										<fmt:formatDate value="${nowdt}" pattern='HH:mm:ss' var="nowTime"/>
										<c:out value="${nowDttmp }" />
										<span>(<c:out value="${nowTime }"/>)</span>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">답변작성</th>
									<td>${adminSession.adminid }</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<c:if test="${type == 'udt'}">
						<a href="javascript:;" id="listBtn" class="btn-01 type-02">목록</a>
						<a href="javascript:;" id="submitBtn" class="btn-01 type-01">저장</a>
					</c:if>
					<c:if test="${empty type || type == 'reg'}">
						<a href="javascript:;" id="listBtn" class="btn-01 type-02">목록</a>
					</c:if>
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
function fileDownload(fileUrl) {
	var fileName = fileUrl.split('/');
	location.href="/download.do?path="+fileUrl+"&fileName="+fileName[4];
}
$(function(){
	$("#hp_pattern").text($("#hp_pattern").text().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
	
	// 저장
	$("#submitBtn").on("click", function(){
		if($("#answer").val() == '') {
			alert("답변내용을 입력하세요");
			return false;
		}
		var feedKind = "${ resultView.feedkind }";
		var confMsg = "";
		if( feedKind == 'email' ){
			confMsg	= "등록된 답변내용은 고객에게 이메일로 자동 발송됩니다. 저장하시겠습니까?";
		}else{
			confMsg = "저장하시겠습니까?";
		}
		
		if( confirm(confMsg) ){
			$.ajax({
		        url: "/admin/customer/customer_modify.do",
		        type: "POST",
		        data: {
		        	'seq' : $("#seq").val(),
		        	'answer' : $("#answer").val(),
		        	'answeryn' : 'Y',
		        	'working' : 'N',
		        	'code' : 'customer'
		        },
		        dataType: 'json',
		        success: function (data) {
	            	if(!!data.result) {
	            		if(data.result == 'SUCCESS') {
	            			alert('답변작성이 완료되었습니다.');
	            			location.href="/admin/customer/customer_list.do";
	            		} else if(data.result == 'FAIL') {
	            			alert('답변내용을 입력해주세요');
	            			return false;
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
	
	// 목록
	$("#listBtn").on("click", function(){
		location.href='/admin/customer/customer_list.do?seq=' + $("#seq").val() + '&pageIndex=' + $("#pageIndex").val() + '&search_cate=' + $("#search_cate").val() + '&search_working=' + $("#search_working").val() + '&search_name=' + $("#search_name").val()  + '&search_hp=' + $("#search_hp").val()  + '&search_email=' + $("#search_email").val();
	});
	
});
</script>
</body>
</html>
