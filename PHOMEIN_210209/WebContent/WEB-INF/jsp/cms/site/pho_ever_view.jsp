<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>사회공헌 관리 상세/수정 | 사이트 관리 | 포메인 통합 관리</title>
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
				<span>사이트 관리</span>
				<span>사회공헌 관리</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">사회공헌 관리</h3>

			<div class="default-cell">
				<h4 class="sub-title"><c:if test="${type == 'reg'}">사회공헌 등록</c:if><c:if test="${type == 'udt'}">사회공헌 상세/수정</c:if><span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<form:form modelAttribute="phoever" id="modifyForm">
					<input type="hidden" name="seq" id="seq" value="${seq }" />
					<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
					<input type="hidden" name="search_useyn" id="search_useyn" value="${search_useyn }" />
					<input type="hidden" name="search_title" id="search_title" value="${search_title }" />
					<div class="table-list-data">
						<fieldset>
							<legend>사회공헌 상세/수정 기본정보 입력 폼</legend>
							<table class="view">
								<caption>사회공헌 상세/수정 기본정보 입력 폼 테이블</caption>
								<colgroup>
									<col style="width:200px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">노출여부 <span class="need"></span></th>
										<td>
											<div class="mulity-check-radio">
												<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" <c:if test="${resultView.useyn == 'Y'}">checked</c:if>><label for="radio0101"><span></span>노출</label></p></div>
												<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" <c:if test="${resultView.useyn == 'N'}">checked</c:if>><label for="radio0102"><span></span>미노출</label></p></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">제목 <span class="need"></span></th>
										<td><input type="text" name="title" id="title" style="width:100%" value="${resultView.title }"></td>
									</tr>
									<tr>
										<th scope="row">PC 이미지 <span class="need"></span></th>
										<td>
											<ul class="file-parent" style="width:700px">
												<li class="add-input">
													<div class="add-file">
														<div class="file-input">
															<input type="hidden" name="pc_img_del" id="pc_img_del" value=""/>
															<input type="file" name="pc_img" id="pc_img" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="pc_img_txt" id="pc_img_txt" value="${resultView.pc_thimg }" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'pc_img')">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<!-- 이미지 썸네일 -->
															<c:if test="${not empty resultView.pc_thimg }"><div class="thumb" style="cursor:pointer;" onclick="fileDownload('${resultView.pc_thimg }');"><img name="blah" src="${resultView.pc_thimg }" alt="your image" /></div></c:if>
															<!-- //이미지 썸네일 -->
														</div>
													</div>
												</li>
											</ul>
											<span class="input-block-info">- 5MB 이하 / jpg, png, gif만 등록 가능</span>
										</td>
									</tr>
									<tr>
										<th scope="row">PC 대체텍스트 <span class="need"></span></th>
										<td>
											<input type="text" name="pc_alt" id="pc_alt" value="${resultView.pc_alt }" style="width:100%">
										</td>
									</tr>
									<tr>
										<th scope="row">PC 내용 <span class="need"></span></th>
										<td><div class="edit-area"><textarea name="pc_contents" id="pc_contents" rows="3" style="width:100%;">${resultView.pc_contents }</textarea></div></td>
									</tr>
									<tr>
										<th scope="row">MOBILE 이미지</th>
										<td>
											<ul class="file-parent" style="width:700px">
												<li class="add-input">
													<div class="add-file">
														<div class="file-input">
															<input type="hidden" name="m_img_del" id="m_img_del" value=""/>
															<input type="file" name="m_img" id="m_img" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="m_img_txt" id="m_img_txt" value="${resultView.m_thimg }" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<!-- 이미지 썸네일 -->
															<c:if test="${not empty resultView.m_thimg }"><div class="thumb" style="cursor:pointer;" onclick="fileDownload('${resultView.m_thimg }');"><img name="blah" src="${resultView.m_thimg }" alt="your image" /></div></c:if>
															<!-- //이미지 썸네일 -->
														</div>
													</div>
												</li>
											</ul>
											<span class="input-block-info">- 5MB 이하 / jpg, png, gif만 등록 가능</span>
										</td>
									</tr>
									<tr>
										<th scope="row">MOBILE 대체텍스트</th>
										<td>
											<input type="text" name="m_alt" id="m_alt" value="${resultView.m_alt }" style="width:100%">
										</td>
									</tr>
									<tr>
										<th scope="row">MOBILE 내용</th>
										<td><div class="edit-area"><textarea name="m_contents" id="m_contents" rows="3" style="width:100%;">${resultView.m_contents }</textarea></div></td>
									</tr>
									<tr>
										<th scope="row">수정</th>
										<td>${adminSession.adminid }</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>
				</form:form>
				<p class="btn-page-wrap">
					<a href="javascript:;" id="listBtn"class="btn-01 type-02">목록</a>
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
function fileDownload(fileUrl) {
	var fileName = fileUrl.split('/');
	location.href="/download.do?path="+fileUrl+"&fileName="+fileName[4];
}
$(function(){
	addEditor("pc_contents");
	addEditor("m_contents");

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
	    
	    // 첨부파일이 이미 저장 되어 있는 상태에서 첨부파일 수정 없이 저장하려고 하면 file rules remove
    	if($("#pc_img_txt").val() != '') {
    		$("#pc_img").rules("remove", "required");
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
	    title: {
	        required: true
	    },
	    pc_img: {
	        required: true,
	        extension: "png|jpe?g|gif", 
	    	filesize: 1024 * 1024 * 5 
	    },
	    pc_alt: {
	        required: true
	    },
	    m_img: {
	    	extension: "png|jpe?g|gif", 
	    	filesize: 1024 * 1024 * 5
	    }
	};
	var message = {
		useyn: {
		    required: '노출여부를 선택하세요'
		},
	    title: {
	        required: '제목을 입력하세요'
	    },
	    pc_img: {
	    	required: 'PC 이미지를 입력하세요',
	        extension: '파일 형식을 확인하세요',
	        filesize: '파일 용량을 확인하세요'
	    },
	    pc_alt: {
	        required: 'PC 대체텍스트를 입력하세요'
	    },
	    m_img: {
	        extension: '파일 형식을 확인하세요',
	        filesize: '파일 용량을 확인하세요'
	    }
	};
	
	var submitFunction = function (form) {
	    var pcContentsTemp = getHTML("pc_contents");
		if(pcContentsTemp == '' || pcContentsTemp == '<p><br></p>') {
			alert('PC 내용을 입력하세요');
			return false;
		}
		
	    var mContentsTemp = getHTML("m_contents");
		
		var formdata = new FormData();
		formdata.append('seq', $("#seq").val());
		formdata.append('useyn', $("input[name='useyn']").prop("checked") ? 'Y' : 'N');
	    formdata.append('title', $("#title").val());
	    formdata.append('pc_img', $("#pc_img").length > 0 ? $("#pc_img")[0].files[0] : '');
	    formdata.append('pc_img_txt', $("#pc_img_txt").length > 0 ? $("#pc_img_txt").val() : '');
	    formdata.append('pc_alt', $("#pc_alt").val());
	    formdata.append('pc_contents', pcContentsTemp);
	    formdata.append('m_img', $("#m_img").length > 0 ? $("#m_img")[0].files[0] : '');
	    formdata.append('m_img_txt', $("#m_img_txt").length > 0 ? $("#m_img_txt").val() : '');
	    formdata.append('m_alt', $("#m_alt").val());
	    formdata.append('m_contents', mContentsTemp);
	    formdata.append('hitcnt', 0);
	    formdata.append('tb_socialcol', "PHO_EVER");
	    
        $.ajax({
            url: "/admin/site/pho_ever_modify.do",
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
            			location.href="/admin/site/pho_ever_list.do";
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
		location.href='pho_ever_list.do?seq=' + $("#seq").val() + '&pageIndex=' + $("#pageIndex").val() + '&search_useyn=' + $("#search_useyn").val() + '&search_title=' + $("#search_title").val();
	});
	
	// 저장
	$("#submitBtn").on("click", function(){
		$("#modifyForm").submit();
	});
});
</script>
</body>
</html>
