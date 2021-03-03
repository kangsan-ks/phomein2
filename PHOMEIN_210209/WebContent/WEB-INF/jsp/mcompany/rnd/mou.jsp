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
<style>
	.red01-inner span{margin: 20px 0 50px; font-size: 12px; line-height: 25px; letter-spacing: 0; font-weight: 400; color: #666; display: block;}
</style>
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
		<div class="sub_visual sv2_1">
			<h3>현대그린푸드 MOU</h3>
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
		<div id="content" class="rnd">
			<div class="mou">
				<div class="tit_area">
					<h4>현대그린푸드<br>‘안전한 식자재 공급 MOU’</h4>
				</div>
				<div class="content">
					<p class="txt1">	
						포메인은 식약처의<br>
						‘위해상품 차단 시스템’ 을 갖춘 종합식품기업<br>
						‘현대그린푸드’와 함께<br>
						건강한 테이블을 만들어 갑니다.
					</p>
					<p class="txt2">
						<strong>Relief Phomein</strong>
						<span>
							포메인과 현대그린푸드는 지난 2016년 8월<br>
							‘안전한 식자재 공급’ 에 대한 업무협약을 체결하였습니다.	
						</span>
						<span>
							포메인은 전 가맹점 식자재 유통 경로 일원화를 추진 중이며, <br>
							현대그린푸드를 통해 식자재를 유통 받는 가맹점에서는<br>
							‘Relief Phomein’ 인증 마크를 확인할 수 있습니다.
						</span>
					</p>
					<p class="img"><img src="../common/images/content/mark_mou.png" alt="Relief Phomein 인증마크"></p>
				</div>
				<div class="tit_area" style="margin-top: 30vw; padding-bottom: 30px;">
					<h4>현대그린푸드<br>‘안전한 식자재 공급 MOU’</h4>
				</div>
				<p style="margin-top: 20px;">
					<img src="/mcompany/common/images/layout/img_new_01.jpg" alt="" />
				</p>
				<p style="margin-bottom: 20px; font-size: 11px;">
					오흥용 현대그린푸드 대표이사(사진 왼쪽) /<br/>김대일 ㈜데일리킹 대표이사(사진 오른쪽)
				</p>
				<div class="red01-inner">
					<span>
						2016년 국내 베트남 쌀국수 업계 1위 브랜드 포메인이 종합식품기업 현대그린푸드와 함께 ‘안전하고 우수한 품질의 식자재 공급’을 위한 업무협약(MOU)을 체결했다고 밝혔다.
						<br/><br/>
						현대그린푸드는 이번 업무협약을 통해 연간 100억원 규모의 식자재를 포메인 가맹점에 공급할 예정이다.
						<br/><br/>
						포메인은 식품 원자재의 안전성을 높이기 위해 ‘위해상품 판매차단시스템’을 도입한 식품 안전 우수기업인 현대그린푸드와 협약을 맺고, 120여 개 가맹점에 일반 식자재 공급 일원화를 추진한다. 이로써 현대그린푸드를 통해 포메인에 유통되는 식자재 중 불량하다고 판단되거나, 위해 성분이 검출된 상품은 물류센터, 배송 차량, 각 가맹점 등에서 거점별로 실시간 원천 차단이 가능해진다.
						<br/><br/>
						현대그린푸드는 선진화된 위생시스템을 바탕으로 기존 산업체·​병원 급식 업체에 안전성이 검증된 상품을 공급해 왔으며, 이번 포메인과의 MOU 체결로 외식 프랜차이즈 업체로까지 그 영역을 확대하게 됐다.
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
$(function(){
});
</script>
</body>
</html>
