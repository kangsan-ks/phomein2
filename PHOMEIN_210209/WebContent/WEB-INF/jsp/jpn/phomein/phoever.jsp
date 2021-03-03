<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/jpn/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	phomein
		02. menu					:	menu
		03. store					:	store
		04. community				:	community
		05. franchisee				:	franchisee
	-->

	<section id="dBody" class="cphomein">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_01.jpg');"></div>
			<h2 class="h2-type">CSR</h2>
<!-- 			<span class="txt">따뜻한 세상을 희망하는 포메인의 나눔은 계속 됩니다.<br>포메인이 전하는 따뜻한 온기</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/jpn/include/jpnMenuHead.jsp"%>

		<!-- contents -->
		<div id="contents" class="content">
			<!-- csr-info -->
			<div class="csr-info">
				<div class="page-box">
<!-- 					<p class="txt01 load-fadein">フォーメインが作りあ<br>げる世界</p> -->
					<p class="txt02 load-fadein">PHOMEIN CSR</p>
					<p class="txt03 load-fadein">冷めない熱い心で暖かい今日、暖かい世界を作ります。</p>
					<p class="img load-fadein"><img src="../images/content/csr_img01.png" alt="아이콘 이미지"/></p>
					<p class="txt04 load-fadein">フォーメインは信頼される模範企業という一念の下、<br>
倫理経営を基に恵まれない階層や開発途上国の子供の救援に力を貸しています。</p>
				</div>

				<div class="activity">
					<h4>活動紹介</h4>
					<!-- activity-visual -->
					<div class="activity-box">
						<div class="activity-visual slide-wrap">
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_09.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_09.jpg" alt=""/></span>
									<span class="data-tit">フォーメイン、新米のライスヌードル4,536ボックスを寄付 </span>
									<span class="data-txt">
										フォーメイン本社では新米のみを使用して独自開発に成功した新米のライスヌードルをお店で披露することに先立って、社会的弱者層のために1億8千万ウォン相当のライスヌードル4,536ボックスを寄付しました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_01.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_01.jpg" alt=""/></span>
									<span class="data-tit">「PHO EVER 2018」 職業体験メンタリング</span>
									<span class="data-txt">
										フォーメインは、社団法人グローバルビジョンと共に就職支援が必要な青少年を対象に
										フォーメインで経験できる職業について学習及び実習を行う
										職業体験メンタリング「PHO EVER 2018」を行いました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_02.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_02.jpg" alt=""/></span>
									<span class="data-tit">「浦項地震による被害住民への支援」活動に寄付</span>
									<span class="data-txt">
										フォーメインの公式フェイスブックで浦項地震による被害住民への支援寄付キャンペーン「PHO U x 4」を
										行って募金された基金の4培を「希望ブリッジ全国災害救護協会」に寄付しました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_03.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_03.jpg" alt=""/></span>
									<span class="data-tit">'「新生児を助ける 帽子編みキャンペーン」 に参加 </span>
									<span class="data-txt">
										フォーメイン本社の役職員及び加盟店は低体重や栄養不足の新生児たちの体温を維持し、
										あたたかい生命の力を養うために200個余りの帽子を製作してセーブ・ザ・チルドレンに寄付しました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_04.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_04.jpg" alt=""/></span>
									<span class="data-tit">城南地域児童センターに「幸福ギフトボックス」を届ける</span>
									<span class="data-txt">
										城南地域児童センター3か所にフォーメイン本社の役職員が荷造りした「幸福ギフトボックス」
										100箱をお届けし、子供たちと一緒に生春巻きを作って夕食を楽しみながらあたたかなひとときを過ごしました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_05.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_05.jpg" alt=""/></span>
									<span class="data-tit">ハビタット「希望の家作り」基金活動を後援</span>
									<span class="data-txt">
										地域社会に寄与し、無住宅低所得層家庭を援助するためフォーメインの役職員たちと共に
										心をひとつにしてハビタットに基金をお渡ししました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_06.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_06.jpg" alt=""/></span>
									<span class="data-tit">ハビタット「希望の家作り」建築ボランティア</span>
									<span class="data-txt">
										無住宅低所得層の家庭を援助し暖かい家をプレゼントするため
										フォーメインの役職員と一緒に汗を流しながら「希望の家作り」建築ボランティア活動を行いました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_07.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_07.jpg" alt=""/></span>
									<span class="data-tit">「愛の練炭配達」ボランティア</span>
									<span class="data-txt">
										フォーメイン本社の役職員みんなが「愛の練炭配達」ボランティア活動に参加して
										「社団法人 暖かい 韓半島、愛の練炭分かち合い運動」に練炭5,000枚を寄贈し、
										京畿道城南市金土洞の低所得世帯に練炭1,500枚を直接お届けしました。
									</span>
								</p>
							</div>
							<div>
								<p class="img"><img src="../images/content/csr_activity_img_08.jpg" alt=""/></p>
								<p class="info">
									<span class="logo"><img src="../images/content/csr_activity_img_logo_08.jpg" alt=""/></span>
									<span class="data-tit">世界子ども救援基金をお渡しする</span>
									<span class="data-txt">
										業界初にユニセフと寄付協約を結んで援助の手を必要とする
										世界貧困児童たちに小さな希望になることを願いながら
										世界子ども救助基金をお渡しする意味深いイベントを行いました。
									</span>
								</p>
							</div>
						</div>
					</div>
					<!-- //activity-visual -->
				</div>
			</div>
			<!-- //csr-info -->
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/jpn/include/jpnfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<script src="../common/js/front_ui.js"></script>
</body>
</html>
