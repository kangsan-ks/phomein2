<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="gnb">
		<div class="gnb_head">
			<div class="lang">
				<ul>
					<li><a href="/mbrand/main/main.do" target="_self">BRAND</a></li>
					<li><a href="/mcompany/main/main.do" target="_self">FRANCHISE</a></li>
<!-- 					<li class="on"><a href="/meng/main/main.do">ENG</a></li> -->
					<li><a href="/mjpn/main/main.do" target="_self">JPN</a></li>
				</ul>
			</div>
		</div>
		<div class="gnb_container">
			<div class="inner">
				<nav class="gnb_menu">
					<ul>
						<li class="on"><!-- 현재 뎁스 표시 : class="on" -->
							<a href="#none">Phomein</a>
							<ul class="gnbs">
								<li><a href="/meng/phomein/dailyking.do">DAILYKING</a></li><!-- 현재 뎁스 표시 : class="on" -->
								<li><a href="/meng/phomein/about.do">About Phomein</a></li>
								<!-- 20190426 메뉴 추가 s -->
								<li><a href="/meng/phomein/ceo.do">CEO</a></li>
								<li><a href="/meng/phomein/greenfood.do">Relief Phomein</a></li>
								<li><a href="/meng/phomein/phoseason.do">PHO SEASON</a></li>
								<!-- //20190426 메뉴 추가 e -->
								<li><a href="/meng/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">MENU</a>
							<ul class="ea1 gnbs">
								<li><a href="/meng/menu/menu_list.do">PHOMEIN</a></li>
								<li><a href="/meng/menu/red_menu_list.do">PHOMEIN RED</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">STORE</a>
							<ul class="ea1 gnbs">
								<li><a href="/meng/store/store_list.do">STORE</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">COMMUNITY</a>
							<ul class="gnbs">
								<li><a href="/meng/community/sns/community_list.do">SNS</a></li>
								<li><a href="/meng/community/cs_terms.do">CS Center</a></li>
								<li style="display:none;"><a href="/meng/community/cs_info.do">CS Center</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">FRANCHISE</a>
							<ul class="gnbs">
								<li><a href="/meng/franchisee/interior.do">INTERIOR</a></li>
								<li><a href="/meng/franchisee/terms.do">Counseling Request</a></li>
								<li style="display:none;"><a href="/meng/franchisee/info.do">Counseling Request</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<button type="button" class="btn_close">
			<span class="blind">Close</span>
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
