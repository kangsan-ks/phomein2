<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/eng/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/eng/include/engheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인`
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="cs_center">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_04.jpg');"></div>
			<h2 class="h2-type">CS CENTER</h2>
			<span class="txt">It is always prepared to quickly and kindly respond to customers' questions.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/eng/include/engMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="community">
			<div class="inner">

				<div class="cs-con">
					<div class="con-title">
						<h3 class="h3-type">TO REGISTER</h3>
					</div>

					<form:form modelAttribute="cscenter" id="modifyForm">
					<div class="table-list-data mt60">
						<div class="text-info"><span class="need"></span> Required input/selection</div>
						<fieldset>
							<legend>고객의 소리 기본정보 입력 폼</legend>
							<table class="view">
								<caption>고객의 소리 기본정보 입력 폼 테이블</caption>
								<colgroup>
									<col style="width:190px">
									<col style="width:auto">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span class="need"></span> TITLE</th>
										<td>
											<input type="text" name="title" id="title" placeholder="TITLE" style="width:750px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> CONTENT</th>
										<td>
											<textarea name="conts" id="conts" rows="7" placeholder="CONTENT" style="width:750px;"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">FILE</th>
										<td>
											<div class="file-box" style="width:750px;">
												<input type="hidden" name="f_file1_del" id="f_file1_del" value=""/>
												<input type="file" name="f_file1" id="uploadBtn" class="upload-btn" onchange="inputFile(this)">
												<input type="text" name="file-name01" class="file-name" readonly="readonly" placeholder="">
												<button type="button" onclick="deleteImgFileText(this,'f_file1')" class="del">DEL</button>
												<label for="uploadBtn" class="btn btn-03 type-02">FIND</label>
											</div>
											<span class="input-info">- 5MB / jpg, png, gif, hwp, txt, ppt, pptx, doc, docx, xls, pdf, zip</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> Name</th>
										<td>
											<input type="text" name="name" id="name" placeholder="Name" style="width:750px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> Phone Number</th>
										<td>
											<div class="phone-wrap">
												<div class="first">
													<select name="hp1" id="hp1" title="휴대폰 첫번재 4자리 선택">
														<c:forEach var="codeResult" items="${ fnc:codeListSub('113') }" varStatus="status">
															<option value="${codeResult.name }">${codeResult.name }</option>
														</c:forEach>
													</select>
												</div>
												<div class="second"><input type="text" name="hp2" id="hp2" class="onlyNumber" maxlength="4" title="휴대폰 두번째 4자리 입력"></div>
												<div class="three"><input type="text" name="hp3" id="hp3" class="onlyNumber" maxlength="4" title="휴대폰 세번째 4자리 입력"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> Email</th>
										<td>
											<div class="email-wrap">
												<p class="email-name"><input type="text" name="email1" id="email1" title="이메일 아이디 입력"></p>
												<p class="email-address"><input type="text" name="email2" id="email2" title="이메일 주소 입력"></p>
												<p class="email-select">
													<select id="selectedEmail">
														<c:forEach var="codeResult" items="${ fnc:codeListSub('114') }" varStatus="status">
															<option value="${codeResult.name }" <c:if test="${codeResult.name == '직접입력'}">selected="selected"</c:if>>${codeResult.name }</option>
														</c:forEach>
													</select>
												</p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</fieldset>
					</div>
					</form:form>

					<!-- btn-box -->
					<div class="btn-box mt50">
						<a href="javascript:;" class="btn-01 type-01" id="submitBtn">SAVE</a>
					</div>
					<!-- //btn-box -->
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/eng/include/engfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script src="../common/js/jquery.validate.js"></script>
<script src="../common/js/additional-methods.js"></script>
<script type="text/javascript">

$(".onlyNumber").on("keyup", function(){
	$(this).val($(this).val().replace(/\D/g, ""));
});

//파일 업로드의 경로값 설정
function inputFile(_target){
	var _t = $(_target);
	var _p = _t.parent();
	var _n = _t.val();

	if(_n != ""){
		_t.next().val(_n);
	}else{
		_t.next().val('');
	}
	$(".del").addClass('on');
}

//텍스트 입력 셀 삭제
function deleteImgFileText(t,ele){
	var $files = $(t).siblings("input[type='file']");
	var $filesTxt = $(t).siblings("input[type='text']");
	
	if ($.browser.msie) { 
		// ie 일때 input[type=file] init. 
		$files.replaceWith( $files.clone(true) ); 
		$filesTxt.val(""); 
	} else { 
		// other browser 일때 input[type=file] init. 
		$files.val(""); 
		$filesTxt.val(""); 
	}
	$(t).removeClass('on');
	
	if(!!ele && $files.attr("name") == ele)
		$files.rules("add", "required");
}

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();

$(function(){
	
	$(".datepicker").datepicker({
		showOn:"both",
		buttonImage:"../images/datepicker/btn_datepicker.png",
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
	}).datepicker('setDate', new Date());
	
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
	    $.validator.addMethod('minlength', function(value, element, param) {
	        return (value.length >= param);
	    });
	    $.validator.addMethod('regex', function(value, element, regexp) {
	    	var check = false;
	    	return this.optional(element) || regexp.test(value);
	    });
	    
	}
	
	//**********************************************************************************
	//Jquery Validate
	//**********************************************************************************
	var targetForm = $('#modifyForm');
	var ignore = '*:not([name])';  //default : [] - display none ignore
	var rules = {
	 	title: {
		    required: true
		},
		conts: {
		    required: true
	 	},
		f_file1: { 
		    required: false, 
		    extension: "png|jpe?g|gif|hwp|txt|ppt|pptx|doc|docx|xls|pdf|zip", 
		    filesize: 1024 * 1024 * 5  
		},
		name: {
		    required: true
		},
		hp1: {
		    required: true
		},
		hp2: {
		    required: true,
		    minlength: 3
		},
		hp3: {
		    required: true,
		    minlength: 4
		},
		email1: {
		    required: true,
		    regex: /([\w-\.]+)/
		},
		email2: {
		    required: true,
		    regex: /((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/
		}
	};
	var message = {
		title: {
		    required: 'TITLE'
		},
		conts: {
		    required: 'CONTENT'
		},
		f_file1: {
		    extension: 'File Type',
		    filesize: 'File size'
		},
		name: {
		    required: 'NAME'
		},
		hp1: {
		    required: 'FIRST Phone Number'
		},
		hp2: {
		    required: 'MIDDLE Phone Number',
		    minlength: 'Contact format does not match'
		},
		hp3: {
		    required: 'END Phone Number',
		    minlength: 'Contact format does not match'
		},
		email1: {
		    required: 'E-mail',
		    regex: 'Email format does not match'
		},
		email2: {
		    required: 'E-mail',
		    regex: 'Email format does not match'
		}
	};
	var submitFunction = function (form) {
		var formdata = new FormData();
		formdata.append('title', $("#title").val());
	    formdata.append('conts', $("#conts").val());
	    formdata.append('f_file1', $("input[name='f_file1']").length > 0 ? $("input[name='f_file1']")[0].files[0] : '');
	    formdata.append('f_file1_txt', $("input[name='file-name01']").length > 0 ? $("input[name='file-name01']").val() : '');
	    formdata.append('name', $("#name").val());
	    formdata.append('hp', $("#hp1").val() + $("#hp2").val() + $("#hp3").val());
	    formdata.append('email', $("#email1").val() + '@' +  $("#email2").val());
	    
	    $.ajax({
            url: "/eng/community/cs_center_modify.do",
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
            			alert('You have been registered as normal');
            			location.href="/eng/community/cs_terms.do";
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
	
	// 저장
	$("#submitBtn").on("click", function(){
		$("#modifyForm").submit();
	});
	
	$("#selectedEmail").on("change", function(){
		if($("select[id='selectedEmail'] option:selected").val() == 'Direct input') {
			$("#email2").val('');
			$("#email2").attr("readonly", false);

		} else {
			$("#email2").val($("select[id='selectedEmail'] option:selected").val());
			$("#email2").attr("readonly", true);
		}
	});
	
});
</script>
</body>
</html>
