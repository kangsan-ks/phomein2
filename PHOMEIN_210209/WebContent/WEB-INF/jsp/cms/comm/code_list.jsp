<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>코드관리 | 공통 관리 | 포메인 통합관리자</title>
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
				<span>공동관리</span>
				<span>코드관리</span>
				<span>목록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">코드 관리 / 대분류</h3>
			
			<form name="searchForm" id="searchForm" action="code_list.do">
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
			</form>

			<form:form modelAttribute="code" id="modifyForm">
				<input type="hidden" name="seq" id="seq" value="" />
				<input type="hidden" id="pageIndex" name="pageIndex" value="${paginationInfo.currentPageNo }"/>
				<input type="hidden" id="type" name="type" value="${type }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>코드 관리 검색 입력 폼</legend>
						<table class="view">
							<caption>코드 관리 검색 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:160px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">사용여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<!-- <div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="0" checked><label for="radio0101"><span></span>전체</label></p></div> -->
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="1"><label for="radio0102"><span></span>사용</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0103" name="useyn" value="2"><label for="radio0103"><span></span>미사용</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">대분류코드 <span class="need"></span></th>
									<td>
										<input type="text" name="code" id="code" maxlength="3" placeholder="대분류코드를 입력하세요" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">대분류명 <span class="need"></span></th>
									<td>
										<input type="text" name="code_name" id="code_name" placeholder="대분류명을 입력하세요" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td>
										<input type="text" name="" id="" placeholder="" style="width:100%">
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<p class="btn-page-wrap">
						<a href="javascript:;" id="resetBtn" class="btn-01 type-02">초기화</a>
						<a href="javascript:;" id="submitBtn" class="btn-01 type-01">저장</a>
					</p>
				</div>
			</form:form>

			<div class="default-cell">
				<div class="table-sort">전체 : <span><fmt:formatNumber value="${paginationInfo.totalRecordCount}" pattern="#,###" /></span>건</div>
				<div class="table-list-data">
					<table class="list">
						<caption>팝업 관리 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:120px">
							<col style="width:auto">
							<col style="width:140px">
							<col style="width:180px">
							<col style="width:160px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">대분류코드</th>
								<th scope="col">대분류명</th>
								<th scope="col">사용여부</th>
								<th scope="col">관리</th>
								<th scope="col">중분류 관리</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty resultList }" >
								<c:forEach items="${resultList }" var="result" varStatus="status" >
								<input type="hidden" name="nextcode" value="${result.nextcode }"/>
								<tr>
									<td>${result.code }</td>
									<td class="al-l"><a href="#" class="btn-link">${result.name }</a></td>
									<td class="fc01"<c:if test="${result.useyn == 'Y'}">사용</c:if><c:if test="${result.useyn == 'N'}">미사용</c:if></td>
									<td>
										<div class="table-btns row">
											<p><a href="javascript:;" data-seq="${result.seq }" data-useyn="${result.useyn }" data-code="${result.code }" data-code_name="${result.name }" class="btn-01 type-02 round modifyBtn">수정</a></p>
											<p><a href="javascript:;" data-seq="${result.seq }" class="btn-01 type-03 round deleteBtn">삭제</a></p>
										</div>
									</td>
									<td>
										<div class="table-btns row">
											<p><a href="/admin/comm/code_list2.do?code=${result.code }&pcode=${result.code }&useyn=${result.useyn }&code_type=sub_code" class="btn-01 type-03 round">확인/등록</a></p>
										</div>
									</td>
								</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
							<!-- 등록된 게심물이 없을 경우 -->
							<input type="hidden" name="nextcode" value="${pcode }001"/>
							<tr>
								<td colspan="5"><p class="none-data">등록된 게시물이 없습니다</p></td>
							</tr>
							<!-- //등록된 게심물이 없을 경우 -->
							</c:otherwise>
						</c:choose>
							<!-- 
							<tr>
								<td>A02</td>
								<td class="al-l"><a href="#" class="btn-link">제목 클릭 시 수정하기, 수정하기 영역 노출</a></td>
								<td class="fc03">사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>A03</td>
								<td class="al-l"><a href="#" class="btn-link">한 페이지 노출되는 게시글은 10개</a></td>
								<td class="fc03">사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>B01</td>
								<td class="al-l"><a href="#" class="btn-link">제목란 보다 입력된 제목의 글이 많은 경우 ... 처리</a></td>
								<td class="fc01">미사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>B02</td>
								<td class="al-l"><a href="#" class="btn-link">최근 등록된 게시물 순으로 노출</a></td>
								<td class="fc01">미사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>A01</td>
								<td class="al-l"><a href="#" class="btn-link">제목은 좌축 정렬</a></td>
								<td class="fc01">미사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>A02</td>
								<td class="al-l"><a href="#" class="btn-link">제목 클릭 시 수정하기, 수정하기 영역 노출</a></td>
								<td class="fc03">사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>A03</td>
								<td class="al-l"><a href="#" class="btn-link">한 페이지 노출되는 게시글은 10개</a></td>
								<td class="fc03">사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>B01</td>
								<td class="al-l"><a href="#" class="btn-link">제목란 보다 입력된 제목의 글이 많은 경우 ... 처리</a></td>
								<td class="fc01">미사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>B02</td>
								<td class="al-l"><a href="#" class="btn-link">최근 등록된 게시물 순으로 노출</a></td>
								<td class="fc01">미사용</td>
								<td>
									<div class="table-btns row">
										<p><a href="#" class="btn-01 type-02 round">수정</a></p>
										<p><a href="#" class="btn-01 type-03 round">삭제</a></p>
									</div>
								</td>
								<td>
									<div class="table-btns row">
										<p><a href="/admin/comm/code_list.do?code=${code }" class="btn-01 type-03 round">확인/등록</a></p>
									</div>
								</td>
							</tr>
							-->
						</tbody>
					</table>
				</div>
				<div class="paging-wrap">
					<div class="paging">
						<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
						<!--  
						<div class="paging">
							<a href=""><img src="/asset/images/util/paging_first.png" alt="첫번째 목록으로 이동"></a>
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
							<a href=""><img src="/asset/images/util/paging_last.png" alt="마지막 목록으로 이동"></a>
						</div>
						-->
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
<script src="/asset/common/js/jquery.validate.js"></script>
<script>
$(function() {
	var $modifyForm = $('#modifyForm');
	
	if ($modifyForm !== undefined && $modifyForm !== null) {
		
		$modifyForm.find('input[type=text]').each(function() {
			$(this).keydown(function(event) {
				if(event.keyCode === 13) {
					$modifyForm.submit();
				};
			});
		});
		
	}
});

$(function(){
	$("#code").val($("input[name='nextcode']").val());
	
	//Jquery Validate 공통
	function commonValidator(targetForm, ignore, rules, messages, submitFunction) {
	    targetForm.validate({
	        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
	        onfocusout: false,  //onblur 시 해당항목을 validation 할 것인지 여부 (default: true)
	        ignore: ignore,    //name을 부여하지 않은 tag ignore Ex) '*:not([name])'
	        rules: rules,
	        messages: messages,
	        errorPlacement: function (error, element) {
	            /*
	             	validator는 기본적으로 validation 실패 시 실패한 노드 우측에 실패 메시지를 표시하게 되어있다. 작동을 원하지 않으면 내용이 없는 errorPlacement를 선언한다.
	            */
	            // do nothing
	        },
	        invalidHandler: function (form, validator) {
	        	/*
	            	validation 실패 시의 핸들러를 정의한다.
	            	실패 시 메시지를 alert으로 표시하도록 되어 있다.
	            */
	            var errors = validator.numberOfInvalids();
	            if (errors) {
	                alert(validator.errorList[0].message);
	                validator.errorList[0].element.focus();
	            }
	 
	        },
	        submitHandler: submitFunction
		        /*
				         유효성 검사가 완료된 뒤 수행할 핸들러를 정의한다.
				         주의 할 점은 이 옵션을 명시할 경우 'submit' 이벤트만 발생하며 실제 FORM 전송은 일어나지 않는다는 것이다.
				         만약 submitHandler를 명시하지 않으면 유효성 검사 후 온전한 submit을 수행한다.
		        */
	    });
	    $.validator.addMethod('maxlength', function(value, element, param) {
	        return (value.length == param);
	    });
	}
	
	//**********************************************************************************
	//Jquery Validate
	//**********************************************************************************
	var targetForm = $('#modifyForm');
	var ignore = '*:not([name])';  //default : [] - display none ignore
	var rules = {
		useyn: {
			required: true
		},
	    code: {
	        required: true,
	        maxlength: 3
	    },
	   	code_name: {
	        required: true
	    }
	};
	var message = {
		useyn: {
			required: '사용여부를 선택하세요'
		},
		code: {
	        required: '대분류코드를 입력하세요',
	        maxlength: '대분류코드는 3자리 입니다'
	    },
	    code_name: {
	        required: '대분류명을 입력하세요'
	    }
	};
	var submitFunction = function () {
    	var seq = $("#seq").val();
    	var useyn = $("input[name='useyn']:checked").val() == '1' ? 'Y' : 'N';
    	var code = $("#code").val();
    	var code_name = $("#code_name").val();
    	var code_type = 'code';
    	var type = $("#type").val();
    	
	    $.ajax({
            url: "/admin/comm/code_modify.do",
            type: "POST",
            data: {
            	'seq' : seq,
            	'useyn' : useyn,
            	'code' : code,
            	'code_name' : code_name,
            	'code_type' : code_type,
            	'type' : type,
            	'ordr' : '1'
            },
            dataType: 'json',
            success: function (data) {
            	// validation 체크
            	if(!!data.errors) {
            		data.errors.forEach(function(error){
        				if(!!error.codes) {
	            			alert(error.codes[error.codes.length - 1]);
        				}
            		});
            	}
            	
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			alert('정상적으로 등록되었습니다.');
            			location.href="/admin/comm/code_list.do?useyn=" + useyn + "&code=" + code + "&pcode=" + code + "&code_name=" + code_name + "&code_type=code&type=udt";
            		} else {
            			alert('동일한 코드가 이미 존재합니다.');
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
	commonValidator(targetForm, ignore, rules, message, submitFunction);
	
	// 초기화
	$("#resetBtn").on("click", function(){
		$("input[name='useyn']").prop("checked", false);
		$("input[name='useyn']:eq(0)").prop("checked", true);
		$("input[name='code']").val("");
		$("input[name='code_name']").val("");
		$("input[name='type']").val("reg");
	});
	
	// 저장
	$("#submitBtn").on("click", function(){
		$("#modifyForm").submit();
	});
	
	// 삭제
	$(".deleteBtn").on("click", function(){
	    $.ajax({
            url: "/admin/comm/code_delete.do",
            type: "POST",
            data: {
            	'seq' : $(this).data("seq")
            },
            dataType: 'json',
            success: function (data) {
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			alert('삭제되었습니다.');
            		} else {
            			alert('자식 코드가 존재하여 삭제할 수 없습니다.');
            		}
            		location.reload();
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
	
	// 수정
	$(".modifyBtn").on("click", function(){
		if($(this).data("useyn") == 'Y')
			$("input[name='useyn']:eq(1)").prop("checked", true);
		else if($(this).data("useyn") == 'N')
			$("input[name='useyn']:eq(2)").prop("checked", true);
		
		$("input[name='code']").val($(this).data("code"));
		$("input[name='code_name']").val($(this).data("code_name"));
		$("input[name='type']").val("udt");
		$("input[name='seq']").val($(this).data("seq"));
	});
});
</script>
</body>
</html>
