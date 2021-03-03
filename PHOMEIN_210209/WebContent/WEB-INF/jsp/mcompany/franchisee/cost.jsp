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
		<div class="sub_visual sv3">
			<h3>가맹 비용</h3>
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
		<div id="content" class="franchisee">
			<di class="cost">
				<div class="tit_area pb0">
					<h4>가맹 비용</h4>
					<span class="txt fc_9">단위 : 천원</span>
				</div>
				<!-- table -->
				<div class="table_data_ty2">
					<table>
						<caption></caption>
						<colgroup>
							<col style="width:19%;">
							<col style="width:25%;">
							<col>
						</colgroup>
						<thead>
							<th scope="col"><span>구분</span></th>
							<th scope="col"><span>금액</span></th>
							<th scope="col"><span>내용</span></th>
						</thead>
						<tbody>
							<tr>
								<td><span><strong>가맹<br>가입비용</strong></span></td>
								<td><span><strong>25,000</strong></span></td>
								<td>
									<ul>
										<li>상표 및 휘장 사용권 부여</li>
										<li>영업 지역 부여</li>
										<li>메인 메뉴얼 사용 권한 부여</li>
										<li>포메인 교육비 일체</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td><span><strong>인테리어</strong></span></td>
								<td><span><strong>84,000<br>~ 110,000</strong></span></td>
								<td>
									<ul>
										<li class="fc_important">평수별 평단가 / 예상금액
											<ul>
												<li>30평  :  2,800 / 84,000</li>
												<li>35평  :  2,650 / 92,750</li>
												<li>40평  :  2,500 / 100,000</li>
												<li>45평  :  2,350 / 105,750</li>
												<li>50평  :  2,200 / 110,000</li>
											</ul>
										</li>
										<li>가구(의, 탁자 등) 포함</li>
										<li>별도공사
											<ul>
												<li>냉·난방 시설<br>(천정형 에어컨 권장)</li>
												<li>철거, 배수, 덕트 공사, 전기 용량 및 가스 증설, 소방 시설 등</li>
												<li>자재 변경 시</li>
											</ul>
										</li>
									</ul>
									<span class="caution">점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</span>
								</td>
							</tr>
							<tr>
								<td><span><strong>주방 설비<br>및 기물</strong></span></td>
								<td><span><strong>25,000<br>내외</strong></span></td>
								<td>
									<ul>
										<li>주방 면적 약 8평 내외 기준</li>
										<li>사기 그릇, 화구, 냉장고, 식기 세척기, 싱크대 등 각종 주방 물품 일체</li>
									</ul>
									<span class="caution">점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</span>
								</td>
							</tr>
							<tr>
								<td><span><strong>간판</strong></span></td>
								<td><span><strong>8,000<br>내외</strong></span></td>
								<td>
									<ul>
										<li>전면 간판(7,000 × 450mm) 1개 설치 시 기준이며, 간판 규격(size) 및 설치 개수에 따라서 비용이 상이하게 발생할 수 있음.</li>
										<li>LED+갤브프레임</li>
										<li>내부실사 비용 포함</li>
									</ul>
									<span class="caution">점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</span>
								</td>
							</tr>
							<tr>
								<td><span><strong>POS</strong></span></td>
								<td><span><strong>1,280<br>~ 2,280<br>내외</strong></span></td>
								<td>
									<ul>
										<li>메인 POS(듀얼 모니터) : <br>1,280,000원</li>
										<li>추가 설치 품목
											<ul>
												<li>오더 POS : 1,000,000원</li>
												<li>프린터기 : 200,000원</li>
											</ul>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td><span><strong>초도물품</strong></span></td>
								<td><span><strong>2,000<br>내외</strong></span></td>
								<td>
									<ul>
										<li>직원 유니폼, 메뉴판, 빌지 패드 등 기타 비품</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td><span><strong>임차비용</strong></span></td>
								<td><span><strong>별도</strong></span></td>
								<td></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><span><strong>총액</strong></span></td>
								<td><span><strong>약 140,280<br>~ 172,500</strong></span></td>
								<td><span>Vat 별도</span></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- //table -->	
			</di>
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
