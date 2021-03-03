<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>개인정보수정 상세/수정 | 인트라넷 | 포메인 가맹점 관리</title>
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
				<span>개인정보수정</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">개인정보수정</h3>

			<div class="default-cell">
				<h4 class="sub-title">개인정보수정 상세/수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="writeForm" id="writeForm" method="post" onsubmit="return false" >
				<input type="hidden" name="seq" id="seq" value="${result.seq }" />
				<input type="hidden" name="useyn" id="useyn" value="${result.useyn }" />
				<input type="hidden" name="admintype" id="admintype" value="${result.admintype }" />
				<input type="hidden" name="storeseq" id="storeseq" value="${result.store }" />
				<input type="hidden" name="store" id="store" value="${result.storename }" />
				<input type="hidden" name="menu" id="menu" value="${result.bu }" />
				<div class="table-list-data">
					<fieldset>
						<legend>개인정보수정 상세/수정 기본정보 입력 폼</legend>
						<table class="view">
							<caption>개인정보수정 상세/수정 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">매장</th>
									<td>${result.storename }</td>
								</tr>
								<tr>
									<th scope="row">이름 <span class="need"></span></th>
									<td><input type="text" style="width:100%"  name="name" value="<c:out value="${result.name }"/>"></td>
								</tr>
								<tr>
									<th scope="row">아이디</th>
									<td>${result.adminid }</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <span class="need"></span></th>
									<td>
										<p class="input-btns"><input type="password" name="adminpw" id="adminpw" style="width:250px"  value="************">
										<a href="javascript:front.pop.open('pop-03');" class="btn-01 type-03 round">비밀번호 수정</a></p>
										<span class="input-block-info">- 영문자, 숫자, 특수문자 4~20자리</span>
									</td>
								</tr>
								<tr>
									<th scope="row">연락처 <span class="need"></span></th>
									<td>
										<div class="phone-wrap">
											<div class="first">
												<select name="hp1" title="휴대폰 첫번재 4자리 선택">
													<c:forEach var="codeResult" items="${fnc:codeListSub('113')}" >
					                				<option value="${codeResult.name }" <c:if test="${result.hp1 == codeResult.name}">selected</c:if>><c:out value="${codeResult.name }"/></option>  
					                				</c:forEach>
												</select>
											</div>
											<div class="second"><input type="text" name="hp2" value="${result.hp2 }" maxlength="4" title="휴대폰 두번째 4자리 입력" value="1236"></div>
											<div class="three"><input type="text" name="hp3" value="${result.hp3 }" maxlength="4" title="휴대폰 세번째 4자리 입력" value="5555"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="need"></span></th>
									<td>
										<div class="email-wrap">
											<p class="email-name"><input type="text" name="email1" id="email1" value="${result.email1 }" title="이메일 아이디 입력" value="test1234"></p>
											<p class="email-address"><input type="text" name="email2" id="email2" value="${result.email2 }" title="이메일 주소 입력" value="Phomein.com"></p>
											<p class="email-select">
												<select name="email3" onchange="fnSelectEmail(this.value);">
													<option value="">선택하세요.</option>
													<c:forEach var="codeResult" items="${fnc:codeListSub('114')}" >
					                				<option value="${codeResult.name }" <c:if test="${result.email2 == codeResult.name}">selected</c:if>><c:out value="${codeResult.name }"/></option>  
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
				</form>
				
				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-01 _addBtn">저장</a>
				</p>
			</div>
		</section>
		<!-- //contents -->


		<!-- dFoot -->
		<footer id="dFoot"><div class="copy">Copyright ⓒ 2018 DAILYKING INC. All rights reserved.</div></footer>
		<!-- //dFoot -->
	</section>
	<!--// dBody -->
	

	<!-- 비밀번호 수정 팝업 -->
	<!-- layer-pop-wrap -->
	<article id="pop-03" class="layer-pop-wrap">
		<div class="layer-pop-parent">
			<div class="layer-pop-children">

				<div class="pop-data middle">
					<h2>관리자 비밀번호 수정</h2>
					<div class="pop-con">
						<div class="default-cell">
							<h4 class="sub-title">관리자 비밀번호 수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
							<form name="pwdForm" id="pwdForm" onsubmit="return false;">
							<input type="hidden" name="seq" value="${result.seq }" />
							<input type="hidden" name="adminid" value="${result.adminid }" />
							<div class="table-list-data">
								<fieldset>
									<legend>관리자 비밀번호 수정 입력 폼</legend>
									<table class="view">
										<caption>관리자 비밀번호 수정 입력 폼 테이블</caption>
										<colgroup>
											<col style="width:140px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">새 비밀번호 <span class="need"></span></th>
												<td>
													<input type="password" name="adminpw1" id="adminpw1" placeholder="새 비밀번호" style="width:100%">
													<span class="input-block-info">- 영문자, 숫자, 특수문자 조합하여 4~16자리</span>
												</td>
											</tr>
											<tr>
												<th scope="row">비밀번호 확인 <span class="need"></span></th>
												<td>
													<input type="password" name="adminpw2" id="adminpw2" placeholder="비밀번호 확인" style="width:100%">
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
							</form>
						</div>
					</div>

					<div class="pop-bottom">
						<div class="btn-page-wrap al-c">
							<a href="#" onclick="front.pop.close(this);" class="btn-01 type-03">닫기</a>
							<a href="#" onclick="fnPwChange(); return false;" class="btn-01 type-01">확인</a>
						</div>
					</div>

					<a href="#pop-close" onclick="front.pop.close(this);" class="btn-pop-close"></a>
				</div>

			</div>
		</div>
	</article>
	<!-- layer-pop-wrap -->
	<!-- //비밀번호 수정 팝업 -->	
	
		
</div>
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){

});


function fnSelectEmail(obj){
	$("#email2").val( obj );
}

function fnPwChange(){
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=pwdForm]");
    
    var pw1 = frm.find("input[name='adminpw1']").val();
    var pw2 = frm.find("input[name='adminpw2']").val();
    if ( pw1 != pw2){
		alert("비밀번호가 맞지 않습니다.");
		return false;
    }
    if  ( !PassChk(pw1) ){
    	alert("비밀번호는 영문자, 숫자, 특수문자를 조합하여 4~16자리로 입력해주세요.");
    	return false;
    } 
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("등록 되었습니다.");
				//fnPage('/admin/site/manager_list.do');
				location.reload();
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./pwd_proc.do",
		type : "post",
		dataType : 'json',
		//contentType : false,
		//processData : false,
		success : fnApplyCallback,
		error : function(data, result, resultMsg) {
			alert("데이터 전송 중 오류가 발생하였습니다.");
		}
	};
	frm.ajaxSubmit(options);
}


function fnchoice(seq,obj){
	$("#storeseq").val( seq );
	$("#store").val( obj );
	front.pop.close('pop-02');
}


$("._addBtn").click(function() {
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    var menuValue = [];        
    $.each($("input[name='menuValue']:checked"), function(){                    
    	menuValue.push($(this).val());
    	document.getElementById("menu").value=menuValue;
    });
    
    var email = "";
    var email2 = "";
    var email3 = "";
    email2 = frm.find("input[name='email2']").val();
    email3 = frm.find("input[name='email3']").val();
    if ( email2 == ""){
    	email2 = email3;
    }
    var tt = "등록하시겠습니까?";
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>
    
    var validationChk = fnValidateCheck(frm);
	
	if (!validationChk)	return;
	    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("등록 되었습니다.");
				//fnPage('./manager_list.do');
				location.reload();
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./manager_proc.do",
		type : "post",
		dataType : 'json',
		//contentType : false,
		//processData : false,
		success : fnApplyCallback,
		error : function(data, result, resultMsg) {
			alert("데이터 전송 중 오류가 발생하였습니다.");
		}
	};
	frm.ajaxSubmit(options);
});

function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}

function PassChk(obj) {
	//<![CDATA[
	var pw = obj;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	if(pw.length < 4 || pw.length > 16){
		//alert("8자리 ~ 20자리 이내로 입력해주세요.");
		return false;
	}
	if(pw.search(/₩s/) != -1){
		//alert("비밀번호는 공백업이 입력해주세요.");
		return false;
	}
	/*
	} if(num <= 0 || eng <= 0 || spe <= 0 ){
		//alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		return false;
	}
	*/
	//]]>	
 	return true;
}

	$(function(){
		var frm = $("form[name=writeForm]");
	    $("#check0100").click(function(){
	        var chk = $(this).is(":checked");//.attr('checked');
	        if(chk) frm.find("input[name='menuValue']").prop('checked', true);
	        else  frm.find("input[name='menuValue']").prop('checked', false);
	    });
	    
	    /*
	    $("#radio0201").click(function(){
	    	var rk = $(this).is(":checked");
	    	if(rk){ 
	    		$("#storeArea").css("display","none");
	    		$("#bonsaArea1").css("display","table-row");
	    		$("#bonsaArea2").css("display","table-row");
	    	}
	    });
	    $("#radio0202").click(function(){
	    	var rk = $(this).is(":checked");
	    	if(rk){ 
	    		$("#storeArea").css("display","table-row");
	    		$("#bonsaArea1").css("display","none");
	    		$("#bonsaArea2").css("display","none");
	    	}
	    });
	    */
	});


	
</script>
</body>
</html>
