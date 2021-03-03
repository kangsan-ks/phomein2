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
 			<div class="step">
				<!-- 카테고리 메뉴 -->
				<div class="nav_cate swiper">
					<ul class="nav_cate_wrap">
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/status.do">브랜드 파워</a></li>
						<li class="nav_cate_btn"><a href="/mcompany/franchisee/system.do">창업지원시스템</a></li>
						<li class="nav_cate_btn on"><a href="#none">개설절차</a></li>
					</ul>
 				</div>
				<!-- //카테고리 메뉴 -->
				<div class="cont">
					<h5 class="tit">가맹 절차</h5>
					<ol class="list">
						<li>
							<div>
								<em>01</em>
								<strong>가맹문의</strong>
								<p>창업 문의 상담 신청 전반적인 사업 설명</p>
							</div>	
						</li>
						<li>
							<div>
								<em>02</em>
								<strong>시장조사</strong>
								<p>가맹점 후보지 선정</p>
							</div>	
						</li>
						<li>
							<div>
								<em>03</em>
								<strong>입점지 선정</strong>
								<p>상권, 입지, 사업 타당성 분석</p>
							</div>
						</li>
						<li>
							<div>
								<em>04</em>
								<strong>가맹계약</strong>
								<p>정보공개서 제공 가맹 계약 체결</p>
							</div>	
						</li>
						<li>
							<div>
								<em>05</em>
								<strong>인력채용</strong>
								<p>주방/ 홀 직원 채용</p>
							</div>	
						</li>
						<li>
							<div>
								<em>06</em>
								<strong>매장시설 공사</strong>
								<p>주방/ 홀 직원 채용 주방설비 계약 및 공사</p>
							</div>	
						</li>
						<li>
							<div>
								<em>07</em>
								<strong>본점교육</strong>
								<p>이론, 실습, 현장교육 (분당 정자본점 전문교육장)</p>
							</div>	
						</li>
						<li>
							<div>
								<em>08</em>
								<strong>영업준비</strong>
								<p>물품 공급 / 인.허가 증명서 발급 / 전체 점검</p>
							</div>	
						</li>
						<li>
							<div>
								<em>09</em>
								<strong>개점</strong>
								<p>온.오프라인 홍보 오픈 이벤트 진행</p>
							</div>	
						</li>
						<li>
							<div>
								<em>10</em>
								<strong>사후관리</strong>
								<p>안정적인 물품 공급 슈퍼바이저 지원</p>
							</div>	
						</li>
						<li>
							<div>
								<a href="http://www.phomein.com/mcompany/franchisee/terms.do">
									<strong style="display:block;">가맹 신청</strong>
									<p style="display:inline-block; font-size:15px; margin:10px 0; padding:6px 18px; background-color:#525252; color:#fff; border-radius:4px;">바로가기</p>
									<p style="font-size:15px;">대표 전화 : 1899-2422</p>
								</a>
							</div>	
						</li>
					</ol>
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
