<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="lnb">
		<div class="dep dep1">
			<a href="javascript:;" class="nav-title"></a>
			<ul class="dep_list">
				<li id="COMPANY"><a href="/mcompany/company/dailyking.do">회사소개</a></li>
				<li id="RND"><a href="/mcompany/rnd/phoseason.do">연구개발</a></li>
				<li id="FRANCHISEE"><a href="/mcompany/franchisee/status.do">가맹개설정보</a></li>
				<li id="CSR"><a href="/mcompany/csr/phoever.do">사회공헌</a></li>
				<li id="POLICY"><a href="/mcompany/etc/terms.do">POLICY</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">회사소개</a>
			<dd style="display:none;">COMPANY</dd>
			<ul class="dep_list">
				<li><a href="/mcompany/company/dailyking.do">㈜데일리킹</a></li>
				<li><a href="/mcompany/company/phomein.do">포메인</a></li>
				<li><a href="/mcompany/franchisee/mred.do">포메인 RED</a></li>
				<!-- 20190426 메뉴 추가 s -->
				<li><a href="/mcompany/company/ceo.do">CEO</a></li>
				<!-- //20190426 메뉴 추가 e -->
				<!-- <li><a href="/mcompany/company/brownsugar.do">패밀리 브랜드</a></li> -->
				<li><a href="/mcompany/company/location.do">오시는 길</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">연구개발</a>
			<dd style="display:none;">RND</dd>
			<ul class="dep_list">
				<li><a href="/mcompany/rnd/phoseason.do">포시즌</a></li>
				<li><a href="/mcompany/rnd/greenfood.do">현대그린푸드 MOU</a></li>
				<li><a href="/mcompany/rnd/educ.do">전문 교육장</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">가맹개설정보</a>
			<dd style="display:none;">FRANCHISEE</dd>
			<ul class="dep_list">
				<li><a href="/mcompany/franchisee/status.do">가맹 안내</a></li>
				<li style="display:none;"><a href="/mcompany/franchisee/system.do">가맹 안내</a></li>
				<li style="display:none;"><a href="/mcompany/franchisee/step.do">가맹 안내</a></li>
				<!-- <li><a href="/mcompany/franchisee/estimate.do">가맹 비용</a></li> -->
				<li><a href="/mcompany/franchisee/interior.do">인테리어</a></li>
				<li><a href="/mcompany/franchisee/interview.do">우수매장 인터뷰</a></li>
				<li><a href="/mcompany/franchisee/terms.do">가맹 상담 신청</a></li>
				<li style="display:none;"><a href="/mcompany/franchisee/info.do">가맹 상담 신청</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">사회공헌</a>
			<dd style="display:none;">CSR</dd>
			<ul class="dep_list">
				<li><a href="/mcompany/csr/phoever.do">CSR</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">POLICY</a>
			<dd style="display:none;">POLICY</dd>
			<ul class="dep_list">
				<li><a href="/mcompany/etc/terms.do">이용약관</a></li>
				<li><a href="/mcompany/etc/privacy.do">개인정보취급방침</a></li>
				<li><a href="/mcompany/etc/email.do">이메일무단수집거부</a></li>
			</ul>
		</div>
	</div>

	<script>
	$(document).ready(function () {
		var url = $(location).attr("pathname");
		$(".dep2 ul li a").each(function(index) {
			if($(this).attr("href") == url){
				$(this).parent("li").attr("class", "actived"); // depth02 active
				$(this).closest(".dep2").show(); // depth02 show
				var aId = $(this).closest(".dep2").children('a').text();
				$("#"+aId).attr("class", "actived"); // depth01 active
				$(".dep1").children('a').text(aId); // depth01 text
				$(this).closest(".dep2").children('a').text($(this).text()); // depth02 text
			}
		});
	});
	</script>
