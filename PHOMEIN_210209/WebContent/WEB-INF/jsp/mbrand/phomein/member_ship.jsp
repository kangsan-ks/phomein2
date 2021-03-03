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
		<div class="sub_visual sv1_2">
			<h3>멤버십</h3>
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
						<option value="" selected>멤버십 안내</option>
						<option value="/mbrand/phomein/mileage_01.do">마일리지 조회</option>
						<option value="/mbrand/phomein/mileage_03.do">마일리지 통합</option>
					</select>
				<!-- //셀렉트 박스 -->
			</div>
			
			<div class="member_intro">
				<div class="tit_area">
					<h4>포메인 멤버십 등록</h4>
				</div>
				<div class="cont">
					<span class="img"><img src="../common/images/content/img_membership.png" alt=""></span>
					<p class="txt">
						포메인 전 매장에서 <br>
						휴대전화번호 입력을 통해<br> 
						간편하게 멤버십 등록이 <br>
						가능합니다.
					</p>
				</div> 
			</div>
			<div class="member_info">
				<div class="tit_area">
					<h4>적립 및 사용</h4>
				</div>
				<div class="cont">
					<ul>
						
						<li class="no1">
							<div>
								<strong>적립</strong>
								<span>결제 금액 1% 적립</span>
								<p>
									전 메뉴 결제 금액의 1%가 적립됩니다. <br>
									추후 적립은 영수증 소지 시 3일 이내에 해당
									매장에서 신청 가능합니다.
								</p>
							</div>
						</li>
						<li class="no2">
							<div>
								<strong>사용</strong>
								<span>2,000마일리지 적립시<br>500마일리지 사용가능</span>
								<p>
									2,000 마일리지 이상 적립 시 500 마일리지 단위로
									사용 가능합니다. 마일리지는 결제 시 사용 가능하며,
									무단도용 사용을 방지하기 위해 본인 인증
									SMS 절차를 거쳐 사용 할 수 있습니다.  <br>
									(멤버십 등록 휴대전화 필참)
								</p>
							</div>
						</li>
						<li class="no3">
							<div>
								<strong>조회</strong>
								<a href="/mbrand/phomein/mileage_01.do" class="btn_tyn c_black">마일리지 조회</a>
								<p>
									마일리지 적립 즉시 카카오톡, SMS로 당일 적립
									마일리지, 누적 마일리지 현황이 발송되며
									홈페이지에서도 조회 가능합니다.
								</p>
							</div>
						</li>
						<li class="no4">
							<div>
								<strong>상품권 교환</strong>
								<a href="/mbrand/phomein/coupon_02.do" class="btn_tyn c_black">상품권 교환 신청</a>
								<p>
									1만 마일리지를 사용하여 포메인 상품권
									1만원권으로 교환이 가능 합니다.
								</p>
							</div>
						</li>
					</ul>
				</div>
				<div class="txt_list">
					<span class="tit">마일리지 이관</span>
					<ul>
						<li><span>
							기존 미등록 포인트카드는 &lt;마일리지 통합&gt; 기능을 통하여 합산 가능 합니다.<br>
							<a href="/mbrand/phomein/mileage_03.do" class="btn_tyn c_black">마일리지 통합하기 신청</a>
						</span></li>
						<li><span>본인의 마일리지를 타인에게 이관 할 수 없습니다.</span></li>
					</ul>
				</div>
				<div class="txt_list">
					<span class="tit">유의사항</span>
					<ul>
						<li><span>
   							유효기간  :  마일리지의 유효기간은 적립 년도 기준, 3년이 되는 해 12월 31일 24시에 일괄 소멸됩니다.<br>
    						<em>예 ) 2018년 7월 2일 적립 마일리지 > 2021년 12월 31일 24시 일괄 소멸</em>
    					</span></li>
						<li><span>타 쿠폰이나 할인 서비스와 중복 사용 불가 합니다.</span></li>
						<li><span>배달서비스 이용 시 마일리지 적립 / 사용이 제한됩니다.</span></li>
					</ul>
				</div>
				<div class="txt_list">
					<span class="tit">기타</span>
					<ul>
						<li><span>멤버쉽 관련 오류 및 문의사항은 아래 온라인 접수 또는 본사로 문의해 주시기 바랍니다.</span></li>
						<li><span>대표번호 031-780-1561~3, 5</span></li>
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
