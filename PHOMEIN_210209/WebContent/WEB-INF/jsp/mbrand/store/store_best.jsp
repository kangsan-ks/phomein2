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
<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<div id="gnb">
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	</div> 
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv3">
			<h3>2018 모범매장</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			CS CENTER : class="sub_visual sv5"
			ETC 	  : class="sub_visual sv6"
		-->
		<!-- //sub visual -->
		
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->
		
		<!-- content -->
		<div id="content" class="store">
		<c:choose>
			<c:when test="${not empty resultList }" >
			<div class="store_best">
				<div class="tit_area">
					<h4>모범매장</h4>
				</div>
				<div class="store_best_list swiper">
					<ul class="swiper_wrap">
						<c:forEach items="${resultList }" var="result" varStatus="status" >
						<li class="swiper_slide">
							<a href="/mbrand/store/store_list.do?storeName=${result.name }&best=Y" class="link_best_list">
								<span class="thum"><img src="${result.f_file1 }" alt=""></span>
								<!--<span class="thum"><img src="../common/images/content/noimg_store.gif" alt=""></span>	 매장 이미지 없을때 : 디폴트 이미지 -->
								<span class="cont"><strong>${result.name }</strong><em>${result.hp1 }-${result.hp2 }-${result.hp3 }</em></span>
							</a>	
						</li>
						</c:forEach>
					</ul>
					<div class="swiper_pagination"></div>
					<div class="swiper_btn_next"></div>
					<div class="swiper_btn_prev"></div>
				</div>
			</div>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>

			<div class="store_crit">
				<div class="tit_area">
					<h4>선정기준</h4>
				</div>
				<p class="desc">선정 기준별 평균 점수 이상을 획득한 매장이<br>“모범 매장”으로 선정됩니다.</p>
				<ul class="cont">
					<li class="no1"><span>식재료 안전</span></li>
					<li class="no2"><span>위생</span></li>
					<li class="no3"><span>서비스</span></li>
				</ul>
			</div>
			
			<div class="store_faq">
				<div class="tit_area">
					<h4>FAQ</h4>
				</div>
				<ul class="ac_list">
					<li>
						<a href="#none" class="ac_tit"><span>선정되지 않은 매장들은 기준에 문제가 있는 건가요?</span></a>
						<div class="ac_cont">
							<p>그렇지 않습니다. 포메인 전 매장은 식자재 안전, 위생, 서비스 등이 철저하게 관리되고 있습니다.<br>
							선정되지 않은 매장들도 우수한 점수로 기준을 준수하며, 선정 된 매장의 경우 전 매장의 평균 점수보다 조금 더 획득한 매장을 의미합니다.</p>
						</div>
					</li>
					<li>
						<a href="#none" class="ac_tit"><span>‘안전 인증 로고(Relief Phomein)’는 무엇인가요?</span></a>
						<div class="ac_cont">
							<p>‘Relief Phomein’ 인증마크는 생산, 유통 과정의 안정성을 포메인과 현대그린푸드가 과학적 식품안전시스템으로 인증한 상품임을 표기한 것으로, 안전한 식재료와 정직한먹거리를 제공하고자 하는 포메인의 건강한 약속입니다.<br>
							* 인증마크는 현대그린푸드의 위해상품 차단시스템을 거친 식재료를 100% 사용하는 매장에 한해 수여되며, 매장 입구 윈도우에서 부착 여부를 확인 할 수 있습니다.</p>
						</div>
					</li>
					<li>
						<a href="#none" class="ac_tit"><span>‘위해상품 차단시스템’은 무엇인가요?</span></a>
						<div class="ac_cont">
							<p>식품의약품안전처, 환경부, 국가기술표준원에서 제공되는 위해상품정보를 대한상공회의소에서 종합하여 유통업체 본사에 실시간으로 일괄 전송, 해당 상품의 판매를 차단하는 시스템입니다.<br>
							이로써 현대그린푸드를 통해 포메인에 유통되는 식자재 중 불량하다고 판단되거나, 위해 성분이 검출된 상품은 물류센터와 배송 차량, 각 가맹점 등에서 실시간 SNS 전송으로 거점별 원천 차단이 가능해집니다.</p>
						</div>
					</li>
				</ul>
			</div>
			
		</div>
		<!-- //content -->
	
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script>
// Swiper
$(function(){
	defaultSwiper();
});
</script>
</body>
</html>
