<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>
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
			<!--<h3></h3>-->
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
		<div id="content" class="store pd0"  style="width:100%;height:600px;">
			<!-- 지도영역 : 개발시 삭제 -->
			<div id="map" style="width:100%;height:100%;">
			</div>

			<!-- //마커 표시 -->
			<div class="store_search" style="z-index:20;">
				<h3>매장찾기</h3>
				<ul class="nav">
					<li><a href="#none" onclick="layerOpen('layerStoreName');">매장명</a></li><!-- 레이어 팝업 띄우기 : layerOpen('Id') -->
					<li><a href="#none" onclick="layerOpen('layerStoreAddr');">주소</a></li>
					<li><a href="#none" onclick="layerOpen('layerStoreOption');">옵션 선택</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //content -->
	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/mbrand/include/brandfooter.jsp"%>
	<!--// dFoot -->

	<!-- layer popup -->
	<div class="dim"></div>
	<!-- 매장명 찾기 -->
	<div id="layerStoreName" class="layer_pop" style="z-index:20001;">
		<div class="head">
			<h4>매장명 찾기</h4>
		</div>
		<div class="cont">
			<div class="search_input">
				<input type="text" name="searchStoreName" id="searchStoreName" class="text" placeholder="매장명를 입력하세요" title="매장명" value="${storeName }" onkeypress="if(event.keyCode==13) {searchStoreNameBtn();}">
				<input type="hidden" name="best" id="best" value="${best}">
				<input type="hidden" name="init" id="init">
				<input type="hidden" name="searchStoreNameHidden" id="searchStoreNameHidden">
				<button type="button" class="btn_search" onclick="searchStoreNameBtn();"><span class="blind">검색</span></button>
			</div>
			<div class="search_result">
				<div class="result_option">
					<button type="button" class="btn_retry" onclick="searchStoreNameHiddenBtn();">재검색</button>
					<span class="num">검색결과 <em id="totalCnt">0</em> 건</span>
				</div>
				<!-- 검색 결과 없을 때 -->
				<div class="list_area no_result" id="storeListNameUl">
					<span>검색된 정보가 없습니다.</span>
				</div>
				<!-- //검색 결과 없을 때 -->
			</div>
		</div>
		<button type="button" class="btn_close" onclick="layerClose('layerStoreName');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
	</div>
	<!-- //매장명 찾기 -->
	<!-- 주소로 찾기 -->
	<div id="layerStoreAddr" class="layer_pop" style="z-index:20001;">
		<div class="head">
			<h4>주소로 찾기</h4>
		</div>
		<div class="cont">
			<div class="search_input">
				<input type="text" class="text"  name="searchAddr" id="searchAddr" placeholder="주소를 입력하세요" title="주소" onkeypress="if(event.keyCode==13) {searchAddrBtn();}">
				<input type="hidden" name="searchAddrHidden" id="searchAddrHidden">
				<button type="button" class="btn_search" onclick="searchAddrBtn();"><span class="blind">검색</span></button>
			</div>
			<div class="search_result">
				<div class="result_option">
					<button type="button" class="btn_retry" onclick="searchAddrHiddenBtn();">재검색</button>
					<span class="num">검색결과 <em id="totalAddrCnt">0</em> 건</span>
				</div>
				<!-- 검색 결과 없을 때 -->
				<div class="list_area no_result" id="storeListAddrUl">
					<span>검색된 정보가 없습니다.</span>
				</div>
				<!-- //검색 결과 없을 때 -->
			</div>
		</div>
		<button type="button" class="btn_close" onclick="layerClose('layerStoreAddr');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
	</div>
	<!-- //주소로 찾기 -->
	<!-- 옵션 선택 -->
	<div id="layerStoreOption" class="layer_pop" style="z-index:20001;">
		<div class="head">
			<h4>옵션 선택</h4>
		</div>
		<div class="cont">
			<div class="search_option">
				<ul>
					<li class="delivery">
						<span class="checkbox">
							<input type="checkbox" id="rd11" name="rd1" value="Y"><label for="rd11">딜리버리</label>
						</span>
					</li>
					<li class="best">
						<span class="checkbox">
							<input type="checkbox" id="rd12" name="rd1" value="Y"><label for="rd12">우수매장</label>
						</span>
					</li>
					<li class="parking">
						<span class="checkbox">
							<input type="checkbox" id="rd13" name="rd1" value="Y"><label for="rd13">주차가능</label>
						</span>
					</li>
				</ul>
			</div>
			<!--
			<div class="btn_area">
				<a href="#none" class="btn_tyf c_black">검색</a>
			</div> -->
			<div class="search_result">
				<div class="result_option">
					<button type="button" class="btn_retry" onclick="searchOptBtn();">재검색</button>
					<span class="num">검색결과 <em id="totalOptCnt">0</em> 건</span>
				</div>
				<!-- 검색 결과 없을 때 -->
				<div class="list_area no_result" id="storeListOptionUl">
					<span>검색된 정보가 없습니다.</span>
				</div>
				<!-- //검색 결과 없을 때 -->
			</div>
		</div>
		<button type="button" class="btn_close" onclick="layerClose('layerStoreOption');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
	</div>
	<!-- //옵션 선택 -->
	<!-- //layer popup -->

	<!-- 매장 상세  -->
	<div class="dim"></div>

	<div id="layerDetail"></div>

	<div id="layerStoreView" class="layer_pop" style="z-index:20002;">
<!-- 		<div class="head">
			<h4>주소로 찾기</h4>
		</div> -->
		<div class="cont">
			<div class="stoer_view">
				<h5 id="detailName"></h5>
				<div class="swiper">
					<ul class="swiper_wrap" id="backGroudImg">
					</ul>
					<div class="swiper_pagination"></div>
					<div class="swiper_btn_next"></div>
					<div class="swiper_btn_prev"></div>
					<div class="option" id="detailOption">
					</div>
				</div>
			</div>
			<div class="stoer_info">
				<dl>
					<dt>신주소</dt>
					<dd id="detailNaddr"></dd>
				</dl>
				<dl>
					<dt>구주소</dt>
					<dd id="detailOaddr"></dd>
				</dl>
				<dl>
					<dt>상세주소</dt>
					<dd id="detailDaddr"></dd>
				</dl>
				<dl>
					<dt>전화번호</dt>
					<dd id="detailPh"></dd>
				</dl>
				<dl>
					<dt>영업시간</dt>
					<dd id="detailTime"></dd>
				</dl>
				<dl id="busarea">
					<dt>버스</dt>
					<dd id="detailBus"></dd>
				</dl>
				<dl id="subarea">
					<dt>지하철</dt>
					<dd id="detailSubway"></dd>
				</dl>
			</div>
		</div>
		<!-- <button type="button" class="btn_back"><span class="blind">뒤로가기</span></button> -->
		<button type="button" class="btn_close" onclick="layerClose('layerStoreView');"><span class="blind">닫기</span></button><!-- 레이어 팝업 닫기 : layerClose('Id') -->
	</div>
	<!-- //매장 상세 -->

</div>
<!-- //wrap -->
<script src="/mbrand/common/js/swiper.min.js"></script>
<script src="/mbrand/common/js/common.js"></script>
</body>
</html>
<%--
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1431e31aea654cea5be1ad1d5992740&libraries=services,clusterer,drawing"></script>  --%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39bba2b31d9341f502bf5e9708bdc18d&libraries=services,clusterer,drawing"></script>
<script>

	var mapContainer = document.getElementById('map');
	
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
	
	
	function initDaumNoAddrApi(){
		var imageSrc = '/brand/images/icon/icon_pin.png', // 마커이미지의 주소입니다
	    imageSize = new daum.maps.Size(41, 51), // 마커이미지의 크기입니다
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
		var imageSrc = '/brand/images/icon/icon_pin.png', // 마커이미지의 주소입니다
		    imageSize = new daum.maps.Size(41, 51), // 마커이미지의 크기입니다
		    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new daum.maps.LatLng(mapX, mapY); // 마커가 표시될 위치입니다

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition,
		    image: markerImage // 마커이미지 설정
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		bounds = new daum.maps.LatLngBounds();
		bounds.extend(markerPosition);
		
		map.setBounds(bounds);
		
		
		layerClose('layerStoreName');
		layerClose('layerStoreAddr');
		layerClose('layerStoreOption');

		
		// 마커에 click 이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'click', function() {
	    	//$("#layerStoreView").load("/mbrand/store/store_view.do?seq="+storeId );

			$.ajax({
		     	url: "/mbrand/store/selectStore.do",
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
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file1+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file2){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file2+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file3){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file3+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file4){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file4+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file5){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file5+"\' alt=''></li>";
		        	}
		        	$('#backGroudImg').html('');
		        	$('#backGroudImg').append($html);

		        	$html = "";
		        	var option1 = data.result.option1;
		        	$('#detailOption').html('');
		        	if(option1.indexOf('106201') != -1){
		        		$html += '<span class="ico_delivery"><em class="blind">딜리버리</em></span>';
		        	}
		        	if(option1.indexOf('106202') != -1){
		        		$html += '<span class="ico_best"><em class="blind">우수매장</em></span>';
		        	}
		        	if(option1.indexOf('106203') != -1){
		        		$html += '<span class="ico_parking"><em class="blind">주차가능</em></span>';
		        	}
		        	$('#detailOption').append($html);
		        	$('#detailNaddr').text(data.result.naddr);
		        	$('#detailOaddr').text(data.result.oaddr);
		        	$('#detailDaddr').text(data.result.daddr);
		        	$('#detailPh').text(data.result.hp1+'-'+data.result.hp2+'-'+data.result.hp3);
		        	//$('#detailTime').text(data.result.bhour);
		        	$('#detailTime').text(data.result.bh1+':'+data.result.bh2+'~'+data.result.bh3+':'+data.result.bh4);
		        	if ( data.result.busyn == 'Y'){
			        	$('#detailBus').text(data.result.businfo);
			        	$('#busarea').css('display','table-row');
		        	}else{
		        		$('#detailBus').text('');
		        		$('#busarea').css('display','none');
		        	}
		        	if ( data.result.subyn == 'Y'){
			        	$('#detailSubway').text(data.result.subinfo);
			        	$('#subarea').css('display','table-row');
		        	}else{
		        		$('#detailSubway').text('');
		        		$('#subarea').css('display','none');
		        	}

		        	// 핀 클릭 시 매장 상세 팝업 오픈
	        		layerOpen('layerStoreView');
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
		    });
			
	    	layerOpen('layerStoreView');
	    	
	    });
		
		/*
	    //if($("#best").val() == 'Y'){
	    	$.ajax({
		     	url: "/mbrand/store/selectStore.do",
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
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file1+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file2){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file2+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file3){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file3+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file4){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file4+"\' alt=''></li>";
		        	}
		        	if(data.result.f_file5){
		        		$html += "<li class='swiper_slide'><img src=\'"+data.result.f_file5+"\' alt=''></li>";
		        	}
		        	$('#backGroudImg').html('');
		        	$('#backGroudImg').append($html);

		        	$html = "";
		        	var option1 = data.result.option1;
		        	$('#detailOption').html('');
		        	if(option1.indexOf('106201') != -1){
		        		$html += '<span class="ico_delivery"><em class="blind">딜리버리</em></span>';
		        	}
		        	if(option1.indexOf('106202') != -1){
		        		$html += '<span class="ico_best"><em class="blind">우수매장</em></span>';
		        	}
		        	if(option1.indexOf('106203') != -1){
		        		$html += '<span class="ico_parking"><em class="blind">주차가능</em></span>';
		        	}
		        	$('#detailOption').append($html);
		        	$('#detailNaddr').text(data.result.naddr);
		        	$('#detailOaddr').text(data.result.oaddr);
		        	$('#detailDaddr').text(data.result.daddr);
		        	$('#detailPh').text(data.result.hp1+'-'+data.result.hp2+'-'+data.result.hp3);
		        	//$('#detailTime').text(data.result.bhour);
		        	$('#detailTime').text(data.result.bh1+':'+data.result.bh2+'~'+data.result.bh3+':'+data.result.bh4);
		        	if ( data.result.busyn == 'Y'){
			        	$('#detailBus').text(data.result.businfo);
			        	$('#busarea').css('display','table-row');
		        	}else{
		        		$('#detailBus').text('');
		        		$('#busarea').css('display','none');
		        	}
		        	if ( data.result.subyn == 'Y'){
			        	$('#detailSubway').text(data.result.subinfo);
			        	$('#subarea').css('display','table-row');
		        	}else{
		        		$('#detailSubway').text('');
		        		$('#subarea').css('display','none');
		        	}

		        	// 핀 클릭 시 매장 상세 팝업 오픈
	        		layerOpen('layerStoreView');
	        		$("#best").val('N');

				},
		        error: function (xhr, status, error) {
		            if (xhr.status == 500) {
		            	alert('Internal error: ' + xhr.responseText);
		            } else {
		                alert('Unexpected error.');
		            }
		        }
		    });
			
	    	layerOpen('layerStoreView');
    	//}
		*/
		
	}
	
	
	initDaumNoAddrApi();
</script>

<script>
	// 매장 상세 레이어팝업 보이기 (퍼블리싱 확인용)
	$(function(){
		//layerOpen('layerStoreView');
	});

	$(document).ready(function () {
		//매장 초기화
		if($('#searchStoreName').val() != ""){
			store_init($('#searchStoreName').val());
			$("#init").val('N');
		}else{
			store_init('정자본점');
			$("#init").val('Y');
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


	var store_init = function (storeName){
		$.ajax({
	     	url: "/mbrand/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'name' : storeName,
	        	'useyn' : 1
	        },
	        dataType: 'json',
	        success: function (data) {
	    	    $("#totalCnt").text(data.totalCnt);
	    	    $('#storeListNameUl').html('');
	    	    if(data.resultList.length > 0) {
	    	    	var $html = '';
	    	    	$html += '<ul>';
    				$.each(data.resultList, function(key, index){
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" class="link_detail" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="tit">'+data.resultList[key].name+'</span>';
    					$html += '<span class="tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="addr">'+data.resultList[key].oaddr+' '+data.resultList[key].daddr+'</span>';
    					$html += '<span class="option">';
    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<span class="ico_delivery"><em class="blind">딜리버리</em></span>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<span class="ico_best"><em class="blind">우수매장</em></span>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<span class="ico_parking"><em class="blind">주차가능</em></span>';
						}
    					$html += '</span>';
    					$html += '</a>';
        			});
    				$html += '</ul>';
    				$('#storeListNameUl').append($html);
    				$('#storeListNameUl').removeClass('no_result');
    				
    				if($("#best").val() == 'Y'){
    					$('#storeListNameUl').find('a').first().trigger('click');
    				}
    				if($("#init").val() == 'Y'){
    					//layerOpen('layerStoreName');
    					$('#storeListNameUl').find('a').first().trigger('click');
    					$("#init").val('N');
    				}
    				//$('#storeListNameUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<span>검색된 정보가 없습니다.</span>";
    				$('#storeListNameUl').addClass('no_result');
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
	     	url: "/mbrand/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'addr' : addr
	        },
	        dataType: 'json',
	        success: function (data) {
	        	$("#totalAddrCnt").text(data.totalCnt);
	    	    $('#storeListAddrUl').html('');
	    	    if(data.resultList.length > 0) {
	    	    	var $html = '';
	    	    	$html += '<ul>';
    				$.each(data.resultList, function(key, index){
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" class="link_detail" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="tit">'+data.resultList[key].name+'</span>';
    					$html += '<span class="tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="addr">'+data.resultList[key].oaddr+' '+data.resultList[key].daddr+'</span>';
    					$html += '<span class="option">';
    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<span class="ico_delivery"><em class="blind">딜리버리</em></span>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<span class="ico_best"><em class="blind">우수매장</em></span>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<span class="ico_parking"><em class="blind">주차가능</em></span>';
						}
    					$html += '</span>';
    					$html += '</a>';
        			});
    				$html += '</ul>';
    				$('#storeListAddrUl').append($html);
    				$('#storeListAddrUl').removeClass('no_result');
    				//$('#storeListAddrUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<span>검색된 정보가 없습니다.</span>";
    				$('#storeListAddrUl').addClass('no_result');
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
	     	url: "/mbrand/store/selectStoreList.do",
	        type: "POST",
	        data: {
	        	'opt1' : opt1,
	        	'opt2' : opt2,
	        	'opt3' : opt3,
	        	'optionSearch' : 1
	        },
	        dataType: 'json',
	        success: function (data) {
	        	$("#totalOptCnt").text(data.totalCnt);
	    	    $('#storeListOptionUl').html('');
	    	    if(data.resultList.length > 0) {
	    	    	var $html = '';
	    	    	$html += '<ul>';
    				$.each(data.resultList, function(key, index){
    					$html += '<li>';
    					$html += '<a href="javascript:void(0);" class="link_detail" onclick="initDaumApi(\''+data.resultList[key].seq +'\' , \''+data.resultList[key].lat +'\' , \''+ data.resultList[key].longi+'\')">';
    					$html += '<span class="tit">'+data.resultList[key].name+'</span>';
    					$html += '<span class="tel">'+data.resultList[key].hp1+'-'+data.resultList[key].hp2+'-'+data.resultList[key].hp3+'</span>';
    					$html += '<span class="addr">'+data.resultList[key].oaddr+' '+data.resultList[key].daddr+'</span>';
    					$html += '<span class="option">';
    					var option1 = data.resultList[key].option1;
    					if(option1.indexOf('106201') != -1){
    						$html += '<span class="ico_delivery"><em class="blind">딜리버리</em></span>';
    					}
						if(option1.indexOf('106202') != -1){
							$html += '<span class="ico_best"><em class="blind">우수매장</em></span>';
						}
						if(option1.indexOf('106203') != -1){
							$html += '<span class="ico_parking"><em class="blind">주차가능</em></span>';
						}
    					$html += '</span>';
    					$html += '</a>';
        			});
    				$html += '</ul>';
    				$('#storeListOptionUl').append($html);
    				$('#storeListOptionUl').removeClass('no_result');
    				//$('#storeListOptionUl').find('a').first().trigger('click');
    			} else {
    				var $html = '';
    				$html += "<span>검색된 정보가 없습니다.</span>";
    				$('#storeListOptionUl').addClass('no_result');
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
