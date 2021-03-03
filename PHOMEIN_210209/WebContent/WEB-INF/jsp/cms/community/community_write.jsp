<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>
	<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도 
		<c:choose>
			<c:when test="${empty result}">등록</c:when>
			<c:when test="${not empty result}">상세/수정</c:when>
		</c:choose> | 게시판관리 | 포메인 통합관리자</c:if>
	<c:if test="${searchVO.boardType == 'event'}">이벤트
		<c:choose>
			<c:when test="${empty result}">등록</c:when>
			<c:when test="${not empty result}">상세/수정</c:when>
		</c:choose> | 게시판관리 | 포메인 통합관리자</c:if>
	<c:if test="${searchVO.boardType == 'sns'}">포메인 SNS 
		<c:choose>
			<c:when test="${empty result}">등록</c:when>
			<c:when test="${not empty result}">상세/수정</c:when>
		</c:choose> | 게시판관리 | 포메인 통합관리자</c:if>
</title>
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
				<span>게시판관리</span>
				<span>
					<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
					<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
					<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if>
				</span>
				<span><c:choose>
						<c:when test="${empty result}">등록</c:when>
						<c:when test="${not empty result}">상세/수정</c:when>
					</c:choose></span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">
				<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
				<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
				<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if>
			</h3>
			<div class="default-cell">
				<h4 class="sub-title">
					<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
					<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
					<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if> 
					<c:choose>
						<c:when test="${empty result}">등록</c:when>
						<c:when test="${not empty result}">상세/수정</c:when>
					</c:choose><span class="fc01">* 는 필수입력/선택 항목입니다</span>
				</h4>
				<div class="table-list-data">
					<fieldset>
						<legend>
							<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
							<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
							<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if>
							<c:choose>
								<c:when test="${empty result}">등록</c:when>
								<c:when test="${not empty result}">상세/수정</c:when>
							</c:choose>기본정보 입력 폼
						</legend>
						<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" onsubmit="return false">
						<input type="hidden" id="boardType" name="boardType" value="${searchVO.boardType }" />
						<input type="hidden" name="seq" id="seq" value="${result.seq }" />
						<table class="view">
							<caption>
								<c:if test="${searchVO.boardType == 'notice'}">공지&언론보도</c:if>
								<c:if test="${searchVO.boardType == 'event'}">이벤트</c:if>
								<c:if test="${searchVO.boardType == 'sns'}">포메인SNS</c:if> 
								<c:choose>
									<c:when test="${empty result}">등록</c:when>
									<c:when test="${not empty result}">상세/수정</c:when>
								</c:choose> 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" <c:if test="${result.useyn == 'Y' }">checked</c:if>><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" <c:if test="${result.useyn == 'N' }">checked</c:if>><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">구분 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<c:if test="${searchVO.boardType == 'notice'}">
												<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
					                        		<div>
					                        			<p class="radio-type01">
					                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${result.cate == codeResult.code}">checked</c:if> />
					                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
					                        			</p>
					                        		</div>
					                        	</c:forEach>
											</c:if>
											<c:if test="${searchVO.boardType == 'event'}">
												<c:forEach var="codeResult" items="${ fnc:codeListSub('108') }" varStatus="status">
					                        		<div>
					                        			<p class="radio-type01">
					                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${result.cate == codeResult.code}">checked</c:if> />
					                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
					                        			</p>
					                        		</div>
					                        	</c:forEach>
											</c:if>
											<c:if test="${searchVO.boardType == 'sns'}">
												<c:forEach var="codeResult" items="${ fnc:codeListSub('109') }" varStatus="status">
					                        		<div>
					                        			<p class="radio-type01">
					                        				<input type="radio" id="<c:out value="${codeResult.code}"/>" name="cate" value="<c:out value="${codeResult.code}"/>" <c:if test="${result.cate == codeResult.code}">checked</c:if> />
					                        				<label for="<c:out value="${codeResult.code}"/>"><span></span><c:out value="${codeResult.name}"/></label>
					                        			</p>
					                        		</div>
					                        	</c:forEach>
											</c:if>
										</div>
									</td>
								</tr>
								<c:if test="${searchVO.boardType == 'notice' }">
									<tr>
										<th scope="row">상단게시 <span class="need"></span></th>
										<td>
											<div class="mulity-check-radio">
												<div><p class="radio-type01"><input type="radio" id="radio0301" name="topview" value="N" <c:if test="${result.topview == 'N' }">checked</c:if>><label for="radio0301"><span></span>미게시</label></p></div>
												<div><p class="radio-type01"><input type="radio" id="radio0302" name="topview" value="Y" <c:if test="${result.topview == 'Y' }">checked</c:if>><label for="radio0302"><span></span>게시</label></p></div>
											</div>
										</td>
									</tr>
								</c:if>
								<c:if test="${searchVO.boardType == 'event' }">
									<tr id="storeTr" <c:if test="${result.cate == 'store' }">style='display:display;'</c:if> <c:if test="${result.cate != 'store' }">style='display:none;'</c:if>>
										<th scope="row">매장 <span class="need"></span></th>
										<td>
											<p class="input-btns">
												<input style="width:250px" type="text" id="store" name="store" readonly="" value="${result.store }">
												<a class="btn-01 type-03 round" href="javascript:void(0)" onclick="storeSearch();">매장 검색</a>
											</p>
										</td>
									</tr>
								</c:if>
								<tr>
									<th scope="row">제목 <span class="need"></span></th>
									<td>
										<input type="text" name="title" id="title" placeholder="제목을 입력하세요" style="width:100%" value="${result.title }">
									</td>
								</tr>
								<c:if test="${searchVO.boardType =='notice' || searchVO.boardType == 'event' }">
								<tr>
									<th scope="row">소제목 <span class="need"></span></th>
									<td>
										<input type="text" name="stitle" id="stitle" placeholder="소제목을 입력하세요" style="width:100%" value="${result.stitle }">
									</td>
								</tr>
								</c:if>
								<c:if test="${searchVO.boardType == 'event' }">
									<tr>
										<th scope="row">기간 <span class="need"></span></th>
										<td>
											<div class="date-input-wrap">
												<div class="cell"><p class="date-input"><input  value="${result.startdt }" class="datepicker" name="startdt" id="startdt" style="width:130px;" type="text"><!-- <img title="..." class="ui-datepicker-trigger" alt="..." src="/asset/images/datepicker/btn_datepicker.png"> --></p></div>
												<div class="cell"><p class="date-input"><input  value="${result.enddt }" class="datepicker" name="enddt" id="enddt" style="width:130px;" type="text"><!-- <img title="..." class="ui-datepicker-trigger" alt="..." src="/asset/images/datepicker/btn_datepicker.png"> --></p></div>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">진행 상태 <span class="need"></span></th>
										<td>
											<div class="mulity-check-radio">
												<div><p class="radio-type01"><input <c:if test="${result.event_progress == 'P' }">checked</c:if> name="event_progress" id="radio0301" type="radio" value="P"><label for="radio0301"><span></span>진행중</label></p></div>
												<div><p class="radio-type01"><input <c:if test="${result.event_progress == 'E' }">checked</c:if> name="event_progress" id="radio0302" type="radio" value="E"><label for="radio0302"><span></span>종료</label></p></div>
											</div>
										</td>
									</tr>
								</c:if>
								<c:if test="${searchVO.boardType == 'sns' }">
									<tr>
										<th scope="row">관련URL</th>
										<td>
											<input style="width:100%" type="text" id="url" value="${result.url }" name="url" placeholder="http://">
										</td>
									</tr>
								</c:if>
								<tr>
									<th scope="row">PC 썸네일이미지 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" name="pc_img_del" id="pc_img_del" value=""/>
														<input type="file" name="pc_img" id="pc_img" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="pc_img_txt" id="pc_img_txt" value="${result.pc_thimg }" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<input type="hidden" name="pc_thorinm" id="pc_thorinm" value="${result.pc_thorinm }"/>
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'pc_img')">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${not empty result.pc_thimg}">
														<div class="thumb"><img src="${result.pc_thimg }" ></div>
														</c:if>
													</div>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">PC 대체텍스트 <span class="need"></span></th>
									<td>
										<input type="text" name="pcAlt" id="pcAlt" value="${result.pc_alt }" placeholder="" style="width:100%">
									</td>
								</tr>
								<c:if test="${searchVO.boardType =='notice' || searchVO.boardType == 'event' }">
									<tr>
										<th scope="row">PC 내용 <span class="need"></span></th>
										<td>
											<div class="edit-area">
												<textarea id="pcContents" name="pcContents" rows="3" style="width:100%;" >${result.pc_contents }</textarea>
											</div>
										</td>
									</tr>
								</c:if>
								<tr>
									<th scope="row">MOBILE 썸네일이미지 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" name="m_img_del" id="m_img_del" value=""/>
														<input type="file" name="m_img" id="m_img" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="m_img_txt" id="m_img_txt" value="${result.m_thimg }" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<input type="hidden" name="m_thorinm" id="m_thorinm" value="${result.m_thorinm }"/>
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this , 'm_img')">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<c:if test="${not empty result.m_thimg}">
														<div class="thumb"><img src="${result.m_thimg }" ></div>
														</c:if>
													</div>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">MOBILE 대체텍스트 <span class="need"></span></th>
									<td>
										<input type="text" name="mAlt" id="mALt" value="${result.m_alt }" placeholder="" style="width:100%">
									</td>
								</tr>
								<c:if test="${boardType =='notice' || boardType == 'event' }">
									<tr>
										<th scope="row">MOBILE 내용 <span class="need"></span></th>
										<td><div class="edit-area"><textarea id="mContents" name="mContents" rows="3" style="width:100%;" >${result.m_contents }</textarea></div></td>
									</tr>
									<tr>
										<th scope="row">출처</th>
										<td>
											<input type="text" name="source" id="source" value="${result.source }" placeholder="" style="width:100%">
										</td>
									</tr>
								</c:if>
								<c:if test="${boardType =='notice'}">
									<tr>
										<th scope="row">관련URL</th>
										<td>
											<input type="text" name="url" id="url" value="${result.url }" placeholder="http://" style="width:100%">
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td>
											<ul class="file-parent" style="width:700px">
												<li class="add-input">
													<div class="add-file">
														<div class="file-input">
															<input type="hidden" dataFile="fileDel" name="file01_del" id="file01_del" value=""/>
															<input type="file" name="file01" dataFile="file" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="file-name01" dataFile="fileTxt" value="${result.filename1 }" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
															<input type="hidden" dataFile="fileOri" name="file1_orinm" value="${result.file1_orinm }"/>
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<c:if test="${result.filename1 != ''}">
																<ul class="file-list"><li><a href="/download.do?path=${result.filename1}&fileName=${result.file1_orinm }">${result.file1_orinm }</a></li></ul>
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
															<input type="file" name="file02" dataFile="file" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="file-name02" dataFile="fileTxt" value="${result.filename2 }" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
															<input type="hidden" dataFile="fileOri" name="file2_orinm" value="${result.file2_orinm }"/>
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<c:if test="${result.filename2 != ''}">
																<ul class="file-list"><li><a href="/download.do?path=${result.filename2}&fileName=${result.file2_orinm }">${result.file2_orinm }</a></li></ul>
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
															<input type="file" name="file03" dataFile="file" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="file-name03" dataFile="fileTxt" value="${result.filename3 }" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
															<input type="hidden" dataFile="fileOri" name="file3_orinm" value="${result.file3_orinm }"/>
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<c:if test="${result.filename3 != ''}">
																<ul class="file-list"><li><a href="/download.do?path=${result.filename3}&fileName=${result.file3_orinm }">${result.file3_orinm }</a></li></ul>
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
															<input type="file" name="file04" dataFile="file" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="file-name04" dataFile="fileTxt" value="${result.filename4 }" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
															<input type="hidden" dataFile="fileOri" name="file4_orinm" value="${result.file4_orinm }"/>
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<c:if test="${result.filename4 != ''}">
																<ul class="file-list"><li><a href="/download.do?path=${result.filename4}&fileName=${result.file4_orinm }">${result.file4_orinm }</a></li></ul>
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
															<input type="file" name="file05" dataFile="file" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
															<input type="text" name="file-name05" dataFile="fileTxt" value="${result.filename5 }" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
															<input type="hidden" dataFile="fileOri" name="file5_orinm" value="${result.file5_orinm }"/>
															<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this)">파일삭제</a>
															<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
															<c:if test="${result.filename5 != ''}">
																<ul class="file-list"><li><a href="/download.do?path=${result.filename5}&fileName=${result.file5_orinm }">${result.file5_orinm }</a></li></ul>
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
								</c:if>
								<tr>
									<th scope="row">작성</th>
									<td>
										<c:choose>
											<c:when test="${empty result}">${adminSession.adminid }</c:when>
											<c:when test="${not empty result}">${result.regid}</c:when>
										</c:choose>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					</fieldset>
				</div>
				<p class="btn-page-wrap">
					<a href="javascript:void(0)" class="btn-01 type-02" onclick="goList();">목록</a>
					<a href="javascript:void(0)" class="btn-01 type-01" id="_addBtn">저장</a>
				</p>
			</div>
		</section>
		<!-- //contents -->
		<!-- dFoot -->
		<footer id="dFoot"><div class="copy">Copyright ⓒ 2018 DAILYKING INC. All rights reserved.</div></footer>
		<!-- //dFoot -->
	</section>
	<!--// dBody -->
	<article class="layer-pop-wrap" id="pop-02" style="display:none;">
		<div class="layer-pop-parent">
			<div class="layer-pop-children">
				<div class="pop-data middle">
					<h2>매장 검색</h2>
					<div class="pop-con">
						<div class="default-cell">
							<h4 class="sub-title">매장 검색<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
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
													<input style="width:100%" type="text" id="searchStoreName" placeholder="매장명을 입력하세요">
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
							<p class="btn-page-wrap">
								<a class="btn-01 type-01" href="javascript:void(0)"  onclick="searchBtn();">검색</a>
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
											<th scope="col">선택</th>
										</tr>
									</thead>
									<tbody id="storeListTbody">
									</tbody>
								</table>
							</div>
						</div>
						<div class="paging-wrap">
							<div class="paging">
								<%@ include file="/WEB-INF/jsp/include/paging.jspf"%>
							</div>
						</div>
					</div>

					<div class="pop-bottom">
						<div class="btn-page-wrap al-c">
							<a class="btn-01 type-02" href="javascript:void(0);" onclick="front.pop.close(this);">닫기</a>
							<a class="btn-01 type-01" href="javascript:void(0);" onclick="selectStore();">확인</a>
						</div>
					</div>

					<a class="btn-pop-close" onclick="front.pop.close(this);" href="#pop-close"></a>
				</div>

			</div>
		</div>
	</article>
</div>
<form name="searchForm" id="searchForm" method="get" action="/admin/community/${boardType}/community_list.do" >
	<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
	<input type="hidden" name="searchCondition" id="searchCondition" value="" />
	<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
</form>
<!-- //wrap -->

<script src="/asset/common/js/front_ui.js"></script>
<script src="/asset/common/js/jquery.validate.js"></script>
<script src="/asset/common/js/additional-methods.js"></script>
<script src="http://cloud.tinymce.com/5/tinymce.min.js"></script>
<script>
$(function(){
	
});

function storeSearch(){
	front.pop.open('pop-02');
	
	$("#searchStoreName").val('');
	$('#storeListTbody').html('');
}

function searchBtn(){
	var storeName = $("#searchStoreName").val();
	if ( storeName == "" ){
		alert("매장명을 입력해주세요");
		return false;
	}
	storeSearchInit(storeName);
}


function storeSearchInit(storeName){
	$.ajax({
     	url: "/admin/store/get_store_list_ajax.do",
        type: "POST",
        data: {
        	'name' : storeName
        },
        dataType: 'json',
        success: function (data) {
        	$('#storeListTbody').html('');
        	
        	var $html;
    	    if(data.result.length > 0) {
				$.each(data.result, function(key, index){
					$html = '';
					$html += '<tr>';
					$html += '<td class="al-l">'+data.result[key].name+'</td>';
					$html += '<td class="al-l">'+data.result[key].oaddr+'</td>';
					$html += '<td><p class="radio-type01 single"><input name="storeRadio" id="r'+data.result[key].seq+'" type="radio" value="'+data.result[key].name+'"><label for="r'+data.result[key].seq+'"><span></span></label></p></td>';
					$html += '</tr>';
					$('#storeListTbody').append($html);
    			});
			} else {
				$html += '<tr><td colspan="3"><p class="none-data">등록된 게시물이 없습니다</p></td></tr>';
				$('#storeListTbody').append($html);
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

function selectStore(){
	var selectStore = $("input[name='storeRadio']:checked").val();
	
	if(selectStore == '' || selectStore == "undefined" || selectStore == undefined){
		alert("매장을 선택하세요.");
		return false;
	}
	
	$("#store").val(selectStore);
	$(".btn-pop-close").trigger("click");
}


$("input[name='cate']").click(function(){
	if($(this).val() == '108201'){
		$("#storeTr").show();
		$("#store").val('');
	}else{
		$("#storeTr").hide();
		$("#store").val('');
	}
})


$(".datepicker").datepicker({
	showOn:"both",
	buttonImage:"/asset/images/datepicker/btn_datepicker.png",
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
});


$("#_addBtn").click(function() {
	
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    var tt = "등록하시겠습니까?";
    
    <c:if test="${boardType =='notice'}">
    
    	if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
    		alert("노출여부를 선택해주세요.");
    		return false;
    	}
    	
    	if($("input[name='cate']:checked").val() == undefined || $("input[name='cate']:checked").val() == 'undefined'){
    		alert("구분을 선택해주세요.");
    		return false;
    	}
    	
    	if($("input[name='topview']:checked").val() == undefined || $("input[name='topview']:checked").val() == 'undefined'){
    		alert("상단게시를  선택해주세요.");
    		return false;
    	}
    	
    	if($("#title").val() == ''){
    		alert("제목을 입력해주세요.");
    		return false;
    	}
    	
    	if($("#stitle").val() == ''){
    		alert("소제목을 입력해주세요.");
    		return false;
    	}
    	
    	if($("#pc_img_txt").val() == ''){
       		alert("PC 썸네일이미지를 선택해주세요.");
       		return false;
       		
       	}else{
       		var fileName = $("#pc_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
       	
       	if($("#pcAlt").val() == ''){
       		alert("PC 대체텍스트를 입력해주세요");
       		return false;
       	}
       	
       	var pcTemp =  getHTML("pcContents");
       	if(pcTemp.indexOf('<p><br></p>') > -1){
       		alert('PC 내용을 입력해주세요.');
       		return false;
       	}
       	
       	if($("#m_img_txt").val() == ''){
       		alert("MOBILE 썸네일이미지를 선택해주세요.");
       		return false;
       	}else{
       		var fileName = $("#m_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
       	
       	if($("#mALt").val() == ''){
       		alert("MOBILE 대체텍스트를 입력해주세요.");
       		return false;
       	}
       	
       	var mTemp =  getHTML("mContents");
       	if(mTemp.indexOf('<p><br></p>') > -1){
       		alert('MOBILE 내용을 입력해주세요.');
       		return false;
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
    		var fileName = $("input[name=file-name04]").val();
       		if(!fileNameCheck(fileName)){
       			return false;
       		}
       	}
       	
    	
    </c:if>
    
    <c:if test="${boardType =='event'}">
    
		if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
			alert("노출여부를 선택해주세요.");
			return false;
		}
		
		if($("input[name='cate']:checked").val() == undefined || $("input[name='cate']:checked").val() == 'undefined'){
			alert("구분을 선택해주세요.");
			return false;
		}

		if($("input[name='cate']:checked").val() == '108201'){
			if($('#store').val() == ''){
				alert("매장을 선택해주세요.");
				return false;
			}
		}
		
		if($("#title").val() == ''){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if($("#stitle").val() == ''){
    		alert("소제목을 입력해주세요.");
    		return false;
    	}
		
		if($("#startdt").val() == '' || $("#enddt").val() == ''){
			alert("기간을 입력해주세요.");
			return false;
		}
		
		if ($("input[name='event_progress']:checked").val() === undefined 
				|| $("input[name='event_progress']:checked").val() === 'undefined') {
			alert("진행 상태를 입력해주세요.");
			return false;
		}
		
		if($("#pc_img_txt").val() == ''){
	   		alert("PC 썸네일이미지를 선택해주세요.");
	   		return false;
	   	}else{
       		var fileName = $("#pc_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
	   	
	   	if($("#pcAlt").val() == ''){
	   		alert("PC 대체텍스트를 입력해주세요");
	   		return false;
	   	}
	   	
	   	var pcTemp =  getHTML("pcContents");
	   	if(pcTemp.indexOf('<p><br></p>') > -1){
	   		alert('PC 내용을 입력해주세요.');
	   		return false;
	   	}
	   	
	   	if($("#m_img_txt").val() == ''){
	   		alert("MOBILE 썸네일이미지를 선택해주세요.");
	   		return false;
	   	}else{
       		var fileName = $("#m_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
	   	
	   	if($("#mALt").val() == ''){
	   		alert("MOBILE 대체텍스트를 입력해주세요.");
	   		return false;
	   	}
	   	
	   	var mTemp =  getHTML("mContents");
	   	if(mTemp.indexOf('<p><br></p>') > -1){
	   		alert('MOBILE 내용을 입력해주세요.');
	   		return false;
	   	}
		
	</c:if>
	
	<c:if test="${boardType =='sns'}">
    
		if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
			alert("노출여부를 선택해주세요.");
			return false;
		}
		
		if($("input[name='cate']:checked").val() == undefined || $("input[name='cate']:checked").val() == 'undefined'){
			alert("구분을 선택해주세요.");
			return false;
		}
		
		if($("#title").val() == ''){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if($("#pc_img_txt").val() == ''){
	   		alert("PC 썸네일이미지를 선택해주세요.");
	   		return false;
	   	}else{
       		var fileName = $("#pc_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
	   	
	   	if($("#pcAlt").val() == ''){
	   		alert("PC 대체텍스트를 입력해주세요");
	   		return false;
	   	}
	   	
	   	if($("#m_img_txt").val() == ''){
	   		alert("MOBILE 썸네일이미지를 선택해주세요.");
	   		return false;
	   	}else{
       		var fileName = $("#m_img_txt").val();
       		if(!imageNameCheck(fileName)){
       			return false;
       		}
       	}
	   	
	   	if($("#mALt").val() == ''){
	   		alert("MOBILE 대체텍스트를 입력해주세요.");
	   		return false;
	   	}
		
	</c:if>
    
    
    
    <c:if test="${boardType =='notice' || boardType == 'event' }">
	    var cnTemp =  getHTML("pcContents");
		frm.find("textarea[name=pcContents]").val(cnTemp);
	    var cnTemp =  getHTML("mContents");
		frm.find("textarea[name=mContents]").val(cnTemp);
	</c:if>
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>
    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("등록 되었습니다.");
				goList();
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "/admin/community/"+$('#boardType').val()+"/write_proc.do",
		type : "post",
		dataType : 'json',
		contentType : false,
		processData : false,
		success : fnApplyCallback,
		error : function(data, result, resultMsg) {
			alert("데이터 전송 중 오류가 발생하였습니다.");
		}
	};
	
	//alert($("#stitle").val());
	frm.ajaxSubmit(options);
});




function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}

$(document).ready(function(){

	<c:if test="${boardType =='notice' || boardType == 'event' }">
		addEditor("pcContents");
		addEditor("mContents");
	</c:if>

});
</script>
</body>
</html>
