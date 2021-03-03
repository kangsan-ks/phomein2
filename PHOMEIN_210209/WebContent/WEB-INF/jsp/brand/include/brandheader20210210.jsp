<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header id="dHead">
		<!-- header_wrap -->
		<div class="header-wrap">
			<div class="inner">
				<h1><a href="/brand/main/main.do">PHOMEIN</a></h1>
				<nav id="gnb">
					<ul>
						<li>
							<a href="/brand/phomein/about.do">PHOMEIN</a>
							<ul>
								<li><a href="/brand/phomein/about.do">브랜드 소개</a></li>
								<li><a href="/company/franchisee/terms.do">가맹 상담</a></li>
								<li><a href="/brand/phomein/phoever.do">CSR</a></li>
								<li><a href="/brand/phomein/member_ship.do">멤버십</a></li>
								<li style="display:none;"><a href="/brand/phomein/mileage_01.do">멤버십</a></li>
								<li style="display:none;"><a href="/brand/phomein/mileage_02.do">멤버십</a></li>
								<li style="display:none;"><a href="/brand/phomein/mileage_03.do">멤버십</a></li>
								<li style="display:none;"><a href="/brand/phomein/mileage_04.do">멤버십</a></li>
								<li><a href="/brand/phomein/coupon_01.do">상품권</a></li>
								<li style="display:none;"><a href="/brand/phomein/coupon_02.do">상품권</a></li>
								<li style="display:none;"><a href="/brand/phomein/coupon_03.do">상품권</a></li>
							</ul>
						</li>
						<li>
							<a href="/brand/menu/menu_list.do">MENU</a>
							<ul>
								<li><a href="/brand/menu/menu_list.do">포메인</a></li>
								<li><a href="/brand/menu/red_menu_list.do">포메인 레드</a></li>
							</ul>
						</li>
						<li>
							<a href="/brand/store/store_list.do">STORE</a>
							<ul>
								<!--<li><a href="/brand/store/store_best.do">2018 모범매장</a></li>-->
								<!--<li><a href="/brand/store/interview.do">우수매장</a></li>-->
								<li><a href="/brand/store/store_list.do">매장찾기</a></li>
							</ul>
						</li>
						<li>
							<a href="/brand/community/notice/community_list.do">COMMUNITY</a>
							<ul>
								<li><a href="/brand/community/notice/community_list.do">공지 & 언론보도</a></li>
								<li><a href="/brand/community/event/community_list.do">EVENT</a></li>
								<li><a href="/brand/community/sns/community_list.do">SNS</a></li>
								<li style="display:none;"><a href="/brand/community/notice/community_view.do">공지 & 언론보도</a></li>
								<li style="display:none;"><a href="/brand/community/event/community_view.do">EVENT</a></li>
								<li style="display:none;"><a href="/brand/community/sns/community_view.do">SNS</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="btn-franchisee">
					<a href="/brand/main/main.do" target="_self">브랜드 사이트</a>
					<a href="/company/main/main.do" target="_self">기업 사이트</a>
				</div>
				<div class="btn-system2">
				<a href="/admin/login.do">포메인 시스템</a>
			</div>
			</div>
			<!-- btn-country -->
			<div class="btn-country">
				<a href="javascript:;">country</a>
				<div class="list">
					<ul>
						<li><a href="/brand/main/main.do">KOR</a></li>
						<li><a href="/eng/main/main.do">ENG</a></li>
						<li><a href="/jpn/main/main.do">JPN</a></li>
					</ul>
				</div>
			</div>
			<!-- //btn-country -->

			<div class="btn-system">
				<a href="/admin/login.do">포메인 시스템</a>
			</div>
		</div>
		<!-- //header_wrap -->
	</header>

	<script>
	$(document).ready(function () {
		var url = $(location).attr("pathname");
		$("#gnb ul li ul li a").each(function(index) {
			var $this = $(this);

			if($this.attr("href") == url){ // dailyking.do
				if($this.parent("li").css("display") == "none") {
					var $text = $this.text();
					$this.parent("li").parent("ul").find("li a").each(function(index) {
						if($text == $(this).text()) {
							$(this).parent("li").attr("class", "actived");
							return false;
						}
					});
				} else {
					$this.parent("li").attr("class", "actived");
				}
			}
		});
	});
	</script>

<style>
#resizable
{
    border: 0px;
    width: 100px;
    height: 300px;
    z-index: 1000;
    right: 130px;
    top: 32%;    
    position:fixed;
    background-color: transparent;
}
</style>
<div id="resizable" class="ui-widget-content" style="z-index: 1001;">
	<a href="/company/main/main.do"><img style="margin-bottom:10px;" src="/brand/images/icon/right_fixed_ico01.png"></a>
	<a href="/company/franchisee/red.do"><img style="margin-bottom:10px;" src="/brand/images/icon/right_fixed_ico02.png"></a>
	<a href="/company/franchisee/terms.do"><img src="/brand/images/icon/right_fixed_ico03.png"></a>
</div>
	