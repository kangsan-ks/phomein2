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
		<div class="sub_visual sv1">
			<h3>오시는 길</h3>
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
		<div id="content" class="company">
			<div class="location">
				<!-- 타이틀 영역 -->
				<div class="tit_area">
					<h4>오시는 길</h4>
				</div>
				<!-- //타이틀 영역 -->
				<!-- 지도 영역 -->
				<div class="map_area">
					<img src="../common/images/@temp/map_640x296.jpg" alt="" style="width:100%;">
				</div>
				<!-- //지도 영역 -->
				<!-- table -->
				<div class="table_data">
					<table>
						<caption></caption>
						<colgroup>
							<col style="width:76px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>대표번호</span></th>
								<td class="vam"><span><strong>1899-2422</strong></span></td>
							</tr>
							<tr>
								<th scope="row"><span>주소</span></th>
								<td>
									<span><strong>경기도 성남시 분당구 황새울로 216<br>휴맥스빌리지 4층 ㈜데일리킹</strong></span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span>교통편</span></th>
								<td>
									<ul>
										<li>
											<strong>지하철<em>:</em></strong>수내역 3번 출구 도보 약 2분
										</li>
										<li>
											<strong>버스<em>:</em></strong>수내역.롯데백화점 하차
											<span><strong>일반</strong>17, 33, 52, 55-1, 250, 300, 380, 390, 520</span>
											<span><strong>직행</strong>102, 1241, 5500-1, 7007-1, 9414, G8110, 8106, 8109</span>
										</li>
										<li>
											<strong>자동차<em>:</em></strong>네비게이션 이용 시 ‘데일리킹’<br>또는 ‘휴맥스빌리지’ 검색<br>(휴맥스빌리지 건물 주차 가능)
										</li>	
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //table -->
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
