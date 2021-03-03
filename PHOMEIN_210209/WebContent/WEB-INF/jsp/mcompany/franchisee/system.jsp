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
		<div class="sub_visual sv3_1">
			<h3>가맹 안내</h3>
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
		<div id="content" class="franchisee">
 			<div class="system">
				<!-- 카테고리 메뉴 -->
				<div class="nav_cate swiper">
					<ul class="nav_cate_wrap">
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/status.do">브랜드 파워</a></li>
						<li class="nav_cate_btn on"><a href="#none">창업지원시스템</a></li>
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/step.do">개설절차</a></li>
					</ul>
 				</div>
				<!-- //카테고리 메뉴 -->
				<div class="cont">
					<ol class="list">
						<li>
							<div>
								<em>01</em>
								<strong>전문가 상권 분석</strong>
								<p>본사 점포개발팀의 철저한 상권 조사 및<br>분석을 통한 가맹점 입지 제안</p>
							</div>	
						</li>
						<!--li>
							<div>
								<em>02</em>
								<strong>신한은행 프랜차이즈론</strong>
								<p>창업 자금 대출 (최대 7천만 원) 및<br>우대 금융 서비스 제공</p>
							</div>	
						</li-->
						<li>
							<div>
								<em>02</em>
								<strong>전문교육장 운영</strong>
								<p>[분당 정자본점] 내 전문교육장에서의<br>점주 및 실무자 운영 교육 진행</p>
							</div>	
						</li>
						<li>
							<div>
								<em>03</em>
								<strong>체계적인 사후 관리</strong>
								<p>전문 지식을 갖춘 본사 슈퍼바이저의<br>정기적인 가맹점 방문 및 매장 현황 분석/진단</p>
							</div>	
						</li>
					</ol>
					<span class="banner">
						대한민국 쌀국수 전문 브렌드 포메인
						<em>7년연속 가맹점<br>월평균 매출액 1위!</em>
					</span>
				</div>
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
//카테고리 메뉴
$(function(){
	cateNav();
});
</script>
</body>
</html>
