<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>본사물품신청관리 | 인트라넷 | 포메인 통합관리자</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
	<script type="text/javascript">
	// <![CDATA[  
	    
	    $(document).ready(function(){

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
				<span>인트라넷</span>
				<span>본사물품신청관리</span>
				<span>등록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">본사 물품 신청 관리</h3>

			<div class="default-cell">
				<h4 class="sub-title">본사 물품 신청 관리 등록<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="searchForm" id="searchForm" method="get" action="order_item_manage_list.do" >
				<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
				<input type="hidden" name="searchCondition" id="searchCondition" value="" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
				</form>
				<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" onsubmit="return false" >
				<input type="hidden" name="cate" value="item"/>
				<input type="hidden" name="groupprice" value=""/>
				<input type="hidden" name="groupoption" value=""/>
				<div class="table-list-data">
					<fieldset>
						<legend>본사 물품 신청 관리 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>본사 물품 신청 관리 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" checked><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" ><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">항목 <span class="need"></span></th>
									<td><input type="text" style="width:100%" name="title" value="" placeholder="항목을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">대표이미지<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file01_del" id="file01_del" value=""/>
														<input type="file" dataFile="file" name="file01" id="f_file1" class="input-file" value="" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name01" id="fn1" readonly="" value="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file01');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<div class="thumb" style="display:none;"></div>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">내용 <span class="need"></span></th>
									<td><div class="edit-area"><textarea id="conts" name="conts" rows="10" style="width:100%;" ></textarea></div></td>
								</tr>
								<tr>
									<th scope="row">사이즈/가격 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:440px">
											<li class="add-input">
												<div class="add-text">
													<div class="row-input-wrap">
														<div><input type="text" name="option" id="option0" style="width:200px"><span class="char">/</span></div>
														<div><input type="text" name="price" id="price0" style="width:100px" class="al-r" onkeyup="fnOnlyNumber(this);"><span class="char">원</span></div>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputText(this);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputText(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">작성</th>
									<td>${adminSession.adminid }</td>
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
</div>
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){

});

function fnPrice(ob){
	
	if ( ob == 'Y' ){
		$("#priceChoice1").css("display", "table-row");
		$("#priceChoice2").css("display", "none");
	}else{
		$("#priceChoice1").css("display", "none");
		$("#priceChoice2").css("display", "table-row");
	}
	
}

$("._addBtn").click(function() {
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    var price = frm.find("input[name='price']").val();
    
    var size = $("input[name='price']").length;
	var fileData = new Array(size);
	for ( i = 0; i < size; i++){
		fileData[i] = $("input[name='price']")[i].value;
	}
	frm.find("input[name='groupprice']").val(fileData);
	
    var size = $("input[name='option']").length;
	var fileData = new Array(size);
	for ( i = 0; i < size; i++){
		fileData[i] = $("input[name='option']")[i].value;
	}
	frm.find("input[name='groupoption']").val(fileData);
    
    var tt = "등록하시겠습니까?";
    var cnTemp =  getHTML("conts");
	frm.find("textarea[name=conts]").val(cnTemp); 
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>

   	if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
   		alert("노출여부를 선택해주세요.");
   		return;
   	}
    if ( $("input[name='title']").val() == "" ){
    	alert("항목을 입력하세요");
    	return;
    }
    
   	if($("input[name=file-name01]").val() != '' && $("input[name=file-name01]").val() != undefined){
		var fileName = $("input[name=file-name01]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name02]").val() != '' && $("input[name=file-name02]").val() != undefined){
		var fileName = $("input[name=file-name02]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}

   	if($("input[name=file-name03]").val() != '' && $("input[name=file-name03]").val() != undefined){
		var fileName = $("input[name=file-name03]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name04]").val() != '' && $("input[name=file-name04]").val() != undefined){
		var fileName = $("input[name=file-name04]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name05]").val() != '' && $("input[name=file-name05]").val() != undefined){
		var fileName = $("input[name=file-name05]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}    	
    	
    var tx = $("textarea#conts").val();
    if ( tx.length < 4 ){
    	alert("내용을 입력하세요.");
    	return;
    }   	
    
    
    var optionFlag = true;
    $("input[name=option]").each(function() {
    	if ($(this).val() === '') {
    		alert("상품종류를 입력하세요.");
    		optionFlag = false;
    		return false;
    	}
    });
	if (optionFlag === false) {
		return false;
	}    
    $("input[name=price]").each(function() {
    	if ($(this).val() === '') {
    		alert("상품가격을 입력하세요.");
    		optionFlag = false;
    		return false;
    	}
    	if (Number($(this).val()) === 0) {
    		alert("상품 가격은 0원으로 등록할 수 없습니다.");
    		optionFlag = false;
    		return false;
    	}
    });
	if (optionFlag === false) {
		return false;
	}    
    if ( $("input[name='groupprice']").val() == "" ){
    	alert("상품 종류 및 가격을 입력하세요");
    	return;
    }    	
    	
    var validationChk = fnValidateCheck(frm);
	
	if (!validationChk)	return;
	    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("등록 되었습니다.");
				fnPage('./order_item_manage_list.do');
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./design_proc.do",
		type : "post",
		dataType : 'json',
		contentType : false,
		processData : false,
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

$(document).ready(function(){

	addEditor("conts");

});
</script>
</body>
</html>
