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
<div id="wrap">
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
		<!-- sub visual -->
		<div class="sub_visual sv5">
			<h3>インテリア</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			FRANCHISE : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mjpn/include/jpnlnb.jsp"%>
		<!-- //lnb -->
		
		<!-- content -->
		<div id="content" class="franchisee">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
			<div class="interior">
				<div class="tit_area">
					<h4>Modern &amp; Minimal</h4>
					<p class="desc">
					フォーメインは、不要な要素を最小限に抑え、シンプルですっきりとした印象の空間を追求しつつ、<br>
					明るく温かみのある色使いで、ゆったりとお食事をお楽しみいただける雰囲気を造成しています。
					</p>
				</div>
				<c:choose>
					<c:when test="${not empty resultList }" >
					<div class="store_list">
					<c:forEach items="${resultList }" var="result" varStatus="status" >
						<a href="/mjpn/store/store_list.do?storeName=${result.en_name }&best=Y">
						<div class="swiper">
							<ul class="swiper_wrap">
									<c:if test="${not empty result.f_file6 }"><li class="swiper_slide"><img src="${result.f_file6 }" alt=""></li></c:if>
									<c:if test="${not empty result.f_file7 }"><li class="swiper_slide"><img src="${result.f_file7 }" alt=""></li></c:if>
									<c:if test="${not empty result.f_file8 }"><li class="swiper_slide"><img src="${result.f_file8 }" alt=""></li></c:if>
							</ul>
							<div class="store">${result.en_name }</div>
							<div class="swiper_btn_next"></div>
							<div class="swiper_btn_prev"></div>
							<div class="swiper_pagination"></div>
						</div>
						</a>
					</c:forEach>
					</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<c:if test="${totalRecordCount > pageIndex * 3}">
					<!-- 버튼 영역 -->
					<div class="btn_area">
						<button type="button" id="moreBtn" class="btn_tyf c_white btn_more">もっと見る</button>
					</div>
					<!-- //버튼 영역 -->
				</c:if>
			</div>
		</div>
		<!-- //content -->
	
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mjpn/include/jpnfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>

<script>
//Swiper
function InteriorSwiper() {
	var InteriorSwiper = new Swiper('.swiper', {
		wrapperClass: 'swiper_wrap',
		slideClass: 'swiper_slide',
		slidesPerView: 1,
		loop: true,
		pagination: {
			el: '.swiper_pagination',
			type: 'fraction',
		},
		navigation: {
			nextEl: '.swiper_btn_next',
			prevEl: '.swiper_btn_prev',
		},
	});
}

if( $(".swiper .swiper_slide").length > 1 ){
	InteriorSwiper();
}

$("#moreBtn").on("click", function(){
	$("#pageIndex").val(parseInt($("#pageIndex").val()) + 1);
	$.ajax({
     	url: "/mjpn/franchisee/get_interior_list_ajax.do",
        type: "POST",
        data: {
        	'pageIndex' : $("#pageIndex").val()
        },
        dataType: 'json',
        success: function (data) {
        	var tmplVal = new Object();
    	    tmplVal.jsonArr = data.result;
    	    tmplVal.jsonArr.pageIndex = data.pageIndex;
    	    tmplVal.jsonArr.searchTotalCnt = data.searchTotalCnt;
    	    $(".store_list").append($("#interiorListTmpl").tmpl(tmplVal));
    	    InteriorSwiper();
    	    
    	    if(data.searchTotalCnt <= data.pageIndex * 3) {
    			$(".btn_area").hide();	
    		} else {
    			$(".btn_area").show();
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
});

</script>
<script id="interiorListTmpl" type="text/x-tmpl">
	{{if jsonArr.length > 0}}
	{{each(key,item) jsonArr}}
		<a href="/mjpn/store/store_list.do?storeName={{= item.en_name}}&best=Y">
		<div class="swiper">
			<ul class="swiper_wrap">
			{{if item.f_file6 != ""}}
				<li class="swiper_slide"><img src="{{= item.f_file6}}" alt=""></li>
			{{/if}}
			{{if item.f_file7 != ""}}
				<li class="swiper_slide"><img src="{{= item.f_file7}}" alt=""></li>
			{{/if}}
			{{if item.f_file8 != ""}}
				<li class="swiper_slide"><img src="{{= item.f_file8}}" alt=""></li>
			{{/if}}
			</ul>
			<div class="store">{{= item.en_name}}</div>
			<div class="swiper_btn_next"></div>
			<div class="swiper_btn_prev"></div>
			<div class="swiper_pagination"></div>
		</div>
		</a>
	{{/each}}
	{{/if}}
</script>
</body>
</html>