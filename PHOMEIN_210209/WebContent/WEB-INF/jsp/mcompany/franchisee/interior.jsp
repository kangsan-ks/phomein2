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
<div id="wrap">
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
		<!-- sub visual -->
		<div class="sub_visual sv3">
			<h3>인테리어</h3>
		</div>
		<!-- 상단비쥬얼 영역
			회사소개	: class="sub_visual sv1"
			연구개발	: class="sub_visual sv2"
			가맹개설정보 : class="sub_visual sv3"
			사회공헌 	: class="sub_visual sv4"
			POLICY	   : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mcompany/include/companylnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="franchisee">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
			<div class="interior">
				<div class="tit_area">
					<h4>Modern &amp; Minimal</h4>
					<p class="desc">
					포메인은 불필요한 요소를 최소화하여 간결하고<br>
					깔끔한 느낌의 공간을 추구하며, 밝고 따뜻한 컬러의 사용으로 식사 시 편안한 분위기를 조성합니다.
					</p>
				</div>
				<c:choose>
					<c:when test="${not empty resultList }" >
					<div class="store_list">
						<c:forEach items="${resultList }" var="result" varStatus="status" >
							<div class="swiper">
								<ul class="swiper_wrap">
										<c:if test="${not empty result.f_file6 }"><li class="swiper_slide"><img src="${result.f_file6 }" alt=""></li></c:if>
										<c:if test="${not empty result.f_file7 }"><li class="swiper_slide"><img src="${result.f_file7 }" alt=""></li></c:if>
										<c:if test="${not empty result.f_file8 }"><li class="swiper_slide"><img src="${result.f_file8 }" alt=""></li></c:if>
								</ul>
								<div class="store">${result.name }</div>
								<div class="swiper_btn_next"></div>
								<div class="swiper_btn_prev"></div>
								<div class="swiper_pagination"></div>
							</div>
						</c:forEach>
					</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
				<c:if test="${totalRecordCount > pageIndex * 3}">
					<!-- 버튼 영역 -->
					<div class="btn_area">
						<button type="button" id="moreBtn" class="btn_tyf c_white btn_more">더보기</button>
					</div>
					<!-- //버튼 영역 -->
				</c:if>
			</div>
		</div>
		<!-- //content -->
	</div> 
	<!-- //container -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyfooter.jsp"%>
	<!-- //footer -->
	
</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">
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
     	url: "/mcompany/franchisee/get_interior_list_ajax.do",
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
			<div class="store">{{= item.name}}</div>
			<div class="swiper_btn_next"></div>
			<div class="swiper_btn_prev"></div>
			<div class="swiper_pagination"></div>
		</div>
	{{/each}}
	{{/if}}
</script>
</body>
</html>
