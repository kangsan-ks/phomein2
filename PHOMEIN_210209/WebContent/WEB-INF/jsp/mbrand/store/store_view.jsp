<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<div class="head">
	<h4>주소로 찾기</h4>
</div>
<div class="cont">
	<div class="stoer_view">
		<h5>${result.name}</h5>
		<div class="swiper">
			<ul class="swiper_wrap">
				<c:if test="${not empty result.f_file1}">
					<li class="swiper_slide"><img src="${result.f_file1}" alt=""></li>
				</c:if>
				<c:if test="${not empty result.f_file2}">
					<li class="swiper_slide"><img src="${result.f_file2}" alt=""></li>
				</c:if>
				<c:if test="${not empty result.f_file3}">
					<li class="swiper_slide"><img src="${result.f_file3}" alt=""></li>
				</c:if>
				<c:if test="${not empty result.f_file4}">
					<li class="swiper_slide"><img src="${result.f_file4}" alt=""></li>
				</c:if>
				<c:if test="${not empty result.f_file5}">
					<li class="swiper_slide"><img src="${result.f_file5}" alt=""></li>
				</c:if>
			</ul>
			<div class="swiper_pagination"></div>
			<div class="swiper_btn_next"></div>
			<div class="swiper_btn_prev"></div>
			<div class="option">
				<c:if test="${fn:indexOf(result.option1, '106201') != -1}">
					<span class="ico_delivery"><em class="blind">딜리버리</em></span>
				</c:if>
				<c:if test="${fn:indexOf(result.option1, '106202') != -1}">
					<span class="ico_best"><em class="blind">우수매장</em></span>
				</c:if>
				<c:if test="${fn:indexOf(result.option1, '106203') != -1}">
					<span class="ico_parking"><em class="blind">주차가능</em></span>
				</c:if>
			</div>
		</div>
	</div>
	<div class="stoer_info">
		<dl>
			<dt>신주소</dt>
			<dd>${result.naddr}</dd>
		</dl>
		<dl>
			<dt>구주소</dt>
			<dd>${result.oaddr}</dd>
		</dl>
		<dl>
			<dt>상세주소</dt>
			<dd>${result.daddr}</dd>
		</dl>
		<dl>
			<dt>전화번호</dt>
			<dd>${result.hp1}-${result.hp2}-${result.hp3}</dd>
		</dl>
		<dl>
			<dt>영업시간</dt>
			<dd>${result.bh1}:${result.bh2}~${result.bh3}:${result.bh4}</dd>
		</dl>
		<c:if test="${result.busyn == 'Y' }">
		<dl>
			<dt>버스</dt>
			<dd>${result.businfo}</dd>
		</dl>
		</c:if>
		<c:if test="${result.subyn == 'Y' }">
		<dl>
			<dt>지하철</dt>
			<dd>${result.subinfo}</dd>
		</dl>
		</c:if>
	</div>
</div>
<button type="button" class="btn_back"><span class="blind">뒤로가기</span></button>
<button type="button" class="btn_close" onclick="layerClose('layerStoreView');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->

		