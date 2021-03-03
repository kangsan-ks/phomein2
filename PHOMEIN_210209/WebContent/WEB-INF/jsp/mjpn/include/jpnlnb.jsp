<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="lnb">
		<div class="dep dep1">
			<a href="javascript:;" class="nav-title"></a>
			<ul class="dep_list">
				<li id="PHOMEIN"><a href="/mjpn/phomein/dailyking.do">PHOMEIN</a></li>
				<li id="メニュー"><a href="/mjpn/menu/menu_list.do">メニュー</a></li>
				<li id="全店舗一覧"><a href="/mjpn/store/store_list.do">全店舗一覧</a></li>
				<li id="コミュニティ"><a href="/mjpn/community/sns/community_list.do">コミュニティ</a></li>
				<li id="加盟店"><a href="/mjpn/franchisee/interior.do">加盟店</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">PHOMEIN</a>
			<dd style="display:none;">PHOMEIN</dd>
			<ul class="dep_list">
				<li><a href="/mjpn/phomein/dailyking.do">㈱デイリーキング</a></li>
				<li><a href="/mjpn/phomein/about.do">ブランドご紹介</a></li>
				<!-- 20190426 메뉴 추가 s -->
				<li><a href="/mjpn/phomein/ceo.do">CEO</a></li>
				<li><a href="/mjpn/phomein/greenfood.do">現代グリーンフード</a></li>
				<li><a href="/mjpn/phomein/phoseason.do">フォーシーズン</a></li>
				<!-- //20190426 메뉴 추가 e -->
				<li><a href="/mjpn/phomein/phoever.do">CSR</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">メニュー</a>
			<dd style="display:none;">メニュー</dd>
			<ul class="dep_list">
				<li><a href="/mjpn/menu/menu_list.do">PHOMEIN</a></li>
				<li><a href="/mjpn/menu/red_menu_list.do">PHOMEIN RED</a></li>
				<li style="display:none;"><a href="/mjpn/menu/menu_view.do">PHOMEIN</a></li>
				<li style="display:none;"><a href="/mjpn/menu/red_menu_view.do">PHOMEIN RED</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">全店舗一覧</a>
			<dd style="display:none;">全店舗一覧</dd>
			<ul class="dep_list">
				<li><a href="/mjpn/store/store_list.do">全店舗一覧</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">コミュニティ</a>
			<dd style="display:none;">コミュニティ</dd>
			<ul class="dep_list">
				<li><a href="/mjpn/community/sns/community_list.do">SNS</a></li>
				<li><a href="/mjpn/community/cs_terms.do">顧客問い合わせ</a></li>
				<li style="display:none;"><a href="/mjpn/community/cs_info.do">顧客問い合わせ</a></li>
			</ul>
		</div>
		<div class="dep dep2" style="display:none;">
			<a href="#none">加盟店</a>
			<dd style="display:none;">加盟店</dd>
			<ul class="dep_list">
				<li><a href="/mjpn/franchisee/interior.do">インテリア</a></li>
				<li><a href="/mjpn/franchisee/terms.do">加盟相談申請</a></li>
				<li style="display:none;"><a href="/mjpn/franchisee/info.do">加盟相談申請</a></li>
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
