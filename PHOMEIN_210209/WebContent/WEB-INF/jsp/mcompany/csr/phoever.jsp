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
		<div class="sub_visual sv4">
			<h3>CSR</h3>
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
		<div id="content" class="csr">
			<div class="csr_intro">
				<h4>포메인이 만드는 세상<br><em>PHOEVER CSR</em></h4>
				<p class="desc">식지 않는 뜨거운 진심으로<br>따뜻한 오늘, 따뜻한 세상을 만듭니다.</p>
				<p class="txt">
					포메인은 신뢰받는 모범 기업이라는<br>
					일념 아래 윤리 경영을 바탕으로<br>
					소외 계층과 개발 도상국 어린이 구호에<br>
					힘을 보태고 있습니다.
				</p>
			</div>
			<div class="csr_cont">
				<h5>활동 소개</h5>
				<div class="swiper_area">
					<div class="swiper">
						<ul class="swiper_wrap">
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_09.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_09.jpg" alt=""></span>
									<span class="tit">포메인 햅쌀 쌀국수면 4,536박스 기부 </span>
									<p class="txt">
										포메인 본사에서는 햅쌀만을 사용해 자체 개발에 성공한 햅쌀 쌀국수면을 매장에 선보이기에 앞서, 복지 소외계층을 위해 1억 8천만원 상당의 쌀국수 4,536박스를 기부하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_01.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_01.jpg" alt=""></span>
									<span class="tit">‘PHO EVER 2018’ 직업체험 멘토링</span>
									<p class="txt">
										포메인은 (사)글로벌비전과 함께 취업 지원이 필요한
										청소년을 대상으로 포메인에서 경험할 수 있는 직업에 대해
										학습 및 실습하는 직업체험 멘토링 ‘PHO EVER 2018’을
										진행하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_02.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_02.jpg" alt=""></span>
									<span class="tit">‘포항 지진 피해주민 돕기’ 기부</span>
									<p class="txt">
										포메인 공식 페이스북에서 포항 지진 피해주민 돕기 기부
										캠페인 ‘PHO U x 4’를 진행하여 모금된 기금의 4배를
										‘희망브리지 전국재해 구호협회’에 기부하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_03.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_03.jpg" alt=""></span>
									<span class="tit">‘신생아 살리기 모자뜨기 캠페인’ 참여</span>
									<p class="txt">
										포메인 본사 임직원 및 전 가맹점주들은 저체중이나 영양이 부족한
										신생아들이 체온을 유지하고, 따듯한 생명의 힘을 키울 수 있도록
										200여 개의 모자를 제작하여 세이브더칠드런에 기부하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_04.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_04.jpg" alt=""></span>
									<span class="tit">성남 지역아동센터 ‘행복선물상자’ 전달</span>
									<p class="txt">
										성남 지역아동센터 3곳에 포메인 본사 임직원들이 포장한
										행복선물상자 100박스를 전달하고, 아이들과 함께 월남쌈을
										만들며 따뜻한 저녁 식사를 나누었습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_05.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_05.jpg" alt=""></span>
									<span class="tit">해비타트 ‘희망의 집 짓기’ 기금 후원</span>
									<p class="txt">
										지역 사회에 기여하고, 무주택 저소득층 가정에 도움을 드리고자
										포메인 임원들과 함께 한 마음 한 뜻으로 해비타트에
										기금을 전달하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_06.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_06.jpg" alt=""></span>
									<span class="tit">해비타트 ‘희망의 집 짓기’ 건축 봉사</span>
									<p class="txt">
										무주택 저소득층 가정의 자립을 돕고 따뜻한 보금자리를
										선물하고자 포메인 임직원들과 함께 직접 땀 흘려
										‘희망의 집 짓기’ 건축 봉사 활동을 진행하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_07.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_07.jpg" alt=""></span>
									<span class="tit">‘사랑의 연탄 나눔’ 봉사</span>
									<p class="txt">
										포메인 본사 임직원 모두가 ‘사랑의 연탄 나눔’ 봉사에
										참여하여 ‘(사) 따뜻한 한반도 사랑의 연탄 나눔 운동’ 에 연탄
										5,000장을 기증하고, 경기 성남 금토동의 소외계층 가구에
										연탄 1,500장을 직접 전달하였습니다.
									</p>
								</div>
							</li>
							<li class="swiper_slide">
								<div class="thum"><img src="../common/images/content/csr_activity_img_08.jpg" alt=""></div>
								<div class="cont">
									<span class="logo"><img src="../common/images/content/csr_activity_img_logo_08.jpg" alt=""></span>
									<span class="tit">세계 어린이 구호 기금 전달</span>
									<p class="txt">
										업계 최초로 유니세프와 기부 협약을 맺고 도움의 손길이
										필요한 세계 빈곤 아동들에게 작은 희망이 되기를 바라며,
										세계 어린이 구호 기금을 전달하는 의미 있는 행사를 가졌습니다.
									</p>
								</div>
							</li>
						</ul>
						<div class="swiper_btn_next"></div>
						<div class="swiper_btn_prev"></div>
					</div>
					<div class="swiper_pagination"></div>
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
//Swiper
$(function(){
	defaultSwiper();
});
</script>
</body>
</html>
