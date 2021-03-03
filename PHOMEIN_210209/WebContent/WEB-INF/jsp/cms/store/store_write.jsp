<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>매장관리 | 매장관리 | 포메인 통합관리자</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
</head>
<body>

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<header id="dHead">
		<!-- header-wrap -->
		<%@ include file="/WEB-INF/jsp/include/header.jspf"%>
		<!-- //header-wrap -->
	</header>
	<!--// dHead -->


	<!-- dBody -->
	<section id="dBody">
		<!-- lnb -->
		<jsp:include page="/admin/include/lnb.do" />
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">
			<!-- location -->
			<p class="location">
				<span>매장관리</span>
				<span>매장관리</span>
				<span>등록</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">매장관리</h3>

			<div class="default-cell">
				<h4 class="sub-title">매장 등록<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="searchForm" id="searchForm" method="get" action="./store_list.do" >
					<input type="hidden" name="pageIndex" id="pageIndex" value="${searchVO.pageIndex }" />
					<input type="hidden" name="searchCondition" id="searchCondition" value="" />
					<input type="hidden" name="searchKeyword" id="searchKeyword" value="" />
				</form>
				<form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data" onsubmit="return false" >
				<input type="hidden" name="seq" id="seq" value="${result.seq }" />
				<div class="table-list-data">
					<fieldset>
						<legend>제품 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>제품 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출여부 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0101" name="useyn" value="Y" checked><label for="radio0101"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0102" name="useyn" value="N" ><label for="radio0102"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">오픈상태 <span class="need"></span></th>
									<td>
										<div class="mulity-row-input-wrap">
											<p class="radio-type01"><input type="radio" id="radio0201" name="openstatus" value="N" checked><label for="radio0201"><span></span>오픈예정</label></p>
											<p class="radio-type01"><input type="radio" id="radio0202" name="openstatus" value="Y" ><label for="radio0202"><span></span>영업중</label></p>
											<div class="cell" id="openArea">
												<div class="input-btns">
													 <label for="text0101">오픈예정일 : </label>
													<p class="date-input"><input type="text" name="opendt" id="opendt" class="datepicker" style="width:130px;"></p>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">인테리어 노출 <span class="need"></span></th>
									<td>
										<div class="mulity-check-radio">
											<div><p class="radio-type01"><input type="radio" id="radio0301" name="interior" value="Y" checked><label for="radio0301"><span></span>노출</label></p></div>
											<div><p class="radio-type01"><input type="radio" id="radio0302" name="interior" value="N"  ><label for="radio0302"><span></span>미노출</label></p></div>
										</div>
									</td>
								</tr>
								<tr id="intArea">
									<th scope="row">인테리어사진<br><em class="fc01">(사이즈 x 사이즈)</em><br>(최대 3개 가능)</th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel2" name="file06_del" id="file06_del" value=""/>
														<input type="file" dataFile="file2" name="file06" id="f_file6" class="input-file" value="" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt2" name="file-name06" id="fn6" readonly="" value="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file06');front.form.deleteInputFile2(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<div class="thumb" style="display:none;"></div>
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile2(this,3);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile2(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">매장명 <span class="need"></span></th>
									<td><input type="text" name="name" style="width:100%" placeholder="매장명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">영문 매장명</th>
									<td><input type="text" name="en_name" style="width:100%" placeholder="영문 매장명을 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">우편번호 <span class="need"></span></th>
									<td>
										<div class="address-wrap">
											<p class="zip-code"><input type="text" name="post" id="post" maxlength="6" title="우편번호 입력" readonly><a href="#" onclick="postFind();" class="btn-01 type-03 round">우편번호 검색</a></p>
											<p>* 주소 검색 후 지번 클릭 시 도로명과 지번이 모두 등록됩니다.</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">도로명 <span class="need"></span></th>
									<td><input type="text" name="naddr" id="naddr" style="width:100%" placeholder="" readonly></td>
								</tr>
								<tr>
									<th scope="row">지번 <span class="need"></span></th>
									<td><input type="text" name="oaddr" id="oaddr" style="width:100%" placeholder="" readonly></td>
								</tr>
								<tr>
									<th scope="row">상세 주소 <span class="need"></span></th>
									<td><input type="text" name="daddr" id="daddr" style="width:100%" placeholder="상세 주소를 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">영문 대표주소</th>
									<td><input type="text" name="enaddr" id="enaddr" style="width:100%" placeholder="영문 대표주소를 입력하세요"></td>
								</tr>
								<tr>
									<th scope="row">위도/경도 <span class="need"></span></th>
									<td>
										<div class="label-input-mulity">
											<p class="label-input">
												<label for="text0201">위도 : </label>
												<input type="text" name="lat" id="lat" style="width:150px" >
											</p>
											<p class="label-input">
												<label for="text0202">경도 : </label>
												<input type="text" name="longi" id="longi" style="width:150px" >
											</p>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">전화번호 <span class="need"></span></th>
									<td>
										<div class="phone-wrap">
											<div class="first">
												<select title="휴대폰 첫번재 4자리 선택" name="hp1">
													<c:forEach var="codeResult" items="${ fnc:codeListSub('113') }" varStatus="status">
													<option value="<c:out value="${codeResult.name}"/>"><c:out value="${codeResult.name}"/></option>
													</c:forEach>
													<!-- <option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option> -->
												</select>
											</div>
											<div class="second"><input type="text" name="hp2" maxlength="4" title="휴대폰 두번째 4자리 입력"></div>
											<div class="three"><input type="text" name="hp3" maxlength="4" title="휴대폰 세번째 4자리 입력"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">영업시간</th>
									<td>
										<div class="row-input-wrap">
											<!-- <div class="date-input-wrap">
												<div class="cell"><p class="date-input"><input type="text" name="bhours" id="bhours" class="datepicker"></p></div>
											</div> -->
											<div>
												<select style="width:100px" name="bh1">
													<option value="01">01시</option>
													<option value="02">02시</option>
													<option value="03">03시</option>
													<option value="04">04시</option>
													<option value="05">05시</option>
													<option value="06">06시</option>
													<option value="07">07시</option>
													<option value="08">08시</option>
													<option value="09">09시</option>
													<option value="10">10시</option>
													<option value="11">11시</option>
													<option value="12">12시</option>
													<option value="13">13시</option>
													<option value="14">14시</option>
													<option value="15">15시</option>
													<option value="16">16시</option>
													<option value="17">17시</option>
													<option value="18">18시</option>
													<option value="19">19시</option>
													<option value="20">20시</option>
													<option value="21">21시</option>
													<option value="22">22시</option>
													<option value="23">23시</option>
													<option value="24">24시</option>
												</select>
											</div>
											<div>
												<select style="width:100px" name="bh2">
													<option value="00">00분</option>
													<option value="10">10분</option>
													<option value="20">20분</option>
													<option value="30">30분</option>
												</select>
											</div>
											<div class="ico-bar01"></div>
											<!-- <div class="date-input-wrap">
												<div class="cell"><p class="date-input"><input type="text" name="bhoure" id="bhoure" class="datepicker"></p></div>
											</div> -->
											<div>
												<select style="width:100px" name="bh3">
													<option value="01">01시</option>
													<option value="02">02시</option>
													<option value="03">03시</option>
													<option value="04">04시</option>
													<option value="05">05시</option>
													<option value="06">06시</option>
													<option value="07">07시</option>
													<option value="08">08시</option>
													<option value="09">09시</option>
													<option value="10">10시</option>
													<option value="11">11시</option>
													<option value="12">12시</option>
													<option value="13">13시</option>
													<option value="14">14시</option>
													<option value="15">15시</option>
													<option value="16">16시</option>
													<option value="17">17시</option>
													<option value="18">18시</option>
													<option value="19">19시</option>
													<option value="20">20시</option>
													<option value="21">21시</option>
													<option value="22">22시</option>
													<option value="23">23시</option>
													<option value="24">24시</option>
												</select>
											</div>
											<div>
												<select style="width:100px" name="bh4">
													<option value="00">00분</option>
													<option value="10">10분</option>
													<option value="20">20분</option>
													<option value="30">30분</option>
												</select>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">교통편 </th>
									<td>
										<input type="hidden" name="busyn" />
										<input type="hidden" name="subyn" />
										<div><p class="check-type01"><input type="checkbox" id="ck01" name="busynChk"/> <label for="ck01"><span></span>버스 안내 노출</label> </p></div>
										<p class="label-textarea">
											<label for="textarea01">버스 : </label>
											<textarea name="businfo" id="businfo" placeholder="버스 노선을 입력해주세요"></textarea>
										</p>
										<div><p class="check-type01"><input type="checkbox" id="ck02" name="subynChk"/> <label for="ck02"><span></span>지하철 안내 노출</label> </p></div>
										<p class="label-textarea">
											<label for="textarea02">지하철 : </label>
											<textarea name="subinfo" id="subinfo" placeholder="지하철 노선을 입력해주세요"></textarea>
										</p>
										
									</td>
								</tr>
								<tr>
									<th scope="row">부가옵션 </th>
									<td>
										<div class="mulity-check-radio"><input type="hidden" name="option1"  id="option1" value=""/>
											<c:forEach var="codeResult" items="${ fnc:codeListSub('106') }" varStatus="status">
												<div><p class="check-type01"><input type="checkbox" id="check010${status.count}" name="options" value="${codeResult.code}" ><label for="check010${status.count}"><span></span>${codeResult.name}</label></p></div>
											</c:forEach>
											<!-- 
											<div><p class="check-type01"><input type="checkbox" id="check0101" name="option1" value="Y" checked><label for="check0101"><span></span>딜리버리</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0102" name="option2" value="Y"><label for="check0102"><span></span>우수매장</label></p></div>
											<div><p class="check-type01"><input type="checkbox" id="check0103" name="option3" value="Y"><label for="check0103"><span></span>주차여부</label></p></div>
											 -->
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">매장사진<br><em class="fc01">(사이즈 x 사이즈)</em><br>(최대 5개 가능)</th>
									<td>
										<ul class="file-parent" style="width:700px">
											<li class="add-input">
												<div class="add-file">
													<div class="file-input">
														<input type="hidden" dataFile="fileDel" name="file01_del" id="file01_del" value=""/>
														<input type="file" dataFile="file" name="file01" id="f_file1" class="input-file" value="" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" dataFile="fileTxt" name="file-name01" id="fn1" readonly="" value="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file01');front.form.deleteInputFile(this);">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a>
														<div class="thumb" style="display:none;"></div>
														<!-- <input type="hidden" name="file01_del" id="file01_del" value=""/>
														<input type="file" name="file01" id="f01" class="input-file" onchange="front.form.inputFile(this)" title="파일 업로드 찾기">
														<input type="text" name="file-name01" id="fn01" readonly="" placeholder="" class="read-file" title="업로드된 파일 경로">
														<a href="javascript:;" class="btn-close" onclick="front.form.deleteFileText(this,'file01')">파일삭제</a>
														<a href="javascript:;" class="btn-01 type-03 round">찾아보기</a> -->
													</div>
													<p class="btn-ui">
														<a href="javascript:;" onclick="front.form.addInputFile(this,5);" class="btn-add"></a>
														<a href="javascript:;" onclick="front.form.deleteInputFile(this);" class="btn-del"></a>
													</p>
												</div>
											</li>
										</ul>
										<span class="input-block-info">- 5MB 이하 / jpg, png, gif 만 등록 가능</span>
									</td>
								</tr>
								<tr>
									<th scope="row">작성 </th>
									<td>${adminSession.adminid }</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>
				</form>
				
				<p class="btn-page-wrap">
					<a href="#" onclick="goList();" class="btn-01 type-02">목록</a>
					<a href="#" class="btn-01 type-01 _addBtn">저장</a>
				</p>
			</div>

		</section>
		<!-- //contents -->

		<!-- dFoot -->
		<footer id="dFoot"><div class="copy">Copyright ⓒ 2018 DAILYKING INC. All rights reserved.</div></footer>
		<!-- //dFoot -->

	</section>
	<!--// dBody -->

	<!-- @ 제품조회 팝업 -->
	<!-- layer-pop-wrap -->
	<article id="pop-01" class="layer-pop-wrap">
		<div class="layer-pop-parent">
			<div class="layer-pop-children">

				<div class="pop-data">
					<h2>제품조회</h2>
					<div class="pop-con">

						<div class="default-cell">
							<h3 class="con-title">제품조회<span class="fc01">* 는 필수입력/선택 항목입니다</span></h3>
							<div class="table-list-data">
								<fieldset>
									<legend>제품 입력 폼</legend>
									<table class="view">
										<caption>제품 기본정보 입력 폼 테이블</caption>
										<colgroup>
											<col style="width:160px">
											<col style="width:auto">
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">제품명 <span class="need"></span></th>
												<td>
													<input type="text" name="" id="" placeholder="검색할 내용을 입력하세요" style="width:100%">
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
								<p class="btn-page-wrap">
									<a href="#" class="btn-01 type-01">검색</a>
								</p>
							</div>

						</div>

						<div class="default-cell">
							<div class="table-list-data">
								<table class="list">
									<caption>리스트 테이블 표</caption>
									<colgroup>
										<col style="width:200px">
										<col style="width:auto">
										<col style="width:120px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">제품코드</th>
											<th scope="col">제품명</th>
											<th scope="col">선택</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제품코드</td>
											<td class="al-l">제목은 좌측정렬</td>
											<td><p class="radio-type01 single"><input type="radio" id="r0201" name="r0201"><label for="r0201"><span></span></label></p></td>
										</tr>
										<tr>
											<td>제품코드</td>
											<td class="al-l">제목은 좌측정렬</td>
											<td><p class="radio-type01 single"><input type="radio" id="r0202" name="r0201"><label for="r0202"><span></span></label></p></td>
										</tr>
										<tr>
											<td>제품코드</td>
											<td class="al-l">제목은 좌측정렬</td>
											<td><p class="radio-type01 single"><input type="radio" id="r0203" name="r0201"><label for="r0203"><span></span></label></p></td>
										</tr>
										<tr>
											<td colspan="3"><p class="none-data">등록된 게시물이 없습니다</p></td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="paging-wrap">
								<div class="paging">
									<a href=""><img src="/asset/images/util/paging_first.png" alt="첫번째 목록으로 이동"></a>
									<a href=""><img src="/asset/images/util/paging_prev.png" alt="이전 목록으로 이동"></a>
									<p>
										<a href="">1</a>
										<a href="" class="on">2</a>
										<a href="">3</a>
										<a href="">4</a>
										<a href="">5</a>
										<a href="">6</a>
										<a href="">7</a>
										<a href="">8</a>
										<a href="">9</a>
										<a href="">10</a>
									</p>
									<a href=""><img src="/asset/images/util/paging_next.png" alt="다음 목록으로 이동"></a>
									<a href=""><img src="/asset/images/util/paging_last.png" alt="마지막 목록으로 이동"></a>
								</div>
							</div>
						</div>

					</div>
	
					<div class="pop-bottom">
						<div class="btn-page-wrap al-c">
							<a href="#" class="btn-01 type-02">닫기</a>
							<a href="#" class="btn-01 type-01">확인</a>
						</div>
					</div>

					<a href="#pop-close" onclick="front.pop.close(this);" class="btn-pop-close"></a>
				</div>

			</div>
		</div>
	</article>
	<!-- layer-pop-wrap -->
	<!-- //@ 제품조회 팝업 -->

</div>
<!-- //wrap -->
<div id="map" style="width:0px; height:0px;""></div>
<script src="/asset/common/js/front_ui.js"></script>
<script>
$(function(){
	$(".datepicker").datepicker({
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
		yearSuffix: '년'
	});
});

function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39bba2b31d9341f502bf5e9708bdc18d&libraries=services,clusterer,drawing"></script>
<script>
function postFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("naddr").value = roadAddr;
            document.getElementById("oaddr").value = data.jibunAddress;
            
            start_order_lat_non(roadAddr);
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("daddr").value = extraRoadAddr;
            } else {
                document.getElementById("daddr").value = '';
            }
			
            document.getElementById('enaddr').value = data.roadAddressEnglish;
            
            /*
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
            */
        }
    }).open();
    
}    

function start_order_lat_non(from_addr) {
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    // 지도를 생성합니다
    var map = new daum.maps.Map(mapContainer, mapOption);
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new daum.maps.services.Geocoder();
    var address_start = from_addr;
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(address_start, function(result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
            //console.log("1.다음지도====="+result[0].y); /// 위도
            //console.log("2.다음지도====="+result[0].x); /// 경도
            $("#lat").val(result[0].y);  //order_start_lat 필드에 위도 값 저장
            $("#longi").val(result[0].x);  //order_start_lon 필드에 경도 값 저장
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new daum.maps.InfoWindow({
                //content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
            });
            infowindow.open(map, marker);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });
}


$("._addBtn").click(function() {
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    var tt = "등록하시겠습니까?";
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>

   	if($("input[name='useyn']:checked").val() == undefined || $("input[name='useyn']:checked").val() == 'undefined'){
   		alert("노출여부를 선택해주세요.");
   		return;
   	}
   	
	if($("input[name='openstatus']:checked").val() == undefined || $("input[name='openstatus']:checked").val() == 'undefined'){
		alert("오픈상태를 선택해주세요.");
		return;
	}
	
	if($("input[name='interior']:checked").val() == undefined || $("input[name='interior']:checked").val() == 'undefined'){
		alert("인테리어노출을 선택해주세요.");
		return;
	}
	
   	var st = $(":input:radio[name=openstatus]:checked").val();
    if ( st == "N" )	{
    	if ( $("input[name='opendt']").val() == "" ){
    		alert("오픈예정일을 입력해 주세요");
    		return;
    	}
    }
    if ( $("input[name='name']").val() == "" ){
    	alert("매장명을 입력하세요");
    	return;
    }
    if ( $("input[name='post']").val() == "" ){
    	alert("우편번호 검색을 통하여 우편번호를 입력하세요");
    	return;
    }
    if ( $("input[name='naddr']").val() == "" ){
    	alert("우편번호 검색을 통하여 주소를 입력하세요");
    	return;
    }
    if ( $("input[name='daddr']").val() == "" ){
    	alert("우편번호 검색을 통하여 상세 주소를 입력하세요");
    	return;
    }
    if ( $("input[name='lat']").val() == "" ){
    	alert("우편번호 검색을 통하여 위도정보를 입력하세요");
    	return;
    }
    if ( $("input[name='longi']").val() == "" ){
    	alert("우편번호 검색을 통하여 경도정보를 입력하세요");
    	return;
    }
    if ( $("input[name='hp2']").val() == "" &&  $("input[name='hp3']").val() == ""  ){
    	alert("전화번호를 입력하세요");
    	return;
    }
    

   	if($("input[name=file-name01]").val() != '' && $("input[name=file-name01]").val() != undefined){
		var fileName = $("input[name=file-name01]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name02]").val() != '' && $("input[name=file-name02]").val() != undefined){
		var fileName = $("input[name=file-name02]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}

   	if($("input[name=file-name03]").val() != '' && $("input[name=file-name03]").val() != undefined){
		var fileName = $("input[name=file-name03]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name04]").val() != '' && $("input[name=file-name04]").val() != undefined){
		var fileName = $("input[name=file-name04]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name05]").val() != '' && $("input[name=file-name05]").val() != undefined){
		var fileName = $("input[name=file-name05]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name06]").val() != '' && $("input[name=file-name06]").val() != undefined){
		var fileName = $("input[name=file-name06]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name07]").val() != '' && $("input[name=file-name07]").val() != undefined){
		var fileName = $("input[name=file-name07]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
   	
   	if($("input[name=file-name08]").val() != '' && $("input[name=file-name08]").val() != undefined){
		var fileName = $("input[name=file-name08]").val();
   		if(!imageNameCheck(fileName)){
   			return;
   		}
   	}
    
	var menuValue = [];        
    $.each($("input[name='options']:checked"), function(){                    
    	menuValue.push($(this).val());
    	document.getElementById("option1").value=menuValue;
    });
    
    if ($('input[name=busynChk]').is(":checked")) {
    	$('input[name=busyn]').val('Y');
    } else {
    	$('input[name=busyn]').val('N');
    }
    
    if ($('input[name=subynChk]').is(':checked')) {
    	$('input[name=subyn]').val('Y');
    } else {
    	$('input[name=subyn]').val('N');
    }
    
    var validationChk = fnValidateCheck(frm);
	
	if (!validationChk)	return;
	    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("정상적으로 등록 되었습니다.");
				fnPage('./store_list.do');
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./store_proc.do",
		type : "post",
		dataType : 'json',
		contentType : false,
		processData : false,
		success : fnApplyCallback,
		error : function(data, result, resultMsg) {
			alert("데이터 전송 중 오류가 발생하였습니다.");
		}
	};
	frm.ajaxSubmit(options);
});



    $("#radio0201").click(function(){
    	var rk = $(this).is(":checked");
    	if(rk){ 
    		$("#openArea").css("display","block");
    	}
    });
    $("#radio0202").click(function(){
    	var rk = $(this).is(":checked");
    	if(rk){ 
    		$("#openArea").css("display","none");
    	}
    });
    
    
    $("#radio0301").click(function(){
    	var rk = $(this).is(":checked");
    	if(rk){ 
    		$("#intArea").css("display","table-row");
    	}
    });
    $("#radio0302").click(function(){
    	var rk = $(this).is(":checked");
    	if(rk){ 
    		$("#intArea").css("display","none");
    	}
    });    
    
	
</script>
</body>
</html>
