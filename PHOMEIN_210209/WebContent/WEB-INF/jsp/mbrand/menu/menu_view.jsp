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
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv2">
			<h3>메뉴소개</h3>
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
		<div id="content" class="menu">
			<!-- 상세 영역 -->
			<div class="detail_menu">
				<div class="detail_head">
					<span class="flag">${resultView.kr_code_name }</span>
					<span class="tit">${resultView.kr_name }</span>
					<span class="tit_en">${resultView.en_name }</span>
				</div>
				<div class="detail_thum swiper">
					<ul class="swiper_wrap">
						<c:if test="${not empty resultView.f_file1 }"><li class="swiper_slide"><img src="${resultView.f_file1 }" alt=""></li></c:if>
					</ul>
					<div class="swiper_pagination"></div>
					<div class="swiper_btn_next"></div>
					<div class="swiper_btn_prev"></div>
					<span class="flag_group">
						<c:if test="${resultView.best_ck == 'Y' }"><span class="flag best"><span class="blind">BEST</span></span></c:if>
						<c:if test="${resultView.new_ck == 'Y' }"><span class="flag new"><span class="blind">NEW</span></span></c:if>
						<c:if test="${resultView.hot_ck == 'Y' }"><span class="flag spicy"><span class="blind">SPICY</span></span></c:if>
					</span>
				</div>
				<div class="detail_cont">
					<p class="txt">${resultView.kr_menu }</p>
<!-- 
					<div class="price_wrap">
						<c:if test="${resultView.c_yn == 'Y' }">
							<span class="price"><em class="size">S</em><span class="format-money">${resultView.s_price }</span></span>
							<span class="price"><em class="size">L</em><span class="format-money">${resultView.l_price }</span></span>
						</c:if>
						<c:if test="${resultView.c_yn == 'N' }">
							<span class="price"><span class="format-money">${resultView.c_price }</span></span>
						</c:if>
					</div>
					<p class="caution">매장별로 가격이 상이 할 수 있습니다.</p>
 -->
				</div>
				<!-- 버튼 영역 -->
				<div class="btn_area">
					<a href="/mbrand/menu/menu_list.do" class="btn_tyf c_black">목록보기</a>
				</div>
				<!-- //버튼 영역 -->
			</div>
			<!-- //상세 영역 -->
			
		</div>
		<!-- //content -->
		
	</div>
	<!-- //wrap -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>

<script type="text/javascript">
//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};

// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";

    return num.format();
};

jQuery('.format-money').text(function() {
    jQuery(this).text(
        jQuery(this).text().format() + '원'
    );
});

//Swiper
$(function(){
	defaultSwiper();
});
</script>
</body>
</html>
