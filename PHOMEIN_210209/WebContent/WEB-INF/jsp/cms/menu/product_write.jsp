<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>제품관리 | 메뉴관리 | 포메인 통합관리자</title>
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
				<span>메뉴관리</span>
				<span>제품관리</span>
				<span>등록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">제품관리</h3>

			<div class="default-cell">
				<h4 class="sub-title">제품 등록<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>

				<div class="table-list-data">
					<fieldset>
						<legend>제품 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>제품 등록 기본정보 입력 폼 테이블</caption>
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
									<th scope="row">제품명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="제품명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">제품코드 <span class="need"></span></th>
									<td><p class="input-btns"><input type="text" name="" id="" style="width:250px"><a href="" class="btn-01 type-03 round">중복체크</a></td>
								</tr>
								<tr>
									<th scope="row">사용범위 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="check-type01"><input type="checkbox" id="check0101" name="check01" checked><label for="check0101"><span></span>국문사이트</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0102" name="check01"><label for="check0102"><span></span>영문사이트</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0103" name="check01"><label for="check0103"><span></span>일문사이트</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">국문 메뉴 카테고리<span class="need"></span></th>
									<td>
										<div class="row-input-wrap">
											<div>
												<select style="width:200px">
													<option value="">중분류명</option>
												</select>
											</div>
											<div>
												<select style="width:200px">
													<option value="">소분류명</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">영문 메뉴 카테고리<span class="need"></span></th>
									<td>
										<div class="row-input-wrap">
											<div>
												<select style="width:200px">
													<option value="">중분류명</option>
												</select>
											</div>
											<div>
												<select style="width:200px">
													<option value="">소분류명</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">일문 메뉴 카테고리<span class="need"></span></th>
									<td>
										<div class="row-input-wrap">
											<div>
												<select style="width:200px">
													<option value="">중분류명</option>
												</select>
											</div>
											<div>
												<select style="width:200px">
													<option value="">소분류명</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">국문 제품명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="국문 제품명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">영문 제품명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="영문 제품명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">일문 제품명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="일문 제품명을 입력하세요"></td>
								</tr>
								<!-- 가격설정 사이즈 선택시  -->
								<tr>
									<th scope="row">가격설정 <span class="need"></span></th>
									<td>
										<div class="mulity-row-input-wrap">
											<p class="radio-type01"><input type="radio" id="radio0301" name="radio03" checked><label for="radio0301"><span></span>사이즈</label></p>
											<p class="radio-type01"><input type="radio" id="radio0302" name="radio03"><label for="radio0302"><span></span>공통</label></p>
											<div class="cell">
												<div class="row-input-wrap">
													<div><label for="text0101">S 사이즈 </label><input type="text" name="text0101" id="text0101" style="width:150px" class="al-r"><span class="char">원</span></div>
													<div><label for="text0102">L 사이즈 </label><input type="text" name="text0102" id="text0102" style="width:150px" class="al-r"><span class="char">원</span></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<!-- //가격설정 사이즈 선택시  -->
								<!-- 가격설정 공통 선택시  -->
								<tr>
									<th scope="row">가격설정 <span class="need"></span></th>
									<td>
										<div class="mulity-row-input-wrap">
											<p class="radio-type01"><input type="radio" id="radio0401" name="radio04"><label for="radio0401"><span></span>사이즈</label></p>
											<p class="radio-type01"><input type="radio" id="radio0402" name="radio04" checked><label for="radio0402"><span></span>공통</label></p>
											<div class="cell">
												<div class="row-input-wrap">
													<div><input type="text" name="" id="" style="width:150px" class="al-r"><span class="char">원</span></div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<!-- //가격설정 공통 선택시  -->
								<tr>
									<th scope="row">국문 메뉴 설명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="국문 메뉴 설명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">영문 메뉴 설명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="영문 메뉴 설명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">일문 메뉴 설명 <span class="need"></span></th>
									<td><input type="text" style="width:100%" placeholder="일문 메뉴 설명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">설정<span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="check-type01"><input type="checkbox" id="check0101" name="check01" checked><label for="check0101"><span></span>BEST</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0102" name="check01"><label for="check0102"><span></span>HOT</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0103" name="check01"><label for="check0103"><span></span>NEW</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">(대)제품사진<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="제품사진을 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
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
									<th scope="row">(중)제품사진<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file02" id="f02" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name02" id="fn02" readonly="" placeholder="제품사진을 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
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
									<th scope="row">(소)제품사진<br><em class="fc01">(사이즈 x 사이즈)</em><span class="need"></span></th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file03" id="f03" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name03" id="fn03" readonly="" placeholder="제품사진을 등록 해 주세요" class="read-file" title="업로드된 파일 경로">
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
									<th scope="row">첨부파일<br><em class="fc01">(사이즈 x 사이즈)</em><br>(최대 5개 가능)</th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
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
