/*
*/
$(function(){
	var $reqUrl = $(location).attr('href');
	var refererUrl = "";
	if( $reqUrl.indexOf("/member/") > -1 || $reqUrl.indexOf("/console/") > -1 
		|| $reqUrl.indexOf("/mypage/activity/") > -1 
		|| $reqUrl.indexOf("/mypage/myInfo/") > -1 
		|| $reqUrl.indexOf("/mypage/cs/inquiryForm.do") > -1
		|| $reqUrl.indexOf("/mall/mypage/order/userView.do") > -1 ){

		if( $(location).attr('protocol') == 'http:' ){
			var httpUrl = $reqUrl.replace("http:", "https:");
			httpUrl = httpUrl.replace(":18081", ":18010");
			if( $reqUrl.indexOf("/login.do") > -1 ){
				refererUrl = "?returnUrl="+ document.referrer;
			}
			//document.location.href = httpUrl + refererUrl;
		}
		
	}else{ 
		if( $(location).attr('protocol') == 'https:' ){
			var httpUrl = $reqUrl.replace("https:", "http:");
			httpUrl = httpUrl.replace(":18010", ":18081");
			//document.location.href = httpUrl;
		}
		
	}
});
jQuery(function($) {
	$('.datepicker').datepicker({
		showOn:"both",
		buttonImage:"/asset/images/datepicker/btn_datepicker.png",
		buttonImageOnly:true,
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    }
    });

	// jquery appendVal plugin
	$.fn.appendVal = function (newPart) {
		var result = this.each(function(){ 
			if( null != $(this).val() && "" != $(this).val() ){
				$(this).val( $(this).val() +","+ newPart );
			}else{
				$(this).val( $(this).val() + newPart); 
			}
		});
		return result;
	};

	$("input:checkbox[name='chkAll']").click(function(){
		if ( $(this).is(":checked") ) {
    		$("input:checkbox[name=chkSeq]").prop("checked", true);
    	}else{
    		$("input:checkbox[name=chkSeq]").prop("checked", false);
    	}			
	}); 
		
    var url = window.location.href;
    var authDir = url.substr(0, url.lastIndexOf('/')).substr(url.substr(0, url.lastIndexOf('/')).lastIndexOf('/') + 1, url.substr(0, url.lastIndexOf('/')).length);    
    var currentFileNm =   url.substr(url.lastIndexOf('/') + 1, url.length);
    // 마이페이지 lnb 활성화 
	$("div[id=mypageLnb] > div[id=lnb] ul li a").filter(function(){		
		if ( this.id == authDir) {
			$(this).addClass('on');
			$(this).next().find("li a").filter(function(){				
				return ( currentFileNm.indexOf(this.id) > -1 )
				//return ( this.href.indexOf(currentFileNm) > -1 ); 
			}).addClass('on');
		}  
		//return 
	});	
	
});


$(function() {
	var $searchForm = $('form[name=searchForm]');
	
	if ($searchForm !== undefined && $searchForm !== null) {
		
		$searchForm.find('input[type=text]').each(function() {
			$(this).keydown(function(event) {
				if(event.keyCode === 13) {
					fnSearchForm();
				};
			});
		});
		
	}
});

var fnSearchForm = function() {
	$("input[name='pageIndex']").val(1);
	$("#searchForm").submit();
};


//############전역 변수################################
var han_pattern =/.*[(ㄱ-ㅎ)ㅏ-ㅣ(가-힣)]+.*/;


//############ 메인 팝업 창 닫기 #######################
function mainPopCloseWin(val) { 
	if ( $("input:checkbox[name=chkboxPop" + val + "]" ).is(":checked")) {
		setCookies( "catershopMainPop" + val, "catershopMainPop" + val + "_cookie" , 1 );
	}				
	$("#mainPop" + val).css("display", "none");				
	return false;
}
//############ 레이어 팝업 호출 ( 상세 보기용 )################################
var fnShowViewLayerPop = function() {
	var body = $('html, body'),
	wrap = $('#wrap'),
	dim = $('<div class="dim"></div>'),	
	layer = $('#layerPopup');
	wrap.prepend(dim);
	layer.show();
	
	body.animate({ scrollTop : layer.offset().top-20 },{ duration : 350, easing : 'easeInOutQuart' });    	
	// close
	layer.find('.close').on('click', function(){			 
		dim.remove();
		layer.hide();
		return false;
	});		
};  
//############ 레이어 팝업 호출 ################################
var fnShowLayerPop = function() {
	var layer = $('#layerPopup');	
	layer.show();
	$('html, body').animate({ scrollTop : $('.layer-wrap').offset().top },{ duration : 350, easing : 'easeInOutQuart' });
	// close
	layer.find('.close').on('click', function(){
		layer.hide();
		return false;
	});		
	layer.find('[id=close]').on('click', function(){
		layer.hide();
		return false;
	});		
};  
// ########### 상품 상세 페이지로 이동 ###########################
var fnItemView = function(proCd, stockCnt) {
	if ( stockCnt < 1 ) {
		alert("판매 중지된 상품입니다.");
		return;
	}
	location.href="/mall/disp/itemView.do?proCd=" + proCd;
	// targetLocation("/mall/disp/itemView.do?proCd=" + proCd);
};
//############ 도메인 return ################################
var getDomain = (function(_url){
	 _url = _url.split('//');
	 _url = _url[1].substr(0, _url[1].indexOf('/')); 
	 return _url;
});		

//############ 로그인 여부 확인 ################################
var isLoginLnk = (function(lnkUrl){		
	if(isLogin == false){		
		if( ! confirm("로그인이 필요한 서비스 입니다.\n로그인 페이지로 이동하시겠습니까?") ) 	return false;
		location.href = '/mall/console/login.do';
		return false;
	}else{
		if ( isBlank(lnkUrl) == false) location.href = lnkUrl;		
		return true;
	}
});	

// ########## SNS 공유 ################################
//페이스북 공유
var fnShareFb = (function() {	
	var snsUrl		= location.href;	
	popWin("http://www.facebook.com/sharer.php?u="+ encodeURIComponent( snsUrl ), '626', '436', 'yes', 'facebook_share_dialog');		

});

// ############팝업 열기################################
function popWin(url, w, h, scroll, name) {
	var option = "status=no,height=" + h + ",width=" + w
			+ ",resizable=no,left=0,top=0,screenX=0,screenY=0,scrollbars="
			+ scroll;

	commonPopWin = window.open(url, name, option);
	commonPopWin.focus();
}

function confirmPopWin(url, w, h, scroll, name) {
	if (confirm("새 창으로 열립니다. 여시겠습니까?") == false)
		return;

	var option = "status=no,height=" + h + ",width=" + w
			+ ",resizable=no,left=0,top=0,screenX=0,screenY=0,scrollbars="
			+ scroll;

	commonPopWin = window.open(url, name, option);
	commonPopWin.focus();
}
function confirmTargetLocation(url) {
	if (confirm("새 창으로 열립니다. 여시겠습니까?") == false)
		return;
	var popWin = window.open('about:blank');
	popWin.location.href = url;
}
function targetLocation(url) {
	var popWin = window.open('about:blank');
	popWin.location.href = url;
}

// 아이프레임 리사이즈
function fnIframeResize(_objId) {
	var iframeObj = document.getElementById(_objId);

	var childFrameHeight = iframeObj.contentWindow.document.body.offsetHeight;

	$('#' + _objId).css('height', childFrameHeight);

}


//에디터 전역 변수
var oEditors = [];

/** 네이버 에디터 추가 * */
function addEditor(id, fnc) {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : id,
		sSkinURI : "/editor/SmartEditor2Skin.html",
		htParams : {
			bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지
			// 않음)
			bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부
			// (true:사용/ false:사용하지 않음)
			fOnBeforeUnload : function() {
			},
			aAdditionalFontList : []
		}, // boolean
		fOnAppLoad : function() {
			// oEditors.getById[id].setDefaultFont('kopubM', 10) ;
			if (fnc) {
				fnc();
			}
		},
		fCreator : "createSEditor2"
	});
}

/** 네이버 에디터에서 값을 가져온다. * */
function getHTML(id) {
	//return sHTML = oEditors.getById[id].exec("UPDATE_CONTENTS_FIELD", []);
	return sHTML = oEditors.getById[id].getIR();
	
}
function setHTML(id, HTML) {
	oEditors.getById[id].exec("PASTE_HTML", [ HTML ]);
}
/** XSS 치환 return **/
function fnStripTag(str){  
	str = str.replace(/<[^<|>]*>|&nbsp;|\r\n/gi, "").trim();
	return str;
}

//페이징 이동 
function fnPaging(pageIndex){
    var frm = document.searchForm;
    $("input[name='pageIndex']").val( pageIndex );
    frm.submit();
}

//페이징 이동 Sub
function fnPaging2(pageIndex2){
  var frm = document.searchForm;
  $("input[name='pageIndex2']").val( pageIndex2 );
  alert( $("input[name='pageIndex2']").val() );
}

//페이징 이동 Sub
function fnPagingSub(pageIndexSub){
	var frm = document.searchForm;
	$("input[name='pageIndexSub']").val( pageIndexSub );
	frm.submit();
}


//페이징 Url 이동 
function fnPagingUrl(pageIndex, _url){
    var frm = document.searchForm;
    $("input[name='pageIndex']").val( pageIndex );
    frm.action = _url;
    frm.submit();
}

//페이지 이동
function fnPage(_url) {
    var frm = document.searchForm;
    frm.action = _url;
    frm.method = "get";
    frm.submit();
}

//상세페이지 이동 
function fnView(_url, _seq) {
    var frm = document.searchForm;
	$("input[name='seq']").val( _seq );
	frm.action = _url;
	frm.method = "get";
	frm.submit();
}

// 첨부파일 화면 삭제( 단일 구조 )
function fnAtDel(obj) {
	$(obj).parent().remove();
	
}


// 첨부파일 다운로드
function downloadFile(path, name) {
	var url = encodeURI("/download.do?path=" + path + "&fileName=" + name);
	$("#ifr").attr("src", url);
}
// 이미지 뷰 팝업 
function imgFileView(imgSrc) {
	popWin("/imageView.do?imgSrc=" + imgSrc, 600, 500, "no", "imageView");
}
// 첨부파일 삭제
function delFile(id1, id2, obj) {
	if (id1) {
		$("#" + id1).val('');
	}
	if (id2) {
		$("#" + id2).val('');
	}
	$(obj).parent().remove();
}

// 엑셀 다운로드 
function fnExcelDown(){
	var frm = $("form[name=searchForm]");
	var params = frm.serialize();
	$("#ifr").attr("src", "downExcel.do?" + params);
}
// 주소 검색 팝업 
function fnPopAddrSearch (objId) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
//        	console.log( data );
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
			
			$("#" + objId).find("[id=zipCode]").val(data.zonecode);
			$("#" + objId).find("[id=addr2]").val(fullRoadAddr);
			if( data.jibunAddress != '' ){
				$("#" + objId).find("[id=addr]").val(data.jibunAddress);	
			}else{
				$("#" + objId).find("[id=addr]").val(fullRoadAddr);
			}

        }
    }).open();    	
}

//주소 검색 팝업 
function fnPopAddrSearch2(zipCode, addr1, addr2, addrInfo, fn) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
//        	console.log( data );
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }
            
			$("#" + zipCode).val(data.zonecode);
			$("#" + addr1).val(fullRoadAddr);
			$("#" + addr2).val(data.jibunAddress);
//			if(addrInfo){
//				$("#" + addrInfo).val(data.buildingName);
//			}
//			if(data.buildingName){
//				$("#" + addr2).val($("#" + addr2).val() + " "+data.buildingName);
//			}
			if(fn){
				eval(fn);
			}
        }
    }).open();    	
}

//############레이어  팝업################################
var showAjaxLayerPopup = (function (url, title, w) {
	var PopObj = new Object();
    var popup = new jQuery.Popup({
        popupId : 'catershopPop',
        popupTitle : title,
        center : true,
        popupMove: true,
        popupBackground : true, 
        ajax : true,
        lnkUrl : url,
        width:w
        				
    }); 				 	
	popup.openPopup();

});
var fnPopClose = ( function(id){
	new jQuery.Popup().closePopup("catershopPop"); 
});

// 3자리 마다 컴마찍기
function fnSetNum(num) {
	var reg = /(^[+-]?\d+)(\d{3})/;
	num += '';
	 while (reg.test(num)) {
		 num = num.replace(reg, '$1' + ',' + '$2');
	 }
	return  num;
}

//쿠키이용
function setCookie(name, value) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + 365);   
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";"
}

//쿠키이용
function setCookies(name, value, days) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + days);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";"
} 
// 쿠키 소멸 함수
function clearCookie(name) {
	var today = new Date()
	// 어제 날짜를 쿠키 소멸 날짜로 설정한다.
	var expire_date = new Date(today.getTime() - 60 * 60 * 24 * 1000)
	document.cookie = name + "= " + "; expires=" + expire_date.toGMTString()
}

function getCookieVal(name) {
	var nameOfCookie = name + "=";
	var x = 0;
	while (x <= document.cookie.length) {
		var y = (x + nameOfCookie.length);
		if (document.cookie.substring(x, y) == nameOfCookie) {
			if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
				endOfCookie = document.cookie.length;
			return unescape(document.cookie.substring(y, endOfCookie));
		}
		x = document.cookie.indexOf(" ", x) + 1;
		if (x == 0)
			break;
	}
	return "";
}


function inpuOnlyNumber(obj) {
	var checkChar = '0123456789';
	var val = obj.value;
	var val2 = "";
	for(var i=0; i<val.length; i++){
		var bool=false;
		for(var j=0; j<checkChar.length; j++){
			if(checkChar.charAt(j) == val.charAt(i)){
				bool=false;
				val2 += val.charAt(i);
				break;
			}else{
				bool=true;
				
			}
		}	
		if(bool){
		}
	}
	obj.value=val2;
}


function inpuOnlyId(obj) {
	var checkChar = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	var val = obj.value;
	var val2 = "";
	for(var i=0; i<val.length; i++){
		var bool=false;
		for(var j=0; j<checkChar.length; j++){
			if(checkChar.charAt(j) == val.charAt(i)){
				bool=false;
				val2 += val.charAt(i);
				break;
			}else{
				bool=true;
				
			}
		}	
		if(bool){
		}
	}
	obj.value=val2;
}

var allImagesLoaded= function() {
	var images = document.images;
	for (var i = 0;i<images.length;i++)		{
			if(images[i].complete == false) return false;
	}
	return true;
};

//우편번호검색
function findZip(formName, zipName, addr1, addr2, user_addr2,user_zipcode_seq) {
	Request_URL = "/cmmn/zipFind.do?formName="+formName+"&zipName="+zipName+"&addr1="+addr1+"&addr2="+addr2+"&userAddr2="+user_addr2+"&userZipcodeSeq="+user_zipcode_seq;
	pops(Request_URL, 'pop_zip_find', '500', '600');
}
function pops(url,name,w,h){window.open(url,name,'top=400px,left=400px,width='+w+',height='+h+',scrollbars=yes','top=');} //Popup(스크롤바있음)
