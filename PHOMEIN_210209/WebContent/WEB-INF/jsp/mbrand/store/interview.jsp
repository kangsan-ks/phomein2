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
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandgnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv3">
			<h3>우수매장 인터뷰</h3>
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
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="franchisee">
			<input type="hidden" name="pageIndex" id="pageIndex" value="${pageIndex }" />
			<div class="interview">
				<div class="tit_area">
					<p class="tit">PHOMEIN BEST STORE</p>
					<p class="desc">
						가장 가까운 곳에서 점주님들의
						이야기를 듣고 신뢰로 함께 성장합니다.
					</p>
				</div>
				<div class="content">
					<h5>우수 매장 인증제도</h5>
					<p class="txt">	
						포메인의 ‘안전한 식재료·정직한 먹거리’<br>
						원칙 실현 기여도 외 연간 기준별 고득점을<br>
						획득한 매장을 대상으로 선정
					</p>
					<c:choose>
						<c:when test="${not empty resultList }" >
						<div class="store_list">
							<ul id="store_ul">
								<c:forEach items="${resultList }" var="result" varStatus="status" >
								<li>
									<a href="#none" class="link" onclick="layerOpen('layerInterview_${result.seq }');"><!-- 레이어 팝업 띄우기 : layerOpen('Id') -->
										<img src="${result.m_thimg }" alt="${result.m_alt }">
										<span class="name">
											<strong>${result.store }</strong>
											<em>${result.title }</em>
										</span>
									</a>
								</li>
								</c:forEach>
							</ul>
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
		</div>
		<!-- //content -->
	</div> 
	<!-- //container -->
	
	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->
	
	<!-- layer popup -->
	<div class="dim"></div>
	
	<c:forEach items="${resultList }" var="result" varStatus="status" >
		<!-- 우수매장 인터뷰 상세 -->
		<div id="layerInterview_${result.seq }" class="layer_pop">
			<div class="head">
				<h4>인터뷰</h4>
			</div>
			<div class="cont">
				<div class="interview_con">
					<strong>${result.title }</strong>
					<em>${result.name }</em>
					<p>
						${result.m_contents }
					</p>
				</div>
			</div>
			<button type="button" class="btn_close" onclick="layerClose('layerInterview_${result.seq }');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
		</div>
		<!-- //우수매장 인터뷰 상세 -->
	</c:forEach>
	<!-- //layer popup -->
	
</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">
$(".interview_con").each(function(){
	$(this).append($(this).find(".cont").val());
});
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
     	url: "/mcompany/franchisee/get_interview_list_ajax.do",
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
    	    $("#store_ul").append($("#interviewListTmpl").tmpl(tmplVal));
    	    $("#wrap").append($("#interviewLayerTmpl").tmpl(tmplVal));
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
<script id="interviewListTmpl" type="text/x-tmpl">
	{{if jsonArr.length > 0}}
	{{each(key,item) jsonArr}}
		<li>
			<a href="#none" class="link" onclick="layerOpen('layerInterview_{{= item.seq}}');"><!-- 레이어 팝업 띄우기 : layerOpen('Id') -->
				<img src="{{= item.m_thimg}}" alt="{{= item.m_alt}}">
				<span class="name">
					<strong>{{= item.title}}</strong>
					<em>{{= item.name}}</em>
				</span>
			</a>
		</li>
	{{/each}}
	{{/if}}
</script>
<script id="interviewLayerTmpl" type="text/x-tmpl">
	{{if jsonArr.length > 0}}
	{{each(key,item) jsonArr}}
		<div id="layerInterview_{{= item.seq}}" class="layer_pop">
			<div class="head">
				<h4>인터뷰</h4>
			</div>
			<div class="cont">
				<div class="interview_con">
					<strong>{{= item.title}}</strong>
					<em>{{= item.name}}</em>
					<p>
						{{= item.m_contents}}
					</p>
				</div>
			</div>
			<button type="button" class="btn_close" onclick="layerClose('layerInterview_{{= item.seq}}');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
		</div>
	{{/each}}
	{{/if}}
</script>
</body>
</html>
