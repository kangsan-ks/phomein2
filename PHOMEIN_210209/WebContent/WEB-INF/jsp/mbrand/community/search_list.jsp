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
<style>
	.lnb{display:none;}
</style>
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
		<div class="sub_visual sv4">
			<h3>통합검색</h3>
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
		<div id="content" class="menu search_list list_area">
			<ul class="nav_cate_wrap">
				<li class="nav_cate_btn">
					<a href="javascript: void(0);" id="board_all" class="search_tabs">통합검색</a>
				</li>
				<li class="nav_cate_btn">
					<a href="javascript: void(0);" id="board_menu" class="search_tabs">메뉴</a>
				</li>
				<li class="nav_cate_btn">
					<a href="javascript: void(0);" id="board_sns" class="search_tabs">SNS</a>
				</li>
				<li class="nav_cate_btn on">
					<a href="javascript: void(0);" id="board_notice" class="search_tabs">공지 & 언론보도</a>
				</li>
			</ul>
			
			<!-- //page-tab -->
			<div class="sch-filter">
				<div class="sch-input">
					<form id="searchForm" name="searchForm" method="post" action="/brand/community/search_list.do">
						<input type="hidden" id="boardType" name="boardType" value="${searchVO.boardType}"/>
						<input type="hidden" id="cate" name="cate" value="${searchVO.cate}"/>
						<input type="hidden" id="event_progress" name="event_progress" value="${searchVO.event_progress}"/>
						<input type="hidden" id="searchCondition" name="searchCondition" value="2"/>
						<input type="hidden" id="searchKeyword" name="searchKeyword" value=""/>
						<input type="hidden" id="front" name="front" value="Y"/>
						<div class="list_search">
						
							<!-- //셀렉트 박스 -->
							<div class="search_input">
								<input type="text" id="searchKeywordTemp" name="searchKeywordTemp" value="" class="text" placeholder="검색어를 입력하세요" title="검색어">
								<button type="button" onclick="searchBtn();" class="btn_search"><span class="blind">검색</span></button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="search_list_box">
				<div class="board_list board_menu">
					<h3>메뉴</h3>
					<div class="more_box"><a href="/brand/menu/menu_list.do" target="_blank">더보기</a></div>
					<ul>
						<li>
							<div class="left">
								<img src="/upload/sns/board/20210208/20210208131215413014.jpg" alt="" />
							</div>
							<div class="right">
								<p class="item_title">제목입니다.</p>
								<p class="date">2020.01.01</p>
								<div class="contents">
									<p class="tx_ec2">
										서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.
									</p>
									<a href="" target="_blank">http://localhost:8080/brand/menu/menu_list.do</a>
								</div>
							</div>
						</li>
						<li>
							<div class="left">
								<img src="/upload/sns/board/20210208/20210208131215413014.jpg" alt="" />
							</div>
							<div class="right">
								<p class="item_title">제목입니다.</p>
								<p class="date">2020.01.01</p>
								<div class="contents">
									<p class="tx_ec2">
										서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.
									</p>
									<a href="" target="_blank">http://localhost:8080/brand/menu/menu_list.do</a>
								</div>
							</div>
						</li>
						<li>
							<div class="left">
								<img src="/upload/sns/board/20210208/20210208131215413014.jpg" alt="" />
							</div>
							<div class="right">
								<p class="item_title">제목입니다.</p>
								<p class="date">2020.01.01</p>
								<div class="contents">
									<p class="tx_ec2">
										서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.
									</p>
									<a href="" target="_blank">http://localhost:8080/brand/menu/menu_list.do</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="board_list board_sns">
					<h3>SNS</h3>
					<div class="more_box"><a href="/brand/community/sns/community_list.do?cate=109203" target="_blank">더보기</a></div>
					<ul>
						<li>
							<p class="no_data">검색 결과가 없습니다.</p>
						</li>
					</ul>
				</div>
				<div class="board_list board_notice">
					<h3>공지 & 언론보도</h3>
					<div class="more_box"><a href="/brand/community/notice/community_list.do" target="_blank">더보기</a></div>
					<ul>
						<li>
							<div class="left">
								<img src="/upload/sns/board/20210208/20210208131215413014.jpg" alt="" />
							</div>
							<div class="right">
								<p class="item_title">제목입니다.</p>
								<p class="date">2020.01.01</p>
								
								<div class="contents">
									<p class="tx_ec2">
										서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.서브 내용입니다.
									</p>
									<a href="" target="_blank">http://localhost:8080/brand/menu/menu_list.do</a>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
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
	$('.search_tabs').click(function(){
		var tab_id = $(this).attr('id');
		$('.search_tabs').removeClass('on');
		$(this).addClass('on');
		
		if(tab_id == 'board_all'){
			$('.board_list').show();
		}else{
			$('.board_list').hide();
			$('.'+tab_id).show();
		}
	});
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
</body>
</html>
