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

	<section id="dBody" class="franchisee">
		
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_03.jpg');"></div>
			<h2 class="h2-type">가맹비용</h2>
			<span class="txt">포메인의 철학과 성공 노하우로 안정적인 창업을 지원합니다.<br>대한민국 대표 쌀국수 전문브랜드, 포메인</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>
		
		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="estimate-con">
					<div class="con-title">
						<h3 class="h3-type">가맹비용</h3>
					</div>


					<div class="table-list-data mt60">
						<div class="text-info">단위 : 천원</div>
							<fieldset>
								<legend>가맹비용 테이블 리스트</legend>
								<table class="view2">
									<caption>가맹비용 테이블 리스트</caption>
									<colgroup>
										<col style="width:200px">
										<col style="width:200px">
										<col style="width:auto">
									</colgroup>
									<tbody>
										<tr>
											<th>구분</th>
											<th>금액</th>
											<th>내용</th>
										</tr>
										<tr>
											<td>가맹 가입비용</td>
											<td>25,000</td>
											<td class="td-con">
												<ul class="list1">
													<li>상표 및 휘장 사용권 부여</li>
													<li>영업 지역 부여</li>
													<li>메인 매뉴얼 사용 권한 부여</li>
													<li>포메인 교육비 일체</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>인테리어</td>
											<td>84,000 ~ 110,000</td>
											<td class="td-con">
												<table class="min-table-list">
													<caption>인테리어 평단가 예상금액 테이블 리스트</caption>
													<colgroup>
														<col style="width:auto">
														<col style="width:16.5%">
														<col style="width:16.5%">
														<col style="width:16.5%">
														<col style="width:16.5%">
														<col style="width:16.5%">
													</colgroup>
													<tbody>
														<tr>
															<th>구분</th>
															<th>30평</th>
															<th>35평</th>
															<th>40평</th>
															<th>45평</th>
															<th>50평</th>
														</tr>
														<tr>
															<td>평단가</td>
															<td>2,800</td>
															<td>2,650</td>
															<td>2,500</td>
															<td>2,350</td>
															<td>2,200</td>
														</tr>
														<tr>
															<td>예상금액</td>
															<td>84,000</td>
															<td>92,750</td>
															<td>100,000</td>
															<td>105,750</td>
															<td>110,000</td>
														</tr>
													</tbody>
												</table>

												<ul class="list1">
													<li>가구(의, 탁자 등) 포함</li>
													<li>별도공사</li>
												</ul>
												<ul class="list2">
													<li>냉·난방 시설(천정형 에어컨 권장)</li>
													<li>철거, 배수, 덕트 공사, 전기 용량 및 가스 증설, 소방 시설 등</li>
													<li>자재 변경 시</li>
												<ul>
												<p class="txt-col">※ 점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</p>
											</td>
										</tr>
										<tr>
											<td>주방 설비 및 기물</td>
											<td>25,000 내외</td>
											<td class="td-con">
												<ul class="list1">
													<li>주방 면적 약 8평 내외 기준</li>
													<li>사기 그릇, 화구, 냉장고, 식기 세척기, 싱크대 등 각종 주방 물품 일체</li>
												</ul>
												<p class="txt-col">※ 점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</p>
											</td>
										</tr>
										<tr>
											<td>간판</td>
											<td>8,000 내외</td>
											<td class="td-con">
												<ul class="list1">
													<li>전면 간판(7,000 × 450mm) 1개 설치 시 기준이며, 간판 규격(size) 및 설치 개수에 따라서 비용이 상이하게 발생할 수 있음.</li>
													<li>LED+갤브프레임</li>
													<li>내부실사 비용 포함</li>
												</ul>
												<p class="txt-col">※ 점포지 제반 상황에 따라서 추가 비용이 발생할 수 있음</p>
											</td>
										</tr>
										<tr>
											<td>POS</td>
											<td>1,280 ~ 2,280 내외</td>
											<td class="td-con">
												<ul class="list1">
													<li>메인 POS(듀얼 모니트) : 1,280,000원</li>
													<li>추가 설치 품목</li>
													<li>오더 POS : 1,000,000원</li>
													<li>프린터기 : 200,000원</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>초도물품</td>
											<td>2,000 내외</td>
											<td class="td-con">
												<ul class="list1">
													<li>직원 유니폼, 메뉴판, 빌지 패드 등 기타 비품</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td>임차비용</td>
											<td>별도</td>
											<td class="td-con"></td>
										</tr>
											<tr class="bg-col">
											<td>총액</td>
											<td>약 146,000</td>
											<td class="td-con">Vat 별도</td>
										</tr>
									</tbody>
								</table>
							</fieldset>
						</div>

				</div>
			</div>
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
</body>
</html>
