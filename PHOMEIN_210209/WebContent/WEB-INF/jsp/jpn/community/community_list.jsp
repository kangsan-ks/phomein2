<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title><c:if test="${searchVO.boardType == 'notice'}">공지 & 언론보도 리스트</c:if><c:if test="${searchVO.boardType == 'event'}"> EVENT</c:if><c:if test="${searchVO.boardType == 'sns'}"> SNS</c:if> | Community | 포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>
<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
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

		<c:if test="${searchVO.boardType == 'notice'}">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual" style="background-image:url('/jpn/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">공지 & 언론보도</h2>
				<!-- <span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span> -->
			</div>
			<!-- //page-title -->
		</c:if>
		<c:if test="${searchVO.boardType == 'event'}">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual" style="background-image:url('/jpn/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">EVENT</h2>
				<!-- <span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span> -->
			</div>
			<!-- //page-title -->
		</c:if>
		<c:if test="${searchVO.boardType == 'sns'}">
			<!-- page-title -->
			<div class="page-title">
				<div class="visual open" style="background-image:url('/jpn/images/content/sub_visual_04.jpg');"></div>
				<h2 class="h2-type">SNS</h2>
				<!-- <span class="txt">함께하는 분들에게 조금 더 가까이, 포메인은 늘 소통합니다.</span> -->
			</div>
			<!-- //page-title -->
		</c:if>

		<!-- location-menu -->
		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>
		<!-- //location-menu -->

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">
				<!-- page-tab -->
				<div class="page-tab">
					<form id="searchForm" name="searchForm" method="post" action="/jpn/community/${searchVO.boardType}/community_list.do">
						<input type="hidden" id="boardType" name="boardType" value="${searchVO.boardType}"/>
						<input type="hidden" id="cate" name="cate" value="${searchVO.cate}"/>
						<input type="hidden" id="event_progress" name="event_progress" value="${searchVO.event_progress}"/>
						<input type="hidden" id="searchCondition" name="searchCondition" value="2"/>
						<input type="hidden" id="searchKeyword" name="searchKeyword" value=""/>
						<input type="hidden" id="front" name="front" value="Y"/>
					</form>
					
					<c:if test="${searchVO.boardType == 'notice'}">
						<ul>
							<li <c:if test="${searchVO.cate == ''}"> class=actived </c:if> ><a href="/jpn/community/notice/community_list.do">ALL</a></li>
							<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
								<c:if test="${codeResult.code != '107202'}">
	                      			<li <c:if test="${searchVO.cate == codeResult.code}"> class='actived' </c:if> ><a href="/jpn/community/notice/community_list.do?cate=${codeResult.code}"><c:out value="${codeResult.name}"/></a></li>
	                      		</c:if>
	                      	</c:forEach>
						</ul>
					</c:if>
					<c:if test="${searchVO.boardType == 'event'}">
						<ul>
							<li <c:if test="${searchVO.event_progress == ''}"> class=actived </c:if> ><a href="/jpn/community/event/community_list.do">전체</a></li>
							<li <c:if test="${searchVO.event_progress == 'P'}"> class='actived' </c:if> ><a href="/jpn/community/event/community_list.do?event_progress=P">진행중 이벤트</a></li>
							<li <c:if test="${searchVO.event_progress == 'E'}"> class='actived' </c:if> ><a href="/jpn/community/event/community_list.do?event_progress=E">종료된 이벤트</a></li>
						</ul>
					</c:if>
					<c:if test="${searchVO.boardType == 'sns'}">
						<ul>
							<li <c:if test="${searchVO.cate == ''}"> class=actived </c:if> ><a href="/jpn/community/sns/community_list.do">ALL</a></li>
							<c:forEach var="codeResult" items="${ fnc:codeListSub('109') }" varStatus="status">
								<c:if test="${codeResult.code == '109203'}">
	                      			<li <c:if test="${searchVO.cate == codeResult.code}"> class='actived' </c:if> ><a href="/jpn/community/sns/community_list.do?cate=${codeResult.code}"><c:out value="${codeResult.name}"/></a></li>
	                      		</c:if>
	                      	</c:forEach>
						</ul>
					</c:if>
				</div>
				<!-- //page-tab -->

				<!-- media-list -->
				<c:if test="${searchVO.boardType == 'notice'}">
					<input type="hidden" id="noticeIndex" name="noticeIndex" value="${currentPage}"/>
					<div class="media-list">
						<!-- sch-filter -->
						<div class="sch-filter">
							<div class="sch-input">
								<fieldset>
									<legend>검색 폼</legend>
									<input type="text" id="searchKeywordTemp" name="searchKeywordTemp" value="${searchVO.searchKeyword }" placeholder="검색어를 입력해주세요." style="width:580px">
									<button type="button" class="btn" onclick="searchBtn();"><span>검색</span></button>
								</fieldset>
							</div>
						</div>
						<!-- //sch-filter -->
						<!-- img-board-list -->
						<div class="img-board-list">
							<ul id="noticeUl">
								<c:choose>
									<c:when test="${not empty resultList }" >
										<c:forEach items="${resultList }" var="result" varStatus="status" >
											<li>
												<p class="img"><a href="javascript:void(0);" onclick="javascript:fnDetailView('/jpn/community/${searchVO.boardType}/community_view.do', <c:out value="${result.seq }" />); return false;"><img src="${result.pc_thimg }" alt="${result.pc_alt}"/></a></p>
												<c:if test="${result.topview == 'Y'}">
													<p class="ico-not"><span>알림</span></p>
												</c:if>
												<p class="ico-stamp">
													<span>
														<c:forEach var="codeResult" items="${ fnc:codeListSub('107') }" varStatus="status">
								                      		<c:if test="${result.cate == codeResult.code}">${codeResult.name}</c:if>
								                      	</c:forEach>
													</span>
												</p>
												<p class="tit"><a href="javascript:void(0);" onclick="javascript:fnDetailView('/jpn/community/${searchVO.boardType}/community_view.do', <c:out value="${result.seq }" />); return false;">
												 ${fnc:xssContents(result.title )} <c:if test="${result.newYn == 'Y'}"><span class="new">new</span></c:if></a></p>
												<p class="txt"><c:out value="${result.stitle }"/></p>
												<p class="date">
													<fmt:parseDate value="${result.regdt}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
													<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd' var="regDttmp"/>
													<fmt:formatDate value="${regDt}" pattern='HH:mm:ss' var="regTime"/>
													<c:out value="${regDttmp }" />
												</p>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
									<!-- //공지가 없을때  -->
									<li class="no-con">
										<p>등록된 내용이 없습니다.</p>
									</li>
									<!-- 공지가 없을때//  -->
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- //img-board-list -->
						<!-- btn-box -->
						<c:if test="${ currentPage lt lastPage  }">
							<div class="btn-box mt10" id="noticeMoreDiv">
								<a href="javascript:void(0);" onclick="selectNoticeMore();" class="btn-02 type-03 btn-plus">더보기 +</a>
							</div>
						</c:if>
						<!-- //btn-box -->
					</div>
				</c:if>
				<!-- //media-list -->
				
				<c:if test="${searchVO.boardType == 'event'}">
					<input type="hidden" id="eventIndex" name="eventIndex" value="${currentPage}"/>
					<div class="event-list">
						<!-- img-board-list -->
						<div class="img-board-list">
							<ul id="eventUl">
								<c:choose>
									<c:when test="${not empty resultList }" >
										<c:forEach items="${resultList }" var="result" varStatus="status" >
											<li>
												<p class="img"><a href="javascript:void(0);" onclick="javascript:fnDetailView('/jpn/community/${searchVO.boardType}/community_view.do', <c:out value="${result.seq }" />); return false;"><img alt="" src="${result.pc_thimg }"></a></p>
												<p class="ico-stamp">
												<span>
													<c:if test="${result.cate == '108201'}">
														${result.store }
													</c:if>
													<c:if test="${result.cate == '108202'}">
														공식
													</c:if>
												</span></p>
												<p class="ico-proceed"><span><c:if test="${result.event_progress == 'P' }">진행중</c:if></span></p>
												<p class="ico-closed"><span><c:if test="${result.event_progress == 'E' }">마감</c:if></span></p>
												<p class="tit"><a href="javascript:void(0);" onclick="javascript:fnDetailView('/jpn/community/${searchVO.boardType}/community_view.do', <c:out value="${result.seq }" />); return false;">
												${fnc:xssContents(result.title )} <c:if test="${result.newYn == 'Y'}"><span class="new">new</span></c:if></a></p>
												<p class="txt"><c:out value="${result.stitle }"/></p>
												<p class="date"><c:out value="${result.startdt }" /> ~ <c:out value="${result.enddt }" /></p>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
									<!-- //진행중인 이벤트가 없을때  -->
									<li class="no-con">
										<p>등록된 이벤트가 없습니다.</p>
									</li>
									<!-- 진행중인 이벤트가 없을때//  -->
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- //img-board-list -->
	
						<!-- btn-box -->
						<c:if test="${ currentPage lt lastPage  }">
							<div class="btn-box mt10" id="eventMoreDiv">
								<a class="btn-02 type-03 btn-plus" href="javascript:void(0);" onclick="selectEventMore();">더보기 <span id="moreSpan">${ currentPage } / ${ lastPage }</span></a>
							</div>
						</c:if>
						<!-- //btn-box -->
					</div>
				</c:if>
				
				<c:if test="${searchVO.boardType == 'sns'}">
					<input type="hidden" id="snsIndex" name="snsIndex" value="${currentPage}"/>
					<div class="sns-list">
						<!-- img-board-list -->
						<div class="img-board-list type02">
							<ul id="snsUl">
								<c:choose>
									<c:when test="${not empty resultList }" >
										<c:forEach items="${resultList }" var="result" varStatus="status" >
											<li class=<c:if test="${result.cate == '109201' }">"ico-f"</c:if><c:if test="${result.cate == '109202' }">"ico-b"</c:if><c:if test="${result.cate == '109203' }">"ico-i"</c:if> >
												<p class="img"><img alt="" src="${result.pc_thimg }"></p>
												<a href="${result.url}" target="_blank">
													<span class="icon"></span>
													<span class="txt">${fnc:xssContents(result.title )}</span>
												</a>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
									<!-- //게시글이 없을때  -->
									<li class="no-con">
										<p>登録された文がありません。</p>
									</li>
									<!-- 게시글이 없을때//  -->
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- //img-board-list -->
						<!-- btn-box -->
						<c:if test="${ currentPage lt lastPage  }">
							<div class="btn-box mt80" id="snsMoreDiv">
								<a class="btn-02 type-03 btn-plus" href="javascript:void(0);" onclick="selectSnsMore();">もっと見る +</a>
							</div>
						</c:if>
						<!-- //btn-box -->
					</div>
				</c:if>
			</div>
		</div>
		<!-- //contents -->
	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="/jpn/common/js/front_ui.js"></script>
<script>
	$(function(){
		
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
	     	url: "/jpn/community/"+boardType+"/selectCommunityList.do",
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
						$html += '<p class="img"><a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/jpn/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;"><img src="'+data.resultList[key].pc_thimg+'" alt=""/></a></p>';
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
						$html += '<a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/jpn/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;">';
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
	     	url: "/jpn/community/"+boardType+"/selectCommunityList.do",
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
						$html += '<p class="img"><a href="javascript:void(0);" onclick="javascript:fnDetailView(\'/jpn/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;"><img alt="" src="'+data.resultList[key].pc_thimg+'"></a></p>';
						$html += '<p class="ico-stamp"><span>';
						if(data.resultList[key].cate == '108201'){
							$html += data.resultList[key].store;
						}else{
							$html += '공식';
						}
						
						$html += '</span></p>';
						$html += '<p class="ico-proceed"><span>';
						if(data.resultList[key].event_progress == 'P'){
							$html += '진행중';
						}else if(data.resultList[key].event_progress == 'E'){
							$html += '마감';
						}
						$html += '</span></p>';
						$html += '<p class="tit"><a href=\"javascript:void(0);\" onclick=\"javascript:fnDetailView(\'/jpn/community/'+data.resultList[key].board_type+'/community_view.do\', \''+data.resultList[key].seq+'\' ); return false;">';
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
	     	url: "/jpn/community/"+boardType+"/selectCommunityList.do",
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


