<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/company/include/companyheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="cphomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_04.jpg');"></div>
			<h2 class="h2-type">CSR</h2>
<!-- 			<span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- csr-info -->
			<div class="csr-info">
				<!-- 20190208 수정 s -->
				<div class="page-box">
					<p class="txt02 load-fadein">PHOMEIN CSR</p>
					<p class="txt03 load-fadein">식지 않는 뜨거운 진심으로 따뜻한 오늘, 따뜻한 세상을 만듭니다.</p>
					<p class="img load-fadein"><img src="../images/content/csr_img01.png" alt="아이콘 이미지"/></p>
					<p class="txt04 load-fadein">포메인은 신뢰 받는 모범 기업이라는 일념 아래<br>윤리 경영을 바탕으로 소외 계층과 개발 도상국 어린이 구호에 힘을 보태고 있습니다.</p>
				</div>
				<!-- //20190208 수정 e -->

				<div class="activity">
					<h4>활동 소개</h4>
					<!-- activity-visual -->
					<div class="activity-box">
						<div class="activity-visual slide-wrap">
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_09.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_09.jpg" alt=""/></span>
									<span class="data-tit">포메인 햅쌀 쌀국수면 4,536박스 기부</span>
									<span class="data-txt">
										포메인 본사에서는 햅쌀만을 사용해 자체 개발에 성공한 햅쌀 <br>
										쌀국수면을 매장에 선보이기에 앞서, 복지 소외계층을 위해 <br>
										1억 8천만원 상당의 쌀국수 4,536박스를 기부하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_01.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_01.jpg" alt=""/></span>
									<span class="data-tit">‘PHO EVER 2018’ 직업체험 멘토링</span>
									<span class="data-txt">
										포메인은 (사)글로벌비전과 함께 취업 지원이 필요한<br>
										청소년을 대상으로 포메인에서 경험할 수 있는 직업에 대해 <br>
										학습 및 실습하는 직업체험 멘토링 ‘PHO EVER 2018’을<br>
										진행하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_02.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_02.jpg" alt=""/></span>
									<span class="data-tit">‘포항 지진 피해주민 돕기’ 기부</span>
									<span class="data-txt">
										포메인 공식 페이스북에서 포항 지진 피해주민 돕기 기부<br>
										캠페인 ‘PHO U x 4’를 진행하여 모금된 기금의 4배를 <br>
										‘희망브리지 전국재해 구호협회’에 기부하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_03.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_03.jpg" alt=""/></span>
									<span class="data-tit">‘신생아 살리기 모자뜨기 캠페인’ 참여</span>
									<span class="data-txt">
										포메인 본사 임직원 및 전 가맹점주들은 저체중이나 영양이 부족한<br>
										신생아들이 체온을 유지하고, 따듯한 생명의 힘을 키울 수 있도록<br>
										200여 개의 모자를 제작하여 세이브더칠드런에 기부하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_04.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_04.jpg" alt=""/></span>
									<span class="data-tit">성남 지역아동센터 ‘행복선물상자’ 전달</span>
									<span class="data-txt">
										성남 지역아동센터 3곳에 포메인 본사 임직원들이 포장한<br>
										행복선물상자 100박스를 전달하고, 아이들과 함께 월남쌈을<br>
										만들며 따뜻한 저녁 식사를 나누었습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_05.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_05.jpg" alt=""/></span>
									<span class="data-tit">해비타트 ‘희망의 집 짓기’ 기금 후원</span>
									<span class="data-txt">
										지역 사회에 기여하고, 무주택 저소득층 가정에 도움을 드리고자<br>
										포메인 임원들과 함께 한 마음 한 뜻으로 해비타트에 <br>
										기금을 전달하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_06.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_06.jpg" alt=""/></span>
									<span class="data-tit">해비타트 ‘희망의 집 짓기’ 건축 봉사</span>
									<span class="data-txt">
										무주택 저소득층 가정의 자립을 돕고 따뜻한 보금자리를<br>
										선물하고자 포메인 임직원들과 함께 직접 땀 흘려<br>
										‘희망의 집 짓기’ 건축 봉사 활동을 진행하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_07.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_07.jpg" alt=""/></span>
									<span class="data-tit">‘사랑의 연탄 나눔’ 봉사</span>
									<span class="data-txt">
										포메인 본사 임직원 모두가 ‘사랑의 연탄 나눔’ 봉사에<br>
										참여하여 ‘(사) 따뜻한 한반도 사랑의 연탄 나눔 운동’ 에 연탄<br>
										5,000장을 기증하고, 경기 성남 금토동의 소외계층 가구에 <br>
										연탄 1,500장을 직접 전달하였습니다.
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_08.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_08.jpg" alt=""/></span>
									<span class="data-tit">세계 어린이 구호 기금 전달</span>
									<span class="data-txt">
										업계 최초로 유니세프와 기부 협약을 맺고 도움의 손길이 <br>
										필요한 세계 빈곤 아동들에게 작은 희망이 되기를 바라며, <br>
										세계 어린이 구호 기금을 전달하는 의미 있는 행사를 가졌습니다.
									</span>
								</p>
							</div>
						</div>
					</div>
					<!-- //activity-visual -->
				</div>
			</div>
			<!-- //csr-info -->
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/company/include/companyfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script type="text/javascript">
$(function(){
});
</script>
</body>
</html>
