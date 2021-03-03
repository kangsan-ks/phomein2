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
		<div class="sub_visual sv1_3">
			<h3>상품권</h3>
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
		<div id="content" class="phomein">
 			
 			<div class="select_cate">
				<!-- 셀렉트 박스 -->
				<span class="selectbox">
					<label for="selCate">카테고리 선택</label>
					<select id="selCate" onchange="if (this.value) window.location.href=this.value">
						<option value="" selected>상품권 안내</option>
						<option value="/mbrand/phomein/coupon_02.do">상품권 교환 신청</option>
					</select>
				</span>
				<!-- //셀렉트 박스 -->
			</div>
			
 			<div class="coupon_buying">
				<div class="tit_area">
					<h4>구매방법</h4>
				</div>
				<div class="cont">
					<ul>
						<li class="no1">
							<dl>
								<dt>현금 구매</dt>
								<dd>포메인 고객센터를<br>통해 가능합니다.</dd>
							</dl>
							<dl>
								<dt>문의 전화</dt>
								<dd><em>1899-2422</em></dd>
							</dl>
						</li>
						<li class="no2">
							<dl>
								<dt>마일리지 구매</dt>
								<dd>마일리지가 10,000점<br>
									이상일 경우 교환 가능하며<br>
									마일리지 전환을 통한상품권<br>
									구매는 포메인 홈페이지에서<br>
									온라인 신청서 작성 후<br> 가능합니다.
								</dd>
							</dl>
						</li>
					</ul>
				</div> 
			</div>
			<div class="coupon_buying_point">
				<div class="tit_area">
					<h4>마일리지 <em>구매 절차</em></h4>
				</div>
				<div class="cont">
					<ul>
						<li class="step1"><span>포메인<br>홈페이지 접속</span></li>
						<li class="step2"><span>휴대폰 본인인증 후<br>온라인 신청서 작성</span></li>
						<li class="step3"><span>우편발송 &amp; 수취</span></li>
						<li class="step4"><span>상품권 사용</span></li>
					</ul>
				</div>
				<div class="btn_area">
					<a href="/mbrand/phomein/coupon_02.do" class="btn_tyn c_black btn_app">상품권 교환 신청</a>
				</div>
				<div class="txt_list">
					<span class="tit">포메인 상품권 사용 안내</span>
					<ul>
						<li><span>본 상품권은 포메인 전 매장에서 현금과 동일하게 사용 가능하며 타 상품권과 동시 사용이 가능합니다.</span></li>
						<li><span>본 상품권의 유효기간은 상품권의 뒷면을 확인해 주시기 바랍니다.</span></li>
						<li><span>본 상품권은 현금으로 교환하실 수 없습니다.</span></li>
						<li><span>권면금액의 80% 이상 사용 시 현금 잔액을 돌려받을 수 있습니다.</span></li>
						<li><span>수취하신 상품권의 도난, 분실, 훼손 등에 대해서는 당사에서 책임지지 않습니다.</span></li>
					</ul>
				</div>
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
</body>
</html>
