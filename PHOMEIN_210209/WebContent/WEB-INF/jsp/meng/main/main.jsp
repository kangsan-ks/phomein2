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
<%@ include file="/WEB-INF/jsp/meng/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/meng/include/engheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/meng/include/enggnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<div id="fullpage">
			<div class="section" id="section1">
				<div class="swiper">
					<ul class="swiper_wrap">
						<li class="swiper_slide con_wrap con1" style="background-image:url(../common/images/main/mv1_2.jpg);">
							<div class="cont">
								<div class="con con1" style="bottom:-40%;">
									<span class="tit">
										Phomein,<br> Self-making Noodles<br> with Freshly<br> Harvested Rice
									</span>
									<span class="desc">The fragrance of freshly cooked new rice <br>Clear and transparent color<br>  Soft and chewy texture</span>
									<span class="desc" style="font-size:17px; font-weight:bold;">Phomein is it for rice noodles.</span>
								</div>
							</div>
						</li>
						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_1.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										Phomein's <br>rice noodle with <br>the best rice grains
									</span>
									<span class="desc">Rice noodles cooked with<br> freshly harvested rice have good quality <br>and offer rich health benefits.</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_3.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										Daily fresh <br>Phomein dishes
									</span>
									<span class="desc">Phomein meat broth is made with handpicked<br> natural flavourings through 14 hours <br>of boiling every day at the restaurant.</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_4.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										Healthy <br>Phomein ingredients
									</span>
									<span class="desc">The hazardous production prevention<br>systemensures the provision of<br> safe and excellent food ingredients. </span>
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
						<span class="flag">Since 2006</span>
						<span class="desc">Phomein, the start of the <br> Korean rice noodle history.</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<span class="num volume">${ mainFieldVO.totalSales }</span>
						<span class="txt">CUMULATIVE SALES VOLUME</span>
					</div>
				</div>
 			</div>
			<div class="section con_wrap" id="section3">
				<div class="cont">
					<div class="con">
						<span class="tit">
							31 kinds of<br> Vietnamese dishes<br> WILL IMPRESS YOU
							</span>
						<a href="/meng/menu/menu_list.do" class="btn">PHOMEIN MENU</a>
						<span class="caution"><em>*</em> The menu for each store can be different</span>
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
								<dt><span>NUMBER OF STORES<em>${ mainFieldVO.storeEngDt }</em></span></dt>
								<dd><span class="volume2">${ mainFieldVO.totalStore }</span></dd>
							</dl-->
							<dl>
								<dt><span>SALES<em>${ mainFieldVO.revenueEngDt }</em></span></dt>
								<!-- 20190507 수정 s -->
								<dd><span class="volume2">${ mainFieldVO.revenue }</span><em>HUNDRED MILLION</em></dd>
								<!-- //20190507 수정 e -->
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="section con_wrap" id="section4">
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
			<div class="section con_wrap" id="section5">
				<div class="cont">
					<div class="con">
						<span class="tit">PHOMEIN CSR <br>The world created<br>by Phomein</span>
						<span class="desc">With its warm rice noodles,<br> Phomein makes a heart-warming world.</span>
					</div>
				</div>
				<div class="conb">
					<a href="/meng/phomein/phoever.do" class="link">
					<div class="con">
						<span class="ico"></span>
					</div>
					</a>
				</div>
			</div>
			<div class="section con_wrap" id="section6">
				<div class="cont">
					<div class="con">
						<a href="/meng/franchisee/interior.do" class="link">
							<span class="flag">INTERIOR</span>
							<span class="tit">WITH PHOMAIN'S PHILOSOPHY<br> AND KNOW-HOW ON SUCCESS,<br> SUPPORTS STABLE START-UPS</span>
						</a>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li class="event">
								<a href="/meng/community/cs_terms.do" class="link">
									<span class="flag">CS CENTER</span>
									<span class="tit">We'll answer <br>your Questions <br>quickly</span>
								</a>
							</li>
							<li class="franch">
								<a href="/meng/franchisee/terms.do" class="link">
									<span class="flag">FRANCHISE</span>
									<span class="tit">Franchise <br>Consultation</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="section fp-auto-height" id="section7">
				<!-- footer -->
				<%@ include file="/WEB-INF/jsp/meng/include/engfooter.jsp"%>
				<!-- //footer -->
			</div>
		</div>
		<!-- right-nav -->
		<ul class="right-nav">
			<li data-menuanchor="firstPage"><a href="#firstPage"><span>HOME</span></a></li>
			<li data-menuanchor="secondPage"><a href="#secondPage"><span>BRAND</span></a></li>
			<li data-menuanchor="thirdPage"><a href="#thirdPage"><span>MENU</span></a></li>
			<li data-menuanchor="fourthPage"><a href="#fourthPage"><span>SNS</span></a></li>
			<li data-menuanchor="fifthPage"><a href="#fifthPage"><span>CSR</span></a></li>
			<li data-menuanchor="sixthPage"><a href="#sixthPage"><span>FRANCHISE</span></a></li>
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
	    url: "/meng/main/show_popup.do",
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
