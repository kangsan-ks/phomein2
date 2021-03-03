<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header id="dHead">
		<!-- header_wrap -->
		<div class="header-wrap">
			<div class="inner">
				<h1><a href="/eng/main/main.do">PHOMEIN</a></h1>
				<nav id="gnb">
					<ul>
						<li>
							<a href="/eng/phomein/dailyking.do">PHOMEIN</a>
							<ul>
								<li><a href="/eng/phomein/dailyking.do">DAILYKING</a></li>
								<li><a href="/eng/phomein/about.do">About Phomein</a></li>
								<li><a href="/eng/phomein/ceo.do">CEO</a></li>
								<li><a href="/eng/phomein/greenfood.do">Relief Phomein</a></li>
								<li><a href="/eng/phomein/phoseason.do">PHO SEASON</a></li>
								<li><a href="/eng/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li>
							<a href="/eng/menu/menu_list.do">MENU</a>
							<ul>
								<li><a href="/eng/menu/menu_list.do">Phomein</a></li>
								<li><a href="/eng/menu/red_menu_list.do">Phomein Red</a></li>
							</ul>
						</li>
						<li>
							<a href="/eng/store/store_list.do">STORE</a>
							<ul>
								<li><a href="/eng/store/store_list.do">STORE</a></li>
							</ul>
						</li>
						<li>
							<a href="/eng/community/sns/community_list.do">COMMUNITY</a>
							<ul>
								<li><a href="/eng/community/sns/community_list.do">SNS</a></li>
								<li><a href="/eng/community/cs_terms.do">CS Center</a></li>
								<li style="display:none;"><a href="/eng/community/cs_info.do">CS Center</a></li>
							</ul>
						</li>
						<li>
							<a href="/eng/franchisee/interior.do">FRANCHISE</a>
							<ul>
								<li><a href="/eng/franchisee/interior.do">INTERIOR</a></li>
								<li><a href="/eng/franchisee/terms.do">Counseling Request</a></li>
								<li style="display:none;"><a href="/eng/franchisee/info.do">Counseling Request</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="btn-franchisee">
					<a href="/eng/menu/menu_list.do">MENU VIEW</a>
				</div>
			</div>

			<!-- btn-country -->
			<div class="btn-country">
				<a href="javascript:;">country</a>
				<div class="list">
					<ul>
						<li><a href="/brand/main/main.do">BRAND</a></li>
						<li><a href="/company/main/main.do">FRANCHISE</a></li>
						<li><a href="/jpn/main/main.do">JPN</a></li>
					</ul>
				</div>
			</div>
			<!-- //btn-country -->

			<!-- btn-system -->
			<!--<div class="btn-system">
				<a href="#">포메인 시스템</a>
			</div>-->
			<!-- //btn-system -->
		</div>
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
