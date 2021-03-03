<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>관리자관리 | 사이트관리 | 포메인 통합관리자</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
	<script type="text/javascript">
	// <![CDATA[  
	    
	    $(document).ready(function(){
			
	    	$("#storeArea").css("display","none");
	    });
	    
		function fnSearchForm() {

			$('#searchCondition').val($('#searchConditionTemp').val());
			$('#searchKeyword').val($('#searchKeywordTemp').val());

			var searchKeyword = $('input[name=searchKeyword]').val();
			fnPaging(1);
		}
		
		function fnReset(){
			$('#searchKeyword').val('');
			fnPaging(1);
		}

     // ]]>
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
				<span>사이트관리</span>
				<span>관리자관리</span>
				<span>등록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">관리자 관리</h3>
			
			<div class="default-cell">
				<h4 class="sub-title">관리자 관리 등록<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="searchForm" id="searchForm" method="get" action="./manager_list.do" >
					<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
					<input type="hidden" name="searchCondition" id="searchCondition" value="" />
					<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
				</form>
				<form name="writeForm" id="writeForm" method="post" onsubmit="return false" >
				<div class="table-list-data">
					<fieldset>
						<legend>관리자 관리 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>관리자 관리 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상태여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" checked><label for="radio0101"><span></span>활성</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N"><label for="radio0102"><span></span>비활성</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">계정타입 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="admintype" value="111201" checked><label for="radio0201"><span></span>통합관리자</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="admintype" value="111202" ><label for="radio0202"><span></span>매장관리자</label></p></div>
										</div>
									</td>
								</tr>
								<tr id="storeArea">
									<th scope="row">매장선택 <span class="need"></span></th>
									<td>
										<input type="hidden" name="storeseq" id="storeseq" value=""/>
										<p class="input-btns"><input type="text" name="store" id="store" style="width:250px" readonly><a href="javascript:front.pop.open('pop-02');" class="btn-01 type-03 round">매장 검색</a></p>
									</td>
								</tr>
								<tr id="bonsaArea1">
									<th scope="row">부서 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<c:forEach var="codeResult" items="${ fnc:codeListSub('112') }" varStatus="status">
			                        		<div>
			                        			<p class="radio-type01">
			                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="bu" value="<c:out value="${codeResult.code}"/>"  />
			                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
			                        			</p>
			                        		</div>
			                        		</c:forEach> 
										</div>
									</td>
								</tr>
								<tr id="bonsaArea2">
									<th scope="row">권한설정 <span class="need"></span></th>
									<td><!-- TODO --><input type="hidden" name="menu" id="menu" value=""/>

										<div class="mulity-check-radio">
											<div><p class="check-type01"><input type="checkbox" id="check0100" name="menuValue" value="999" ><label for="check0100"><span></span>전체</label></p></div>
										</div>
										<br/><br/>
										<c:set var="cnt" value="1"/>
										<c:forEach var="codeResult" items="${fnc:menuList('')}">
										<div class="mulity-check-radio">
												<c:forEach var="subResult" items="${fnc:menuListSub( codeResult.menuCd )}" varStatus="status">
												<div><p class="check-type01"><input type="checkbox" id="check010${cnt}" name="menuValue" value="${subResult.menuCd }" <c:if test="${fn:indexOf(result.menu, subResult.menuCd)>-1}">checked</c:if>><label for="check010${cnt}"><span></span>[${codeResult.menuNm }] - ${subResult.menuNm }</label></p></div>
												<c:set var="cnt" value="${cnt + 1}"/>
												</c:forEach>
										</div>
										<br/><br/>
										</c:forEach>
										
									</td>
								</tr>
								<tr>
									<th scope="row">이름 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="name" value="" placeholder="이름을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">아이디 <span class="need"></span></th>
									<td><p class="input-btns"><input type="text" name="adminid" id="adminid" value="" style="width:250px"><a href="javascript:fnDup();" class="btn-01 type-03 round">중복 확인</a></p>
										<input type="hidden" name="idDupchk" value="N"/>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <span class="need"></span></th>
									<td>
										<input type="password" style="width:250px"  name="adminpw" id="adminpw" placeholder="비밀번호">
										<span class="input-block-info">- 영문자, 숫자, 특수문자 조합하여 4~16자리</span>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 확인 <span class="need"></span></th>
									<td>
										<input type="password" style="width:250px"  name="adminpw2" id="adminpw2" placeholder="비밀번호 확인">
										<span class="input-block-info">- 영문자, 숫자, 특수문자 조합하여 4~16자리</span>
									</td>
								</tr>
								<tr>
									<th scope="row">연락처 <span class="need"></span></th>
									<td>
										<div class="phone-wrap">
											<div class="first">
												<select name="hp1" title="휴대폰 첫번재 4자리 선택">
													<option value="010" <c:if test="${result.hp1 == '010' }">selected</c:if> >010</option>
													<option value="011" <c:if test="${result.hp1 == '011' }">selected</c:if> >011</option>
													<option value="016" <c:if test="${result.hp1 == '016' }">selected</c:if> >016</option>
													<option value="017" <c:if test="${result.hp1 == '017' }">selected</c:if> >017</option>
													<option value="018" <c:if test="${result.hp1 == '018' }">selected</c:if> >018</option>
													<option value="019" <c:if test="${result.hp1 == '019' }">selected</c:if> >019</option>
												</select>
											</div>
											<div class="second"><input type="text" name="hp2" value="" maxlength="4" title="휴대폰 두번째 4자리 입력"></div>
											<div class="three"><input type="text" name="hp3" value="" maxlength="4" title="휴대폰 세번째 4자리 입력"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="need"></span></th>
									<td>
										<div class="email-wrap">
											<p class="email-name"><input type="text" name="email1" id="email1" value="" title="이메일 아이디 입력"></p>
											<p class="email-address"><input type="text" name="email2" id="email2" value="" title="이메일 주소 입력"></p>
											<p class="email-select">
												<select name="email3" onchange="fnSelectEmail(this.value);">
													<option value="">선택하세요.</option>
													<c:forEach var="codeResult" items="${fnc:codeListSub('114')}" >
					                				<option value="${codeResult.name }" ><c:out value="${codeResult.name }"/></option>  
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
					<a href="#" onclick="goList();" class="btn-01 type-02">목록</a>
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
	

	<!-- 매장 검색 팝업 -->
	<!-- layer-pop-wrap -->
	<article id="pop-02" class="layer-pop-wrap">
		<div class="layer-pop-parent">
			<div class="layer-pop-children">

				<div class="pop-data middle">
					<h2>매장 검색</h2>
					<div class="pop-con">
						<div class="default-cell">
							<h4 class="sub-title">매장 검색<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
							<form name="storeForm" id="storeForm" onsubmit="return false;">
							<div class="table-list-data">
								<fieldset>
									<legend>이벤트 등록 기본정보 입력 폼</legend>
									<table class="view middle">
										<caption>이벤트 등록 기본정보 입력 폼 테이블</caption>
										<colgroup>
											<col style="width:100px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">매장 <span class="need"></span></th>
												<td>
													<input type="text" name="name" id="name" value="" placeholder="매장명을 입력하세요" style="width:100%">
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
							</form>
							<p class="btn-page-wrap">
								<a href="#" onclick="setStoreList(); return false;" class="btn-01 type-01">검색</a>
							</p>
						</div>
		
						<div class="default-cell">
							<div class="table-list-data">
								<table class="list">
									<caption>이벤트 리스트 테이블 표</caption>
									<colgroup>
										<col style="width:120px">
										<col style="width:auto">
										<col style="width:100px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">매장명</th>
											<th scope="col">주소</th>
											<th scope="col">선태</th>
										</tr>
									</thead>
									<tbody id="storeList">
										
									</tbody>
								</table>
							</div>
						</div>
						<%-- <div class="paging-wrap">
							<div class="paging">
								<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
							</div>
						</div> --%>
					</div>

					<div class="pop-bottom">
						<div class="btn-page-wrap al-c">
							<a href="#" onclick="front.pop.close(this);" class="btn-01 type-02">닫기</a>
							<a href="#" onclick="front.pop.close(this);" class="btn-01 type-01">확인</a>
						</div>
					</div>

					<a href="#pop-close" onclick="front.pop.close(this);" class="btn-pop-close"></a>
				</div>

			</div>
		</div>
	</article>
	<!-- layer-pop-wrap -->
	<!-- //매장 검색 팝업 -->	
		
</div>
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){

});


function fnSelectEmail(obj){
	$("#email2").val( obj );
}

function fnDup(){
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    var adminid = frm.find("input[name='adminid']").val();
    if ( adminid == null || adminid == ""){
    	alert("아이디를 입력해 주세요.");
    	return false;
    }
    
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("사용가능한 아이디 입니다.");
				frm.find("input[name='idDupchk']").val("Y");
			} else if (obj["result"] == 'Dup') {
				alert("중복된 아이디 입니다.");
				frm.find("input[name='idDupchk']").val("N");
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
				frm.find("input[name='idDupchk']").val("N");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
			frm.find("input[name='idDupchk']").val("N");
		}
	}

	var options = {
		url : "./dup_proc.do",
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


function setStoreList(){

	var frm = $("form[name=storeForm]");
	var obj = frm.find("input[name='name']").val();
	if ( obj == "" ){
		alert("매장명을 입력해주세요");
		return false;
	}
	var page = 1;
	var params = "pageIndex2=" + page + "&name=" + obj;
    $.ajax({  
        type: "post",
        url : "./jsonList.do",
        dataType : "json",
        data : params,
        cache:false,
        error:function ( e ){	                 
        },
        success:function ( jdata, e, a ){
        	var data = JSON.parse( jdata );
			var List = data.list;
			var html = "";
			if (List.length > 0 ) {            	   
	        	for ( var i = 0 ; i < List.length ; i ++  ) {
					html += "<tr>";
					html += "<td class='al-l'>"+List[i].name+"</td>";
					html += "<td class='al-l'>"+List[i].naddr+"</td>";
					html += "<td><p class='radio-type01 single'><input type='radio' id='r0"+i+"' name='storename' onclick=\"fnchoice('"+List[i].seq+"','"+List[i].name+"');\"><label for='r0"+i+"'><span></span></label></p></td>";
					html += "</tr>";
	        	}
			}else{
					html += "<tr>";
					html += "<td colspan='3'><p class='none-data'>등록된 게시물이 없습니다</p></td>";
					html += "</tr>";
			}
			$("#storeList").html( html );
        },
        complete:function(){  
        }               
         
    });          	
}

function fnchoice(seq,obj){
	$("#storeseq").val( seq );
	$("#store").val( obj );
	front.pop.close('pop-02');
}


$("._addBtn").click(function() {
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    var idDupchk = frm.find("input[name='idDupchk']").val();
    if ( idDupchk == "N" ){
		alert("아이디 중복체크를 해주세요.");
		return false;
    }
    
    var pw1 = frm.find("input[name='adminpw']").val();
    var pw2 = frm.find("input[name='adminpw2']").val();
    if ( pw1 != pw2){
		alert("비밀번호가 맞지 않습니다.");
		return false;
    }
    
    if  ( !PassChk(pw1) ){
    	alert("비밀번호는 영문자, 숫자, 특수문자를 조합하여 4~16자리로 입력해주세요.");
    	return false;
    } 
    
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
				fnPage('./manager_list.do');
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
 	return true;
}

	$(function(){
		var frm = $("form[name=writeForm]");
	    $("#check0100").click(function(){
	        var chk = $(this).is(":checked");//.attr('checked');
	        if(chk) frm.find("input[name='menuValue']").prop('checked', true);
	        else  frm.find("input[name='menuValue']").prop('checked', false);
	    });

	});
	
	
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
	

</script>
</body>
</html>
