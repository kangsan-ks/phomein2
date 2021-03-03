<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>		
<script>
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	var userInputId = getCookieVal("userInputId");
	$("input[name='userID']").val(userInputId); 
	
	if($("input[name='userID']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}
 
	$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			var userInputId = $("input[name='userID']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}else{ // ID 저장하기 체크 해제 시,
			setCookie("userInputId", "", -1);
		}
	});

	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	$("input[name='userID']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			var userInputId = $("input[name='userID']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}
	});
});

function fnLoginProc(){
	var params = "" ; 
	var userIDTmp = $('#userID').val();
	var passwordTmp = $('#pwd').val();
	
	if(userIDTmp == ""){
		alert("조이시티 아이디를 입력해주세요");
		return false;
	} else if (passwordTmp == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}  
	
	$.ajax({
		url:'https://www.joycity.com/login',
		type:'post',
		data: {userID: userIDTmp, password:passwordTmp},
		xhrFields: {
			withCredentials: true
		},
		error:function ( e ){	       
			console.log(e);
		},
		success:function ( data, e, a ){
			if( data.status == "1" ){
				console.log(data);
				fnCookietoSession();
			} else if( data.status == "-111" ){
				alert("회원 정보가 없습니다. 회원가입 후 이용해주세요.");
			} else if( data.status == "-114" ){
				alert("비밀번호가 정확하지 않습니다. 비밀번호를 확인해주세요.");
			} else if( data.status == "-115" ){
				alert("휴면 처리된 계정입니다. 고객센터에 문의해주세요.");
			} else if( data.status == "-116" ){
				alert("규제된 계정입니다. 고객센터에 문의해주세요.");
			} else if( data.status == "-117" ){
				alert("이미 탈퇴한 회원입니다. 재가입 후 이용해주세요.");
			} else if( data.status == "-118" ){
				alert("5회 이상 로그인 실패로 계정이 차단되었습니다. 고객센터에 문의해주세요.");
				location.href="https://www.joycity.com/user/userLoginRetry?returnURL="+location.href;
				return;
			} else {
				alert("서버 오류입니다. 고객센터에 문의해주세요.");
				console.log(data);
			}
		},
		complete:function(){       
		}       
	});
}

function fnCookietoSession(){
	$.ajax({  
		type: "post",
		url : "/web/membership/loginProc.do",
		dataType : "json", 
		cache:false,
		async:false,
		error:function ( e ){	    
			console.log(e);
		},
		success:function ( data, e, a ){
			console.log(data.result);
			location.href = '/web/main.do';
		},
		complete:function(){
		}               
	});         
}

function fnLogout(){
	// TODO-REAL 
	location.href = "https://www.joycity.com/logout?returnURL=fs2.joycity.com/web/membership/logout.do";
}

var USEYN = 'N';
function fnLauncherOnOff(){
		 $.ajax({  
			type: "post",
			url : "/web/launcherOnOff.do",
			dataType : "json", 
			cache:false,
			async:false,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			error:function ( e ){	    
				console.log(e);
			},
			success:function ( data, e, a ){
				if( data.result == "S" ){
					if(data.resultdata == null) {
						USEYN = 'N';
					} else if (data.resultdata == ''){
						USEYN = 'N';
					} else {
						USEYN = 'Y';
					}
					
					if(USEYN == 'Y'){
				    	if(data.alertText != ''){
				    		$('#alertText').val( decodeURIComponent( data.alertText ) );
				    		alert($('#alertText').val());
				    	} else {
				    		alert("점검중입니다.");
				    	}
					} else {
						fnSessionGUIDCheck();
					}
				} else if ( data.result == "171" ){
					console.log("JCC CNC 접근");
					fnSessionGUIDCheck();
				} else if ( data.result == "153" ){
					console.log("JCC CT 접근");
					fnSessionGUIDCheck();
				} else if ( data.result == "2" ){
					console.log("업무망 접근");
					fnSessionGUIDCheck();
				} else {
					console.log("서버 오류");
				}
			},
			complete:function(){
			}               
		});    
	
}

function fnGameStart(obj){
	 $.ajax({  
		type: "post",
		url : "/web/gameStart.do",
		dataType : "json", 
		cache:false,
		async:false,
		error:function ( e ){	    
			console.log(e);
		},
		success:function ( data, e, a ){
			if( data.result == "S" ){
				console.log(data.data);
				location.href = "freestyle2://Eval="+data.data+"&time="+obj;
			} else if( data.result == "loginError" ){
				alert("로그인 후 다운로드 가능합니다.");
			}
		},
		complete:function(){
		}               
	});    
}


function fnGmSelect(){
	$.ajax({
		// TODO-REAL 
		url:'https://member.joycity.com/game/time/check' ,
		type:'post',
		data: { memberID: $('#memberID').val() },
		dataType : "html", 
	/* 	xhrFields: {
			withCredentials: true
		},  */
		error:function ( e ){	       
			console.log(e);
		},
		success:function ( data, e, a ){
			if(data <= 0){
				/* console.log(data); */
				fnGameStart(data);
			} else if(data == 1) {
				alert("게임 시간 선택제 적용 시간입니다.");
				return;
			} else {
				fnGameStart(data);
				console.log("server error")
			}
		},
		complete:function(){       
		}       
	});
}

function fnSessionGUIDCheck(){
	if($('#memberID').val()== ''){
		alert("로그인 후 이용 가능합니다.");
		 return;
	}
	$.ajax({
		url:'https://member.joycity.com/game/session/check' ,
		type:'post',
		data: { memberID: $('#memberID').val(), sessionGUID: $('#sessionGUID').val() },
		dataType : "html", 
		error:function ( e ){	       
			console.log(e);
		},
		success:function ( data, e, a ){
			console.log(data); 
			if(data != 0){
				alert("세션 정보가 일치하지 않습니다. 다시 로그인 후 게임을 시작해주세요");
				fnLogout();
				return;
			} else {
				fnGmSelect();
			}
		},
		complete:function(){       
		}       
	});
}
</script>
		<input type="hidden" value="${userSession.memberID}" id="memberID" />
		<input type="hidden" value="${userSession.sessionGUID}" id="sessionGUID" />
		<input type="hidden" value="${launcherOnOff[0].CONTENT}" id="alertText" />
		
		<c:set var="nowUrl">${requestScope['javax.servlet.forward.request_uri']}</c:set>
			<!-- top-info-box -->
			
			<c:choose>
				<c:when test="${fn:indexOf(nowUrl, 'main' ) lt 0 }">
				<div class="top-info-box "><!-- type-sub -->
					<div class="left-area">
						<!-- game-start -->
						<div class="game-start"  id="id_game_start">
							<a href="#" 
								<c:choose>
									<c:when test="${userSession.memberID eq null || userSession.memberID eq '' }"> onclick="alert('로그인 후 이용 가능합니다.'); return false;" </c:when>
									<c:otherwise> onclick="fnLauncherOnOff(); return false;" </c:otherwise>
								</c:choose>
								class="btn_nowDownload"><img src="/web/images/btn/btn_game_start.jpg" alt="game start">
							</a>
						</div>
						<div class="nowDownload">
							<a href="#" class="nowClose"><img src="/web/images/btn/close.png" alt="close"></a>
							<div class="nowDownload_text">
							게임 실행이 되지 않을 경우<br>
							지금설치를 눌러 프리스타일2<br>
							웹스타트런처를 설치하세요!
							</div>
							<a href="http://fs2-cf.joycityglobal.com/FS2/Game/ASIA_SEOUL/Plugin/FS2KOR_Plugin.exe" download class="nowDown"><img src="/web/images/btn/nowDownload.png" alt="now download"></a>
						</div>
						<!-- //game-start -->
						<!-- tab-board-wrap -->
						<div class="tab-board-wrap">
							<div class="tab-area">
								<ul class="tab-type02">
									<li class="active"><a href="#">공지 &amp; 업데이트</a></li>
									<li><a href="#">자유게시판 BEST</a></li>
								</ul>
							</div>
							<div class="con-area">
								<div class="list-type01">
									<ul>
										<c:forEach items="${noticeTopList }" var="notice" varStatus="status">
											<li>
												<p class="fc02"><a href="javascript:;" 
												<c:choose>
													<c:when test="${notice.BDCATE eq 'update' }">
														onclick="javascript:fnView('/web/news/update/view.do', ${notice.SEQ})"
													</c:when>
													<c:otherwise>
														onclick="javascript:fnView('/web/news/notice/view.do', ${notice.SEQ})"
													</c:otherwise>
												</c:choose>
												>
												${fnc:xssContents(notice.TITLE )}</a></p>
												<p class="fc03">
													<fmt:parseDate value="${notice.REGDT}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
													<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd HH:mm' var="regDttmp"/>
													<c:out value="${regDttmp }" />
												</p>
											</li>
										</c:forEach>
									</ul>
								</div>
								<div class="list-type01">
									<ul>
										<c:forEach items="${boardTopList }" var="board" varStatus="status">
											<li>
												<p class="fc02"><a href="javascript:;" onclick="javascript:fnView('/web/community/board/view.do', ${board.SEQ})">${fnc:xssContents(board.TITLE )}</a></p>
												<p class="fc03">
													<fmt:parseDate value="${board.REGDT}" var="regDt" pattern='yyyy-MM-dd HH:mm:ss'/>
													<fmt:formatDate value="${regDt}" pattern='yyyy.MM.dd HH:mm' var="regDttmp"/>
													<c:out value="${regDttmp }" />
												</p>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
						<!-- //tab-board-wrap -->
					</div>
				</c:when>
				<c:otherwise>
				<div class="top-info-box">
					<div class="left-area">
						<!-- game-start -->
						<div class="game-start"  id="id_game_start">
							<a href="#" 
								<c:choose>
									<c:when test="${userSession.memberID eq null || userSession.memberID eq '' }"> onclick="alert('로그인 후 이용 가능합니다.'); return false;" </c:when>
									<c:otherwise> onclick="fnLauncherOnOff(); return false;" </c:otherwise>
								</c:choose>
								class="btn_nowDownload"><img src="/web/images/btn/btn_game_start.jpg" alt="game start">
							</a>
						</div>
						<div class="nowDownload">
							<a href="#" class="nowClose"><img src="/web/images/btn/close.png" alt="close"></a>
							<div class="nowDownload_text">
							게임 실행이 되지 않을 경우<br>
							지금설치를 눌러 프리스타일2<br>
							웹스타트런처를 설치하세요!
							</div>
							<a href="http://fs2-cf.joycityglobal.com/FS2/Game/ASIA_SEOUL/Plugin/FS2KOR_Plugin.exe" download class="nowDown"><img src="/web/images/btn/nowDownload.png" alt="now download"></a>
						</div>
						<!-- //game-start -->
						<c:choose>
						<c:when test="${userSession.userID ne null}">
							<!-- 로그인 후 -->
							<!-- my-box -->
							<div class="my-box">
								<div class="user">
									<c:choose>	
										<c:when test="${userSession.gameId ne null}">
											<span class="name">“${userSession.gameId }”</span> 님 안녕하세요~! <br>
										</c:when>
										<c:otherwise>
											<span class="name">캐릭터 생성 후 대표캐릭터를 설정해주세요.</span><br>
										</c:otherwise>
									</c:choose>
									프리스타일2와 즐거운 시간 되세요.
								</div>
								<div class="utils">
									<ul>
										<!--// TODO-REAL   -->
										<li><a href="https://www.joycity.com/user/userManageMain" target="_blank"><span class="icon-blet"><img src="/web/images/icon/ico_member.png" alt=""></span>회원정보</a></li>
										<li><a href="https://bill.joycity.com/MyPage/Cash" target="_blank"><span class="icon-blet"><img src="/web/images/icon/ico_cash.png" alt=""></span>캐쉬내역</a></li>
									</ul>
									<p>
										<a href="#" onclick="fnLogout(); return false;" class="btn-logout">로그아웃</a>
									</p>
								</div>
							</div>
							<!-- //my-box -->
							<!-- //로그인 후 -->
						</c:when>
						<c:otherwise>
							<!-- 로그인 전 -->
							<!-- login-box -->
							<div class="login-box">
								<div class="in-value">
									<div class="txt">
										<p>
											<label for="pu-id">조이시티 아이디</label> <input type="text"  id="userID" name="userID" placeholder="조이시티 아이디" >
										</p>
										<p>
											<label for="pu-pw">비밀번호</label> <input type="password" id="pwd" placeholder="비밀번호" onkeyup="if (window.event.keyCode == 13) { fnLoginProc();}">
										</p>
									</div>
								<button class="btn-login" onclick="javascript:fnLoginProc();">로그인</button>
								</div>
								<div class="utils">
									<p class="chk-option">
										<input type="checkbox" id="idSaveCheck"><label for="pu-chk01">ID기억</label>
									</p>
									<p class="link">
										<!--// TODO-REAL   -->
										<span><a href="https://www.joycity.com/user/userSearchAcnt">아이디/비밀번호찾기</a></span> 
										<span><a href="https://www.joycity.com/user/userJoinClause"><strong>회원가입</strong></a></span>
									</p>
								</div>
							</div>
							<!-- //login-box -->
							<!-- //로그인 전 -->
						</c:otherwise>
						</c:choose>
						<!-- quick-link -->
						<div class="quick-link">
							<!-- 20180801 수정 -->
							<ul>
								<li><a href="javascript:void(0);" <c:choose><c:when test="${userSession.memberID eq null || userSession.memberID eq '' }"> onclick="alert('로그인 후 이용 가능합니다.'); return false;" </c:when>
								<c:otherwise>onclick="fnWindowOpen('charge', '', ''); return false;"</c:otherwise></c:choose>><span class="icon-blet"><img src="/web/images/icon/ico_cash02.png" alt="캐쉬충전"></span>캐쉬충전</a></li>
								<li><a href="javascript:void(0);" <c:choose><c:when test="${userSession.memberID eq null || userSession.memberID eq '' }"> onclick="alert('로그인 후 이용 가능합니다.'); return false;" </c:when>
								<c:otherwise>onclick="location.href='http://www.joycity.com/user/userManageGmTmInfo'"</c:otherwise></c:choose>><span class="icon-blet"><img src="/web/images/icon/ico_time.png" alt="게임시간 선택제"></span>게임시간 선택제</a></li>
								<li>
									<a href="javascript:alert('새로운 PC방 혜택 준비 중입니다');" class="btn-pcroom"><span class="icon-blet"><img src="/web/images/icon/ico_pc.png" alt="PC방 찾기"></span>PC방 찾기</a>
								</li>
								<li><a href="https://fs2.zendesk.com/hc/ko?userID=${userSession.userID }" target="_blank"><span class="icon-blet"><img src="/web/images/icon/ico_center.png" alt="고객센터"></span>고객센터</a></li>
							</ul>
							<!-- //20180801 수정 -->
						</div>
						<!-- //quick-link -->
					</div>
				</c:otherwise>
			</c:choose>
			
			<!-- top-banner -->
			<div class="top-banner">
				<div class="visual swiper-container">
					<ul class="swiper-wrapper">
						<c:forEach items="${bannerList }" var="result" varStatus="status">
							<li class="swiper-slide"><a href="${result.LINKURL }"><img src="${result.FILENM }" alt="${fnc:xssContents(result.TITLE )}"></a></li>
						</c:forEach>
					</ul>
					<p class="swiper-pagination"></p>
					<p class="control-arrow">
						<a href="#" class="btn-prev"><img src="/web/images/btn/btn_prev.png" alt="이전으로"></a>
						<a href="#" class="btn-next"><img src="/web/images/btn/btn_next.png" alt="다음으로"></a>
					</p>
				</div>
				<div class="txt-info">
					<ul>
						<c:forEach items="${bannerList }" var="result" varStatus="status">
							<li>
								<a href="${result.LINKURL }">
									<strong>${fnc:xssContents(result.TITLE )}</strong>
									<span>${result.SUBTITLE }</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- //top-banner -->
			
			<!-- FS캘린더 -->
			<a href="/web/calendar/main.do" target="_blank" class="btn_calendar"><img src="/web/images/btn/btn_calendar.png" alt="FS캘린더"></a>
			<!-- //FS캘린더 -->

			</div>
			<!-- //top-info-box -->