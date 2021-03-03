<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>매장안내 | store | 포메인</title>
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
		01. phomain					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="store no-visual">

		<div class="page-title">
			<div class="visual" style="background-image:url('/jpn/images/content/sub_visual_03.jpg');"></div>
			<h2 class="h2-type">매장찾기</h2>
			<span class="txt">대한민국 대표 ‘명품’ 쌀국수, 쌀국수는 포메인 입니다.</span>
		</div>

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">

			<!-- map-wrap -->
			<!--
			//	@ 실제 개발시 인라인 스타일(백그라운드) 제거
			-->
			<div class="map-wrap" center center no-repeat;background-size:cover"> <!-- style="background:url(../images/tmp/@map.jpg); -->

				<!-- map -->
				<div id="map">
					<div class="map-search-box">
						<h3 class="h3-type">全店舗一覧</h3>
						<div class="map-tab tabArea">
							<ul class="tab">
								<li class="active"><a href="#">埋葬名</a></li>
								<li id="addrLi"><a href="#">住所</a></li>
								<li id="optLi"><a href="#">オプション</a></li>
							</ul>
							<!-- 매장명 -->
							<div class="tap-con on">
								<!-- sch-input -->
								<div class="sch-input">
									<fieldset>
										<legend>매장명으로 매장검색 폼</legend>
										<input type="text" name="searchStoreName" id="searchStoreName" placeholder="埋葬名" title="매장명 입력" value="${storeName }" onkeypress="if(event.keyCode==13) {searchStoreNameBtn();}">
										<input type="hidden" name="searchStoreNameHidden" id="searchStoreNameHidden">
										<button type="button" class="btn" onclick="searchStoreNameBtn();"><span>検索</span></button>
									</fieldset>
								</div>
								<!-- //sch-input -->

								<!-- store-list -->
								<div class="store-list">
									<div class="result">
										<a href="javascript:void(0)" onclick="searchStoreNameHiddenBtn();" class="btn-sch">再検索</a>
										<span>検索結果 <em id="totalCnt">0</em> </span>
									</div>
									<ul id="storeListNameUl">
										<li class="no-result">検索された情報がありません。</li>
									</ul>
								</div>
								<!-- //store-list -->
							</div>
							<!-- //매장명 -->

							<!-- 주소 -->
							<div class="tap-con">
								<!-- sch-input -->
								<div class="sch-input">
									<fieldset>
										<legend>주소로 매장검색 폼</legend>
										<input type="text" name="searchAddr" id="searchAddr" placeholder="住所" title="주소를 입력" onkeypress="if(event.keyCode==13) {searchAddrBtn();}">
										<input type="hidden" name="searchAddrHidden" id="searchAddrHidden">
										<button type="button" class="btn" onclick="searchAddrBtn();"><span>検索</span></button>
									</fieldset>
								</div>
								<!-- //sch-input -->

								<!-- store-list -->
								<div class="store-list">
									<div class="result">
										<a href="javascript:void(0)" onclick="searchAddrHiddenBtn();" class="btn-sch">再検索</a>
										<span>検索結果 <em id="totalAddrCnt">0</em> </span>
									</div>
									<ul id="storeListAddrUl">
										<li class="no-result">検索された情報がありません。</li>
									</ul>
								</div>
								<!-- //store-list -->
							</div>
							<!-- //주소 -->

							<!-- 옵션 선택 -->
							<div class="tap-con">
								<!-- check-tab-wrap -->
								<div class="check-tab-wrap">
									<span class="check-tab">
										<input type="checkbox" id="rd11" name="rd1" value="Y">
										<label for="rd11">出前</label>
									</span>
									<span class="check-tab">
										<input type="checkbox" id="rd12" name="rd1" value="Y">
										<label for="rd12">最高売り場</label>
									</span>
									<span class="check-tab">
										<input type="checkbox" id="rd13" name="rd1" value="Y">
										<label for="rd13">駐車可能</label>
									</span>
								</div>
								<!-- check-tab-wrap -->

								<!-- store-list -->
								<div class="store-list">
									<div class="result">
										<a href="javascript:void(0);"  onclick="searchOptBtn();" class="btn-sch">再検索</a>
										<span>検索結果 <em id="totalOptCnt">0</em>건</span>
									</div>
									<ul id="storeListOptionUl">
										<li class="no-result">検索された情報がありません。</li>
									</ul>
								</div>
								<!-- //store-list -->
							</div>
							<!-- //옵션 선택 -->
						</div>
					</div>

				</div>
				
				<%--
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1431e31aea654cea5be1ad1d5992740&libraries=services,clusterer,drawing"></script> --%>
				 
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39bba2b31d9341f502bf5e9708bdc18d&libraries=services,clusterer,drawing"></script>
				<script>

					function initDaumNoAddrApi(){
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					    mapOption = {
					        center: new daum.maps.LatLng(37.3702444, 127.107506), // 지도의 중심좌표
					        level: 4 // 지도의 확대 레벨
					    };

						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						function setZoomable(zoomable) {
						    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
						    map.setZoomable(zoomable);    
						}
						
						setZoomable(false);
						
						var imageSrc = '../images/icon/icon_pin.png', // 마커이미지의 주소입니다
					    imageSize = new daum.maps.Size(91, 111), // 마커이미지의 크기입니다
					    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
						    markerPosition = new daum.maps.LatLng(37.3702444, 127.107506); // 마커가 표시될 위치입니다
		
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
						    position: markerPosition,
						    image: markerImage // 마커이미지 설정
						});
						    
						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
					}

					function initDaumApi(storeId , mapX , mapY){
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div
					    mapOption = {
					        center: new daum.maps.LatLng(mapX, mapY), // 지도의 중심좌표
					        level: 4 // 지도의 확대 레벨
					    };

						var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						
						function setZoomable(zoomable) {
						    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
						    map.setZoomable(zoomable);    
						}
						
						setZoomable(false);

						var imageSrc = '../images/icon/icon_pin.png', // 마커이미지의 주소입니다
						    imageSize = new daum.maps.Size(91, 111), // 마커이미지의 크기입니다
						    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
						    markerPosition = new daum.maps.LatLng(mapX, mapY); // 마커가 표시될 위치입니다

						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
						    position: markerPosition,
						    image: markerImage // 마커이미지 설정
						});

						// 마커에 click 이벤트를 등록합니다
					    daum.maps.event.addListener(marker, 'click', function() {

					    	$("#layerPopStore").load("/jpn/store/store_view.do?seq="+storeId );
					    	$('.layer-pop-wrap').stop(true).fadeIn(400);
			        		$('html').addClass('fix');

			        		/*
							$.ajax({
						     	url: "/brand/store/selectStore.do",
						        type: "POST",
						        data: {
						        	'seq' : storeId
						        },
						        dataType: 'json',
						        success: function (data) {
						        	console.info(data);

						        	$('#detailName').text(data.result.name);
						        	var $html = "";
						        	if(data.result.f_file1){
						        		$html += "<div style='background-image:url(\""+data.result.f_file1+"\");' class='img'></div>";
						        	}
						        	if(data.result.f_file2){
						        		$html += "<div style='background-image:url(\""+data.result.f_file2+"\");' class='img'></div>";
						        	}
						        	if(data.result.f_file3){
						        		$html += "<div style='background-image:url(\""+data.result.f_file3+"\");' class='img'></div>";
						        	}
						        	if(data.result.f_file4){
						        		$html += "<div style='background-image:url(\""+data.result.f_file4+"\");' class='img'></div>";
						        	}
						        	if(data.result.f_file5){
						        		$html += "<div style='background-image:url(\""+data.result.f_file5+"\");' class='img'></div>";
						        	}
						        	$('#backGroudImg').append($html);

						        	$html = "";
						        	if(data.result.option1 == 'Y'){
						        		$html += "<span class='ico01' id='detailIco01'></span>"
						        	}
						        	if(data.result.option2 == 'Y'){
						        		$html += "<span class='ico02' id='detailIco02'></span>"
						        	}
						        	if(data.result.option3 == 'Y'){
						        		$html += "<span class='ico03' id='detailIco03'></span>"
						        	}
						        	$('#detailOption').append($html);
						        	$('#detailNaddr').text(data.result.naddr);
						        	$('#detailOaddr').text(data.result.oaddr);
						        	$('#detailDaddr').text(data.result.daddr);
						        	$('#detailPh').text(data.result.hp1+'-'+data.result.hp2+'-'+data.result.hp3);
						        	$('#detailTime').text(data.result.bhour);
						        	$('#detailBus').text(data.result.businfo);
						        	$('#detailSubway').text(data.result.subinfo);


						        	// 핀 클릭 시 매장 상세 팝업 오픈
					        		$('.layer-pop-wrap').stop(true).fadeIn(400);
					        		$('html').addClass('fix');
					        		//$('#backGroudImg').init(true);
					        		//document.write('<script src="/brand/common/js/slick.js?dev=' + Math.floor(Math.random() * 100) + '"\><\/script>');

								},
						        error: function (xhr, status, error) {
						            if (xhr.status == 500) {
						            	alert('Internal error: ' + xhr.responseText);
						            } else {
						                alert('Unexpected error.');
						            }
						        }
						    });*/



					    });

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						if($('#init').val() != 'Y'){
							$("#layerPopStore").load("/jpn/store/store_view.do?seq="+storeId );
					    	$('.layer-pop-wrap').stop(true).fadeIn(400);
			        		$('html').addClass('fix');
						}
						$('#init').val('N');
						
					}

					initDaumNoAddrApi();

				</script>
				<input type="hidden" id="init"/>

				<!-- //map -->

			</div>
			<!-- //map-wrap -->

		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<!-- [레이어 팝업] 매장 상세 보기 -->
<div class="layer-pop-wrap" id="layerPopStore">

</div>
<!-- //[레이어 팝업] 매장 상세 보기 -->

<script src="../common/js/front_ui.js"></script>
<script>
	$(document).ready(function () {
		//매장 초기화
		if($('#searchStoreName').val() == ""){
			$("#searchStoreName").val("The Head Store in Jeongja");
			store_init($('#searchStoreName').val());
		}else if($('#searchStoreName').val() != ""){
			store_init($('#searchStoreName').val());
		}
	});

	function searchStoreNameBtn(){
		var searchStoreName = $('#searchStoreName').val();
		$('#searchStoreNameHidden').val(searchStoreName);
		store_init(searchStoreName);
	}

	function searchStoreNameHiddenBtn(){
		//var searchStoreName = $('#searchStoreNameHidden').val();
		//store_init(searchStoreName);
		location.replace("./store_list.do");
	}

	function searchAddrBtn(){
		var searchAddr = $('#searchAddr').val();
		$('#searchAddrHidden').val(searchAddr);
		adress_init(searchAddr);
	}

	$("#addrLi").click(function(){
		//adress_init('');
	});

	function searchAddrHiddenBtn(){
		//var searchAddr = $('#searchAddrHidden').val();
		//adress_init(searchAddr);
		location.replace("./store_list.do");
	}

	function searchOptBtn(){
		//opt_init();
		location.replace("./store_list.do");
	}

	$("input[name='rd1']").click(function(){
		opt_init();
	});



	$("#optLi").click(function(){
		//opt_init();
	});


	var store_init = function (storeName){
		$.ajax({
	     	url: "/jpn/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'en_name' : storeName,
	        	'useyn' : 1
	        	//'en_name' : storeName
	        },
	        dataType: 'json',
	        success: function (data) {
	    	    $("#totalCnt").text(data.totalCnt);
	    	    $('#storeListNameUl').html('');
	    	    if(data.resultList.length > 0) {
	    	    	$('#init').val('Y');
    				$.each(data.resultList, function(key, index){
    					var $html = '';
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="detail-name">'+data.resultList[key].en_name+'</span>';
    					$html += '<span class="detail-tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="detail-address">'+data.resultList[key].enaddr+'</span>';
    					$html += '<span class="detail-ico">';
    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<strong class="ico01"></strong>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<strong class="ico02"></strong>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<strong class="ico03"></strong>';
						}
    					$html += '</span>';
    					$html += '</a>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')" class="btn-pin"></a>';
    					$html += '</li>';
    					$('#storeListNameUl').append($html);
        			});
    				$('#storeListNameUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<li class='no-result'>検索された情報がありません。</li>";
    				$('#storeListNameUl').append($html);
    				initDaumNoAddrApi();
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

	var adress_init = function (addr){
		$.ajax({
	     	url: "/jpn/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'enaddr' : addr
	        },
	        dataType: 'json',
	        success: function (data) {
	        	$('#init').val('Y');
	        	$("#totalAddrCnt").text(data.totalCnt);
	    	    $('#storeListAddrUl').html('');
	    	    if(data.resultList.length > 0) {
    				$.each(data.resultList, function(key, index){
    					var $html = '';
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="detail-name">'+data.resultList[key].en_name+'</span>';
    					$html += '<span class="detail-tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="detail-address">'+data.resultList[key].enaddr+'</span>';
    					$html += '<span class="detail-ico">';
    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<strong class="ico01"></strong>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<strong class="ico02"></strong>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<strong class="ico03"></strong>';
						}
    					$html += '</span>';
    					$html += '</a>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')" class="btn-pin"></a>';
    					$html += '</li>';
    					$('#storeListAddrUl').append($html);
        			});
    				$('#storeListAddrUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<li class='no-result'>検索された情報がありません。</li>";
    				$('#storeListAddrUl').append($html);
    				initDaumNoAddrApi();
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


	var opt_init = function (){
		var opt1 = '';
		var opt2 = '';
		var opt3 = '';

		if($("#rd11").is(":checked")){
			opt1 = '106201';
		}
		if($("#rd12").is(":checked")){
			opt2 = '106202';
		}
		if($("#rd13").is(":checked")){
			opt3 = '106203';
		}

		$.ajax({
	     	url: "/jpn/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'opt1' : opt1,
	        	'opt2' : opt2,
	        	'opt3' : opt3,
	        	'optionSearch' : 1
	        },
	        dataType: 'json',
	        success: function (data) {
	        	$('#init').val('Y');
	        	$("#totalOptCnt").text(data.totalCnt);
	    	    $('#storeListOptionUl').html('');
	    	    if(data.resultList.length > 0) {
    				$.each(data.resultList, function(key, index){
    					var $html = '';
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="detail-name">'+data.resultList[key].en_name+'</span>';
    					$html += '<span class="detail-tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="detail-address">'+data.resultList[key].enaddr+'</span>';
    					$html += '<span class="detail-ico">';

    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<strong class="ico01"></strong>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<strong class="ico02"></strong>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<strong class="ico03"></strong>';
						}
    					$html += '</span>';
    					$html += '</a>';
    					$html += '<a href="javascript:void(0);" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')" class="btn-pin"></a>';
    					$html += '</li>';
    					$('#storeListOptionUl').append($html);
        			});
    				$('#storeListOptionUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<li class='no-result'>検索された情報がありません。</li>";
    				$('#storeListOptionUl').append($html);
    				initDaumNoAddrApi();
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
