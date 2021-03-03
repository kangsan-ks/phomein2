<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>가맹점자의 | 문의 관리 | 포메인 통합관리자</title>
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
				<span>가맹점문의</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">가맹점 문의</h3>

			<input type="hidden" name="seq" id="seq" value="${seq }" />
			<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
			<input type="hidden" name="search_working" id="search_working" value="${search_working }" />
			<input type="hidden" name="search_name" id="search_name" value="${search_name }" />
			<input type="hidden" name="search_hp" id="search_hp" value="${search_hp }" />
			<input type="hidden" name="search_email" id="search_email" value="${search_email }" />
			<div class="default-cell">
				<h4 class="sub-title">가맹점 문의 상세/수정</h4>
				<div class="table-list-data">
					<fieldset>
						<legend>가맹점 문의 상세/수정 기본정보 테이블</legend>
						<table class="view">
							<caption>가맹점 문의 상세/수정 기본정보 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td>${resultView.title }</td>
								</tr>
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
									<th scope="row">창업희망지역</th>
									<td>${resultView.uparea }</td>
								</tr>
								<tr>
									<th scope="row">예상창업비용</th>
									<td>${resultView.upprice } 만원</td>
								</tr>
								<tr>
									<th scope="row">창업 희망 브랜드</th>
									<td>
										<c:choose>
											<c:when test="${resultView.storetype == 'P'}"><img src="/company/images/content/logo.png" alt="" style="width: 60px; margin-right:10px;">포메인</c:when>
											<c:when test="${resultView.storetype == 'R'}"><img src="/company/images/content/logo_red.png" alt="" style="width: 60px; margin-right:10px;">포메인 레드</c:when>
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">점포보유유무</th>
									<td>
										<c:choose>
											<c:when test="${resultView.storeyn == 'Y'}">보유</c:when>									
											<c:when test="${resultView.storeyn == 'N'}">미보유</c:when>																
										</c:choose>
									</td>
								</tr>
								<tr>
									<th scope="row">문의내용</th>
									<td>${resultView.contents }</td>
								</tr>
								<tr>
									<th scope="row">진행상태 <span class="need"></span></th>
									<td><p class="check-type01"><input type="checkbox" id="c02" name="check" <c:if test="${resultView.answeryn == 'Y' }">checked disabled</c:if>><label for="c02"><span></span>답변완료</label></p></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<a href="javascript:;" id="listBtn" class="btn-01 type-02">목록</a>
					<c:if test="${empty resultView.answeryn || resultView.answeryn == 'N' }">
						<a href="javascript:;" id="submitBtn" class="btn-01 type-01">저장</a>
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
$(function(){
	$("#hp_pattern").text($("#hp_pattern").text().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3"));
	
	// 저장
	$("#submitBtn").on("click", function(){
		if(!$("input[name='check']").is(":checked")) {
			alert("진행상태를 선택하세요");
			return false;
		}
	
		$.ajax({
	        url: "/admin/customer/customer_modify.do",
	        type: "POST",
	        data: {
	        	'seq' : $("#seq").val(),
	        	'answer' : $("input[name='check']").is(":checked") ? 'Y' : '',
	        	'answeryn' : 'Y',
	        	'working' : 'N',
	        	'code' : 'store'
	        },
	        dataType: 'json',
	        success: function (data) {
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			alert('답변작성이 완료되었습니다.');
            			location.href="/admin/customer/store_inquiry_list.do";
            		} else if(data.result == 'FAIL') {
            			alert('진행상태를 선택해주세요');
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
	});
	
	// 목록
	$("#listBtn").on("click", function(){
		location.href='/admin/customer/store_inquiry_list.do?seq=' + $("#seq").val() + '&pageIndex=' + $("#pageIndex").val() + '&search_working=' + $("#search_working").val() + '&search_name=' + $("#search_name").val()  + '&search_hp=' + $("#search_hp").val()  + '&search_email=' + $("#search_email").val();
	});
	
});
</script>
</body>
</html>
