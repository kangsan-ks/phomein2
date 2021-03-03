<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>

	<div class="layer-pop-parent">
		<div class="layer-pop-area">
			<!-- layer-cont -->
			<div class="layer-cont store-pop">
				<h2>${result.en_name}</h2>
				<!-- store-visual -->
				<div class="store-visual">
					<div class="slide-wrap">
						<c:if test="${not empty result.f_file1}">
							<div style="background-image:url('${result.f_file1}');" class="img"></div>
						</c:if>
						<c:if test="${not empty result.f_file2}">
							<div style="background-image:url('${result.f_file2}');" class="img"></div>
						</c:if>
						<c:if test="${not empty result.f_file3}">
							<div style="background-image:url('${result.f_file3}');" class="img"></div>
						</c:if>
						<c:if test="${not empty result.f_file4}">
							<div style="background-image:url('${result.f_file4}');" class="img"></div>
						</c:if>
						<c:if test="${not empty result.f_file5}">
							<div style="background-image:url('${result.f_file5}');" class="img"></div>
						</c:if>
					</div>
					<div class="detail-ico">
						<c:if test="${fn:indexOf(result.option1, '106201') != -1}">
							<span class="ico01"></span>
						</c:if>
						<c:if test="${fn:indexOf(result.option1, '106202') != -1}">
							<span class="ico02"></span>
						</c:if>
						<c:if test="${fn:indexOf(result.option1, '106203') != -1}">
							<span class="ico03"></span>
						</c:if>
					</div>
				</div>
				<!-- //store-visual -->

				<!-- table-simple-list -->
				<table class="table-simple-list">
					<caption>매장 정보 테이블</caption>
					<colgroup>
						<col style="width:110px">
						<col style="width:auto">
					</colgroup>
					<tbody>
						<tr>
							<th>住所</th>
							<td>${result.enaddr}</td>
						</tr>
						<tr>
							<th>電話番号</th>
							<td>${result.hp1}-${result.hp2}-${result.hp3}</td>
						</tr>
						<tr>
							<th>営業時間</th>
							<td>${result.bh1}:${result.bh2}~${result.bh3}:${result.bh4}</td>
						</tr>
						<c:if test="${result.busyn == 'Y' }">
						<tr>
							<th>バス</th>
							<td>${result.businfo}</td>
						</tr>
						</c:if>
						<c:if test="${result.subyn == 'Y' }">
						<tr>
							<th>地下鉄</th>
							<td>${result.subinfo}</td>
						</tr>
						</c:if>
					</tbody>
				</table>
				<!-- //table-simple-list -->
				<a href="javascript:;" class="btn-pop-close"></a>
			</div>
			<!-- //layer-cont -->
		</div>
	</div>
	
<script>
	front.common.slide();
	
	// 핀 클릭 시 매장 상세 팝업 오픈
	$('.pin').on('click',function(){
		$('.layer-pop-wrap').stop(true).fadeIn(400);
		$('html').addClass('fix');

		return false;
	});

	// 매장 상세 팝업 닫기
	$('.btn-pop-close').on('click',function(){
		$('.layer-pop-wrap').stop(true).fadeOut(400);
		$('html').removeClass('fix');

		return false;
	});
	
</script>
