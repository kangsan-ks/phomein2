<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>관리자관리 | 사이트관리 | 포메인 통합관리자</title>
<%@ include file="/WEB-INF/jsp/include/head.jspf"%>

<script type="text/javascript">
	var fnMainFieldEdit = function() {
		var $frm = $("form[name=editForm]");		
		if ($frm.find('input[name=totalSales]').val() === '') {
			alert('누적 판매량을 입력하세요');
			return false;
		}
		if ($frm.find('input[name=yearCnt]').val() === '') {
			alert('연도를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=totalStore]').val() === '') {
			alert('매장 수를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=revenue]').val() === '') {
			alert('매출액을 입력하세요');
			return false;
		}
		if ($frm.find('input[name=storeBrandDt]').val() === '') {
			alert('매장 수 기준 한국어를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=storeEngDt]').val() === '') {
			alert('매장 수 기준 영어를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=storeJpnDt]').val() === '') {
			alert('매장 수 기준 일본어를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=revenueBrandDt]').val() === '') {
			alert('매출액 기준 한국어를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=revenueEngDt]').val() === '') {
			alert('매출액 기준 영어를 입력하세요');
			return false;
		}
		if ($frm.find('input[name=revenueJpnDt]').val() === '') {
			alert('매출액 기준 일본어를 입력하세요');
			return false;
		}
		
		$frm.ajaxSubmit({
			dataType: 'json',
			success: function(response) {
				var obj = JSON.parse(response);
				if (obj.resultCode === "0002") {
					alert("저장되었습니다.");
					location.replace('./mainFieldView.do');
				} else {
					alert("저장 실패하였습니다.");
				}
			},
			error: function(e) {}
		});
	}
	
	var fnFormReset = function() {
		$("form[name=editForm]")[0].reset();
	};
</script>

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
				<span>사이트관리</span>
				<span>메인 관리</span>
				<span>수정</span>
			</p>
			<!-- //location -->

			<h3 class="con-title border">메인 관리</h3>
			
			<div class="default-cell">
				<h4 class="sub-title">메인 관리 수정<span class="fc01">* 는 필수입력/선택 항목입니다</span></h4>
				<form name="editForm" id="editForm" method="post" action="./mainFieldProc.do">
				<input type="hidden" name="menuCd" value="${ menuCd }"/>
				<div class="table-list-data">
					<fieldset>
						<legend>메인 관리 등록 기본정보 입력 폼</legend>
						<table class="view">
							<caption>메인 관리 등록 기본정보 입력 폼 테이블</caption>
							<colgroup>
								<col style="width:200px">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">누적 판매량 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="totalSales" value="${ mainFieldVO.totalSales }"></td>
								</tr>
								<tr>
									<th scope="row">연도 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="yearCnt" value="${ mainFieldVO.yearCnt }"></td>
								</tr>
								<tr>
									<th scope="row">매장 수 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="totalStore" value="${ mainFieldVO.totalStore }"></td>
								</tr>
								<tr>
									<th scope="row">매출액 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="revenue" value="${ mainFieldVO.revenue }"></td>
								</tr>
								<tr>
									<th scope="row">매장 수 기준<br>한국어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="storeBrandDt" value="${ mainFieldVO.storeBrandDt }"></td>
								</tr>
								<tr>
									<th scope="row">매장 수 기준<br>영어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="storeEngDt" value="${ mainFieldVO.storeEngDt }"></td>
								</tr>
								<tr>
									<th scope="row">매장 수 기준<br>일본어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="storeJpnDt" value="${ mainFieldVO.storeJpnDt }"></td>
								</tr>
								<tr>
									<th scope="row">매출액 기준<br>한국어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="revenueBrandDt" value="${ mainFieldVO.revenueBrandDt }"></td>
								</tr>
								<tr>
									<th scope="row">매출액 기준<br>영어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="revenueEngDt" value="${ mainFieldVO.revenueEngDt }"></td>
								</tr>
								<tr>
									<th scope="row">매출액 기준<br>일본어 <span class="need"></span></th>
									<td><input type="text" style="width:250px" name="revenueJpnDt" value="${ mainFieldVO.revenueJpnDt }"></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>

				<p class="btn-page-wrap">
					<a href="#" class="btn-01 type-03" onclick="fnFormReset();">초기화</a>
					<a href="#" class="btn-01 type-01" onclick="fnMainFieldEdit();">저장</a>
				</p>
				</form>
			</div>
		</section>
		<!-- //contents -->


		<!-- dFoot -->
		<footer id="dFoot"><div class="copy">Copyright ⓒ 2018 DAILYKING INC. All rights reserved.</div></footer>
		<!-- //dFoot -->
	</section>
	<!--// dBody -->
</div>
<script src="/asset/common/js/front_ui.js"></script>
</body>
</html>
