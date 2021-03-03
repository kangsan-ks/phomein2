/*==============================================

    ----------------------------------------------------------------
	* Date		:	2018.08.29
	* Modify	:
	* Name		:	front_ui.js
	----------------------------------------------------------------

	- Description -
	01. front.init()				:	프론트 스크립트 초기실행
	02. front.ready()				:	html 문서 로드 완료시
	03. front.resize()				:	window 크기 변경시
	04. front.scroll()				:	window 스크롤시

==============================================*/


/*===================================
@ front
===================================*/
var front = {

	winW : null,										//윈도우 넓이
	winH : null,										//윈도우 높이
	browser : null,									//브라우저 종류
	sc : null,											//스크롤 상단값
	mobile : null,									//모바일 여부 체크

	init : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
		front.browser = navigator.userAgent;
		front.mobile = front.common.agentCheck();

		front.scroll();
		front.common.init();
		front.form.init();
		front.contents.init();
		front.secItem.init();// 20190509 추가
		front.pop.init();

		if(!front.mobile){
			$('body').css({'min-width' : '320px'});
			$('.login-wrap').addClass('mobile');
		}

	},

	ready : function(){

	},

	load : function(){

	},

	resize : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
	},

	scroll : function(){
		front.winW = $(window).width();
		front.winH = $(window).height();
		front.sc = $(window).scrollTop();

	},

	common : {

		init : function(){

			var common = front.common;

			common.gnb.init();

		},

		gnb : {

			target : null,

			init : function(){
				var _this = front.common.gnb;
				_this.target = $('#lnb');

				_this.target.find('> ul > li').each(function(){
					if($(this).find('.snb').length > 0) {
						$(this).find('> a').attr('href' , 'javascript:;');
						$(this).addClass('two-depth');
					}else{
						$(this).addClass('none');
					}

					if($(this).hasClass('actived')){
						$(this).addClass('open');
					}
				});

				_this.target.find('> ul > li > a').click(function(){
					var _parent = $(this).parent();
					if(_parent.hasClass('open')){
						_parent.removeClass('open');
					}else{
						_parent.addClass('open');
					}

					var _sideHeight = $('#lnb').find('> ul').innerHeight();
					var _contentHeight = $('#dBody').innerHeight();

					if(_sideHeight > _contentHeight){
						$('#dBody').css({'min-height' : _sideHeight + 'px'});
					}else{
						$('#dBody').attr('style' , '');
					}
				});

				// ▼▼▼ 20190502 추가 ▼▼▼
				if($('.mobile-menu').length > 0 ){
					$('.mobile-menu').click(function(){
						if($(this).hasClass('open')){
							// 닫기
							$(this).removeClass('open');
							$('#lnb').removeClass('open');
							$('.global-menu').removeClass('open');
							$('html').removeClass('fix');
						}else{
							//열기
							$(this).addClass('open');
							$('#lnb').addClass('open');
							$('.global-menu').addClass('open');
							$('html').addClass('fix');
						}
					});
				}
				//▲▲▲ 20190502 추가 끝 ▲▲▲
			}

		},

		moveScroll : function(tgY, speed){

			if(speed == null || speed == 'undefind') speed = 1000;
			$('html, body').stop().animate({'scrollTop':tgY}, {queue:false, duration:speed, easing:'easeOutCubic'});

		},

		getParamater : function(key){

			var url = location.href;
			var spoint = url.indexOf("?");
			var query = url.substring(spoint, url.length);
			var keys = new Array;
			var values = new Array;
			var nextStartPoint = 0;
			while (query.indexOf("&", (nextStartPoint + 1)) > -1) {
				var item = query.substring(nextStartPoint, query.indexOf("&", (nextStartPoint + 1)));
				var p = item.indexOf("=");
				keys[keys.length] = item.substring(1, p);
				values[values.length] = item.substring(p + 1, item.length);
				nextStartPoint = query.indexOf("&", (nextStartPoint + 1));
			}
			item = query.substring(nextStartPoint, query.length);
			p = item.indexOf("=");
			keys[keys.length] = item.substring(1, p);
			values[values.length] = item.substring(p + 1, item.length);
			var value = "";
			for (var i = 0; i < keys.length; i++) {
				if (keys[i] == key) {
					value = values[i];
				}
			}
			return value;

		},

		agentCheck : function(){

			var UserAgent = navigator.userAgent;
			var UserFlag = true;
			if (UserAgent.match(/iPhone|iPad|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) UserFlag = false;

			return UserFlag;

		},

		getPer : function(_Amin,_Amax,_Bmin,_Bmax,_index){

			var value = (_index/(_Bmax-_Bmin))*(_Amax-_Amin)+_Amin;

			return value;

		}

	},

	contents : {

		init : function(){


		}

	},

	form : {
		fileNum : 1,
		fileNum2 : 6,
		textNum : 1,
		init : function(){

			$('.login-wrap').find('.input-cell').each(function(idx){
				var _this = $(this);

				_this.find('input').focusout(function(){
					if(String($(this)[0].value).length > 0){
						$(this).addClass('is-value');
					}else{
						$(this).removeClass('is-value');
					}
				});

			});

		},

		//파일 업로드의 경로값 설정
		inputFile : function(_target){
			var _t = $(_target);
			var _p = _t.parent();
			var _n = _t.val();
			var _d = _t.siblings("input[type='hidden']");
			
			if(_n != ""){
				_d.val("");
				_t.next().val(_n);
			}else{
				_d.val("Y");
				_t.next().val('');
			}
		},

		//파일 업로드 셀 추가
		addInputFile : function (t,num){
			
			//이전 파일 업로드 안되어있으면 생성 안됨.
			var fileCnt = 0;
			var currentFileCnt = 0;
			$(t).parents('.file-parent').find($('input[type=text]')).each(function(){
				currentFileCnt++;
				if($(this).val() != ''){
					fileCnt++;
				}
			});
			
			if(fileCnt == currentFileCnt){
				if(currentFileCnt < parseInt(num)) {
					var _t = $(t);
					var _p = _t.parents('.file-parent');
					
					var _line = ''; 
						_line += '<li class="add-input">';
						_line += '	<div class="add-file">';
						_line += '		<div class="file-input">';
						_line += '			<input type="hidden" dataFile="fileDel" name="file0' + parseInt(this.fileNum + 1) + '_del" id="file0' + parseInt(this.fileNum + 1) + '_del" value=""/>';
						_line += '			<input type="file" dataFile="file" name="file0' + parseInt(this.fileNum + 1) + '" id="f_file'+ parseInt(this.fileNum + 1) +'" class="input-file" onchange="front.form.inputFile(this,event)" title="파일 업로드 찾기">';
						_line += '			<input type="text" dataFile="fileTxt" name="file-name0' + parseInt(this.fileNum + 1) + '" id="fn' + parseInt(this.fileNum + 1) + 'Txt"readonly="" class="read-file" title="업로드된 파일 경로">';
						_line += '			<input type="hidden" dataFile="fileOri" name="file' + parseInt(this.fileNum + 1) + '_orinm" value=""/>';
						_line += '			<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this);front.form.deleteInputFile(this);">파일삭제</a>';
						_line += '			<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>';
						_line += '			<div class="thumb" style="display:none;"><img name="blah" alt="your image" /></div>';
						_line += '		</div>';
						_line += '		<p class="btn-ui">';
						_line += '			<a href="javascript:;" onclick="front.form.addInputFile(this,' + parseInt(num) + ');" class="btn-add"></a>';
						_line += '			<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>';
						_line += '		</p>';
						_line += '	</div>';
						_line += '</li>';

					_p.append(_line);

					this.fileNum++;
				}
			}
			
			$('input[dataFile=file').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileTxt').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileDel').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1)+'_del');
			});
			
			$('input[dataFile=fileOri').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1)+'_orinm');
				
			});
		},

		//파일 업로드 셀 삭제
		deleteInputFile : function(t){
			var _parents = $(t).parents('.file-parent');
			if(_parents.find('> li').length > 1){
				$(t).parents('.add-input').remove();
				this.fileNum--;
			}
			
			$('input[dataFile=file').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileTxt').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileDel').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1)+'_del');
			});
			
			$('input[dataFile=fileOri').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1)+'_orinm');
				
			});
			
		},
		
		//두번째 파일업로드
		//파일 업로드 셀 추가
		addInputFile2 : function (t,num){
			//이전 파일 업로드 안되어있으면 생성 안됨.
			var fileCnt = 0;
			var currentFileCnt = 0;
			console.log(fileCnt);
			console.log(currentFileCnt);
			$(t).parents('.file-parent').find($('input[type=text]')).each(function(){
				currentFileCnt++;
				if($(this).val() != ''){
					fileCnt++;
				}
			});
			
			if(fileCnt == currentFileCnt){
				if(currentFileCnt < parseInt(num)) {
					var _t = $(t);
					var _p = _t.parents('.file-parent');
					
					var _line = ''; 
						_line += '<li class="add-input">';
						_line += '	<div class="add-file">';
						_line += '		<div class="file-input">';
						_line += '			<input type="hidden" dataFile="fileDel2" name="file0' + parseInt(this.fileNum2 + 1) + '_del" id="file0' + parseInt(this.fileNum2 + 1) + '_del" value=""/>';
						_line += '			<input type="file" dataFile="file2" name="file0' + parseInt(this.fileNum2 + 1) + '" id="f_file'+ parseInt(this.fileNum2 + 1) +'" class="input-file" onchange="front.form.inputFile(this,event)" title="파일 업로드 찾기">';
						_line += '			<input type="text" dataFile="fileTxt2" name="file-name0' + parseInt(this.fileNum2 + 1) + '" id="fn' + parseInt(this.fileNum2 + 1) + 'Txt"readonly="" class="read-file" title="업로드된 파일 경로">';
						_line += '			<input type="hidden" dataFile="fileOri2" name="file' + parseInt(this.fileNum2 + 1) + '_orinm" value=""/>';
						_line += '			<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this);front.form.deleteInputFile2(this);">파일삭제</a>';
						_line += '			<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>';
						_line += '			<div class="thumb" style="display:none;"><img name="blah" alt="your image" /></div>';
						_line += '		</div>';
						_line += '		<p class="btn-ui">';
						_line += '			<a href="javascript:;" onclick="front.form.addInputFile2(this,' + parseInt(num) + ');" class="btn-add"></a>';
						_line += '			<a href="javascript:;" onclick="front.form.deleteInputFile2(this);" class="btn-del"></a>';
						_line += '		</p>';
						_line += '	</div>';
						_line += '</li>';

					_p.append(_line);

					this.fileNum2++;
				}
			}
			
			$('input[dataFile=file2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1+5));
			});
			
			$('input[dataFile=fileTxt2').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1+5));
			});
			
			$('input[dataFile=fileDel2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1+5)+'_del');
			});
			
			$('input[dataFile=fileOri2').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1+5)+'_orinm');
				
			});
		},
		
		addInputFile3 : function (t,num){
			//이전 파일 업로드 안되어있으면 생성 안됨.
			var fileCnt = 0;
			var currentFileCnt = 0;
			console.log(fileCnt);
			console.log(currentFileCnt);
			$(t).parents('.file-parent').find($('input[type=text]')).each(function(){
				currentFileCnt++;
				if($(this).val() != ''){
					fileCnt++;
				}
			});
			
			if(fileCnt == currentFileCnt){
				if(currentFileCnt < parseInt(num)) {
					var _t = $(t);
					var _p = _t.parents('.file-parent');
					
					var _line = ''; 
					_line += '<li class="add-input">';
					_line += '	<div class="add-file">';
					_line += '		<div class="file-input">';
					_line += '			<input type="hidden" dataFile="fileDel2" name="file0' + parseInt(this.fileNum2 + 1) + '_del" id="file0' + parseInt(this.fileNum2 + 1) + '_del" value=""/>';
					_line += '			<input type="file" dataFile="file2" name="file0' + parseInt(this.fileNum2 + 1) + '" id="f_file'+ parseInt(this.fileNum2 + 1) +'" class="input-file" onchange="front.form.inputFile(this,event)" title="파일 업로드 찾기">';
					_line += '			<input type="text" dataFile="fileTxt2" name="file-name0' + parseInt(this.fileNum2 + 1) + '" id="fn' + parseInt(this.fileNum2 + 1) + 'Txt"readonly="" class="read-file" title="업로드된 파일 경로">';
					_line += '			<input type="hidden" dataFile="fileOri2" name="file' + parseInt(this.fileNum2 + 1) + '_orinm" value=""/>';
					_line += '			<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this);front.form.deleteInputFile3(this);">파일삭제</a>';
					_line += '			<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>';
					_line += '			<div class="thumb" style="display:none;"><img name="blah" alt="your image" /></div>';
					_line += '		</div>';
					_line += '		<p class="btn-ui">';
					_line += '			<a href="javascript:;" onclick="front.form.addInputFile3(this,' + parseInt(num) + ');" class="btn-add"></a>';
					_line += '			<a href="javascript:;" onclick="front.form.deleteInputFile3(this);" class="btn-del"></a>';
					_line += '		</p>';
					_line += '	</div>';
					_line += '</li>';
					
					_p.append(_line);
					
					this.fileNum2++;
				}
			}
			
			$('input[dataFile=file2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileTxt2').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileDel2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1)+'_del');
			});
			
			$('input[dataFile=fileOri2').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1)+'_orinm');
				
			});
		},

		//파일 업로드 셀 삭제
		deleteInputFile2 : function(t){
			var _parents = $(t).parents('.file-parent');
			if(_parents.find('> li').length > 1){
				$(t).parents('.add-input').remove();
				this.fileNum--;
			}
			
			$('input[dataFile=file2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1+5));
			});
			
			$('input[dataFile=fileTxt2').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1+5));
			});
			
			$('input[dataFile=fileDel2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1+5)+'_del');
			});
			
			$('input[dataFile=fileOri2').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1+5)+'_orinm');
				
			});
			
		},
		
		//파일 업로드 셀 삭제
		deleteInputFile3 : function(t){
			var _parents = $(t).parents('.file-parent');
			if(_parents.find('> li').length > 1){
				$(t).parents('.add-input').remove();
				this.fileNum--;
			}
			
			$('input[dataFile=file2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileTxt2').each(function(i , val){
				$(this).attr('name' , 'file-name0'+ parseInt(i+1));
			});
			
			$('input[dataFile=fileDel2').each(function(i , val){
				$(this).attr('name' , 'file0'+ parseInt(i+1)+'_del');
			});
			
			$('input[dataFile=fileOri2').each(function(i , val){
				$(this).attr('name' , 'file'+parseInt(i+1)+'_orinm');
				
			});
			
		},
		
		//텍스트 입력 셀 삭제
		deleteFileText : function(t){
			var $fileDel = $(t).siblings("input[type='hidden']");
			var $files = $(t).siblings("input[type='file']");
			var $filesTxt = $(t).siblings("input[type='text']");
			var $thumb = $(t).siblings(".thumb");
			
			if ($.browser.msie) { 
				// ie 일때 input[type=file] init. 
				$fileDel.val("Y");
				$files.replaceWith( $files.clone(true) ); 
				$filesTxt.val(""); 
				if(!!$thumb)
					$thumb.remove();
			} else { 
				// other browser 일때 input[type=file] init.
				$fileDel.val("Y");
				$files.val(""); 
				$filesTxt.val(""); 
				if(!!$thumb)
					$thumb.remove();
			}
		},
		
		//텍스트 입력 셀 삭제
		deleteImgFileText : function(t,ele){
			var $files = $(t).siblings("input[type='file']");
			var $filesTxt = $(t).siblings("input[type='text']");
			var $thumb = $(t).siblings(".thumb");
			
			if ($.browser.msie) { 
				// ie 일때 input[type=file] init. 
				$files.replaceWith( $files.clone(true) ); 
				$filesTxt.val("");
				if(!!$thumb)
					$thumb.remove();
			} else { 
				// other browser 일때 input[type=file] init. 
				$files.val(""); 
				$filesTxt.val("");
				if(!!$thumb)
					$thumb.remove();
			}
			
			if(!!ele && $files.attr("name") == ele)
				$files.rules("add", "required");
		},

		//텍스트 입력 셀 추가
		addInputText : function (t){
			//이전 파일 업로드 안되어있으면 생성 안됨.
			var textCnt = 0;
			var currentTextCnt = 0;
			$(t).parents('.file-parent').find($('input[name=price]')).each(function(){
				currentTextCnt++;
				if($(this).val() != ''){
					textCnt++;
				}
			});
			
			if(textCnt == currentTextCnt){
				var _t = $(t);
				var _p = _t.parents('.file-parent');
				var _line = '';
					_line += '<li class="add-input">';
					_line += '	<div class="add-text">';
					_line += '		<div class="row-input-wrap"><input type="hidden" name="useq" id="useq" value="0"/>';
					_line += '			<div><input type="text" name="option" id="option'+this.textNum+'" style="width:150px" class="al-r"><span class="char">/</span></div>';
					_line += '			<div><input type="text" name="price" id="price'+this.textNum+'" style="width:150px" class="al-r" onkeyup="fnOnlyNumber(this);"><span class="char">원</span></div>';
					_line += '		</div>';
					_line += '		<p class="btn-ui">';
					_line += '			<a href="javascript:;" onclick="front.form.addInputText(this);" class="btn-add"></a>';
					_line += '			<a href="javascript:;" onclick="front.form.deleteInputText(this);" class="btn-del"></a>';
					_line += '		</p>';
					_line += '	</div>';
					_line += '</li>';
	
				_p.append(_line);
				this.textNum++;
			}

		},

		//텍스트 입력 셀 삭제
		deleteInputText : function(t){
			var _parents = $(t).parents('.file-parent');
			if(_parents.find('> li').length > 1){
				$(t).parents('.add-input').remove();
				return true;
			} else {
				return false
			}
		},
		
		moveUp : function(el){
			var $tr = $(el).closest('tr'); // 클릭한 버튼이 속한 tr 요소
			$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
		},

		moveDown : function(el){
			var $tr = $(el).closest('tr'); // 클릭한 버튼이 속한 tr 요소
			$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
		},
		
		imageNameCheck : function(fileName){
			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif"){
				alert("이미지 파일은 (jpg, png, gif) 형식만 등록 가능합니다.");
				return false;
			}
			
			return true;
		},

		fileNameCheck : function(fileName){
			fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
			if(fileName != "jpg" && fileName != "png" &&  fileName != "gif"
				&&  fileName != "hwp" &&  fileName != "txt" &&  fileName != "ppt"
					&&  fileName != "pptx" &&  fileName != "doc" &&  fileName != "docx" &&  fileName != "xls" &&  fileName != "pdf" &&  fileName != "zip"){
				alert("첨부 파일은 (jpg, png, gif, hwp, txt, ppt, pptx, doc, docx, xls, pdf, zip) 형식만 등록 가능합니다.");
				return false;
			}
			
			return true;
		}
		
	},

	// 20190509 추가 s
	secItem : {

		init : function(){
			var secItemList = $('.sec-item-list'),
				onBtn = secItemList.find('.on-btn');

			onBtn.on('click' , function(){
				secItemList.toggleClass('on');
				 $('html').toggleClass('fix');
			});

			if($('#dBody').find('.sec-item-list').length > 0){
				$('#dFoot').addClass('mpb');
			}
		}

	},
	// 20190509 추가 e

	pop : {

		init : function(){

			$('.layer-pop-wrap').on("click",function(e) {
				if($(e.target).parents('.pop-data').length == 0) {
					$(this).stop(true).fadeOut(400);
					$('html').removeClass('fix');
				}
			});

		},

		/*==========================================
		/	@ 팝업 오픈
		/	front.pop.open(아이디값) 으로 팝업 오픈
		==========================================*/
		open : function(_id){
			var target = $('#'+_id);
			$('html').addClass('fix');

			target.stop(true).fadeIn(400);
		},

		close : function(_t){

			var _target = $(_t).parents('.layer-pop-wrap');
			_target.stop(true).fadeOut(400);
			$('html').removeClass('fix');

		},

		stepChange : function(_t , _index){
			var _target = $(_t).parents('.layer-pop-wrap');
			_target.find('.pop-data').eq(_index).show().siblings().hide();
		},

		//open window Pop
		windowPopOpen : function(_url , _name , _width , _height){

			window.open(_url, _name , 'width='+_width+'px, height='+_height+'px, top=0, left=0, resizable=yes, scrollbars=yes, location=no,  toolbar=no, status=no, menubar=no');

		}

	}

}
/*===================================
@ init
===================================*/
$(function(){
	front.init();
});


/*===================================
@ document ready
===================================*/
$(document).ready(function () {
	front.ready();
});


/*===================================
@ window load
===================================*/
$(window).load(function () {
	front.load();
});


/*===================================
@ window resize
===================================*/
$(window).resize(function () {
	front.resize();
});


/*===================================
@ window scroll
===================================*/
$(window).scroll(function () {
	front.scroll();
});

jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();
