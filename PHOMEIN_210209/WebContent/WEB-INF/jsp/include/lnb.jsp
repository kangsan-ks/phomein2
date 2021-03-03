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
				<%-- ${adminSession.menu } --%>
				<c:set var="mainUrl" value=""/>
				<c:set var="cnt" value="0"/>
				
				<c:forEach var="menuList" items="${ MenuList }" varStatus="status">
				<c:if test="${fn:indexOf(adminSession.menu, menuList.menuCd) > -1 }" >
				
				<li <c:if test="${ fn:substring(menuCd,0,3) == menuList.menuCd }">class="actived"</c:if> >
					<a href="${menuList.link }" <c:if test="${ fn:substring(menuCd,0,3) == '108' }">target="blank"</c:if>><span><c:out value="${menuList.menuNm }"/></span></a>
					<ul class="snb">
					<c:forEach var="result" items="${ fnc:menuListSub(menuList.menuCd) }" varStatus="status">
						<%-- ${ result.menuCd }
						 --%>
						<c:if test="${fn:indexOf(adminSession.menu, result.menuCd) > -1 }" >
						
						<li <c:if test="${menuCd == result.menuCd }">class="actived"</c:if> ><a href="${ result.link }" <c:if test="${ fn:substring(result.menuCd,0,3) == '108' }">target="blank"</c:if>><span>${ result.menuNm }</span></a>
						<c:if test="${cnt == '0'}">
						<c:set var="mainUrl" value="${ result.link }"/>
						</c:if>
						<c:set var="cnt" value="#{cnt+1 }"/>
						</li>
						
						</c:if>
						
					</c:forEach>
					</ul>
				</li>
				
				
				</c:if>
				</c:forEach>
<%--				
				<li>
					<a href="#"><span>메뉴 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '101201' }">class="actived"</c:if> ><a href="#"><span>제품 관리</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>매장 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '102201' }">class="actived"</c:if> ><a href="#"><span>매장 관리</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>게시판 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '103201' }">class="actived"</c:if> ><a href="#"><span>공지&언론보도</span></a></li>
						<li <c:if test="${menuCd == '103202' }">class="actived"</c:if> ><a href="#"><span>이벤트</span></a></li>
						<li <c:if test="${menuCd == '103203' }">class="actived"</c:if> ><a href="#"><span>포메인 SNS</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>문의 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '104201' }">class="actived"</c:if> ><a href="#"><span>고객의 소리</span></a></li>
						<li <c:if test="${menuCd == '104202' }">class="actived"</c:if> ><a href="#"><span>가맹점 문의</span></a></li>
						<li <c:if test="${menuCd == '104203' }">class="actived"</c:if> ><a href="#"><span>포인트 조회</span></a></li>
						<li <c:if test="${menuCd == '104204' }">class="actived"</c:if> ><a href="#"><span>포인트 병합 신청</span></a></li>
						<li <c:if test="${menuCd == '104205' }">class="actived"</c:if> ><a href="#"><span>포메인상품권 신청</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>인트라넷</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '105201' }">class="actived"</c:if> ><a href="#"><span>공지사항</span></a></li>
						<li <c:if test="${menuCd == '105202' }">class="actived"</c:if> ><a href="#"><span>자료실</span></a></li>
						<li <c:if test="${menuCd == '105203' }">class="actived"</c:if> ><a href="#"><span>디자인 발주 신청 관리</span></a></li>
						<li <c:if test="${menuCd == '105204' }">class="actived"</c:if> ><a href="#"><span>디자인 발주 신청</span></a></li>
						<li <c:if test="${menuCd == '105205' }">class="actived"</c:if> ><a href="#"><span>디자인 발주 신청 내역</span></a></li>
						<li <c:if test="${menuCd == '105206' }">class="actived"</c:if> ><a href="#"><span>본사 물품 신청 관리</span></a></li>
						<li <c:if test="${menuCd == '105207' }">class="actived"</c:if> ><a href="#"><span>본사 물품 신청 내역</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>회원 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '106201' }">class="actived"</c:if> ><a href="#"><span>온라인 회원</span></a></li>
						<li <c:if test="${menuCd == '106202' }">class="actived"</c:if> ><a href="#"><span>탈퇴 회원 관리</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>사이트 관리</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '107201' }">class="actived"</c:if> ><a href="#"><span>관리자 관리</span></a></li>
						<li <c:if test="${menuCd == '107202' }">class="actived"</c:if> ><a href="#"><span>팝업 관리</span></a></li>
						<li <c:if test="${menuCd == '107203' }">class="actived"</c:if> ><a href="#"><span>메인 관리</span></a></li>
						<li <c:if test="${menuCd == '107204' }">class="actived"</c:if> ><a href="#"><span>PHO EVER 관리</span></a></li>
						<li <c:if test="${menuCd == '107205' }">class="actived"</c:if> ><a href="#"><span>우수매장 인터뷰 관리</span></a></li>
					</ul>
				</li>
				<li>
					<a href="#"><span>통계</span></a>
					<ul class="snb">
						<li <c:if test="${menuCd == '108201' }">class="actived"</c:if> ><a href="#"><span>접속 통계</span></a></li>
					</ul>
				</li>
				<li class="actived">
					<a href="#"><span>공동 관리</span></a>
					<!--
					//	@snb
					//
					//	- snb > li 태그에 actived 클래스 추가시 활성화
					-->
					<ul class="snb">
						<li <c:if test="${menuCd == '109201' }">class="actived"</c:if> ><a href="#"><span>코드 관리</span></a></li>
						<li <c:if test="${menuCd == '109201' }">class="actived"</c:if> ><a href="/admin/menu/category_list.do"><span>메뉴 관리</span></a></li>
					</ul>
				</li>
 --%>				
			</ul>
		</aside>
		<script >
			$('#mainUrl').prop('href', "${mainUrl}");
		</script>
		