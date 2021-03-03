<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title><c:if test="${searchVO.boardType == 'notice'}">공지 & 언론보도 리스트</c:if><c:if test="${searchVO.boardType == 'event'}"> EVENT</c:if><c:if test="${searchVO.boardType == 'sns'}"> SNS</c:if> | Community | 포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>
<style>
	.location-menu{display:none;}
</style>
<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandheader.jsp"%>
	<!--// dHead -->
	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="community">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual" style="background-image:url('/brand/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">통합검색</h2>
				<!-- <span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span> -->
			</div>

		<!-- location-menu -->
		<%@ include file="/WEB-INF/jsp/brand/include/brandMenuHead.jsp"%>
		<!-- //location-menu -->

		<!-- contents -->
		<div id="contents" class="content search_list">
			<div class="inner">
				<!-- page-tab -->
				<div class="page-tab">
					<ul>
						<li>
							<a href="javascript: void(0);" id="board_all" class="search_tabs">통합검색</a>
						</li>
						<li>
							<a href="javascript: void(0);" id="board_menu" class="search_tabs">메뉴</a>
						</li>
						<li>
							<a href="javascript: void(0);" id="board_sns" class="search_tabs">SNS</a>
						</li>
						<li class="actived">
							<a href="javascript: void(0);" id="board_notice" class="search_tabs">공지 & 언론보도</a>
						</li>
					</ul>
				</div>
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
							<fieldset>
								<legend>검색 폼</legend>
								<input type="text" id="searchKeywordTemp" name="searchKeywordTemp" value="${searchVO.searchKeyword }" placeholder="검색어를 입력해주세요." style="width:580px">
								<button type="button" class="btn" onclick="searchBtn();"><span>검색</span></button>
							</fieldset>
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
		</div>
		<!-- //contents -->
	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인, 매장찾기 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->
	
	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="/brand/common/js/front_ui.js"></script>
<script>
	$(function(){
		$('.search_tabs').click(function(){
			var tab_id = $(this).attr('id');
			$('.search_tabs').removeClass('actived');
			$(this).addClass('actived');
			
			if(tab_id == 'board_all'){
				$('.board_list').show();
			}else{
				$('.board_list').hide();
				$('.'+tab_id).show();
			}
		});
	});
	
	function searchBtn(){
		var searchKeyWordTemp = $("#searchKeywordTemp").val();
		$("#searchKeyword").val(searchKeyWordTemp);
		searchForm.submit();
	}
	
	function selectNoticeMore(){
		var pageIndex = Number($("#noticeIndex").val())+1;
		var boardType = $("#boardType").val();
		var searchKeyword = $("#searchKeywordTemp").val();
		var cate = $("#cate").val();
		
		$.ajax({
	     	url: "/brand/community/"+boardType+"/selectCommunityList.do",
	        type: "POST",
	        data: {
	        	'pageIndex' : pageIndex,
	        	'boardType' : boardType,
	        	'searchKeyword' : searchKeyword,
	        	'cate' : cate
	        },
	        dataType: 'json',
	        success: function (data) {
	        	
	        	var $html = "";
	    	    if(data.resultList.length > 0) {
					$.each(data.resultList, function(key, index){
						$html = '';
						$html += '<li>';
						$html += '<p class="img"><a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/brand/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;"><img src="'+data.resultList[key].pc_thimg+'" alt=""/></a></p>';
						if(data.resultList[key].topview == 'Y'){
							$html += '<p class="ico-not"><span>알림</span></p>';
						}
						$html += '<p class="ico-stamp">';
						$html += '<span>';
						if(data.resultList[key].cate == '107201'){
							$html += '공지';
						}else if(data.resultList[key].cate == '107202'){
							$html += '뉴스';
						}else if(data.resultList[key].cate == '107203'){
							$html += '언론보도';
						}
						$html += '</span>';
						$html += '</p>';
						$html += '<p class="tit">';
						$html += '<a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/brand/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;">';
						$html += data.resultList[key].title+'';
						if(data.resultList[key].newYn == 'Y'){
							$html += ' <span class="new">new</span>';
						}
						$html += '</a></p>';
						$html += '<p class="txt">'+data.resultList[key].stitle+'</p>';
						$html += '<p class="date">';
						$html += data.resultList[key].regdtTmp;
						$html += '</p>';
						$html += '</li>';
						
						console.info($html);
						
						$('#noticeUl').append($html);
	    			});
				}
	    	    $("#noticeIndex").val(data.currentPage);
	    	    
	    	    if(data.lastPage <= data.currentPage){
	    	    	$("#noticeMoreDiv").hide();
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
		
		
	function selectEventMore(){
		var pageIndex = Number($("#eventIndex").val())+1;
		var boardType = $("#boardType").val();
		var event_progress = $("#event_progress").val();
		
		$.ajax({
	     	url: "/brand/community/"+boardType+"/selectCommunityList.do",
	        type: "POST",
	        data: {
	        	'pageIndex' : pageIndex,
	        	'boardType' : boardType,
	        	'event_progress' : event_progress
	        },
	        dataType: 'json',
	        success: function (data) {
	        	
	        	var $html = "";
	    	    if(data.resultList.length > 0) {
					$.each(data.resultList, function(key, index){
						
						$html = '';
						$html += '<li>';
						$html += '<p class="img"><a href="javascript:void(0);" onclick="javascript:fnDetailView(\'/brand/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;"><img alt="" src="'+data.resultList[key].pc_thimg+'"></a></p>';
						$html += '<p class="ico-stamp"><span>';
						if(data.resultList[key].cate == '108201'){
							$html += data.resultList[key].store;
						}else{
							$html += '공식';
						}
						
						$html += '</span></p>';
						if(data.resultList[key].event_progress == 'P'){
							$html += '<p class="ico-proceed"><span>';
							$html += '진행중';
							$html += '</span></p>';
						}else if(data.resultList[key].event_progress == 'E'){
							$html += '<p class="ico-closed"><span>';
							$html += '마감';
							$html += '</span></p>';
						}
						$html += '<p class="tit"><a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/brand/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;">';
						$html += data.resultList[key].title+'';
						if(data.resultList[key].newYn == 'Y'){
							$html += ' <span class="new">new</span>';
						}
						$html += '</a></p>';
						$html += '<p class="txt">'+data.resultList[key].stitle+'</p>';
						$html += '<p class="date">';
						$html += data.resultList[key].startdtTmp+' ~ '+data.resultList[key].enddtTmp;
						$html += '</p>';
						$html += '</li>';
						
						console.info($html);
						
						$('#eventUl').append($html);
	    			});
				}
	    	    $("#moreSpan").text(data.currentPage+' / '+data.lastPage)
    	    	$("#eventIndex").val(data.currentPage);
	    	    if(data.lastPage <= data.currentPage){
	    	    	$("#eventMoreDiv").hide();
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
	
	
	function selectSnsMore(){
		var pageIndex = Number($("#snsIndex").val())+1;
		var boardType = $("#boardType").val();
		var cate = $("#cate").val();
		
		$.ajax({
	     	url: "/brand/community/"+boardType+"/selectCommunityList.do",
	        type: "POST",
	        data: {
	        	'pageIndex' : pageIndex,
	        	'boardType' : boardType,
	        	'cate' : cate
	        },
	        dataType: 'json',
	        success: function (data) {
	        	
	        	var $html = "";
	    	    if(data.resultList.length > 0) {
					$.each(data.resultList, function(key, index){
						$html = '';
						$html += '<li class=';
						if(data.resultList[key].cate == '109201'){
							$html += 'ico-f';
						}else if(data.resultList[key].cate == '109202'){
							$html += 'ico-b';
						}else if(data.resultList[key].cate == '109203'){
							$html += 'ico-i';
						}
						$html += '>';
						$html += '<p class="img"><img alt="" src="'+data.resultList[key].pc_thimg+'"></p>'
						$html += '<a href="'+ data.resultList[key].url+'" target="_blank">';
						$html += '<span class="icon"></span>';
						$html += '<span class="txt">'+data.resultList[key].title+'</span>';
						$html += '</a>';
						$html += '</li>';
						$('#snsUl').append($html);
	    			});
				}
	    	    $("#snsIndex").val(data.currentPage);
	    	    
	    	    if(data.lastPage <= data.currentPage){
	    	    	$("#snsMoreDiv").hide();
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
	
	function fnDetailView(url , seq){
		location.href=url+'?seq='+seq;
	}
</script>
</body>
</html>


