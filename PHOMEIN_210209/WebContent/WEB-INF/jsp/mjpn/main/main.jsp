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
<%@ include file="/WEB-INF/jsp/mjpn/include/head.jspf"%>
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
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpngnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<div id="fullpage">
			<div class="section" id="section1">
				<div class="swiper">
					<ul class="swiper_wrap">
						<li class="swiper_slide con_wrap con1" style="background-image:url(../common/images/main/mv1_1.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										The Best<br>
										Rice Noodle<br>
										Restaurant Phomein
									</span>
									<span class="desc">ライスヌードルはフォーメイン</span>
								</div>
							</div>
						</li>
						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_2.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										<em>P米一粒から格別な<br>フォーメインらしさ</em>
									</span>
									<span class="desc">新米で直接作った米麺を使ってできれい<br>で健康なライスヌードルをお届けします。</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_3.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										<em>毎日厳しいフォ<br>ーメインらしさ</em>
									</span>
									<span class="desc">厳選された天然スパイスを使って<br>毎日お店で14時間煮詰めてとった<br>スープを使用しています。</span>
								</div>
							</div>
 						</li>
 						<li class="swiper_slide con_wrap con2" style="background-image:url(../common/images/main/mv1_4.jpg);">
							<div class="cont">
								<div class="con">
									<span class="tit">
										<em>材料から健康な<br>フォーメインらしさ</em>
									</span>
									<span class="desc">危害商品遮断システムを導入して<br>安全で優秀な品質の食材を<br>供給してもらっています。</span>
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
						<span class="desc">大韓民国におけるライスヌードル<br>の歴史はフォーメインから</span>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<span class="num volume">${ mainFieldVO.totalSales }</span>
						<span class="txt">累積販売量</span>
					</div>
				</div>
 			</div>
			<div class="section con_wrap" id="section3">
				<div class="cont">
					<div class="con">
						<span class="tit">
								ベトナム料理、
							<em>31種の感動を盛り込む</em>
						</span>
						<a href="/jpn/menu/menu_list.do" class="btn">PHOMEIN メニュー</a>
						<span class="caution"><em>*</em> 店舗によってメニューが異なる場合があります。</span>
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
								<dt><span>埋蔵数<em>${ mainFieldVO.storeJpnDt }</em></span></dt>
								<dd><span class="volume2">${ mainFieldVO.totalStore }</span></dd>
							</dl-->
							<dl>
								<dt><span>売上高<em>${ mainFieldVO.revenueJpnDt }</em></span></dt>
								<!-- 20190507 수정 s -->
								<dd><span class="volume2">${ mainFieldVO.revenue }</span><em>億</em></dd>
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
						<span class="tit">PHOMEIN CSR<br>
						<em>フォーメインが作りあげる世界</em></span>
						<span class="desc">冷めない熱い真心で暖かい今日、<br>
						暖かい世界を作り上げます。</span>
					</div>
				</div>
				<div class="conb">
					<a href="/mjpn/phomein/phoever.do">
					<div class="con">
						<span class="ico"></span>
					</div>
					</a>
				</div>
			</div>
			<div class="section con_wrap" id="section6">
				<div class="cont">
					<div class="con">
						<a href="/mjpn/franchisee/interior.do" class="link">
							<span class="flag">インテリア</span>
							<span class="tit">Phomeinの哲学と成功ノウハウで、<br>
							安定した起業を支援します。</span>
						</a>
					</div>
				</div>
				<div class="conb">
					<div class="con">
						<ul>
							<li class="event">
								<a href="/mjpn/community/cs_terms.do" class="link">
									<span class="flag">顧客問い合わせ</span>
									<span class="tit">お客様のご質問に迅速にお答えできるよう、<br>常に準備に万全を期しています。</span>
								</a>
							</li>
							<li class="franch">
								<a href="/mjpn/franchisee/terms.do" class="link">
									<span class="flag">加盟店</span>
									<span class="tit">加盟相談申請</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="section fp-auto-height" id="section7">
				<!-- footer -->
				<%@ include file="/WEB-INF/jsp/mjpn/include/jpnfooter.jsp"%>
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
	    url: "/mjpn/main/show_popup.do",
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
