<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="lnb">
		<div class="dep dep1">
			<a href="javascript:;" class="nav-title"></a>
			<ul class="dep_list">
				<li id="PHOMEIN"><a href="/meng/phomein/dailyking.do">PHOMEIN</a></li>
				<li id="MENU"><a href="/meng/menu/menu_list.do">MENU</a></li>
				<li id="STORE"><a href="/meng/store/store_list.do">STORE</a></li>
				<li id="COMMUNITY"><a href="/meng/community/sns/community_list.do">COMMUNITY</a></li>
				<li id="FRANCHISE"><a href="/meng/franchisee/interior.do">FRANCHISE</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">PHOMEIN</a>
			<dd style="display:none;">PHOMEIN</dd>
			<ul class="dep_list">
				<li><a href="/meng/phomein/dailyking.do">DAILYKING</a></li>
				<li><a href="/meng/phomein/about.do">About Phomein</a></li>
				<!-- 20190426 메뉴 추가 s -->
				<li><a href="/meng/phomein/ceo.do">CEO</a></li>
				<li><a href="/meng/phomein/greenfood.do">Relief Phomein</a></li>
				<li><a href="/meng/phomein/phoseason.do">PHO SEASON</a></li>
				<!-- //20190426 메뉴 추가 e -->
				<li><a href="/meng/phomein/phoever.do">CSR</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">MENU</a>
			<dd style="display:none;">MENU</dd>
			<ul class="dep_list">
				<li><a href="/meng/menu/menu_list.do">PHOMEIN</a></li>
				<li><a href="/meng/menu/red_menu_list.do">PHOMEIN RED</a></li>
				<li style="display:none;"><a href="/meng/menu/menu_view.do">PHOMEIN</a></li>
				<li style="display:none;"><a href="/meng/menu/red_menu_view.do">PHOMEIN RED</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">STORE</a>
			<dd style="display:none;">STORE</dd>
			<ul class="dep_list">
				<li><a href="/meng/store/store_list.do">STORE</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">COMMUNITY</a>
			<dd style="display:none;">COMMUNITY</dd>
			<ul class="dep_list">
				<li><a href="/meng/community/sns/community_list.do">SNS</a></li>
				<li><a href="/meng/community/cs_terms.do">CS Center</a></li>
				<li style="display:none;"><a href="/meng/community/cs_info.do">CS Center</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">FRANCHISE</a>
			<dd style="display:none;">FRANCHISE</dd>
			<ul class="dep_list">
				<li><a href="/meng/franchisee/interior.do">INTERIOR</a></li>
				<li><a href="/meng/franchisee/terms.do">Counseling Request</a></li>
				<li style="display:none;"><a href="/meng/franchisee/info.do">Counseling Request</a></li>
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
