<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_05.jpg');"></div>
			<h2 class="h2-type">加盟相談申請</h2>
<!-- 			<span class="txt">11년의 노하우, 포메인과 함께라면 행복한 미래를 꿈꾸셔도 좋습니다.<br>밝은 미래, 행복한 포메人</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="cs-con">
					<div class="con-title">
						<h3 class="h3-type">個人情報収集及び利用同意</h3>
						<span class="txt">フォーメインは正確な相談処理のために最小限の個人情報を収集しています。<br>下の内容を確認した後、個人情報の提供及び活用に同意してください。</span>
					</div>

					<div class="agree-con">
						<div class="con-box">
							<h4>個人情報の提供及び活用に対する同意</h4>
							<p>本会社は相談のために下の個人情報を収集及び利用しています。<br>
							1. 個人情報収集項目(必須)：名前、電子メール、連絡先<br>
							2. 個人情報の収集及び利用目的：加盟申請に対する相談<br>
							3. 個人情報保有期間：個人情報を収集後、利用目的が達成されれば最大30日内に情報を破棄<br>
							* あなたは個人情報の提供及び活用に対して同意しない権利がありますが、同意を拒否するとサービスご利用に制限があり得ます。</p>
						</div>
					</div>
					<form name="submitForm" method="post" action="/jpn/franchisee/info.do">
						<p class="chk-type01"><input type="checkbox" id="check0101" name="chk"><label for="check0101"><span></span>個人情報の収集および利用に同意します。<strong>(必須の同意)</strong></label></p>
					</form>

					<!-- btn-box -->
					<div class="btn-box mt50">
						<a href="javascript:;" class="btn-01 type-01" id="agreeBtn">確認</a>
					</div>
					<!-- //btn-box -->
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#agreeBtn").click(function(){
		if(!$("#check0101").is(":checked")) {
			alert("個人情報の収集および利用に同意してください。");
			return false;
		} else {
			document.submitForm.submit();
		}
	});
});
</script>
</body>
</html>
