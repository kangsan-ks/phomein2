<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_05.jpg');"></div>
			<h2 class="h2-type">加盟相談申請</h2>
<!-- 			<span class="txt">11년의 노하우, 포메인과 함께라면 행복한 미래를 꿈꾸셔도 좋습니다.<br>밝은 미래, 행복한 포메人</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="cs-con">
					<div class="con-title">
						<h3 class="h3-type">登録すること</h3>
					</div>
					
					<form:form modelAttribute="cscenter" id="modifyForm">
					<div class="table-list-data mt60">
						<div class="text-info"><span class="need"></span> 必須入力/選択項目です。</div>
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
										<th scope="row"><span class="need"></span> 題目</th>
										<td>
											<input type="text" name="title" id="title" placeholder="題目" style="width:750px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> 内容</th>
										<td>
											<textarea name="conts" id="conts" rows="7" placeholder="内容" style="width:750px;"></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">創業希望地域</th>
										<td>
											<input type="text" name="uparea" id="uparea" placeholder="創業希望地域" style="width:750px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span> お名前</th>
										<td>
											<input type="text" name="name" id="name" placeholder="お名前" style="width:750px;">
										</td>
									</tr>
									<tr>
										<th scope="row"><span class="need"></span>連絡先</th>
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
										<th scope="row"><span class="need"></span> Eメール</th>
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
						<a href="javascript:;" class="btn-01 type-01" id="submitBtn">貯蔵</a>
					</div>
					<!-- //btn-box -->
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script src="../common/js/jquery.validate.js"></script>
<script type="text/javascript">

$(".onlyNumber").on("keyup", function(){
	$(this).val($(this).val().replace(/\D/g, ""));
});

$(function(){
	
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
		uparea: {
			required: false
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
		    required: '題目'
		},
		conts: {
		    required: '内容'
		},
		name: {
		    required: '名前'
		},
		hp1: {
		    required: '連絡先'
		},
		hp2: {
		    required: '連絡先',
		    minlength: '形式が合いません。'
		},
		hp3: {
		    required: '連絡先',
		    minlength: '形式が合いません。'
		},
		email1: {
		    required: 'Eメール',
		    regex: '形式が合いません。'
		},
		email2: {
		    required: 'Eメール',
		    regex: '形式が合いません。'
		}
	};
	var submitFunction = function (form) {
		var formdata = new FormData();
	    formdata.append('title', $("#title").val());
	    formdata.append('conts', $("#conts").val());
	    formdata.append('uparea', $("#uparea").val());
	    formdata.append('upprice', "0");
	    formdata.append('name', $("#name").val());
	    formdata.append('hp', $("#hp1").val() + $("#hp2").val() + $("#hp3").val());
	    formdata.append('email', $("#email1").val() + '@' +  $("#email2").val());
	    
	    $.ajax({
            url: "/jpn/franchisee/info_modify.do",
            type: "POST",
            data: formdata,
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
            			alert('登録されました');
            			location.href="/jpn/franchisee/terms.do";
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
		if($("select[id='selectedEmail'] option:selected").val() == '직접입력') {
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
