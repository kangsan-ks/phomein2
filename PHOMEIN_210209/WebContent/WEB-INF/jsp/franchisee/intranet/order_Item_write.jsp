<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<!doctype html>
<html lang="ko">
<head>
<title>본사 물품 신청 등록 | 인트라넷 | 포메인 가맹점 관리</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>
</head>
<body>

<!-- wrap -->
<div id="wrap">
	<!-- dHead -->
	<header id="dHead">
		<!-- header-wrap -->
		<%@ include file="/WEB-INF/jsp/include/storeheader.jspf"%>
		<!-- //header-wrap -->
	</header>
	<!--// dHead -->


	<!-- dBody -->
	<section id="dBody">
		<!-- lnb -->
		<jsp:include page="/store/include/storelnb.do" />
		<!-- //lnb -->

		<!-- contents -->
		<section id="contents">
			<!-- location -->
			<p class="location">
				<span>인트라넷</span>
				<span>본사 물품 신청</span>
				<span>등록</span>
			</p>
			<!-- //location -->
			<h3 class="con-title">본사 물품 신청</h3>

			<div class="default-cell">
				<h4 class="sub-title">본사 물품 신청 등록</h4>
				<form name="writeForm" id="writeForm" method="post"  enctype="multipart/form-data">
				<input type="hidden" name="cate" id="cate" value="item"/>
				<div class="line-info-list">
					<ul>
						<li>주문 확인 후 평균 3일 이내 배송 됩니다. (주말,공휴일 제외)</li>
						<li>주문 취소는 상품출고전에만 가능합니다.</li>
						<li>교환, 반품, 환불은 상품을 수령하신 날부터 7일 이내 가능합니다. (본사 유선 문의)</li>
						<li>제품 하자 이외의 교환, 반품, 환불은 왕복 배송료 본인 부담입니다.</li>
						<li>결제는 출금 전 결제 내역 문자 안내 후 CMS 자동 출금됩니다. (입금 시 별도 연락 요망. Tel. 1588-2422 대표번호(연결 3번)</li> 
						<li>총 결제 금액이 30,000원 미만일 경우, 택배 발송비 3,500원이 추가됩니다.</li>
						<!-- 						
						<li>주문일로부터 3일 이내 (주말 · 공휴일 제외) 미 입금 시 주문은 취소될 수 있습니다.</li>
						<li>교환, 반품, 환불은 상품을 수령하신 날부터 7일 이내 가능합니다. (본사에 유선으로 문의)</li>
						<li>세금계산서는 입금 확인 후 발행되며 모든 물품은 부가세 포함 가격입니다.</li> -->
					</ul>
				</div>

				<div class="fc01 mb15">* 는 필수입력/선택 항목입니다</div>
				
				<!-- 20190314 수정 s -->
				<div class="order-list-data">
					<ul>
					<c:set var="cnt" value="1"/>
					<c:choose>
						<c:when test="${not empty resultList }" >
						<c:forEach items="${resultList }" var="result" varStatus="status" >
						<li>
							<div class="list-img"><a href="#;"><img src="${result.filename }" alt="제품이미지" onerror="this.src='/asset/images/tmp/@img_300x140.jpg'" /></a></div>
							<div class="info">
								<p class="list-name">${result.title }</p>
								<p class="list-tit"><span>상품</span><span>가격</span><span>수량<strong class="need"></strong></span></p>
								
								<c:forEach var="codeResult" items="${fnc:priceList( result.seq )}"  varStatus="status">
								<p class="list-data">
									<span class="data-tit">${codeResult.options }</span>
									<span class="data-price"><fmt:formatNumber value="${codeResult.price}" pattern="#,###" />원</span>
									<span class="data-num"><input type="number" name="eacnt" id="ea_${codeResult.seq}" value="" data-priceseq="${codeResult.seq}|${codeResult.useq}|${codeResult.price}| ${codeResult.options }" onblur="fnPrice(this);"  placeholder="0" style="width:100px"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /></span>
								</p>
								</c:forEach>
								
							</div>
						</li>
					<c:if test="${(cnt % 3) == 0 }">	
					</ul>
					<ul>
					<c:set var="cnt" value="0"/>
					</c:if>
						
						<c:set var="cnt" value="${cnt + 1}"/>
						</c:forEach>
						</c:when>
					</c:choose>
					</ul>
					<div class="sec-item-list"><!-- 20190509 sec-item-list 클래스 추가 (설명 참고) -->
						<!-- (설명 참고)
						변경전 <div> 상태에서
						변경후 <div class="sec-item-list"> 로 변경
						-->
						<div class="total-list">항목 : <span id="txtUseq">0개</span> / 종류 : <strong id="txtSeq">0개</strong></div>
						<div class="total-sum">총 합계 금액 : <br><span id="txtPrice">0원</span> <strong>(VAT / 배송료 별도)</strong></div>
						<div class="total-sum">최종 출금 예정 금액 : <br><span id="txtPrice1">0원</span>(합계) + <span id="txtVat">0원</span>(VAT)<br> + <span id="txtMove">0원</span>(배송비)<br> : <span id="txtTotalPrice">0원</span></div>
						<!-- <div class="total-sum"><span id="txtOption"></span></div> -->
						<!-- 주문리스트 -->
						<div class="total-data">
							<div class="total-data-area" id="txtOption">
								<p class="tit">
									<span>상품명</span>
									<span>수량</span>
									<span>가격</span>
								</p>
							</div>
						</div>
						<!-- //주문리스트 -->
						<!-- 20190509 추가 s -->
						<a href="#" class="on-btn"></a>
						<!-- //20190509 추가 e -->
					</div>
				</div>
				<!-- //20190314 수정 e -->
				<%-- <div class="table-list-data">
					<table class="list large">
						<caption>디자인 발주 신청 내역 상세 리스트 테이블 표</caption>
						<colgroup>
							<col style="width:350px">
							<col style="width:120px">
							<col style="width:auto">
							<col style="width:260px">
							<col style="width:170px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">이미지</th>
								<th scope="col">항목</th>
								<th scope="col">내용</th>
								<th scope="col">상품종류/가격</th>
								<th scope="col">수량<span class="need"></span></th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty resultList }" >
							<c:forEach items="${resultList }" var="result" varStatus="status" >
							<tr>
								<td>
									<span class="list-img"><img src="${result.filename }" alt="제품이미지" onerror="this.src='/asset/images/tmp/@img_300x140.jpg'" /></span>
								</td>
								<td>${result.title }</td>
								<td>${result.contents }</td>
								
								<td>
									<ul class="order-list">
										<c:set var="cnt" value=""/>
										<c:forEach var="codeResult" items="${fnc:priceList( result.seq )}"  varStatus="status">
										<li>${codeResult.options } / <span> <fmt:formatNumber value="${codeResult.price}" pattern="#,###" />원</span></li>
										<c:set var="cnt" value="${status.count}"/>
										</c:forEach>
									</ul>
								</td>
								<td>
									<ul class="order-list">
										<c:forEach var="codeResult" items="${fnc:priceList( result.seq )}"  varStatus="status">
										<li><input type="text" name="eacnt" id="ea_${codeResult.seq}" value="" data-priceseq="${codeResult.seq}|${codeResult.useq}|${codeResult.price}|${result.title } ${codeResult.options }" onblur="fnPrice(this);"  placeholder="0" style="width:100px"></li>
										</c:forEach>
									</ul>
								</td>								
							</tr>
							</c:forEach>
							</c:when>
						</c:choose>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<div class="total-list">항목 : <span id="txtUseq">0개</span> / 종류 : <strong id="txtSeq">0개</strong></div>
									<div class="total-sum">총 합계 금액 : <span id="txtPrice">0원</span> <strong>(VAT / 배송료 별도)</strong></div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="total-sum">최종 출금 예정 금액 : <span id="txtPrice1">0원</span>(합계) + <span id="txtVat">0원</span>(VAT) + <span id="txtMove">0원</span>(배송비) : <span id="txtTotalPrice">0원</span> </div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="total-sum"><span id="txtOption"></span></div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div> --%>

				<div class="table-list-data">
					<fieldset>
						<legend>본사 물품 신청 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>본사 물품 신청 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr  style="display:none;">
									<th scope="row">입급자명 <span class="need"></span></th>
									<td>
										<input type="text" name="name" id="name" value="${storeSession.name }"  style="width:100%" placeholder="입금자명 입력하세요">
									</td>
								</tr>
								<tr style="display:none;">
									<th scope="row">입금예정일 <span class="need"></span></th>
									<td>
										<div class="input-btns"><p class="date-input"><input type="text" name="paydt" id="paydt" class="datepicker" style="width:130px;" value="<fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" />"></p></div>
									</td>
								</tr>
								<tr style="display:none;">
									<th scope="row">제목 <span class="need"></span></th>
									<td>
										<input type="text" name="title" id="title" style="width:100%" value="물품신청합니다." placeholder="제목을 입력하세요">
									</td>
								</tr>
								<tr style="display:none;">
									<th scope="row">내용</th>
									<td>
										<textarea name="conts" id="conts" placeholder="내용을 입력하세요"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">신청 매장명</th>
									<td>${storeSession.storename }
										<input type="hidden" name="storeseq" id="storeseq" value="${storeSession.store }"/>
										<input type="hidden" name="store" id="store" value="${storeSession.storename }"/>
										<input type="hidden" name="regid" value="${storeSession.adminid }"/>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				
				<input type="hidden" name="buySeq" id="buySeq" value=""/>
				<input type="hidden" name="buyUseq" id="buyUseq" value=""/>
				<input type="hidden" name="buyPrice" id="buyPrice" value=""/>
				
				<input type="hidden" name="productseq" id="productseq" value=""/>
				<input type="hidden" name="detailseq" id="detailseq" value=""/>
				<input type="hidden" name="ea" id="ea" value=""/>
				<input type="hidden" name="gubun" id="gubun" value=""/>
				<input type="hidden" name="kind" id="kind" value=""/>
				
				<input type="hidden" name="totalprice" id="totalprice" value="0"/>
				<input type="hidden" name="orderseq" id="orderseq" value=""/>
				<input type="hidden" name="vat" id="vat" value=""/>
				<input type="hidden" name="movepay" id="movepay" value=""/>
				<input type="hidden" name="price" id="price" value=""/>
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
</div>
<!-- //wrap -->

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


function fnPrice( obj ){
	
	var ev = obj;
	var arrev = new Array();
	arrev = document.writeForm.eacnt;
	
	console.log( "총갯수:"+arrev.length );
	$("#buySeq").val("");
	$("#buyUseq").val("");
	$("#buyPrice").val("");
	$("#productseq").val("");
	$("#detailseq").val("");
	$("#ea").val("");
	$("#totalprice").val("");
	$("#price").val("");
	$("#orderseq").val("");
	$("#txtSeq").html("0개");
	$("#txtUseq").html("0개");
	$("#txtOption").html("");
	$("#txtOption").html("<p class='tit'><span>상품명</span><span>수량</span><span>가격</span></p>");
	
	//var txtSeq = $("#txtSeq").html().replace("개",""); //종류
	var txtSeq = 0; //종류
	var txtSeqTmp = "";
	//var txtUseq = $("#txtUseq").html().replace("개",""); //항목
	var txtUseq = 0;
	var txtUseqTmp = "";
	var txtPrice = $("#txtPrice").html().replace("원","");
	var txtMove = $("#txtMove").html().replace("원","");
	var txtVat = $("#txtVat").html().replace("원","");
	var txtPrice1 = $("#txtPrice1").html().replace("원","");
	var txtTotalPrice = $("#txtTotalPrice").html().replace("원","");
	var move = 0;
	var totalprice1 = 0;
	var totalprice = 0;
	
	for ( i = 0; i < arrev.length; i ++ ){
		console.log( "----------------------------------------");
		if ( arrev[i].value != '' ){
			var e = $("input[name='eacnt']").eq(i).val(); //attr("value")
			var p = $("input[name='eacnt']").eq(i).data("priceseq").toString() ;
			
			if ( parseInt(e) > 0 ){
				var products = p.split("|");
				var seq = products[0];
				var useq = products[1];
				var price = products[2];
				var options = products[3];
				//$("#txtOption").html( $("#txtOption").html() +"<br/>"+ "주문품목 : "+options+" / 수량 : "+e+" ");
				$("#txtOption").html( $("#txtOption").html() +"<p class='data'><span class='tit'>"+ options+" </span><span class='num'> "+e+" </span><span class='price'> " + price + "</span></p>");
				
				var buySeq = $("#buySeq").val();
				var buyUseq = $("#buyUseq").val();
				var buyPrice = $("#buyPrice").val();
				var productseq = $("#productseq").val();
				var detailseq = $("#detailseq").val();
				var ea = $("#ea").val();
				totalprice1 = $("#price").val();
				if ( totalprice1 == "" ){
					totalprice1 = 0;
				}

				if ( buySeq == "" ){
					buySeq = seq;
					buyUseq = useq;
					productseq = seq;
					detailseq = useq;
					buyPrice = price;
					ea = e;
				}else{
					buySeq += ","+seq;
					buyUseq += ","+useq;
					productseq += ","+seq;
					detailseq += ","+useq;
					buyPrice += ","+price;
					ea += ","+e;
				}
				$("#buySeq").val(buySeq);
				$("#buyUseq").val(buyUseq);
				$("#buyPrice").val(buyPrice);
				$("#productseq").val(productseq);
				$("#detailseq").val(detailseq);
				$("#ea").val(ea);
				
				var buySeqArr = buySeq.split(",");
				var buyUseqArr = buyUseq.split(",");
				var txtSeqTmpArr = txtSeqTmp.split(",");
				var txtUseqTmpArr = txtUseqTmp.split(",");
				for ( k = 0; k < buySeqArr.length; k ++ ){
					if ( buySeqArr[k] == seq && txtSeqTmpArr.indexOf(seq) < 0 ){
						txtSeq = parseInt(txtSeq) + parseInt(1);
						$("#txtSeq").html( txtSeq + "개" );
						$("#kind").val( txtSeq );
					}
				}
				for ( k = 0; k < buyUseqArr.length; k ++ ){
					if ( buyUseqArr[k] == useq && txtUseqTmpArr.indexOf(useq) < 0 ){
						txtUseq = parseInt(txtUseq) +  parseInt(1);
						$("#txtUseq").html( txtUseq + "개" );
						$("#gubun").val( txtUseq );
					}
				}
				if ( txtUseq == "" ){
					txtSeqTmp = seq;
					txtUseqTmp = useq;
				}else{
					txtSeqTmp += ","+seq;
					txtUseqTmp += ","+useq;
				}
				
				totalprice1 = parseInt(totalprice1) + ( parseInt(price) * parseInt(e) );
				$("#price").val( totalprice1 );
			}
			//console.log(" buySeq :"+ buySeq +"||"+ seq );
			//console.log(" buyUseq :"+ buyUseq +"||"+ useq );
			//console.log(" buySeq.indexOf(seq) :"+ buySeq.indexOf(seq) );
			//console.log(" buyUseq.indexOf(useq) :"+ buyUseq.indexOf(useq) );
		}//if
	}// for
	var vat = totalprice1 * 0.1;
	if ( parseInt(totalprice1) < 30000 ){
		move = "3500";
	}else{
		move = 0;
	}
	totalprice = parseInt(totalprice1) + parseInt(vat) + parseInt(move);
	$("#totalprice").val(totalprice);
	$("#txtPrice").html( addComma(totalprice1) + "원" );
	$("#txtVat").html( addComma(vat) + "원" );
	$("#txtMove").html( addComma(move) + "원" );
	$("#txtPrice1").html( addComma(totalprice1) + "원" );
	$("#vat").val( vat );
	$("#movepay").val( move );
	$("#txtTotalPrice").html( addComma(totalprice) + "원" );
	
}


$("._addBtn").click(function() {
	
	var obj = "";
	fnPrice( obj );
	
	jQuery.ajaxSettings.traditional = true;
    var frm = $("form[name=writeForm]");
    
    if ( $("#totalprice").val() == "" || $("#totalprice").val() == "0" ){
    	alert("주문 하실 상품을 선택해 주세요.");
    	return;
    }
    
    if ( $("#buySeq").val() == null || $("#buySeq").val() == "" ){
    	alert("주문 하실 상품을 선택해 주세요.");
    	return;
    }
    
    var buyUseq = $("#buyUseq").val();
    if ( buyUseq == 0){
    	alert("제품을 선택해 주세요.");
    	return;
    }
	/*
    var price = $("#buyPrice").val();
    if ( price == 0){
    	alert("제품을 선택해 주세요.");
    	return;
    }
    if( $("#name").val() == "" ){
    	alert("주문 하실 상품을 선택해 주세요.");
    	return;
    }    
    if ( $("input[name='name']").val() == "" ){
    	alert("입금자명을 입력하세요");
    	return;
    }   
    if( $("#paydt").val() == "" ){
    	alert("입금 예정일을 선택해 주세요.");
    	return;
    }

    if( $("#title").val() == "" ){
    	alert("제목을 입력해 주세요.");
    	return;
    }
	*/
	
    var tt = "저장 하시겠습니까?";
    //var cnTemp =  getHTML("conts");
	//frm.find("textarea[name=conts]").val(cnTemp); 
    <c:if test="${not empty result}">
    	var tt = "수정하시겠습니까?"
    </c:if>
    
    var validationChk = fnValidateCheck(frm);
	
	if (!validationChk)	return;
	    
	if (!confirm(tt)) return;
	
	var fnApplyCallback = function(objResponse, statusText, xhr, $from) {
		var obj = JSON.parse( objResponse );
		if (statusText == "success") {
			if (obj["result"] == 'S') {
				alert("주문이 완료 되었습니다.");
				location.replace('./order_item_write.do');
			} else {
				alert("데이터 전송 중 오류가 발생하였습니다.");
			}
		} else { 
			alert("데이터 전송 중 오류가 발생하였습니다 .");
		}
	}

	var options = {
		url : "./design_order_proc.do",
		type : "post",
		dataType : 'json',
		//contentType : false,
		//processData : false,
		success : fnApplyCallback,
		error : function(data, result, resultMsg) {
			alert("데이터 전송 중 오류가 발생하였습니다.");
		}
	};
	frm.ajaxSubmit(options);
});

function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}


function setStoreList(){

	var frm = $("form[name=storeForm]");
	var obj = frm.find("input[name='name']").val();
	var page = 1;
	var params = "pageIndex2=" + page + "&name=" + obj;
    $.ajax({  
        type: "post",
        url : "/admin/site/jsonList.do",
        dataType : "json",
        data : params,
        cache:false,
        error:function ( e ){	                 
        },
        success:function ( jdata, e, a ){
        	var data = JSON.parse( jdata );
			var List = data.list;
			var html = "";
			if (List.length > 0 ) {            	   
	        	for ( var i = 0 ; i < List.length ; i ++  ) {
					html += "<tr>";
					html += "<td class='al-l'>"+List[i].name+"</td>";
					html += "<td class='al-l'>"+List[i].naddr+"</td>";
					html += "<td><p class='radio-type0"+i+" single'><input type='radio' id='r0"+i+"' name='storename' onclick=\"fnchoice('"+List[i].seq+"','"+List[i].name+"');\"><label for='r0"+i+"'><span></span></label></p></td>";
					html += "</tr>";
	        	}
			}else{
					html += "<tr>";
					html += "<td colspan='3'><p class='none-data'>등록된 게시물이 없습니다</p></td>";
					html += "</tr>";
			}
			$("#storeList").html( html );
        },
        complete:function(){  
        }               
         
    });          	
}

function fnchoice(seq, obj){
	$("#storeseq").val( seq );
	$("#store").val( obj );
	front.pop.close('pop-02');
}

function goList(){
	var frm = $("form[name=searchForm]");
	frm.submit();
}


</script>
</body>
</html>
