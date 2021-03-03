<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandheader.jsp"%>
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
			<div class="visual" style="background-image:url('../images/content/sub_visual_03.jpg');"></div>
			<h2 class="h2-type">2019 모범매장</h2>
			<span class="txt">특별하지 않은 포메인은 없습니다. 조금 더 특별한 포메인을 소개합니다.</span>
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<c:choose>
				<c:when test="${not empty resultList }" >
				<!-- best-store-list -->
				<div class="best-store-list">
					<div class="inner">
						<!-- img-board-list -->
						<div class="img-board-list type02">
							<ul>
								<c:forEach items="${resultList }" var="result" varStatus="status" >
									<li>
										<p class="img"><img src="${result.f_file1 }" alt=""/ width="340px" height="380px"></p>
										<a href="/brand/store/store_list.do?storeName=${result.name }">
											<span class="detail-name">${result.name }</span>
											<span class="detail-tel">${result.hp1 }-${result.hp2 }-${result.hp3 }</span>
											<input type="hidden" name="bh1" value="${result.bh1 }"/>
											<input type="hidden" name="bh2" value="${result.bh2 }"/>
											<input type="hidden" name="bh3" value="${result.bh3 }"/>
											<input type="hidden" name="bh4" value="${result.bh4 }"/>
											<span class="detail-time dateFormatTxt"></span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- //img-board-list -->
					</div>
				</div>
				<!-- //best-store-list -->
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>

			<!-- best-store-standard -->
			<div class="inner02">
				<div class="best-store-standard">
					<h3 class="h3-type">선정기준</h3>
					<p class="txt">선정 기준별 평균 점수 이상을 획득한 매장이 “모범 매장”으로 선정됩니다.</p>
					<ul>
						<li>
							<span class="img"><img src="../images/icon/ico_best_standard_01.png" alt=""/></span>
							<span class="tit">식재료 안전</span>
						</li>
						<li>
							<span class="img"><img src="../images/icon/ico_best_standard_02.png" alt=""/></span>
							<span class="tit">위생</span>
						</li>
						<li>
							<span class="img"><img src="../images/icon/ico_best_standard_03.png" alt=""/></span>
							<span class="tit">서비스</span>
						</li>
					</ul>
				</div>
			</div>
			<!-- //best-store-standard -->

			<div class="store-faq">
				<div class="inner">
					<h3 class="h3-type">FAQ</h3>
					<div class="faq-list">
						<dl class="active">
							<dt>선정되지 않은 매장들은 기준에 문제가 있는 건가요?</dt>
							<dd>그렇지 않습니다. 포메인 전 매장은 식자재 안전, 위생, 서비스 등이 철저하게 관리되고 있습니다.<br> 선정되지 않은 매장들도 우수한 점수로 기준을 준수하며, 선정 된 매장의 경우 전 매장의 평균 점수보다 조금 더 획득한 매장을 의미합니다.</dd>
						</dl>
						<dl>
							<dt>‘안전 인증 로고(Relief Phomein)’는 무엇인가요?</dt>
							<dd>‘Relief Phomein’ 인증마크는 생산, 유통 과정의 안정성을 포메인과 현대그린푸드가 과학적 식품안전시스템으로 인증한 상품임을 표기한 것으로, 안전한 식재료와 정직한먹거리를 제공하고자 하는 포메인의 건강한 약속입니다.<br>
								* 인증마크는 현대그린푸드의 위해상품 차단시스템을 거친 식재료를 100% 사용하는 매장에 한해 수여되며, 매장 입구 윈도우에서 부착 여부를 확인 할 수 있습니다.</dd>
						</dl>
						<dl>
							<dt>‘위해상품 차단시스템’은 무엇인가요?</dt>
							<dd>식품의약품안전처, 환경부, 국가기술표준원에서 제공되는 위해상품정보를 대한상공회의소에서 종합하여 유통업체 본사에 실시간으로 일괄 전송, 해당 상품의 판매를 차단하는 시스템입니다.<br>
								이로써 현대그린푸드를 통해 포메인에 유통되는 식자재 중 불량하다고 판단되거나, 위해 성분이 검출된 상품은 물류센터와 배송 차량, 각 가맹점 등에서 실시간 SNS 전송으로 거점별 원천 차단이 가능해집니다.</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인, 매장찾기 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
<script type="text/javascript">
$(function(){
	// 오픈 시간
	$.each($(".dateFormatTxt"), function(){
		var bh1 = $(this).siblings("input[name=bh1]").val();
		var bh2 = $(this).siblings("input[name=bh2]").val();
		var bh3 = $(this).siblings("input[name=bh3]").val();
		var bh4 = $(this).siblings("input[name=bh4]").val();

		if(bh1 == 12) {
			$(this).append('pm 12');
		} else if(bh1 == 24) {
			$(this).append('am 00');
		} else if(bh1 > 12) {
			$(this).append('pm ' + parseInt(bh1 - 12));
		} else {
			$(this).append('am ' + bh1.length == 1 ? '0' + bh1 : 'am ' + bh1);
		}

		$(this).append(':');
		$(this).append(bh2);
		$(this).append(' ~ ');
		if(bh3 == 12) {
			$(this).append('pm 00');
		}
		if(bh3 == 12) {
			$(this).append('pm 12');
		} else if(bh3 == 24) {
			$(this).append('am 00');
		} else if(bh3 > 12) {
			$(this).append('pm ' + parseInt(bh3 - 12));
		} else {
			$(this).append('am ' + bh3.length == 1 ? '0' + bh3 : 'am ' + bh3);
		}
		$(this).append(':');
		$(this).append(bh4);
	});
});
</script>
</body>
</html>
