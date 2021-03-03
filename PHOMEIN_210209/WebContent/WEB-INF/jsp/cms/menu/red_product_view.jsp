<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="ko">
<head>
<title>제품관리 | 메뉴관리 | 포메인 통합관리자</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
<script type="text/javascript">
$(function() {
	var $cPrice = $('#c_price');
	$cPrice.val(Number($cPrice.val()).toLocaleString());
});
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
				<span>메뉴관리</span>
				<span>제품관리</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">제품관리(RED)</h3>

			<div class="default-cell">
				<h4 class="sub-title"><c:if test="${type == 'reg'}">제품 등록</c:if><c:if test="${type == 'udt'}">제품 상세/수정</c:if><span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				
				<form:form modelAttribute="product" id="modifyForm">
					<input type="hidden" name="seq" id="seq" value="${seq }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
					<input type="hidden" name="type" id="type" value="${type }" />
					<input type="hidden" name="pcodeYn" id="pcodeYn" value="" />
					<input type="hidden" name="search_useyn" id="search_useyn" value="${search_useyn }" />
					<input type="hidden" name="search_site_ck" id="search_site_ck" value="${search_site_ck }" />
					<input type="hidden" name="search_name" id="search_name" value="${search_name }" />
					<input type="hidden" name="selected_kr_code" id="selected_kr_code" value="${resultView.kr_code }" />
					<input type="hidden" name="selected_en_code" id="selected_en_code" value="${resultView.en_code }" />
					<input type="hidden" name="selected_jp_code" id="selected_jp_code" value="${resultView.jp_code }" />
					<div class="table-list-data">
						<fieldset>
							<legend>제품 상세/수정 기본정보 입력 폼</legend>
							<table class="view">
								<caption>제품 상세/수정 기본정보 입력 폼 테이블</caption>
								<colgroup>
									<col style="width:200px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" style="background:#FCD9DB">노출여부 <span class="need"></span></th>
										<td>
											<div class="mulity-check-radio">
												<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" <c:if test="${resultView.useyn == 'Y'}">checked</c:if>><label for="radio0101"><span></span>노출</label></p></div>
												<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" <c:if test="${resultView.useyn == 'N'}">checked</c:if>><label for="radio0102"><span></span>미노출</label></p></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">제품명 <span class="need"></span></th>
										<td><input type="text" style="width:100%" id="name" name="name" value="${resultView.name }"></td>
									</tr>
									<c:if test="${type == 'udt'}">
										<tr>
											<th scope="row" style="background:#FCD9DB">제품코드 <span class="need"></span></th>
											<td>${resultView.pcode }</td>
										</tr>
									</c:if>
									<c:if test="${type == 'reg'}">
										<tr>
											<th scope="row" style="background:#FCD9DB">제품코드 <span class="need"></span></th>
											<td>
												<p class="input-btns">
													<input type="text" name="pcode" id="pcode" style="width:250px">
													<a href="javascript:;" id="checkPcodeBtn" class="btn-01 type-03 round">중복체크</a>
													<span id="pcode_txt"></span>
												</p>
											</td>
										</tr>
									</c:if>
									<tr>
										<th scope="row" style="background:#FCD9DB">사용범위 <span class="need"></span></th>
										<td>
											<div class="mulity-check-radio">
												<c:forEach var="codeResult" items="${ fnc:codeListSub('101') }" varStatus="status">
													<div>
														<p class="check-type01">
															<input type="checkbox" id="<c:out value="${codeResult.code}"/>" name="site_ck" 
															value='Y' <c:if test="${codeResult.code == '101201' && resultView.kr_ck == 'Y' }">checked</c:if>
																	  <c:if test="${codeResult.code == '101202' && resultView.en_ck == 'Y' }">checked</c:if>
																	  <c:if test="${codeResult.code == '101203' && resultView.jp_ck == 'Y' }">checked</c:if> />
															<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
														</p>
													</div>
												</c:forEach>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">국문 메뉴 카테고리<span class="need"></span></th>
										<td>
											<div class="row-input-wrap">
												<div>
													<select name="kr_code" style="width:200px">
														<option value="">중분류명</option>
														<c:forEach items="${kr_code }" var="result" varStatus="status">
															<option value="${result.code }" <c:if test="${fn:contains(resultView.kr_code, result.code)}">selected="selected"</c:if>>${result.name }</option>
														</c:forEach>
													</select>
												</div>
												<div>
													<select id="sub_kr_code" style="width:200px">
													</select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">영문 메뉴 카테고리<span class="need"></span></th>
										<td>
											<div class="row-input-wrap">
												<div>
													<select name="en_code" style="width:200px">
														<option value="">중분류명</option>
														<c:forEach items="${en_code }" var="result" varStatus="status">
															<option value="${result.code }" <c:if test="${fn:contains(resultView.en_code, result.code)}">selected="selected"</c:if>>${result.name }</option>
														</c:forEach>
													</select>
												</div>
												<div>
													<select id="sub_en_code" style="width:200px">
													</select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">일문 메뉴 카테고리<span class="need"></span></th>
										<td>
											<div class="row-input-wrap">
												<div>
													<select name="jp_code" style="width:200px">
														<option value="">중분류명</option>
														<c:forEach items="${jp_code }" var="result" varStatus="status">
															<option value="${result.code }" <c:if test="${fn:contains(resultView.jp_code, result.code)}">selected="selected"</c:if>>${result.name }</option>
														</c:forEach>
													</select>
												</div>
												<div>
													<select id="sub_jp_code" style="width:200px">
													</select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">국문 제품명 <span class="need"></span></th>
										<td><input type="text" style="width:100%" id="kr_name" name="kr_name" value="${resultView.kr_name }"></td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">영문 제품명 <span class="need"></span></th>
										<td><input type="text" style="width:100%" id="en_name" name="en_name" value="${resultView.en_name }"></td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">일문 제품명 <span class="need"></span></th>
										<td><input type="text" style="width:100%" id="jp_name" name="jp_name" value="${resultView.jp_name }"></td>
									</tr>
									<!-- 가격설정 선택시  -->
									<tr>
										<th scope="row" style="background:#FCD9DB">가격설정 <span class="need"></span></th>
										<td>
											<div class="mulity-row-input-wrap">
												<p class="radio-type01"><input type="radio" id="c_y" name="c_yn" value="Y" <c:if test="${resultView.c_yn == 'Y' }">checked</c:if>><label for="c_y"><span></span>사이즈</label></p>
												<p class="radio-type01"><input type="radio" id="c_n" name="c_yn" value="N" <c:if test="${resultView.c_yn == 'N' }">checked</c:if>><label for="c_n"><span></span>공통</label></p>
												<div class="cell" id="size_price" style="display:none;">
													<div class="row-input-wrap">
														<div><label for="text0101">S 사이즈 </label><input type="text" name="s_price" id="s_price" style="width:150px" class="al-r onlyNumber" value="${resultView.s_price }"><span class="char">원</span></div>
														<div><label for="text0102">L 사이즈 </label><input type="text" name="l_price" id="l_price" style="width:150px" class="al-r onlyNumber" value="${resultView.l_price }"><span class="char">원</span></div>
													</div>
												</div>
												<div class="cell" id="common_price" style="display:none;">
													<div class="row-input-wrap">
														<div><input type="text" name="c_price" id="c_price" style="width:150px" class="al-r" value="${resultView.c_price }"><span class="char">원</span></div>
													</div>
												</div>
											</div>
										</td>
									</tr>
									<!-- //가격설정 선택시  -->
									<tr>
										<th scope="row" style="background:#FCD9DB">국문 메뉴 설명 <span class="need"></span></th>
										<td><input type="text" name="kr_menu" id="kr_menu" style="width:100%" value="${resultView.kr_menu }"></td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">영문 메뉴 설명 <span class="need"></span></th>
										<td><input type="text" name="en_menu" id="en_menu" style="width:100%" value="${resultView.en_menu }"></td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">일문 메뉴 설명 <span class="need"></span></th>
										<td><input type="text" name="jp_menu" id="jp_menu" style="width:100%" value="${resultView.jp_menu }"></td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">설정<span class=""></span></th>
										<td>
											<div class="mulity-check-radio">
												<div><p class="check-type01"><input type="checkbox" id="best_ck" value="${resultView.best_ck == 'Y' ? 'Y' : 'N' }" <c:if test="${resultView.best_ck == 'Y'}">checked</c:if>><label for="best_ck"><span></span>BEST</label></p></div>
												<div><p class="check-type01"><input type="checkbox" id="hot_ck" value="${resultView.hot_ck == 'Y' ? 'Y' : 'N'}" <c:if test="${resultView.hot_ck == 'Y'}">checked</c:if>><label for="hot_ck"><span></span>SPICY</label></p></div>
												<div><p class="check-type01"><input type="checkbox" id="new_ck" value="${resultView.new_ck == 'Y' ? 'Y' : 'N'}" <c:if test="${resultView.new_ck == 'Y'}">checked</c:if>><label for="new_ck"><span></span>NEW</label></p></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">제품이미지<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
										<td>
											<ul class="file-parent" style="width:700px">
												<li class="add-input">
													<div class="add-file">
														<div class="file-input">
															<input type="hidden" name="f_file1_del" id="f_file1_del" value=""/>
															<input type="file" name="f_file1" id="f_file1" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="f_file1_txt" id="f_file1_txt" value="${resultView.f_file1 }" readonly="" placeholder="제품이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'f_file1')">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<!-- 이미지 썸네일 -->
															<c:if test="${not empty resultView.f_file1 }"><div class="thumb" style="cursor:pointer;" onclick="fileDownload('${resultView.f_file1 }');"><img name="blah" src="${resultView.f_file1 }" alt="your image" /></div></c:if>
															<!-- //이미지 썸네일 -->
														</div>
													</div>
												</li>
											</ul>
											<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
										</td>
									</tr>
									<tr>
										<th scope="row" style="background:#FCD9DB">수정</th>
										<td>${adminSession.adminid }</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>
				</form:form>
				<p class="btn-page-wrap">
					<a href="javascript:;" id="listBtn" class="btn-01 type-02">목록</a>
					<a href="javascript:;" id="submitBtn" class="btn-01 type-01">저장</a>
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
<script src="/asset/common/js/jquery.validate.js"></script>
<script src="/asset/common/js/additional-methods.js"></script>
<script>

$(".onlyNumber").on("keyup", function(){
	$(this).val($(this).val().replace(/\D/g, ""));
});

function fileDownload(fileUrl) {
	var fileName = fileUrl.split('/');
	location.href="/download.do?path="+fileUrl+"&fileName="+fileName[4];
}
$(function(){
	
	var fileIdx = 0;
	$(".attatchlist li").each(function(){
    	if($(this).find(".read-file").val() != '') {
    		fileIdx++;
    	}
    });
	
	front.form.fileNum = fileIdx > 0 ? fileIdx : 1;
	
	// 중분류코드에 대한 소분류코드 리스트
	getSubSubCodes("#sub_kr_code", $("#selected_kr_code").val().substring(0, 6), true);
	
	// 중분류코드에 대한 소분류코드 리스트
	getSubSubCodes("#sub_en_code", $("#selected_en_code").val().substring(0, 6), true);
	
	// 중분류코드에 대한 소분류코드 리스트
	getSubSubCodes("#sub_jp_code", $("#selected_jp_code").val().substring(0, 6), true);
	
	function getSubSubCodes(site_code, code, flag) {
		var $html = "";
		
		if(code == '') {
			$html = "";
			$html += "<option value=''>소분류명</option>";
			$(site_code).html($html);
			return false;
		}
		
		$.ajax({
            url: "/admin/menu/sub_sub_codes.do",
            type: "POST",
            data: {'code' : code},
            dataType: 'json',
            success: function (data) {
            	if(!!data.result) {
            		if(data.result == 'SUCCESS') {
            			$html = "";
            			$html += "<option value=''>소분류명</option>";
            			if(data.data.length > 0) {
            				$.each(data.data, function(key, index){
                				var selected = "";
                				if(flag) {
                					if(data.data[key].code == $("#selected_kr_code").val())
                						selected = "selected";	
                				}
                				$html += "<option value='" + data.data[key].code + "'"+selected+">" + data.data[key].name + "</option>";
                			});
            			}
            			
            			$(site_code).html($html);
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
	    $.validator.addMethod('filesize', function(value, element, param) {
	        // param = size (in bytes) 
	        // element = element to validate (<input>)
	        // value = value of the element (file name)
	        return this.optional(element) || (element.files[0].size <= param) 
	    });
	    
	    // 제품사진이 이미 저장 되어 있는 상태에서 사진 수정 없이 저장하려고 하면 file rules remove
	    if($("#f_file1_txt").val() != '') {
    		$("#f_file1").rules("remove", "required");
    	} else {
    		$("#f_file1").siblings(".thumb").hide();
    	}
    	
    	
    	
	    if($("#type").val() == 'udt') {
	    	$("#pcode").rules("remove", "required");
	    	$("#pcodeYn").rules("remove", "required");
	    }
	    
	    if($("input[name='c_yn']:checked").val() == 'Y') {
			$("#size_price").show();
			$("#common_price").hide();
			
			$("#c_price").rules("remove", "required");
			$("#s_price").rules("add", "required");
			$("#l_price").rules("add", "required");
		} else {
			$("#size_price").hide();
			$("#common_price").show();
			
			$("#c_price").rules("add", "required");
			$("#s_price").rules("remove", "required");
			$("#l_price").rules("remove", "required");
		}
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
	    name: {
	        required: true
	    },
	   	site_ck: {
	        required: true
	    },
	    kr_code: {
	        required: true
	    },
	    en_code: {
	        required: true
	    },
	    jp_code: {
	        required: true
	    },
	    kr_name: {
	        required: true
	    },
	    en_name: {
	        required: true
	    },
	    jp_name: {
	        required: true
	    },
	    s_yn: {
	        required: true
	    },
	    s_price: {
	        required: true
	    },
	    l_price: {
	        required: true
	    },
	    c_yn: {
	        required: true
	    },
	    c_price: {
	        required: true
	    },
	    kr_menu: {
	        required: true
	    },
	    en_menu: {
	        required: true
	    },
	    jp_menu: {
	        required: true
	    },
	    f_file1: {
	    	required: true,
	    	extension: "png|jpe?g|gif", 
	    	filesize: 1024 * 1024 * 5
	    },
	    pcode: {
	    	required: true
	    },
	    pcodeYn: {
	    	required: true
	    }
	};
	var message = {
		useyn: {
		    required: '노출여부를 선택하세요'
		},
	    name: {
	        required: '제품명을 입력하세요'
	    },
	    site_ck: {
	        required: '사용범위를 선택하세요'
	    },
	    kr_code: {
	        required: '국문 카테고리를 선택하세요'
	    },
	    en_code: {
	        required: '영문 카테고리를 선택하세요'
	    },
	    jp_code: {
	        required: '일문 카테고리를 선택하세요'
	    },
	    kr_name: {
	        required: '국문 제품명을 입력하세요'
	    },
	    en_name: {
	        required: '영문 제품명을 입력하세요'
	    },
	    jp_name: {
	        required: '일문 제품명을 입력하세요'
	    },
	    c_yn: {
	    	required: '가격설정을 선택/입력하세요'
	    },
	    s_price: {
	        required: '가격설정을 선택/입력하세요'
	    },
	    l_price: {
	        required: '가격설정을 선택/입력하세요'
	    },
	    c_price: {
	        required: '가격설정을 선택/입력하세요'
	    },
	    kr_menu: {
	        required: '국문 메뉴설명을 입력하세요'
	    },
	    en_menu: {
	        required: '영문 메뉴설명을 입력하세요'
	    },
	    jp_menu: {
	        required: '일문 메뉴설명을 입력하세요'
	    },
	    f_file1: {
	    	required: '제품이미지를 등록하세요',
	        extension: '파일 형식을 확인하세요',
	        filesize: '파일 용량을 확인하세요'
	    },
	    pcode: {
	    	required: '제품코드를 입력하세요'
	    },
	    pcodeYn: {
	    	required: '중복체크를 해주세요'
	    }
	};
	var submitFunction = function (form) {
		var formdata = new FormData();
		formdata.append('seq', $("#seq").val());
		formdata.append('useyn', $("input[name='useyn']").prop("checked") ? 'Y' : 'N');
	    formdata.append('name', $("#name").val());
	    formdata.append('kr_ck', $("input[id='101201']").prop("checked") ? 'Y' : 'N');
	    formdata.append('en_ck', $("input[id='101202']").prop("checked") ? 'Y' : 'N');
	    formdata.append('jp_ck', $("input[id='101203']").prop("checked") ? 'Y' : 'N');
	    
	    if($("select[id='sub_kr_code'] option:selected").val() != '') {
	    	formdata.append('kr_code', $("select[id='sub_kr_code'] option:selected").val());
	    } else {
	    	formdata.append('kr_code', $("select[name='kr_code'] option:selected").val());
	    }
	    
	    if($("select[id='sub_en_code'] option:selected").val() != '') {
	    	formdata.append('en_code', $("select[id='sub_en_code'] option:selected").val());
	    } else {
	    	formdata.append('en_code', $("select[name='en_code'] option:selected").val());
	    }
	    
	    if($("select[id='sub_jp_code'] option:selected").val() != '') {
	    	formdata.append('jp_code', $("select[id='sub_jp_code'] option:selected").val());
	    } else {
	    	formdata.append('jp_code', $("select[name='jp_code'] option:selected").val());
	    }
	    
	    formdata.append('kr_name', $("#kr_name").val());
	    formdata.append('en_name', $("#en_name").val());
	    formdata.append('jp_name', $("#jp_name").val());
	    formdata.append('c_yn', $("input[name='c_yn']:checked").val());
	    
	    if($("input[name='c_yn']:checked").val() == 'Y') {
		    formdata.append('s_price', $("#s_price").val());
		    formdata.append('l_price', $("#l_price").val());	
	    } else {
	    	formdata.append('c_price', $("#c_price").val().replace(',', ''));
	    }
	    
	    formdata.append('kr_menu', $("#kr_menu").val());
	    formdata.append('en_menu', $("#en_menu").val());
	    formdata.append('jp_menu', $("#jp_menu").val());
	    formdata.append('best_ck', $("input[id='best_ck']").prop("checked") ? 'Y' : 'N');
	    formdata.append('new_ck', $("input[id='new_ck']").prop("checked") ? 'Y' : 'N');
	    formdata.append('hot_ck', $("input[id='hot_ck']").prop("checked") ? 'Y' : 'N');
	    formdata.append('f_file1', $("#f_file1").length > 0 ? $("#f_file1")[0].files[0] : '');
	    formdata.append('f_file1_txt', $("#f_file1_txt").length > 0 ? $("#f_file1_txt").val() : '');
	    formdata.append('type', $("#type").val());
	    formdata.append('pcode', $("#pcode").val());
	    formdata.append('pcodeYn', $("#pcodeYn").val());
	    
	    $.ajax({
            url: "/admin/menu/red_product_modify.do",
            type: "POST",
            data: formdata,
            enctype: 'multipart/form-data',
            dataType: 'json',
            processData: false,  // Important!
            contentType: false,
            cache: false,
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
            			location.href="/admin/menu/red_product_list.do";
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

	// 목록
	$("#listBtn").on("click", function(){
		location.href='red_product_list.do?seq=' + $("#seq").val() + '&pageIndex=' + $("#pageIndex").val() + '&search_useyn=' + $("#search_useyn").val() + '&search_site_ck=' + $("#search_site_ck").val() + '&search_name=' + $("#search_name").val();
	});
	
	// 저장
	$("#submitBtn").on("click", function(){
		$("#modifyForm").submit();
	});
	
	// 제품코드 중복체크
	$("#checkPcodeBtn").on("click", function() {
		var $pcode = $(this).siblings("#pcode").val();
		
		if(!!$pcode) {
			$.ajax({
	            url: "/admin/menu/red_product_check.do",
	            type: "POST",
	            data: {'pcode' : $pcode},
	            dataType: 'json',
	            success: function (data) {
	            	if(!!data.result) {
	            		if(data.result == 'SUCCESS') {
	            			$("#pcodeYn").val('Y');
	            			$("#pcode_txt").html('<span>사용 가능한 제품코드입니다</span>');
	            			$("#pcode").rules("remove", "required");
	            			$("#pcodeYn").rules("remove", "required");
	            		} else {
	            			$("#pcodeYn").val('');
	            			$("#pcode_txt").html('<span>제품코드가 이미 존재합니다</span>');
	            			$("#pcode").rules("add", "required");
	            			$("#pcodeYn").rules("add", "required");	
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
		} else {
			alert("제품코드를 입력하세요");
		}
	});
	
	$("input[name='c_yn']").on("click", function(){
		if($("input[name='c_yn']:checked").val() == 'Y') {
			$("#size_price").show();
			$("#common_price").hide();
			
			$("#c_price").rules("remove", "required");
			$("#s_price").rules("add", "required");
			$("#l_price").rules("add", "required");
		} else {
			$("#size_price").hide();
			$("#common_price").show();
			
			$("#c_price").rules("add", "required");
			$("#s_price").rules("remove", "required");
			$("#l_price").rules("remove", "required");
		}
	});
	
	// 국문 메뉴 카테고리 중분류명 콤보박스 변경
	$("select[name='kr_code']").change(function(){
		getSubSubCodes('#sub_kr_code', $(this).val());
	});
	
	// 영문 메뉴 카테고리 중분류명 콤보박스 변경
	$("select[name='en_code']").change(function(){
		getSubSubCodes('#sub_en_code', $(this).val());
	});
	
	// 일문 메뉴 카테고리 중분류명 콤보박스 변경
	$("select[name='jp_code']").change(function(){
		getSubSubCodes('#sub_jp_code', $(this).val());
	});
	
});
</script>
</body>
</html>
