<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/mjpn/include/head.jspf"%>
</head>

<body>
<!-- wrap -->
<div id="wrap">
	<!-- skip nav -->
	<div id="skip_nav">
        <a href="#content">본문 바로가기</a>
    </div>
    <!-- //skip nav -->

	<!-- header -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpngnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv4">
			<h3>顧客問い合わせ</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			FRANCHISE : class="sub_visual sv5"
		-->
		<!-- //sub visual -->

		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mjpn/include/jpnlnb.jsp"%>
		<!-- //lnb -->

		<!-- content -->
		<div id="content" class="community">

			<!-- 타이틀 영역 -->
 			<div class="tit_area">
				<h4>個人情報収集及び利用同意</h4>
				<p class="desc">
					フォーメインは正確な相談処理のために最小限の個人情報を収集しています。<br>
					下の内容を確認した後、個人情報の提供及び活用に同意してください。
				</p>
			</div>
			<!-- //타이틀 영역 -->

			<div class="agree_area">
				<div class="agree_cont">
					<h5>個人情報の提供及び活用に対する同意</h5>
					<p>本会社は相談のために下の個人情報を収集及び利用しています。<br>
					1. 個人情報収集項目(必須)：名前、電子メール、連絡先<br>
					2. 個人情報の収集及び利用目的：顧客の声に対する相談<br>
					3. 個人情報保有期間：個人情報を収集後、利用目的が達成されれば最大30日内に情報を破棄<br>
					* あなたは個人情報の提供及び活用に対して同意しない権利がありますが、同意を拒否するとサービスご利用に制限があり得ます。</p>
				</div>
				<span class="checkbox">
					<form name="submitForm" method="post" action="/mjpn/community/cs_info.do">
						<input type="checkbox" id="check0101" name="chk"><label for="check0101"><span class="fc_2">個人情報の収集および利用に同意します。</span> (必須の同意)</label>
					</form>
				</span>
			</div>

			<!-- 버튼 영역 -->
			<div class="btn_area">
				<a href="javascript:;" class="btn_tyf c_black" id="agreeBtn">확인</a>
			</div>
			<!-- //버튼 영역 -->

		</div>
		<!-- //content -->

	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
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
