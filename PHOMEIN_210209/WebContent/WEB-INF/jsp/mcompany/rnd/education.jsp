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
		<div class="sub_visual sv2_2">
			<h3>교육시스템</h3>
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
			<div class="education">
				<div class="tit_area">
					<h4>체계적이고 확실한 커리큘럼,<br>전문교육장 운영</h4>
					<p class="desc">
						㈜데일리킹 전문교육장에서는 메뉴 조리법은 물론 식자재 및<br/>주방 위생 관리법, 고객 응대 등
						매장 운영에 있어<br/> 필요한 모든 사항을 배우고 익힐 수 있습니다.<br/>
						교육이 끝난 후에도 담당 슈퍼바이저와의 지속적인 사후관리로 믿고 함께할 수 있는 상생을 실천합니다.
					</p>
				</div>
				<div class="content">
					<h5>체계적인 교육,<br>15년의 노하우 전수</h5>
					<p class="txt">	
						㈜데일리킹 전문교육장에서는 메뉴 조리법은 물론<br> 식자재 및 주방 위생 관리법, 고객 응대, POS 사용, 식자재 발주 등<br>
						매장 운영에 있어 필요한 모든 사항을 배우고 익힐 수 있습니다.<br>
						교육이 끝난 후에도 담당 슈퍼바이저와의 지속적인 사후관리로<br> 믿고 함께할 수 있는 상생을 실천합니다.<br><br>
						또한 전문교육장에서는 트렌드 분석과 R&D 전문인력의<br>체계적인 신메뉴 개발로 꾸준한 매출 증대를 도모합니다. 


					</p>
				 	<div class="swiper_area">
						<div class="swiper">
							<ul class="swiper_wrap">
								<li class="swiper_slide"><img src="../common/images/content/img_edu_1.jpg" alt=""></li>
								<li class="swiper_slide"><img src="../common/images/content/img_edu_2.jpg" alt=""></li>
								<li class="swiper_slide"><img src="../common/images/content/img_edu_3.jpg" alt=""></li>
								<li class="swiper_slide"><img src="../common/images/content/img_edu_4.jpg" alt=""></li>
							</ul>
							<div class="swiper_btn_next"></div>
							<div class="swiper_btn_prev"></div>
							<div class="swiper_pagination"></div>
						</div>
					</div>
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
	defaultSwiper();
});
</script>
</body>
</html>
