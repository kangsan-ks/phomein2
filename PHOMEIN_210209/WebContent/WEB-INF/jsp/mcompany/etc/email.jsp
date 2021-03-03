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
<%@ include file="/WEB-INF/jsp/mcompany/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companygnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv5">
			<h3>이메일무단수집거부</h3>
		</div>
		<!-- 상단비쥬얼 영역
			회사소개	: class="sub_visual sv1"
			연구개발	: class="sub_visual sv2"
			가맹개설정보 : class="sub_visual sv3"
			사회공헌 	: class="sub_visual sv4"
			POLICY	   : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mcompany/include/companylnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="policy">
			<!-- 타이틀 영역 -->
 			<div class="tit_area">
				<h4>이메일무단수집거부</h4>
			</div>
			<!-- //타이틀 영역 -->
			<div class="policy_cont">
				<h5 class="tit">정보통신망 이용촉진 및 정보보호 등에 관한 법률</h5>
				<div class="box">
					포메인 홈페이지에 게시된 이메일주소가 자동 수집되는 것을 거부하며, 이를 위반시 정보통신망법에 의해 처벌됨을 유념하시기 바랍니다.<br>
					포메인 홈페이지에 기재된 모든 내용은 저작권법에 의해서 보호됨을 알려드립니다.
				</div>
				<h5 class="tit">제50조의 2(전자우편주소의 무단 수집행위 등 금지)</h5>
				<ul class="txt">
					<li>- 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.</li>
					<li>- 누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.</li>
					<li>- 누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된 전자우편주소임을 알면서 이를 정보 전송에 이용하여서는 아니 된다.</li>
				</ul>
				<h5 class="tit">제74조(벌칙)</h5>
				<ul class="txt">
					<li>- 다음 각 호의 어느 하나에 해당하는 자는 1년 이하의 징역 또는 1천만원 이하의 벌금에 처한다.</li>
  					<li>- 제50조의 2를 위반하여 전자우편주소를 수집·판매·유통하거나 정보 전송에 이용한 자.</li>
				</ul>
			</div>
		</div>
		<!-- //content -->
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script type="text/javascript">
</script>
</body>
</html>
