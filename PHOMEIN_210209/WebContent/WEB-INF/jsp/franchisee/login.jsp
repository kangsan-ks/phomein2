<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>로그인 | 포메인 가맹점 관리</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
</head>
<body>

<!-- wrap -->
<!-- 20190502 수정 s -->
<div id="wrap" class="franchisee">
<!-- //20190502 수정 e -->

	<!-- login-wrap -->
	<div class="login-wrap">
		<div class="d-t">
			<div class="d-c">
				<div class="input-data">
					<form action="./loginProc.do" method="post" name="loginForm" onsubmit="return false;">
					<h1>포메인 가맹점 관리자 로그인</h1>
					<fieldset>
						<legend>로그인 입력 폼</legend>
						<p class="input-cell">
							<input type="text" name="fId" id="fId" placeholder="" data-null="not" style="width:100%;">
							<label for="pu-id">아이디</label>
						</p>
						<p class="input-cell">
							<input type="password" name="fPw" id="fPw" placeholder="" data-null="not" style="width:100%;" onKeyPress="if(event.keyCode == 13) { fnDoLogin(); return false; }">
							<label for="pu-pw">비밀번호</label>
						</p>
						<div class="check-save">
							<p class="check-type01">
								<input type="checkbox" id="save" name="idsave">
								<label for="save"><span></span>아이디 저장</label>
							</p>
						</div>
						<p class="btn-login">
							<button class="btn-01 type-01" onclick="javascript:fnDoLogin(); return false;">로그인</button>
						</p>
					</fieldset>
					<ul>
						<li>관리자로 로그인 하시려면 아이디와 비밀번호를 입력 해 주세요</li>
<!-- 						<li>관리자 계정 문의 및 비밀번호 변경은 데일리킹 <br>(Tel. 000-000-0000)로 문의바랍니다</li> -->
					</ul>
					</form>
				</div>
				<div class="copy">
					<p>경기도 성남시 분당구 황새울로 216, 401호 (수내동, 휴맥스빌리지) 주식회사 데일리킹 <br>Tel: 1899-2422 상호명: 주식회사 데일리킹<span>사업자등록번호: 129-86-03729</span></p>
					<!-- 20190502 수정 s -->
					<p>Copyright ⓒ 2019 DAILYKING INC. All rights reserved.</p>
					<!-- //20190502 수정 e -->
				</div>
			</div>
		</div>
	</div>
	<!-- //login-wrap -->

</div>
<!-- //wrap -->

<script type="text/javascript">
	function fnDoLogin(){
		
		var frm = $("form[name=loginForm]");		
	
		frm.find("input[name='fId']").val( $.trim(frm.find("input[name='fId']").val()) );
		frm.find("input[name='fPw']").val( $.trim(frm.find("input[name='fPw']").val()) );
		
		if ( frm.find("input[name='fId']").val() == '' ){
			alert("아이디를 입력해주세요.");
			return;
		}
		if ( frm.find("input[name='fPw']").val() == '' ){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
            setCookie("adminid", frm.find("input[name='fId']").val(), 30); //쿠키이름을 id로 아이디입력필드값을 30일동안 저장
        } else { // 아이디 저장을 체크 하지 않았을때
            setCookie("adminid", frm.find("input[name='fId']").val(), 0); //날짜를 0으로 저장하여 쿠키삭제
        }
		
        // ajaxSubmit 전 처리 작업
        var fnApplyBefore = function(romData, jqFrom, options){
        }
       
        // ajaxSubmit 통신 후 처리 작업
        var fnApplyCallback = function(objResponse, statusText, xhr, $from){
        	var obj = JSON.parse( objResponse );
        	if (statusText == "success"){
                if( obj["result"] == 'S' ){
               		//location.replace("/admin/menu/product_list.do");
               		//alert( obj["permission"] );
                	//location.replace("/admin/intranet/order_design_manage_list.do");
               		var perArr = obj["permission"].split(",");
               		//alert( perArr.length );
               		var menuCd = perArr[0];
               		if ( menuCd == '999' ) menuCd = perArr[1];
                	//<![CDATA[
               		location.replace("/store/intranet/board_list.do");
                	//]]>
                }else if(obj["result"] == "F"){
                	alert("등록된 관리자 정보가 없습니다.");
                }else{
                	alert("로그인 오류. \n데이터 전송 중 오류가 발생하였습니다.");                    
                }
            }else{
                alert("데이터 전송 중 오류가 발생하였습니다.");    
            }
        }
        var options = {
            url : "./loginProc.do",
            type : "post" , 
            dataType : 'json', 
            beforeSerialize: function() {

            },
            beforeSubmit : fnApplyBefore ,
            success : fnApplyCallback , 
            error: function(data, result, resultMsg) {
            	// console.dir("error : " + result + " ["+ resultMsg + "]");
            }            
        };
        
       frm.ajaxSubmit( options );
	}

	function setCookie(name, value, expiredays) //쿠키 저장함수
    {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires="
                + todayDate.toGMTString() + ";"
    }
 
    function getCookie(Name) { // 쿠키 불러오는 함수
        var search = Name + "=";
        if (document.cookie.length > 0) { // if there are any cookies
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // if cookie exists
                offset += search.length; // set index of beginning of value
                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                if (end == -1)
                    end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
        }
    }

	    
	$(document).ready(function(){
		 if (getCookie("adminid")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
            document.loginForm.fId.value = getCookie("adminid"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
            document.loginForm.idsave.checked = true; // 체크는 체크됨으로
        }
	});
</script>
<script src="/asset/common/js/front_ui.js"></script>
</body>
</html>
