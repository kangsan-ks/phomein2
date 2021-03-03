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
				<span>상세/수정</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">본사 물품 신청 관리</h3>
			<form name="searchForm" id="searchForm" method="get" action="order_item_manage_list.do" >
			<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
			<input type="hidden" name="searchCondition" id="searchCondition" value="" />
			<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
			</form>
			<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" onsubmit="return false" >
			<input type="hidden" name="seq" id="seq" value="${result.seq }" />
			<input type="hidden" name="cate" value="item"/>
			<input type="hidden" name="groupuseq" value=""/>
			<input type="hidden" name="groupdelete" value=""/>
			<input type="hidden" name="groupprice" value=""/>
			<input type="hidden" name="groupoption" value=""/>
			<div class="default-cell">
				<h4 class="sub-title">본사 물품 신청 관리 상세/수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<div class="table-list-data">
					<fieldset>
						<legend>본사 물품 신청 관리 상세/수정 기본정보 입력 폼</legend>
						<table class="view">
							<caption>본사 물품 신청 관리 상세/수정 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" <c:if test="${result.useyn == 'Y' }"> checked </c:if>><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" <c:if test="${result.useyn == 'N' || result.useyn == '' }"> checked </c:if>><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">항목 <span class="need"></span></th>
									<td><input type="text" style="width:100%" name="title" value="${result.title }" placeholder="항목을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">대표이미지<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<c:choose>
											<c:when test="${not empty fileresult }" >
											<c:forEach items="${fileresult }" var="fileresult" varStatus="status" >
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file0${ status.count}_del" id="file0${ status.count}_del" value=""/>
														<input type="file" dataFile="file" name="file0${ status.count}" id="f0${ status.count}" class="input-file" value="${ fileresult.filename}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name0${ status.count}" id="fn0${ status.count}" readonly="" value="${ fileresult.filename}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:void(0);" class="btn-close" onclick="front.form.deleteFileText(this,'file0${status.count}');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${ not empty fileresult.filename}">
														<div class="thumb"><img src="${ fileresult.filename}" ></div>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											<c:set var="fl" value="${fl + 1}"/>
											</c:forEach>
											</c:when>
											<c:otherwise>
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file01_del" id="file01_del" value=""/>
														<input type="file" dataFile="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name01" id="fn01" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close"  onclick="front.form.deleteFileText(this,'file01')">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											<c:set var="fl" value="1"/>
											</c:otherwise>
											</c:choose>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">내용 <span class="need"></span></th>
									<td><div class="edit-area"><textarea id="conts" name="conts" rows="3" style="width:100%;" >${ result.contents }</textarea></div></td>
								</tr>
								<tr>
									<th scope="row">사이즈/가격 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:440px">
											<c:choose>
											<c:when test="${ not empty priceList }" >
											<c:forEach items="${ priceList }" var="price" varStatus="status" >
											<li class="add-input">
												<div class="add-text">
													<div class="row-input-wrap"><input type="hidden" name="useq" id="useq" value="${ price.seq }"/>
														<div><input type="text" name="option" id="option0" value="${ price.options }" style="width:200px"><span class="char">/</span></div>
														<div><input type="text" name="price" id="price0" value="${ price.price }" style="width:100px" class="al-r" onkeyup="fnOnlyNumber(this);"><span class="char">원</span></div>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputText(this);" class="btn-add"></a>
														<a href="javascript:;" onclick="fnDeleteOption(this, '${ price.seq }');" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:forEach>
											</c:when>
											<c:otherwise>
											<li class="add-input">
												<div class="add-text">
													<div class="row-input-wrap"><input type="hidden" name="useq" id="useq" value="0"/>
														<div><input type="text" name="option" id="option0" style="width:150px" class="al-r"><span class="char">/</span></div>
														<div><input type="text" name="price" id="price0" style="width:150px" class="al-r"><span class="char">원</span></div>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputText(this);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputText(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:otherwise>
											</c:choose>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">수정</th>
									<td>${result.regid }</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

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
	
	var useq = frm.find("input[name='useq']").val();
	    
    var size = $("input[name='useq']").length;
	var fileData = new Array(size);
	for ( i = 0; i < size; i++){
		fileData[i] = $("input[name='useq']")[i].value;
	}
	frm.find("input[name='groupuseq']").val(fileData);
	
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
   	
    if ( $("input[name='groupprice']").val() == "" ){
    	alert("상품 종류 및 가격을 입력하세요");
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

function deleteOption(useq){
	var frm = $("form[name=writeForm]");
	var seq = useq;
	var del_data = frm.find("input[name='groupdelete']").val();
	if ( del_data == "" ){
		frm.find("input[name='groupdelete']").val(seq);	
	}else{
		frm.find("input[name='groupdelete']").val(del_data + "," + seq);
	}
	
}

function fnDeleteOption(obj, useq) {
	var len = front.form.deleteInputText(obj);
	if (len) {
		deleteOption(useq);
	}
}

$(document).ready(function(){

	addEditor("conts");
	
	fnPrice('<c:out value='${result.priceuse}'/>');

});

front.form.fileNum = <c:out value="${fl}"/>;


</script>
</body>
</html>
