<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>공지사항 | 인트라넷 | 포메인 통합관리자</title>
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
				<span>인트라넷</span>
				<span>공지사항</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">공지사항</h3>

			<div class="default-cell">
				<h4 class="sub-title">매장 공지 상세/수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="searchForm" id="searchForm" method="get" action="./board_list.do" >
					<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
					<input type="hidden" name="searchCondition" id="searchCondition" value="" />
					<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
				</form>
				<form name="updateForm" id="updateForm" method="post" enctype="multipart/form-data" onsubmit="return false" >
				<input type="hidden" name="seq" id="seq" value="${result.seq }" />
				<input type="hidden" name="pageIndex" id="pageIndex" value="" />
				<input type="hidden" name="searchCondition" id="searchCondition" value="" />
				<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
				<div class="table-list-data">
					<fieldset>
						<legend>매장 공지 상세/수정 기본정보 입력 폼</legend>
						<table class="view">
							<caption>매장 공지 상세/수정 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" <c:if test="${result.useyn == 'Y' }"> checked </c:if> ><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" <c:if test="${result.useyn == 'N' || result.useyn == '' }"> checked </c:if> ><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상단게시 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="topview" value="N" <c:if test="${result.topview == 'N' || result.useyn == '' }"> checked </c:if> ><label for="radio0201"><span></span>미게시</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="topview" value="Y" <c:if test="${result.topview == 'Y' }"> checked </c:if> ><label for="radio0202"><span></span>게시</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">제목 <span class="need"></span></th>
									<td><input type="text" name="title" style="width:100%" value="${result.title }"></td>
								</tr>
								<tr>
									<th scope="row">내용 <span class="need"></span></th>
									<td>
										<div class="edit-area">
											<textarea id="conts" name="conts" rows="3" style="width:100%;" >${result.contents }</textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">첨부파일 <!-- <span class="need"></span> --></th>
									<td>
									<c:choose>
										<c:when test="${result.filename1 == '' || result.filename1 == null }"><c:set var="fl" value="1"/></c:when>
										<c:when test="${result.filename2 == '' || result.filename2 == null }"><c:set var="fl" value="1"/></c:when>
										<c:when test="${result.filename3 == '' || result.filename3 == null }"><c:set var="fl" value="2"/></c:when>
										<c:when test="${result.filename4 == '' || result.filename4 == null }"><c:set var="fl" value="3"/></c:when>
										<c:when test="${result.filename5 == '' || result.filename5 == null }"><c:set var="fl" value="4"/></c:when>
										<c:otherwise><c:set var="fl" value="5"/></c:otherwise>
									</c:choose>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file01_del" id="file01_del" value=""/>
														<input type="file" dataFile="file" name="file01" id="f_file1" class="input-file" value="${result.filename1}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name01" id="fn1" readonly="" value="${result.filename1}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file01');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${result.filename1 != ''}">
															<ul class="file-list"><li><a href="/download.do?path=${result.filename1}&fileName=${result.orgfilename1 }">${result.orgfilename1 }</a></li></ul>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											<c:if test="${not empty result.filename2}">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file02_del" id="file02_del" value=""/>
														<input type="file" dataFile="file" name="file02" id="f_file2" class="input-file" value="${result.filename2}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name02" id="fn2" readonly="" value="${result.filename2}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file02');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${result.filename2 != ''}">
															<ul class="file-list"><li><a href="/download.do?path=${result.filename2}&fileName=${result.orgfilename2 }">${result.orgfilename2 }</a></li></ul>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:if>
											<c:if test="${not empty result.filename3}">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file03_del" id="file03_del" value=""/>
														<input type="file" dataFile="file" name="file03" id="f_file3" class="input-file" value="${result.filename3}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name03" id="fn3" readonly="" value="${result.filename3}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file03');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${result.filename3 != ''}">
															<ul class="file-list"><li><a href="/download.do?path=${result.filename3}&fileName=${result.orgfilename3 }">${result.orgfilename3}</a></li></ul>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:if>
											<c:if test="${not empty result.filename4}">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file04_del" id="file04_del" value=""/>
														<input type="file" dataFile="file" name="file04" id="f_file4" class="input-file" value="${result.filename4}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name04" id="fn4" readonly="" value="${result.filename4}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file04');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${result.filename4 != ''}">
															<ul class="file-list"><li><a href="/download.do?path=${result.filename4}&fileName=${result.orgfilename4 }">${result.orgfilename4 }</a></li></ul>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:if>
											<c:if test="${not empty result.filename5}">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file05_del" id="file05_del" value=""/>
														<input type="file" dataFile="file" name="file05" id="f_file5" class="input-file" value="${result.filename5}" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name05" id="fn5" readonly="" value="${result.filename5}" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file05');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${result.filename5 != ''}">
															<ul class="file-list"><li><a href="/download.do?path=${result.filename5}&fileName=${result.orgfilename5 }">${result.orgfilename5 }</a></li></ul>
														</c:if>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
											</c:if>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif, hwp, txt, ppt, pptx, doc, docx, xls, pdf, zip만 등록 가능</span>
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
				<input type="hidden" name="orgfilename1" value="${result.orgfilename1 }"/>
				<input type="hidden" name="orgfilename2" value="${result.orgfilename2 }"/>
				<input type="hidden" name="orgfilename3" value="${result.orgfilename3 }"/>
				<input type="hidden" name="orgfilename4" value="${result.orgfilename4 }"/>
				<input type="hidden" name="orgfilename5" value="${result.orgfilename5 }"/>
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

function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}

$("._addBtn").click(function() {
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=updateForm]");
    
    var tt = "등록하시겠습니까?";
    var cnTemp =  getHTML("conts");
	frm.find("textarea[name=conts]").val(cnTemp); 
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>
    
    if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
   		alert("노출여부를 선택해주세요.");
   		return false;
   	}

   	if($("input[name='topview']:checked").val() == undefined || $("input[name='topview']:checked").val() == 'undefined'){
   		alert("상단게시를 선택해주세요.");
   		return false;
   	}
   	
    if ( $("input[name='title']").val() == "" ){
    	alert("제목을 입력하세요");
    	return;
    }
    var tx = $("textarea#conts").val();
    if ( tx.indexOf('<p><br></p>') > -1){
    	alert("내용을 입력하세요.");
    	return;
    }
    

   	if($("input[name=file-name01]").val() != '' && $("input[name=file-name01]").val() != undefined){
		var fileName = $("input[name=file-name01]").val();
   		if(!fileNameCheck(fileName)){
   			return false;
   		}
   	}
   	
   	if($("input[name=file-name02]").val() != '' && $("input[name=file-name02]").val() != undefined){
		var fileName = $("input[name=file-name02]").val();
   		if(!fileNameCheck(fileName)){
   			return false;
   		}
   	}

   	if($("input[name=file-name03]").val() != '' && $("input[name=file-name03]").val() != undefined){
		var fileName = $("input[name=file-name03]").val();
   		if(!fileNameCheck(fileName)){
   			return false;
   		}
   	}
   	
   	if($("input[name=file-name04]").val() != '' && $("input[name=file-name04]").val() != undefined){
		var fileName = $("input[name=file-name04]").val();
   		if(!fileNameCheck(fileName)){
   			return false;
   		}
   	}
   	
   	if($("input[name=file-name05]").val() != '' && $("input[name=file-name05]").val() != undefined){
		var fileName = $("input[name=file-name05]").val();
   		if(!fileNameCheck(fileName)){
   			return false;
   		}
   	}        
    
    var validationChk = fnValidateCheck(frm);
	
	if (!validationChk)	return;
	    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("등록 되었습니다.");
				fnPage('./board_list.do');
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./board_proc.do",
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

$(document).ready(function(){

	addEditor("conts");

});
</script>
<script> 
//alert( front.form.fileNum );
front.form.fileNum = '<c:out value="${fl}"/>';
//alert( front.form.fileNum );
</script>
</body>
</html>
