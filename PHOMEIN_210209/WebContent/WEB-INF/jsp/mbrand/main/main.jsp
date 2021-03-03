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
<div id="wrap" class="index_wrap"><!-- main : class="index_wrap" -->
	<!-- skip nav -->
	<div id="skip_nav">
        <a href="#content">본문 바로가기</a>
    </div>
    <!-- //skip nav -->
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<div id="fullpage">
			<div class="section" id="section1">
				<div class="swiper">
					<ul class="swiper_wrap">
						<li class="swiper_slide con_wrap con1" style="background-image:url(../common/images/main/mv1.png); background-position:center bottom;">
							<div class="cont">
								<div class="con con1" style="bottom:-10%;">
									<span class="tit" style="font-size:40px; line-height:52px;"><em style="padding-bottom:15px;">소규모 프리미엄 쌀국수 브랜드</em>포메인 RED 런칭</span>
									<span class="desc" style="font-size:18px;"><b style="color:#ab3221;">R</b>ice noodle <b style="color:#ab3221;">E</b>xpress <b style="color:#ab3221;">D</b>elivery</span>
									<a href="http://www.phomein.com/company/franchisee/red.do" style="display:inline-block; margin-top:50px; padding:11px 21px; background-color:#8a382c; color:#fff; font-size:15px;">브랜드 스토리 확인</a>
								</div>
							</div>
						</li>

						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_2.jpg);">
							<div class="cont">
								<div class="con con1" style="bottom:-10%;">
									<span class="tit" style="font-size:40px; line-height:52px;"><em style="padding-bottom:15px;">포메인,</em>햅쌀로 자가제면<br> 自家製麵</span>
									<span class="desc" style="font-size:16px;">갓 지은 햅쌀밥의 향<br><font style="padding-right:15px;">맑고 투명한 빛깔</font>부드럽고 쫀득한 식감</span>
									<span class="desc" style="padding-top:20px;font-size:13px; line-height:22px;">1년 364일 햅쌀로 직접 만들어 건강한<br> 쌀국수면과 품질개선으로 더 깊어진 명품 육수까지</span>
								</div>
							</div>
						</li>
						<li class="swiper_slide con_wrap con3" style="background-image:url(../common/images/main/mv1_1.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit"><em>쌀 한 톨부터 다른</em>포메인다움</span>
									<span class="desc">햅쌀로 직접 만든 쌀국수면으로 <br>깨끗하고 건강한 쌀국수를 선사합니다.</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con4" style="background-image:url(../common/images/main/mv1_3.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit"><em>매일매일 까다로운</em>포메인다움</span>
									<span class="desc">엄선한 9가지 상급 천연 향신료로 매일<br/>매장에서 직접 끓여낸 명품 육수를 사용합니다</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con5" style="background-image:url(../common/images/main/mv1_4.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit"><em>재료부터 건강한</em>포메인다움</span>
									<span class="desc">위해 상품차단 시스템으로 안전하고 <br>우수한 품질의 식자재를 공급 받습니다.</span>
								</div>
							</div>
 						</li>
					</ul>
					<div class="swiper_pagination"></div>
				</div>
			</div>
			<div class="section con_wrap" id="section2">
				<div class="cont">
					<div class="con">
						<span class="flag">SINCE 2006</span>
						<span class="desc">대한민국 쌀국수의 역사,<br>포메인으로부터.</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<span class="num volume">${ mainFieldVO.totalSales }</span>
						<span class="txt">쌀국수 누적 판매량</span>
					</div>
				</div>
 			</div>
			<div class="section con_wrap" id="section3">
				<div class="cont">
					<div class="con">
						<span class="tit">베트남 요리,<em>31가지 감동을 담다.</em></span>
						<a href="/mbrand/menu/menu_list.do" class="btn">포메인 전체메뉴 보기</a>
						<span class="caution"><em>*</em> 매장별로 판매 메뉴는 상이 할 수 있습니다.</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<div class="info">
							<dl>
								<dt><span>SINCE 2006</span></dt>
								<dd><span class="volume2">${ mainFieldVO.yearCnt }</span><em>th</em></dd>
							</dl>
							<!--dl>
								<dt><span>매장수<em>${ mainFieldVO.storeBrandDt }</em></span></dt>
								<dd><span class="volume2">${ mainFieldVO.totalStore }</span></dd>
							</dl-->
						</div>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section4">
				<div class="cont">
					<div class="con">
						<p class="txt">ENJOY SERVICE</p>
						<span class="tit">당신의 모든 순간<em>포메인</em></span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li><a href="https://gift-talk.kakao.com/appredirect?brand_id=2180" class="link_kakao" target="_blank"><span>카카오톡 <em>선물하기</em></span></a></li>
							<li><a href="/mbrand/store/store_list.do" class="link_delivery"><span><em>딜리버리</em> 매장</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section5">
				<div class="cont">
					<div class="con">
						<span class="tit"><em>PHOMEIN CSR</em>포메인이 만드는 세상</span>
						<span class="desc">
							식지 않는 뜨거운 진심으로 따뜻한 오늘,<br>
							따뜻한 세상을 만듭니다.
						</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<a href="/mbrand/phomein/phoever.do"><span class="ico"><em class="blind">사회공헌</em></span></a>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section6">
				<div class="cont">
					<div class="con">
						<span class="tit">PHOMEIN <em>SNS</em></span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<c:choose>
								<c:when test="${not empty snsList }" >
									<c:forEach items="${snsList }" var="result" varStatus="status" >
										<c:if test="${status.index < 9 }">
											<li><a href="${result.url}"><img alt="" src="${result.m_thimg }"></a></li>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section7">
				<div class="cont">
					<div class="con">
						<c:choose>
							<c:when test="${not empty noticeList }" >
								<c:forEach items="${noticeList }" var="result" varStatus="status" >
									<c:if test="${status.index < 1 }">
										<a href="/mbrand/community/notice/community_view.do?seq=${result.seq }" class="link">
											<span class="flag">NEWS</span>
											<span class="tit">${fnc:xssContents(result.title )}</span>
											<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
											<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
											<span class="date"><c:out value="${regDttmp }" /></span>
										</a>
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li class="event">
								<c:choose>
									<c:when test="${not empty eventList }" >
										<c:forEach items="${eventList }" var="result" varStatus="status">
											<c:if test="${status.index < 1 }">
												<a href="/mbrand/community/event/community_view.do?seq=${result.seq }" class="link">
													<span class="flag">EVENT</span>
													<span class="tit">${fnc:xssContents(result.title )}</span>
												</a>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
									</c:otherwise>
								</c:choose>
							</li>
							<li class="franch">
								<a href="/mcompany/franchisee/terms.do" class="link" target="_blank">
									<span class="flag">FRANCHISE</span>
									<span class="tit"><em class="blind">포메인</em>가맹문의<br>바로가기</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="section fp-auto-height" id="section8">
				<!-- footer -->
				<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
				<!-- //footer -->
			</div>
		</div>
		<!-- right-nav -->
		<ul class="right-nav">
			<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
			<li data-menuanchor="secondPage"><a href="#secondPage"><span>브랜드</span></a></li>
			<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>메뉴</span></a></li>
			<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>서비스</span></a></li>
			<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>CSR</span></a></li>
			<li data-menuanchor="sixthPage"><a href="#sixthPage"><span>SNS</span></a></li>
			<li data-menuanchor="seventhPage"><a href="#seventhPage"><span>커뮤니티</span></a></li>
		</ul>
		<!-- //right-nav -->
	</div>
	<!-- //container -->
	<div id="popHtml"></div>
</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/jquery.fullpage.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="../common/js/jquery.counterup.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/main.js"></script>
<script type="text/javascript">

	function toggleCheckbox(_target) {
		var _t = $(_target);
		setCookie("notToday" + _t.data("seq") + "",'Y', 1);
		_t.parents(".layer-pop-wrap").removeClass('open');
	}

	function btnClose(_target) {
		var _t = $(_target);
		_t.parents(".layer-pop-wrap").removeClass('open');
	}

	function setCookie(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
	}

	function getCookie(name) {
		var cName = name + "=";
		var x = 0;

		while ( x <= document.cookie.length ) {
		    var y = (x+cName.length);
		    if ( document.cookie.substring( x, y ) == cName ) {
		        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
		            endOfCookie = document.cookie.length;
		        return unescape( document.cookie.substring( y, endOfCookie ) );
		    }

		    x = document.cookie.indexOf( " ", x ) + 1;
		    if ( x == 0 )
		    	break;
		}
		return "";
	}

	//팝업 관리
	$.ajax({
	    url: "/mbrand/main/show_popup.do",
	    type: "POST",
	    data: {},
	    dataType: 'json',
	    success: function (data) {
			 if(data.resultList.length > 0) {
				var $popHtml = '';
			 	$.each(data.resultList, function(key, index){
				 	if(!!data.resultList[key].m_img) {
				 		if(getCookie("notToday" + data.resultList[key].seq + "") != "Y"){
							$popHtml += '<article id="popMain" class="layer-pop-wrap main-notice-pop small open">';
							$popHtml += 		'<div class="layer-pop-parent">';
							$popHtml += 			'<div class="layer-pop-children">';
							$popHtml += 				'<div class="pop-data">';
							$popHtml += 					'<div class="content">';
							$popHtml += 						'<a href="' + data.resultList[key].m_url + '">';
							$popHtml += 							'<img src="' + data.resultList[key].m_img + '" alt="'+ data.resultList[key].m_alt +'"/>';
							$popHtml += 						'</a>';
							$popHtml += 					'</div>';
							$popHtml += 					'<p class="pop-bottom-btn">';
							$popHtml += 						'<a href="#" onclick="toggleCheckbox(this)" data-seq="' + data.resultList[key].seq + '">오늘 하루 보지 않기</a>';
							$popHtml += 						'<a href="#" onclick="btnClose(this)">닫기</a>';
							$popHtml += 					'</p>';
							$popHtml += 				'</div>';
							$popHtml += 			'</div>';
							$popHtml += 		'</div>';
							$popHtml += 	'</article>';
						}
				 	}
				});
			 	$("#popHtml").html($popHtml);
	    	}
	    },
	    error: function (xhr, status, error) {
	    	if (xhr.status == 500) {
	    		alert('Internal error: ' + xhr.responseText);
	        } else {
	            alert('Unexpected error.');
	        }
	    }
	});

</script>
</body>
</html>
