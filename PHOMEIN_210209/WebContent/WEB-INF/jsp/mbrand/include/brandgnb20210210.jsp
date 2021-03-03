<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="gnb">
		<div class="gnb_head">
			<div class="lang">
				<ul>
					<li class="on"><a href="/mbrand/main/main.do">KOR</a></li>
					<li><a href="/meng/main/main.do" target="_self">ENG</a></li>
					<li><a href="/mjpn/main/main.do" target="_self">JPN</a></li>
				</ul>
			</div>
		</div>
		<div class="gnb_container">
			<div class="inner">
				<nav class="gnb_menu">
					<ul>
						<li>
							<a href="#none">Phomein</a>
							<ul class="gnbs">
								<li><a href="/mbrand/phomein/about.do">브랜드 소개</a></li>
								<li><a href="/mcompany/franchisee/terms.do">가맹 상담</a></li>
								<li><a href="/mbrand/phomein/phoever.do">CSR</a></li>
								<li><a href="/mbrand/phomein/member_ship.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_01.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_02.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_03.do">멤버십</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/mileage_04.do">멤버십</a></li>
								<li><a href="/mbrand/phomein/coupon_01.do">상품권</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/coupon_02.do">상품권</a></li>
								<li style="display:none;"><a href="/mbrand/phomein/coupon_03.do">상품권</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">Menu</a>
							<ul class="ea1 gnbs">
								<li><a href="/mbrand/menu/menu_list.do">포메인</a></li>
								<li><a href="/mbrand/menu/red_menu_list.do">포메인 레드</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">Store</a>
							<ul class="ea1 gnbs">
								<!--<li><a href="/mbrand/store/store_best.do">2018 모범매장</a></li>-->
								<!--<li><a href="/mbrand/store/interview.do">우수매장</a></li>-->
								<li><a href="/mbrand/store/store_list.do">매장찾기</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">Community</a>
							<ul class="gnbs">
								<li><a href="/mbrand/community/notice/community_list.do">공지&언론보도</a></li>
								<li><a href="/mbrand/community/event/community_list.do">EVENT</a></li>
								<li><a href="/mbrand/community/sns/community_list.do">SNS</a></li>
								<li style="display:none;"><a href="/mbrand/community/notice/community_view.do">공지&언론보도</a></li>
								<li style="display:none;"><a href="/mbrand/community/event/community_view.do">EVENT</a></li>
								<li style="display:none;"><a href="/mbrand/community/sns/community_view.do">SNS</a></li>
							</ul>
						</li>
						<!--
						<li>
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
						</li>
						-->
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
