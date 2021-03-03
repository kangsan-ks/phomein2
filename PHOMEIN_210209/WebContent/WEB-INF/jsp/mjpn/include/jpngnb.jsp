<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="gnb">
		<div class="gnb_head">
			<div class="lang">
				<ul>
					<li><a href="/mbrand/main/main.do" target="_self">BRAND</a></li>
					<li><a href="/mcompany/main/main.do" target="_self">FRANCHISE</a></li>
					<li><a href="/meng/main/main.do" target="_self">ENG</a></li>
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
								<li><a href="/mjpn/phomein/dailyking.do">㈱デイリーキング</a></li><!-- 현재 뎁스 표시 : class="on" -->
								<li><a href="/mjpn/phomein/about.do">ブランドご紹介</a></li>
								<!-- 20190426 메뉴 추가 s -->
								<li><a href="/mjpn/phomein/ceo.do">CEO</a></li>
								<li><a href="/mjpn/phomein/greenfood.do">現代グリーンフード</a></li>
								<li><a href="/mjpn/phomein/phoseason.do">フォーシーズン</a></li>
								<!-- //20190426 메뉴 추가 e -->
								<li><a href="/mjpn/phomein/phoever.do">CSR</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">メニュー</a>
							<ul class="ea1 gnbs">
								<li><a href="/meng/menu/menu_list.do">PHOMEIN</a></li>
								<li><a href="/meng/menu/red_menu_list.do">PHOMEIN RED</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">全店舗一覧</a>
							<ul class="ea1 gnbs">
								<li><a href="/mjpn/store/store_list.do">全店舗一覧</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">コミュニティ</a>
							<ul class="gnbs">
								<li><a href="/mjpn/community/sns/community_list.do">SNS</a></li>
								<li><a href="/mjpn/community/cs_terms.do">顧客問い合わせ</a></li>
								<li style="display:none;"><a href="/mjpn/community/cs_info.do">顧客問い合わせ</a></li>
							</ul>
						</li>
						<li>
							<a href="#none">加盟店</a>
							<ul class="gnbs">
								<li><a href="/mjpn/franchisee/interior.do">インテリア</a></li>
								<li><a href="/mjpn/franchisee/terms.do">加盟相談申請</a></li>
								<li style="display:none;"><a href="/mjpn/franchisee/info.do">加盟相談申請</a></li>
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
