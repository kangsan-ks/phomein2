<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>팝업관리 | 사이트관리 | 포메인 통합관리자</title>
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
				<span>사이트관리</span>
				<span>팝업관리</span>
				<span>등록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">팝업 관리</h3>

			<div class="default-cell">
				<h4 class="sub-title">팝업 관리 등록<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<div class="table-list-data">
					<fieldset>
						<legend>팝업 관리 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>팝업 관리 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">공개여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="radio01" checked><label for="radio0101"><span></span>공개</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="radio01"><label for="radio0102"><span></span>비공개</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0201" name="radio02" checked><label for="radio0201"><span></span>브랜드사이트</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0202" name="radio02"><label for="radio0202"><span></span>기업사이트</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0203" name="radio02"><label for="radio0203"><span></span>영문사이트</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0204" name="radio02"><label for="radio0204"><span></span>일문사이트</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">제목 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="제목을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">내용 <span class="need"></span></th>
									<td><div class="edit-area">에디터 영역...</div></td>
								</tr>
								<tr>
									<th scope="row">노출기간 <span class="need"></span></th>
									<td>
										<div class="row-input-wrap">
											<div class="date-input-wrap">
												<div class="cell"><p class="date-input"><input type="text" name="" id="" class="datepicker"></p></div>
											</div>
											<div>
												<select style="width:100px">
													<option value="">00시</option>
												</select>
											</div>
											<div>
												<select style="width:100px">
													<option value="">00분</option>
												</select>
											</div>
											<div class="ico-bar01"></div>
											<div class="date-input-wrap">
												<div class="cell"><p class="date-input"><input type="text" name="" id="" class="datepicker"></p></div>
											</div>
											<div>
												<select style="width:100px">
													<option value="">00시</option>
												</select>
											</div>
											<div>
												<select style="width:100px">
													<option value="">00분</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">노출위치 <span class="need"></span></th>
									<td>
										<div class="label-input-mulity">
											<p class="label-input">
												<label for="text0101">TOP : </label>
												<input type="text" name="text0101" id="text0101" style="width:150px"><span class="char">px</span>
											</p>
											<p class="label-input">
												<label for="text0102">LEFT : </label>
												<input type="text" name="text0102" id="text0102" style="width:150px"><span class="char">px</span>
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">팝업사이즈 <span class="need"></span></th>
									<td>
										<div class="label-input-mulity">
											<p class="label-input">
												<label for="text0201">WIDTH : </label>
												<input type="text" name="text0201" id="text0201" style="width:150px"><span class="char">px</span>
											</p>
											<p class="label-input">
												<label for="text0202">HEIGHT : </label>
												<input type="text" name="text0202" id="text0202" style="width:150px"><span class="char">px</span>
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">PC 이미지 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
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
										<input type="text" name="" id="" placeholder="" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">PC 이미지 링크</th>
									<td>
										<input type="text" name="" id="" placeholder="" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">MOBILE 이미지 <span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file02" id="f02" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn02" readonly="" placeholder="이미지를 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
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
										<input type="text" name="" id="" placeholder="" style="width:100%">
									</td>
								</tr>
								<tr>
									<th scope="row">MOBILE 이미지 링크</th>
									<td>
										<input type="text" name="" id="" placeholder="" style="width:100%">
									</td>
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
});
</script>
</body>
</html>
