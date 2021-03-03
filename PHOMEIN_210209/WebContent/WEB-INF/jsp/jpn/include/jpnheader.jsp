<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header id="dHead">
		<!-- header_wrap -->
		<div class="header-wrap">
			<div class="inner">
				<h1><a href="/jpn/main/main.do">PHOMEIN</a></h1>
				<nav id="gnb">
					<ul>
						<li>
							<a href="/jpn/phomein/dailyking.do">PHOMEIN</a>
							<ul>
								<li><a href="/jpn/phomein/dailyking.do">㈱デイリーキング</a></li>
								<li><a href="/jpn/phomein/about.do">ブランドご紹介</a></li>
								<li><a href="/jpn/phomein/ceo.do">CEO</a></li>
								<li><a href="/jpn/phomein/greenfood.do">現代グリーンフード</a></li>
								<li><a href="/jpn/phomein/phoseason.do">フォーシーズン</a></li>
								<li><a href="/jpn/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li>
							<a href="/jpn/menu/menu_list.do">メニュー</a>
							<ul>
								<li><a href="/jpn/menu/menu_list.do">Phomein</a></li>
								<li><a href="/jpn/menu/red_menu_list.do">Phomein Red</a></li>
							</ul>
						</li>
						<li>
							<a href="/jpn/store/store_list.do">全店舗一覧</a>
							<ul>
								<li><a href="/jpn/store/store_list.do">全店舗一覧</a></li>
							</ul>
						</li>
						<li>
							<a href="/jpn/community/sns/community_list.do">コミュニティ</a>
							<ul>
								<li><a href="/jpn/community/sns/community_list.do">SNS</a></li>
								<li><a href="/jpn/community/cs_terms.do">顧客問い合わせ</a></li>
								<li style="display:none;"><a href="/jpn/community/cs_info.do">顧客問い合わせ</a></li>
							</ul>
						</li>
						<li>
							<a href="/jpn/franchisee/interior.do">加盟店</a>
							<ul>
								<li><a href="/jpn/franchisee/interior.do">インテリア</a></li>
								<li><a href="/jpn/franchisee/terms.do">加盟相談申請</a></li>
								<li style="display:none;"><a href="/jpn/franchisee/info.do">加盟相談申請</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="btn-franchisee">
					<a href="/jpn/menu/menu_list.do">メニュー表示</a>
				</div>
			</div>

			<!-- btn-country -->
			<div class="btn-country">
				<a href="javascript:;">country</a>
				<div class="list">
					<ul>
						<li><a href="/brand/main/main.do">BRAND</a></li>
						<li><a href="/company/main/main.do">FRANCHISEE</a></li>
						<li><a href="/eng/main/main.do">ENG</a></li>
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
