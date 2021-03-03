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
<style>
	.nav_cate_wrap{margin-bottom: 40px; text-align: center;}
	.nav_cate_wrap li{display: inline-block; padding: 5px;}
	.nav_cate_wrap li a{color: #666;}
	.nav_cate_wrap li.on{border-bottom: 2px solid #333;}
	.nav_cate_wrap li.on a{color: #333;}
</style>
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
		<div class="sub_visual sv2">
			<h3>메뉴소개</h3>
		</div>
		<!-- 상단비쥬얼 영역
			PHOMEIN   : class="sub_visual sv1"
			MENU	  : class="sub_visual sv2"
			STORE 	  : class="sub_visual sv3"
			COMMUNITY : class="sub_visual sv4"
			CS CENTER : class="sub_visual sv5"
			ETC 	  : class="sub_visual sv6"
		-->
		<!-- //sub visual -->

		<!-- lnb -->
		<%@ include file="/WEB-INF/jsp/mbrand/include/brandlnb.jsp"%>
		<!-- //lnb -->

		<!-- content -->
		<div id="content" class="menu">
			<ul class="nav_cate_wrap">
				<li class="nav_cate_btn on"><a href="/mbrand/menu/menu_list.do">포메인</a></li>
				<li class="nav_cate_btn"><a href="/mbrand/menu/red_menu_list.do">포메인레드</a></li>
			</ul>
			<input type="hidden" id="pageIndex" name="pageIndex" value="${pageIndex }"/>
			<div class="select_cate">
				<!-- 셀렉트 박스 -->
				<span class="selectbox">
					<label for="selCate">카테고리 선택</label>
					<select id="selCate">
						<option name="all" value="all" checked>전체</option>
						<option name="best_ck" value="best_ck">BEST</option>
						<option name="hot_ck" value="hot_ck">SPICY</option>
						<option name="new_ck" value="new_ck">NEW</option>
					</select>
				</span>
				<!-- //셀렉트 박스 -->
			</div>

			<!-- 리스트 영역 -->
			<div class="list_area">
				<!-- 카테고리 메뉴 -->
				<div class="nav_cate swiper">
					<ul class="nav_cate_wrap">
						<li class="nav_cate_btn on"><a href="javascript:;" name="menu_ck" data-code="all">전체</a></li>
						<c:forEach items="${krcodes }" var="result" varStatus="status">
							<li class="nav_cate_btn"><a href="javascript:;" name="menu_ck" data-code="${result.code }">${result.name }</a></li>
						</c:forEach>
					</ul>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
 				</div>
				<!-- //카테고리 메뉴 -->
				<!-- 리스트  -->
				<ul class="list_menu">
					<c:choose>
						<c:when test="${not empty resultList }" >
						<c:forEach items="${resultList }" var="result" varStatus="status" >
							<li>
								<a href="/mbrand/menu/menu_view.do?seq=${result.seq }" class="link_thum_list">
									<span class="thum">
										<img src="${result.f_file1 }" alt="">
										<span class="flag_group">
											<c:if test="${result.best_ck == 'Y' }"><span class="flag best"><span class="blind">BEST</span></span></c:if>
											<c:if test="${result.new_ck == 'Y' }"><span class="flag new"><span class="blind">NEW</span></span></c:if>
											<c:if test="${result.hot_ck == 'Y' }"><span class="flag spicy"><span class="blind">SPICY</span></span></c:if>
										</span>
									</span>
									<span class="txt">
										<span class="tit">${result.kr_name }</span>
										<span class="tit_en">${result.en_name }</span>
									</span>
								</a>
		 					</li>
		 				</c:forEach>
							<li class="tackout" style="margin:0 0 0 0;">
								<div class="img"><img src="/brand/images/menu/tackout_service_1000x1000_red.png" alt=""/></div>
							</li>
		 				</c:when>
						<c:otherwise>
							<!-- 20190220 수정 -->
							<li class="no_result">
								<p>검색된 메뉴가 없습니다.</p>
							</li>
							<!-- //20190220 수정 -->
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- //리스트 -->
				<c:if test="${totalRecordCount > pageIndex * 6}">
					<!-- 버튼 영역 -->
					<div class="btn_area">
						<button type="button" id="moreBtn" class="btn_tyf c_white btn_more">더보기</button>
					</div>
					<!-- //버튼 영역 -->
				</c:if>
			</div>
			<!-- //리스트 영역 -->

		</div>
		<!-- //content -->

	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">

//20190219 추가 (common.js 에서는 삭제)
//카테고리 메뉴
$(function(){
	cateNav();
});

// 더보기
$("#moreBtn").on("click", function(){
	$("#pageIndex").val(parseInt($("#pageIndex").val()) + 1);
	makeMenuList('more');
});

$("select[id='selCate']").on("change", function(){
	$("#pageIndex").val(1);
	makeMenuList();
});

$("a[name='menu_ck']").on("click", function(){
	$(".nav_cate_btn").removeClass('on');
	$(this).parent('li').addClass('on');

	$("#pageIndex").val(1);
	makeMenuList();
});

function makeMenuList(flag) {
	var best_ck = "N";

	if($("select[id='selCate'] option:selected").val() == 'best_ck') {
		best_ck = "Y";
	}

	var hot_ck = "N";

	if($("select[id='selCate'] option:selected").val() == 'hot_ck') {
		hot_ck = "Y";
	}

	var new_ck = "N";

	if($("select[id='selCate'] option:selected").val() == 'new_ck') {
		new_ck = "Y";
	}
	var menu_ck_arr = new Array();

	$(".nav_cate_btn").each(function(){
		var $this = $(this);
		if($this.hasClass('on')) {
			if($this.children('a').data('code') == 'all') {
				$("a[name='menu_ck']").each(function(){
					if($(this).data('code') != 'all') {
						menu_ck_arr.push($(this).data('code'));
					}
				});
			} else {
				menu_ck_arr.push($this.children('a').data('code'));
			}
		}
	});
	var all_ck = "N";

	if($("select[id='selCate'] option:selected").val() == 'all') {
		$(".nav_cate_btn").each(function(){
			var $this = $(this);
			if($this.hasClass('on')) {
				if($this.children('a').data('code') == 'all') {
					all_ck = "Y";
				}
			}
		});
	}

	$.ajax({
     	url: "/mbrand/menu/get_menu_list_ajax.do",
        type: "POST",
        data: {
            'pageIndex' : $("#pageIndex").val(),
        	'best_ck' : best_ck,
        	'hot_ck' : hot_ck,
        	'new_ck' : new_ck,
            'menu_ck' : menu_ck_arr,
            'all_ck' : all_ck
        },
        dataType: 'json',
        success: function (data) {
        	var tmplVal = new Object();
    	    tmplVal.jsonArr = data.result;
    	    tmplVal.jsonArr.pageIndex = data.pageIndex;
    	    tmplVal.jsonArr.searchTotalCnt = data.searchTotalCnt;
    	    if(!!flag) {
    	    	$(".list_menu").append($("#menuListTmpl").tmpl(tmplVal));
    	    } else {
    	    	if(data.searchTotalCnt > 0) {
    	    		$(".list_menu").html($("#menuListTmpl").tmpl(tmplVal));
    	    	} else {
    	    		$(".list_menu").html($("#noResultMenuListTmpl").tmpl(tmplVal));
    	    	}
    	    }
    		if(data.searchTotalCnt <= data.pageIndex * 6) {
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
}
</script>
<script id="menuListTmpl" type="text/x-tmpl">
	{{if jsonArr.length > 0}}
	{{each(key,item) jsonArr}}
		<li>
			<a href="/mbrand/menu/menu_view.do?pageIndex={{= item.pageIndex}}&seq={{= item.seq}}" class="link_thum_list">
				<span class="thum">
					<img src="{{= item.f_file1}}" alt="">
					<span class="flag_group">
						{{if item.best_ck == "Y"}}
							<span class="flag best"><span class="blind">BEST</span></span>
						{{/if}}
						{{if item.new_ck == "Y"}}
							<span class="flag new"><span class="blind">NEW</span></span>
						{{/if}}
						{{if item.hot_ck == "Y"}}
							<span class="flag spicy"><span class="blind">SPICY</span></span>
						{{/if}}
					</span>
				</span>
				<span class="txt">
					<span class="tit">{{= item.kr_name}}</span>
					<span class="tit_en">{{= item.en_name}}</span>
				</span>
			</a>
 		</li>
	{{/each}}
	{{/if}}
	{{if jsonArr.length == 0}}
		<div class="no_result">
			검색된 메뉴가 없습니다.
		</div>
	{{/if}}
</script>
<script id="noResultMenuListTmpl" type="text/x-tmpl">
	{{if jsonArr.length == 0}}
		<div class="no_result">
			검색된 메뉴가 없습니다.
		</div>
	{{/if}}
</script>
</body>
</html>
