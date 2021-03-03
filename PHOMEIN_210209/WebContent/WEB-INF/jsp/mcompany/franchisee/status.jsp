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
		<%@ include file="/WEB-INF/jsp/mcompany/include/companylnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="franchisee">
 			<div class="status">
				<!-- 카테고리 메뉴 -->
				<div class="nav_cate swiper">
					<ul class="nav_cate_wrap">
						<li class="nav_cate_btn on"><a href="#none">브랜드 파워</a></li>
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/system.do">창업지원시스템</a></li>
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/step.do">개설절차</a></li>
					</ul>
 				</div>
				<!-- //카테고리 메뉴 -->
				<div class="intro">
					<strong>대한민국 대표<br>쌀국수 전문 브랜드입니다.</strong>
					<p>
						2006년 [분당 정자본점]을 시작으로 가맹 사업을 시작한<br>
						포메인은 한국인의 입맛에 맞는 레시피 개발로<br>
						국내 베트남 쌀국수 대중화를 이끌고 있습니다.
					</p>
				</div>
				<div class="history">
					<div class="title">
						<strong>SINCE 2006<em>대한민국 쌀국수의 기준</em></strong>
						<p>
							포메인은 지난 15년간 동종업계 타 브랜드들과의<br>
							‘협력적 경쟁’을 통해 나 홀로 성장이 아닌 동반성장을 이끌어 낸 <br>
							대한민국 대표 쌀국수 브랜드입니다.
						</p>
					</div>
					<div class="con">
						<span class="tit">대표연혁</span>
						<ul>
							<li>
								<div>
									<em>2019.11</em>
									<p>소규모 프리미엄 쌀국수<br>브랜드 포메인 RED<br>(Rice noodle<br>Express Delivery)<br>강남 도곡 1호점 런칭을<br>시작으로 가맹사업 시작</p>
								</div>
							</li>
							<li>
								<div>
									<em>2019.04</em>
									<p>세계 최초 햅쌀 쌀국수 <br>자체 생산 및 포메인 <br>전 매장 독점 납품</p>
								</div>
							</li>
							<li>
								<div>
									<em>2019.04</em>
									<p>푸드뱅크, 1억 8천만 상당 <br>햅쌀 쌀국수면 기부</p>
								</div>
							</li>
							<li>
								<div>
									<em>2019.04</em>
									<p>푸드뱅크, 1억 8천만 상당<br/>햅쌀 쌀국수면 기부</p>
								</div>
							</li>
							<!-- <li>
								<div>
									<em>2018.06</em>
									<p>(사)글로벌비전,<br>직업체험 멘토링<br>‘PHO EVER 2018’ 진행</p>
								</div>
							</li>
							<li>
								<div>
									<em>2018.01</em>
									<p>자체 개발<br>‘배달 전용 패키지’<br>특허 등록</p>
								</div>
							</li> -->
							<li>
								<div>
									<em>2017.12</em>
									<p>가맹점 다점포율 29% 달성<br>*다점포율:<br>1명의 가맹점주가 여러 개의 매장을 운영하는 비율</p>
								</div>
							</li>
							<li>
								<div>
									<em>2017.12</em>
									<p>포메인 가맹점<br>연간 총매출 780억 달성</p>
								</div>
							</li>


							<li>
								<div>
									<em>2017.09</em>
									<p>포시즌(PHO SEASON)<br>햅쌀 쌀국수 개발 성공<br>· 천연 향신료<br>허브백(Herb-Bags) 생산</p>
								</div>
							</li>
							<li>
								<div>
									<em>2016.09</em>
									<p>포메인 누적 고객 방문자 수 5천만 명 달성</p>
								</div>
							</li>
							<li>
								<div>
									<em>2016.08</em>
									<p>현대그린푸드 <br>‘안전한 식자재 공급’<br>MOU 체결</p>
								</div>
							</li>
							<li>
								<div>
									<em>2015.11</em>
									<p>베트남 현지 법인 포시즌<br> (PHO SEASON) 공장 준공</p>
								</div>
							</li>
							<li>
								<div>
									<em>2014.12</em>
									<p>업계 최초 쌀국수<br>딜리버리 서비스 시행</p>
								</div>
							</li>
							<li>
								<div>
									<em>2014.04</em>
									<p>업계 최초<br>모바일 커머스 플랫폼<br>‘카카오톡 선물하기’ 입점</p>
								</div>
							</li>
							<li>
								<div>
									<em>2013.10</em>
									<p>한국표준협회 선정<br>[2013 프랜차이즈 만족지수<br>(KS-FSI)쌀국수 부문 1위]</p>
								</div>
							</li>
							<li>
								<div>
									<em>2013.03</em>
									<p>‘납세자의 날’ 모범 납세자 선정, 국세청장 표창 수상</p>
								</div>
							</li>
							<!-- <li>
								<div>
									<em>2012.11</em>
									<p>신한은행 ‘가맹점주를 위한 프랜차이즈론’ 협약 체결 </p>
								</div>
							</li> -->
							<li>
								<div>
									<em>2011.12</em>
									<p>포메인 정자본점 확장 리뉴얼 및 R&amp;D 연구소 신설</p>
								</div>
							</li>
							<li>
								<div>
									<em>2009.10</em>
									<p>SK나이츠 프로농구단 5년 연속 후원(2009년~2013년)</p>
								</div>
							</li>
							<li>
								<div>
									<em>2006.05</em>
									<p>포메인 분당 정자본점 오픈 (직영점 운영중)</p>
								</div>
							</li>
							<li>
								<div>
									<em>2006.05</em>
									<p>㈜데일리킹 설립</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="profit">
					<div class="title">
						<strong>포메인, 트렌디한 가치 창출로<br>성장하는 수익성</strong>
						<p>포메인은 시대를 반영한 경쟁력으로 안정적인 수익률과<br>탄탄한 브랜드 파워를 창출합니다.</p>
					</div>
					<div class="top_honor">
						<ul>
							<li>
								<div>
									<em>7년 연속 가맹점 월평균<br>매출액 1위</em>
									<p>포메인은 동종업계 가맹점 월평균 매출액 1위,<br>6년 평균 약 760억의 매출을 유지하며 흔들림 없는<br>경쟁력을 입증하고 있습니다.</p>
									<p>※ 2018. 06 자료 기준</p>
								</div>
							</li>
							<li>
								<div>
									<em>동종업계 내<br>전체 매장 수 1위</em>
									<p>포메인은 가맹사업  5년 만에 100개 매장 달성,<br>현재는 쌀국수 브랜드 중 <br>최다 매장을 보유하고 있습니다.</p>
									<p>※ 2018. 06 자료 기준</p>
								</div>
							</li>
					 		<li>
								<div>
									<em>동종업계 내 수도권<br>시장 점유율 1위</em>
									<p>수도권 점유율 1위를 유지하며,<br>부산-경주-제주 등 전국적으로 가맹 사업을<br>확장하고 있습니다.</p>
									<p>※ 2018. 12 자료 기준</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="con">
						<strong>포메인, 쌀국수 시장을<br>선도하는 변화의 중심</strong>
						<p>포메인은 메뉴부터 서비스까지 차별화된 전략으로<br>시장을 선도하는 탄탄한 입지와<br>높은 수익 안정성을 보유하고 있습니다.</p>
						<div class="swiper_area">
							<ul>
								<li>
									<div class="thum"><img src="../common/images/content/news_opst_img_540x400_01.jpg" alt=""></div>
									<div class="cont">
										<span class="tit">현대그린푸드<br>‘안전한 식자재 공급’ MOU</span>
										<p class="txt">
											포메인은 ‘위해상품 차단 시스템’을 갖춘 종합식품기업
										‘현대그린푸드’와 업무협약을 체결하여 각 가맹점에 안전한
										식자재를 공급하고 있습니다.
										‘건강한 테이블’제공에 대한 인증으로 현대그린푸드를 통해
										식자재를 유통 받는 가맹점에는 ‘Relief Phomein’
										인증 마크가 부착되어 있습니다.
										</p>
									</div>
								</li>
								<li>
									<div class="thum"><img src="../common/images/content/news_opst_img_540x400_02.jpg" alt=""></div>
									<div class="cont">
										<span class="tit">베트남 현지 법인<br>포시즌(PHO SEASON)</span>
										<p class="txt">
											포메인은 ‘안전한 식재료 정직한 먹거리’라는 이념 아래
										베트남 현지 법인 포시즌을 설립하였습니다.
										그곳에서 우리는 독자적인 연구개발로 쌀국수면과 육수용
										허브백(Herb Bags)을 자체 생산하고 있습니다.
										</p>
									</div>
								</li>
							</ul>
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
	// 카테고리 메뉴
	cateNav();
	// Swiper
	defaultSwiper();
});
</script>
</body>
</html>
