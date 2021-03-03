<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>공지&언론보도 상세/수정 | 커뮤니티 | 포메인 통합 관리</title>
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
				<span>커뮤니티</span>
				<span>공지&언론보도</span>
				<span>상세/수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">공지&언론보도</h3>

			<div class="default-cell">
				<h4 class="sub-title">공지&언론보도 상세/수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<div class="table-list-data">
					<fieldset>
						<legend>공지&언론보도 상세/수정 기본정보 입력 폼</legend>
						<table class="view">
							<caption>공지&언론보도 상세/수정 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="radio01" checked><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="radio01"><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">구분 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="radio02" checked><label for="radio0201"><span></span>공지</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="radio02"><label for="radio0202"><span></span>뉴스</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="radio02"><label for="radio0202"><span></span>언론보도</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상단게시 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0301" name="radio03" checked><label for="radio0301"><span></span>미게시</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0302" name="radio03"><label for="radio0302"><span></span>게시</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">제목 <span class="need"></span></th>
									<td>
										<input type="text" name="" id="" value="10 모바일 상품권 리뉴얼 오픈, 카카오톡으로 선물하세요!" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">PC 썸네일이미지 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<!-- 이미지 썸네일 -->
														<div class="thumb"></div>
														<!-- //이미지 썸네일 -->
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
										<input type="text" name="" id="" value="썸네일이미지 대체텍스트" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">PC 내용 <span class="need"></span></th>
									<td><div class="edit-area">내용 ...</div></td>
								</tr>
								<tr>
									<th scope="row">MOBILE 썸네일이미지</th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<!-- 이미지 썸네일 -->
														<div class="thumb"></div>
														<!-- //이미지 썸네일 -->
													</div>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">MOBILE 대체텍스트</th>
									<td>
										<input type="text" name="" id="" value="썸네일이미지 대체텍스트" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">MOBILE 내용</th>
									<td><div class="edit-area">내용 ...</div></td>
								</tr>
								<tr>
									<th scope="row">관련URL</th>
									<td>
										<input type="text" name="" id="" value="http://" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">첨부파일</th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03">찾아보기</a>
														<!-- 이미지 썸네일 -->
														<div class="thumb"></div>
														<!-- //이미지 썸네일 -->
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif, hwp, txt, ppt, pptx, doc, docx, xls, pdf, zip만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">작성</th>
									<td>admin1234</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-02">목록</a>
					<a href="#" class="btn-01 type-01">저장</a>
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
</script>
</body>
</html>
