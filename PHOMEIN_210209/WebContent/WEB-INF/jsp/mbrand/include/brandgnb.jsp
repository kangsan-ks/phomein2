<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="gnb">
		<div class="gnb_head">
			<!-- <div class="lang">
				<ul>
					<li class="on"><a href="/mbrand/main/main.do">KOR</a></li>
					<li><a href="/meng/main/main.do" target="_self">ENG</a></li>
					<li><a href="/mjpn/main/main.do" target="_self">JPN</a></li>
				</ul>
			</div> -->
		</div>
		<div class="gnb_container">
			<div class="inner">
				<nav class="gnb_menu">
					<ul>
						<li>
							<a href="#none">COMPANY</a>
							<ul class="gnbs">
								<li><a href="/mcompany/company/dailyking.do">(주)데일리킹</a></li>
								<li><a href="/mcompany/rnd/phoseason.do">PHOSEASON INC.</a></li>
								<li><a href="/mcompany/company/ceo.do">CEO 인사말</a></li>
								<li><a href="/mcompany/rnd/greenfood.do">현대그린푸드 MOU</a></li>
								<li><a href="/mcompany/csr/phoever.do">사회공헌활동</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">BRAND</a>
							<ul class="ea1 gnbs">
								<li><a href="/mcompany/company/phomein.do">포메인</a></li>
								<li><a href="/mcompany/franchisee/red.do">포메인 레드</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">MENU</a>
							<ul class="ea1 gnbs">
								<li><a href="/mbrand/menu/menu_list.do">메뉴</a></li>
								<li style="display: none;"><a href="/mbrand/menu/red_menu_list.do">메뉴</a></li>
								<li><a href="/mcompany/franchisee/rice.do">국내유일 햅쌀면</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">STORE</a>
							<ul class="ea1 gnbs">
								<li><a href="/mbrand/store/store_list.do">매장찾기</a></li>
								<li><a href="/mcompany/franchisee/delivery.do">딜리버리 서비스</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">FRANCHISE</a>
							<ul class="gnbs">
								<li><a href="/mcompany/franchisee/step01.do">가맹 안내</a></li>
								<li style="display:none;"><a href="/mcompany/franchisee/step02.do">가맹 안내</a></li>
								<li style="display:none;"><a href="/mcompany/franchisee/step03.do">가맹 안내</a></li>
								<li><a href="/mcompany/franchisee/terms.do">가맹 상담 신청</a></li>
								<li style="display:none;"><a href="/mcompany/franchisee/info.do">가맹 상담 신청</a></li>
								<li><a href="/mcompany/rnd/educ.do">교육시스템</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">COMMUNITY</a>
							<ul class="gnbs">
								<li><a href="/mbrand/community/sns/community_list.do?cate=109203">인스타그램</a></li>
								<li><a href="/mbrand/community/sns/community_list.do?cate=109204">블로그</a></li>
								<li><a href="/mbrand/community/sns/community_list.do?cate=109205">유튜브</a></li>
								<li><a href="/mbrand/community/notice/community_list.do">공지 & 언론보도</a></li>
								<li><a href="/mbrand/phomein/coupon_01.do">상품권</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/coupon_02.do">상품권</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/coupon_03.do">상품권</a></li>
								<li><a href="/mbrand/phomein/member_ship.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_01.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_02.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_03.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_04.do">멤버십</a></li>
							</ul>
						</li>
						<!-- <li>
							<a href="#none">CS CENTER</a>
							<ul class="ea1 gnbs">
								<li><a href="/mbrand/cs_center/cs_terms.do">고객의 소리</a></li>
								<li style="display:none;"><a href="/mbrand/cs_center/cs_info.do">고객의 소리</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">POLICY</a>
							<ul class="gnbs">
								<li><a href="/mbrand/etc/terms.do">이용약관</a></li>
								<li><a href="/mbrand/etc/privacy.do">개인정보취급방침</a></li>
								<li><a href="/mbrand/etc/email.do">이메일무단수집거부</a></li>
							</ul>
						</li> -->
					</ul>
				</nav>
				<!-- <div class="banner">
					<ul>
						<li><a href="#none"><img src="../common/images/layout/banner_gnb_1.jpg" alt="BEST MENU 포메인 쌀국수"></a></li>
					</ul>
				</div> -->
			</div>
		</div>
		<button type="button" class="btn_close">
			<span class="blind">전체메뉴 닫기</span>
		</button>
	</div>

	<script>
	$(document).ready(function () {
		var url = $(location).attr("pathname");
		
		function getParameter(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		//console.log(url);
		var params_name = getParameter("cate");
		console.log(params_name);
		if(url.indexOf('/sns/community_list') != -1){
			url = url+'?cate='+params_name;
		}
		
		$('.gnb_menu ul li').removeClass("on"); // depth01 all active remove
		$('.gnbs li').removeClass("on"); // depth02 all active remove

		$('.gnbs li a').each(function(index) {
			if($(this).attr("href") == url){
				var $text = $(this).text();
				$(this).closest('.gnbs').find("li a").each(function(){
					if($text== $(this).text()) {
						$(this).parent("li").attr("class", "on"); // depth02 active
						$(this).closest('.gnbs').parent("li").attr("class", "on"); // depth01 active
						return false;
					}
				});
			}
		});
	});
	</script>
