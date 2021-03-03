<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf" %>
<aside id="lnb">
			<ul>
				<!--
				//	@lnb
				//
				//	- lnb > li 태그에 actived 클래스 추가시 활성화(기본으로 열림);
				//	- lnb > li 태그에 snb 태그가 없으면 스크립트에서 화살표 삭제 클래스 추가;
				-->
				<li <c:if test="${ fn:substring(menuCd,0,3) == '105' }">class="actived"</c:if> >
					<a href="/store/intranet/board_list.do"><span>인트라넷</span></a>
					<!--
					//	@snb
					//
					//	- snb > li 태그에 actived 클래스 추가시 활성화
					-->
					<ul class="snb">
						<li <c:if test="${menuCd == '105201' }">class="actived"</c:if> ><a href="/store/intranet/board_list.do"><span>공지사항</span></a></li>
						<li <c:if test="${menuCd == '105202' }">class="actived"</c:if> ><a href="/store/intranet/reference_list.do"><span>자료실</span></a></li>
						<li <c:if test="${menuCd == '105204' }">class="actived"</c:if> ><a href="/store/intranet/order_design_write.do"><span>디자인 발주 신청</span></a></li>
						<li <c:if test="${menuCd == '105205' }">class="actived"</c:if> ><a href="/store/intranet/order_design_detail_list.do"><span> ┗ 신청 내역</span></a></li>
						<li <c:if test="${menuCd == '105206' }">class="actived"</c:if> ><a href="/store/intranet/order_item_write.do"><span>본사 물품 신청</span></a></li>
						<li <c:if test="${menuCd == '105207' }">class="actived"</c:if> ><a href="/store/intranet/order_item_detail_list.do"><span> ┗  신청 내역</span></a></li>
					</ul>
				</li>

				<li <c:if test="${ fn:substring(menuCd,0,3) == '110' }">class="actived"</c:if> >
					<a href="#"><span>마이페이지</span></a>
					<ul class="snb">
						<li <c:if test="${ fn:substring(menuCd,0,3) == '110' }">class="actived"</c:if>><a href="/store/manager_view.do"><span>개인정보수정</span></a></li>
					</ul>
				</li>
			</ul>
		</aside>