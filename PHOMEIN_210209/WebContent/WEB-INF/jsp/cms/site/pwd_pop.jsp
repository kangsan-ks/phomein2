<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>관리자 비밀번호 수정 팝업 | 포메인 통합 관리</title>
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
		<aside id="lnb">

		</aside>
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">

			<div class="btn-page-wrap al-c">
				<a href="javascript:front.pop.open('pop-02');" class="btn-01 type-03">관리자 비밀번호 수정 팝업</a>
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
	<article id="pop-02" class="layer-pop-wrap">
		<div class="layer-pop-parent">
			<div class="layer-pop-children">

				<div class="pop-data middle">
					<h2>관리자 비밀번호 수정</h2>
					<div class="pop-con">
						<div class="default-cell">
							<h4 class="sub-title">관리자 비밀번호 수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
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
													<input type="password" name="" id="" placeholder="새 비밀번호" style="width:100%">
													<span class="input-block-info">- 영문자, 숫자, 특수문자 조합하여 8~16자리</span>
												</td>
											</tr>
											<tr>
												<th scope="row">비밀번호 확인 <span class="need"></span></th>
												<td>
													<input type="password" name="" id="" placeholder="비밀번호 확인" style="width:100%">
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</div>
						</div>
					</div>

					<div class="pop-bottom">
						<div class="btn-page-wrap al-c">
							<a href="#" class="btn-01 type-03">닫기</a>
							<a href="#" class="btn-01 type-01">확인</a>
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
</body>
</html>
