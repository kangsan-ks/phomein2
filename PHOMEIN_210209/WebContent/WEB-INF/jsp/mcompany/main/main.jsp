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
<div id="wrap" class="index_wrap"><!-- main : class="index_wrap" -->
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
		<div id="fullpage">
			<div class="section" id="section1">
				<div class="swiper">
					<ul class="swiper_wrap">
						<li class="swiper_slide con_wrap con1">
							<div class="con">
								<span class="tit"><em>SINCE 2006</em>대한민국<br>쌀국수의 기준</span>
								<p class="desc">흔들림 없는 브랜드 가치로<br>가장 포메인다운 길을 걸어갑니다.</p>
							</div>
						</li>
						<li class="swiper_slide con_wrap con2">
							<div class="con">
								<span class="tit"><em>트렌디한 가치 창출로</em>성장하는<br>수익성</span>
								<p class="desc">시대를 반영한 경쟁력으로<br>높은 수익률을 보장합니다.</p>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con3">
							<div class="con">
								<span class="tit"><em>쌀국수 시장을 선도하는</em>변화의 중심</span>
								<p class="desc">메뉴부터 서비스까지 차별화된 포메인만의<br>전략으로 시장을 선도합니다.</p>
							</div>
 						</li>
					</ul>
					<div class="swiper_pagination"></div>
				</div>
			</div>
			<div class="section con_wrap" id="section2">
				<div class="cont">
					<div class="con">
						<span class="tit"><em>포메인</em> 가맹 개설</span>
						<span class="desc">2006년 [분당 정자본점]을 시작으로<br>
						 가맹 사업을 시작한 포메인은<br>
						한국인의 입맛에 맞는 레시피 개발로<br>
						국내 베트남 쌀국수 대중화를 이끈 <br>
						대한민국 대표 쌀국수 전문 브랜드입니다.</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li><a href="/mcompany/franchisee/terms.do" class="link"><span>가맹 신청</span></a></li>
							<li><a href="/mcompany/franchisee/status.do" class="link"><span>가맹 안내</span></a></li>
							<!-- <li><a href="/mcompany/franchisee/cost.do" class="link"><span>가맹 비용</span></a></li> -->
						</ul>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section3">
				<div class="cont">
					<div class="con">
						<!-- 20190315 수정 s -->
						<span class="tit"><em>포메인</em> 연구<strong>.</strong>개발</span>
						<!-- //20190315 수정 e -->
						<span class="desc">
							포메인은 ‘안전한 식재료∙정직한 먹거리’<br>
							를 약속하며 포메인만의 특별한<br>
							차이를 만들어갑니다.
						</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li><a href="/mcompany/rnd/phoseason.do" class="link"><span>포시즌</span></a></li>
							<li><a href="/mcompany/rnd/greenfood.do" class="link"><span>현대그린푸드<br>MOU</span></a></li>
							<li><a href="/mcompany/rnd/educ.do" class="link"><span>전문교육장</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${not empty resultList }" >
				<div class="section con_wrap" id="section4">
					<div class="cont">
						<div class="con">
							<span class="tit"><em>PHOMEIN BEST STORE</em>포메인을 빛낸 주인공</span>
							<span class="desc">가장 가까운 곳에서<br>점주님들의 이야기를 듣고, 신뢰로 함께 성장합니다.</span>
						</div>
					</div>
					<div class="conb">
						<div class="con">
							<div class="swiper">
								<ul class="swiper_wrap">
									<c:forEach items="${resultList }" var="result" varStatus="status" >
										<li class="swiper_slide con${status.index + 1 }">
											<a href="/mcompany/franchisee/interview.do" class="link">
												<p class="img"><img src="${result.main_thimg }" alt="main img"></p>
												<p class="info">
													<span class="stroe">${result.store }</span>
													<span class="name">${result.title }</span>
												</p>
											</a>
										</li>
									</c:forEach>
								</ul>
								<div class="swiper_pagination"></div>
							</div>
						</div>
					</div>
				</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			<div class="section con_wrap" id="section5">
				<div class="cont">
					<div class="con">
						<span class="tit"><em>PHOMEIN CSR</em>포메인이 만드는 세상</span>
						<!-- 20190319 수정 s -->
						<span class="desc">
							식지 않는 뜨거운 진심으로 따뜻한 오늘,<br>
							따뜻한 세상을 만듭니다.
						</span>
						<!-- //20190319 수정 e -->
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<a href="/mcompany/csr/phoever.do"><span class="ico"><em class="blind">사회공헌</em></span></a>
					</div>
				</div>
			</div>
			<div class="section fp-auto-height" id="section6">
				<!-- footer -->
				<%@ include file="/WEB-INF/jsp/mcompany/include/companyfooter.jsp"%>
				<!-- //footer -->
			</div>
		</div>
		<!-- right-nav -->
		<ul class="right-nav">
			<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
			<li data-menuanchor="secondPage"><a href="#secondPage"><span>가맹 개설</span></a></li>
			<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>연구 . 개발</span></a></li>
			<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>인터뷰</span></a></li>
			<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>사회공헌</span></a></li>
		</ul>
		<!-- right-nav -->
	</div> 
	<!-- //container -->
	<div id="popHtml"></div>
</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/jquery.fullpage.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/main.js"></script>
<script type="text/javascript">
	$(function(){
	});
	
	
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
	    url: "/mcompany/main/show_popup.do",
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
