<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<!-- location-menu -->
		<div class="location-menu">
			<div class="inner">
				<a href="/jpn/main/main.do" class="btn-home"></a>
				<!-- nav -->
				<div class="nav">
					<ul>
						<li class="depth01">
							<a href="javascript:;" class="nav-title"></a>
							<ul class="nav-list">
								<li id="PHOMEIN"><a href="/jpn/phomein/dailyking.do">PHOMEIN</a></li>
								<li id="メニュー"><a href="/jpn/menu/menu_list.do">メニュー</a></li>
								<li id="全店舗一覧"><a href="/jpn/store/store_list.do">全店舗一覧</a></li>
								<li id="コミュニティ"><a href="/jpn/community/sns/community_list.do">コミュニティ</a></li>
								<li id="加盟店"><a href="/jpn/franchisee/interior.do">加盟店</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">PHOMEIN</a>
							<dd style="display:none;">PHOMEIN</dd>
							<ul class="nav-list">
								<li><a href="/jpn/phomein/dailyking.do">㈱デイリーキング</a></li>
								<li><a href="/jpn/phomein/about.do">ブランドご紹介</a></li>
								<!-- 20190426 메뉴 추가 s -->
								<li><a href="/jpn/phomein/ceo.do">CEO</a></li>
								<li><a href="/jpn/phomein/greenfood.do">現代グリーンフード</a></li>
								<li><a href="/jpn/phomein/phoseason.do">フォーシーズン</a></li>
								<!-- //20190426 메뉴 추가 e -->
								<li><a href="/jpn/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">メニュー</a>
							<dd style="display:none;">メニュー</dd>
							<ul class="nav-list">
								<li><a href="/jpn/menu/menu_list.do">PHOMEIN</a></li>
								<li><a href="/jpn/menu/red_menu_list.do">PHOMEIN RED</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">全店舗一覧</a>
							<dd style="display:none;">全店舗一覧</dd>
							<ul class="nav-list">
								<li><a href="/jpn/store/store_list.do">全店舗一覧</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">コミュニティ</a>
							<dd style="display:none;">コミュニティ</dd>
							<ul class="nav-list">
								<li><a href="/jpn/community/sns/community_list.do">SNS</a></li>
								<li><a href="/jpn/community/cs_terms.do">顧客問い合わせ</a></li>
								<li style="display:none;"><a href="/jpn/community/cs_info.do">顧客問い合わせ</a></li>
							</ul>
						</li>
						<li class="depth02" style="display:none;">
							<a href="javascript:;" class="nav-title">加盟店</a>
							<dd style="display:none;">加盟店</dd>
							<ul class="nav-list">
								<li><a href="/jpn/franchisee/interior.do">インテリア</a></li>
								<li><a href="/jpn/franchisee/terms.do">加盟相談申請</a></li>
								<li style="display:none;"><a href="/jpn/franchisee/info.do">加盟相談申請</a></li>
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
				if($(this).text() == 'メニュー') {
					$(this).closest(".depth02").hide(); // depth02 show
				}
				var aId = $(this).closest(".depth02").children('a').text();
				$("#"+aId).attr("class", "actived"); // depth01 active
				$(".depth01").children('a').text(aId); // depth01 text
				$(this).closest(".depth02").children('a').text($(this).text()); // depth02 text
			}
		});
	});
	</script>
