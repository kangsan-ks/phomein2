<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
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
		<div class="sub_visual sv5">
			<h3>고객의 소리</h3>
		</div>
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
		<div id="content" class="cs_center">
 			
 			<!-- 타이틀 영역 -->
 			<div class="tit_area pb0">
				<h4>등록하기</h4>
				<span class="txt"><strong class="ico_import">*</strong> 는 필수입력/선택 항목입니다.</span>
			</div>
			<!-- //타이틀 영역 -->
 			
			<!-- 등록 영역 -->
			<div class="write_area">
				<form:form modelAttribute="cscenter" id="modifyForm">
				<table class="table_write">
						<caption></caption>
						<colgroup>
							<col width="26.8%">
							<col width="auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><strong class="ico_import">문의구분</strong></th>
								<td>
									<!-- 셀렉트 박스 -->
									<span class="selectbox">
										<label for="cate">카테고리 선택</label>
										<select id="cate" name="cate">
											<c:forEach var="codeResult" items="${ fnc:codeListSub('110') }" varStatus="status">
												<option value="${codeResult.code}"><c:out value="${codeResult.name}"/></option>
											</c:forEach>
										</select>
									</span>
									<!-- //셀렉트 박스 -->
								</td>
							</tr>
							<tr id="visitTr">
								<th scope="row"><strong class="ico_import">방문매장<br> / 방문일</strong></th>
								<td>
									<!-- 셀렉트 박스 -->
									<span class="selectbox">
										<label for="visitstore">방문매장 선택</label>
										<select name="visitstore" id="visitstore">
											<c:forEach items="${resultList }" var="result" varStatus="status" >
													<option value="${result.name }">${result.name }</option>
											</c:forEach>
										</select>
									</span>
									<!-- 20190319 추가 s -->
									<div class="date-input">
										<input type="text" name="visitdatestr" id="visitdatestr" class="text datepicker">
									</div>
									<!-- //20190319 추가 e -->
								</td>
							</tr>
					 		<tr>
								<th scope="row"><strong class="ico_import">제목</strong></th>
								<td><input type="text" name="title" id="title" class="text" placeholder="제목을 입력하세요" title="제목"></td>
							</tr>
							<tr>
								<th scope="row"><strong class="ico_import">내용</strong></th>
								<td><textarea name="conts" id="conts" class="text" cols="30" rows="5" placeholder="내용을 입력하세요" title="내용"></textarea></td>
							</tr>
							<tr>
								<th scope="row"><strong class="ico_import">이름</strong></th>
								<td><input type="text" name="name" id="name" class="text" placeholder="이름을 입력하세요" title="이름"></td>
							</tr>
							<tr>
								<th scope="row"><strong class="ico_import">연락처</strong></th>
								<td>
									<!-- 셀렉트 박스 -->
									<span class="selectbox tel_sel">
										<label for="hp1">연락처 앞자리</label>
										<select name="hp1" id="hp1" title="휴대폰 첫번재 4자리 선택">
											<c:forEach var="codeResult" items="${ fnc:codeListSub('113') }" varStatus="status">
												<option value="${codeResult.name }">${codeResult.name }</option>
											</c:forEach>
										</select>
									</span>
									<!-- //셀렉트 박스 -->
									<input type="text" name="hp2" id="hp2" class="text tel_txt onlyNumber" maxlength="4" title="연락처 중간자리"> 
									<input type="text" name="hp3" id="hp3" class="text tel_txt onlyNumber" maxlength="4" title="연락처 끝자리">
								</td>
							</tr>
							<tr>
								<th scope="row"><strong class="ico_import">이메일</strong></th>
								<td>
									<input type="text" name="email1" id="email1" class="text email_txt1" title="이메일"> <span class="email_at">@</span>
									<input type="text" name="email2" id="email2" class="text email_txt2" title="이메일 도메인">
									<!-- 셀렉트 박스 -->
									<span class="selectbox email_sel">
										<label for="selectedEmail">선택하세요</label>
										<select id="selectedEmail">
											<c:forEach var="codeResult" items="${ fnc:codeListSub('114') }" varStatus="status">
												<option value="${codeResult.name }" <c:if test="${codeResult.name == '직접입력'}">selected="selected"</c:if>>${codeResult.name }</option>
											</c:forEach>
										</select>
									</span>
									<!-- //셀렉트 박스 -->
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>회신방법</strong></th>
								<td>
									<!-- 20190515 삭제 s  -->
									<!-- <span class="radio">
										<input type="radio" id="radio0101" value="mobile" name="feed_kind" checked><label for="radio0101">유선</label>	
									</span> -->
									<!-- //20190515 삭제 e  -->
									<span class="radio">
										<input type="radio" id="radio0102" value="email" name="feed_kind" checked><label for="radio0102">이메일</label>	
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</form:form>
				<!-- 버튼 영역 -->
				<div class="btn_area">
					<a href="javascript:;" class="btn_tyf c_black" id="submitBtn">확인</a>
				</div>
				<!-- //버튼 영역 -->
			</div>
			<!-- //등록 영역 -->
			
		</div>
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
<script src="/mbrand/common/js/jquery.validate.js"></script>
<script src="/mbrand/common/js/jquery-ui.min.js"></script>
<script type="text/javascript">

$(function(){
	$(".datepicker").datepicker({
		showOn:"both",
		buttonImage:"/mbrand/common/images/content/btn_datepicker.png",
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
});

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
		cate: {
			required: true
		},
		visitstore: {
		    required: true
		},
		visitdatestr: {
		    required: true
		},
	 	title: {
		    required: true
		},
		conts: {
		    required: true
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
		},
		feed_kind: {
		    required: true
		}
	};
	var message = {
		cate: {
			required: '문의구분을 선택하세요'
		},
		visitstore: {
		    required: '방문매장을 선택하세요'
		},
		visitdatestr: {
		    required: '방문일을 선택하세요'
		},
		title: {
		    required: '제목을 입력하세요'
		},
		conts: {
		    required: '내용을 입력하세요'
		},
		name: {
		    required: '이름을 입력하세요'
		},
		hp1: {
		    required: '연락처 앞자리를 입력하세요'
		},
		hp2: {
		    required: '연락처 중간자리를 입력하세요',
		    minlength: '연락처 형식이 맞지 않습니다'
		},
		hp3: {
		    required: '연락처 끝자리를 입력하세요',
		    minlength: '연락처 형식이 맞지 않습니다'
		},
		email1: {
		    required: '이메일을 입력하세요',
		    regex: '이메일 형식이 맞지 않습니다'
		},
		email2: {
		    required: '이메일을 입력하세요',
		    regex: '이메일 형식이 맞지 않습니다'
		},
		feed_kind: {
		    required: '회신방법을 선택하세요'
		}
	};
	var submitFunction = function (form) {
		var formdata = new FormData();
		formdata.append('cate', $("select[id='cate'] option:selected").val());
		formdata.append('visitstore', $("select[id='visitstore'] option:selected").val());
		
		/*
		if($("select[id='visitstore'] option:selected").val() == "110201") {
			var visitdatestr = $("#visitdatestr").val() + " " + "00:00:00:00";
			formdata.append('visitdatestr', visitdatestr);	
			formdata.append('visitdate', visitdatestr);	
		}
		*/
		var visitdatestr = $("#visitdatestr").val() + " " + "00:00:00:00";
		formdata.append('visitdatestr', visitdatestr);	
		formdata.append('visitdate', visitdatestr);	
		
	    formdata.append('title', $("#title").val());
	    formdata.append('conts', $("#conts").val());
	    formdata.append('name', $("#name").val());
	    formdata.append('hp', $("#hp1").val() + $("#hp2").val() + $("#hp3").val());
	    formdata.append('email', $("#email1").val() + '@' +  $("#email2").val());
	    formdata.append('feed_kind', $("input[name='feed_kind']:checked").val());
	    
	    $.ajax({
            url: "/mbrand/cs_center/cs_center_modify.do",
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
            			location.href="/mbrand/cs_center/cs_terms.do";
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
	
	$("select[name='cate']").on("change", function(){
		if($("select[id='cate'] option:selected").val() == '110201') {
			$("#visitTr").show();
			$("#visitstore").rules("add", "required");
			$("#visitdatestr").rules("add", "required");
		} else {
			$("#visitTr").hide();
			$("#visitstore").rules("remove", "required");
			$("#visitdatestr").rules("remove", "required");
		}
	});
	
});
</script>
</body>
</html>
