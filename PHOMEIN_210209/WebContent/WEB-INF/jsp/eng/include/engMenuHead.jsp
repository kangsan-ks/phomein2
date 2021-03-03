<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- location-menu -->
		<div class="location-menu">
			<div class="inner">
				<a href="/eng/main/main.do" class="btn-home"></a>
				<!-- nav -->
				<div class="nav">
					<ul>
						<li class="depth01">
							<a href="javascript:;" class="nav-title"></a>
							<ul class="nav-list">
								<li id="PHOMEIN"><a href="/eng/phomein/dailyking.do">PHOMEIN</a></li>
								<li id="MENU"><a href="/eng/menu/menu_list.do">MENU</a></li>
								<li id="STORE"><a href="/eng/store/store_list.do">STORE</a></li>
								<li id="COMMUNITY"><a href="#">COMMUNITY</a></li>
								<li id="FRANCHISE"><a href="/eng/franchisee/interior.do">FRANCHISE</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">PHOMEIN</a>
							<dd style="display:none;">PHOMEIN</dd>
							<ul class="nav-list">
								<li><a href="/eng/phomein/dailyking.do">DAILYKING</a></li>
								<li><a href="/eng/phomein/about.do">About Phomein</a></li>
								<!-- 20190426 메뉴 추가 s -->
								<li><a href="/eng/phomein/ceo.do">CEO</a></li>
								<li><a href="/eng/phomein/greenfood.do">Relief Phomein</a></li>
								<li><a href="/eng/phomein/phoseason.do">PHO SEASON</a></li>
								 <!-- //20190426 메뉴 추가 e -->
								<li><a href="/eng/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">MENU</a>
							<dd style="display:none;">MENU</dd>
							<ul class="nav-list">
								<li><a href="/eng/menu/menu_list.do">PHOMEIN</a></li>
								<li><a href="/eng/menu/red_menu_list.do">PHOMEIN RED</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">STORE</a>
							<dd style="display:none;">STORE</dd>
							<ul class="nav-list">
								<li><a href="/eng/store/store_list.do">STORE</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">COMMUNITY</a>
							<dd style="display:none;">COMMUNITY</dd>
							<ul class="nav-list">
								<li><a href="/eng/community/sns/community_list.do">SNS</a></li>
								<li><a href="/eng/community/cs_terms.do">CS Center</a></li>
								<li style="display:none;"><a href="/eng/community/cs_info.do">CS Center</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">FRANCHISE</a>
							<dd style="display:none;">FRANCHISE</dd>
							<ul class="nav-list">
								<li><a href="/eng/franchisee/interior.do">INTERIOR</a></li>
								<li><a href="/eng/franchisee/terms.do">Counseling Request</a></li>
								<li style="display:none;"><a href="/eng/franchisee/info.do">Counseling Request</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- //nav -->
			</div>
		</div>
		<!-- //location-menu -->

	<script>
	$(document).ready(function () {
		var url = $(location).attr("pathname");
		$(".depth02 ul li a").each(function(index) {
			if($(this).attr("href") == url){
				$(this).parent("li").attr("class", "actived"); // depth02 active
				$(this).closest(".depth02").show(); // depth02 show
				if($(this).text() == 'MENU') {
					$(this).closest(".depth02").hide(); // depth02 hide
				}
				var aId = $(this).closest(".depth02").children('a').text();
				$("#"+aId).attr("class", "actived"); // depth01 active
				$(".depth01").children('a').text(aId); // depth01 text
				$(this).closest(".depth02").children('a').text($(this).text()); // depth02 text
			}
		});
	});
	</script>
