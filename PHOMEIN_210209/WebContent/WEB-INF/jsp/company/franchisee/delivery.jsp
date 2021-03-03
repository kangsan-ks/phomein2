<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="none"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/company/include/head.jspf"%>
</head>

<link rel="stylesheet" href="../images/red/jquery.fullpage.css">

<style>
/* reset */
html { color: -internal-root-color;}
body { width: 100%; min-width: 1200px; color: #222; font-family: 'Noto Sans KR', 'Malgun Gothic', dotum, gulim, verdana, sans-serif; font-weight: 400; font-size: 14px; letter-spacing: -0.05em; word-break: break-all;}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, input, select, textarea, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0px; padding: 0px; vertical-align: top;}
h1, h2, h3, h4, h5, h6, th {font-weight: 400;}
.mt80 {margin-top: 80px !important;}

.clear:after{content:""; display: block; clear:both;}

/* content */
.video_con {width: 100%; margin:0 auto; text-align:center;}	
.inner02 { position: relative; width: 100%; height: 100%; }
.con-title { text-align: center; }
.con-title h3.h3-type { display: block; color: #222; font-size: 35px; font-weight: 500; letter-spacing: -1px;}
.con-title .n-txt { display: block; color: #999; font-size: 19px; line-height: 40px; letter-spacing: -0.5px; font-weight: 400;}
.con-title .n-txt b{color: #ac1600;}

/* red01 */
.red01-wrap{ text-align: center;}
.red01-wrap h2{font-size: 60px; line-height: 100px; text-align: center;}
.red01-inner{position: relative; text-align: center; font-size: 0;}
.red01-inner > img{width: 199px; height: 83px; margin-bottom:190px; display: inline-block; vertical-align:top;}
.red01-inner p{font-size: 25px; line-height:40px; letter-spacing:0; font-weight: 500; color: #333;}
.red01-inner span{margin: 25px 0 108px; font-size: 19px; line-height:30px; letter-spacing:0; font-weight: 400; color: #666; display: block;}

.img_wrap{overflow: hidden;}
/* .img_wrap img{    min-width: 1800px;
    position: relative;
    left: 50%;
    transform: translateX(-50%);} */
/* red01 */

</style>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/company/include/companyheader.jsp"%>
	<!--// dHead -->

	<section id="dBody" class="franchisee">
		<!-- page-title -->
		<div class="page-title">
			<div class="visual" style="background-image:url('../images/content/sub_visual_08.jpg');"></div>
			<h2 class="h2-type">딜리버리 서비스</h2>
			<!-- <span class="txt">소자본 쌀국수 창업 프랜차이즈의 새로운 패러다임을 제시합니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<div id="contents" class="content">
			<div class="video_con">
				<iframe width="1050" height="590" src="https://www.youtube.com/embed/LInM6QPlqLo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="red-con">
				<div class="mt80">
					<div class="red01-wrap">
						<h2>
							WHENEVER, WHEREVER<br/>PHOMEIN DELIVERY SERVICE
						</h2>
						<div class="red01-inner">
							<span>
								2014년 업계 최초로 쌀국수 배달을 시행한 베트남 쌀국수 전문점 포메인은<br/>
								언제 어디서든 쌀국수를 즐길 수 있는 환경을 조성하고자 딜리버리 사업에 뛰어들었습니다.<br/>
								<br/>
								분명 쉬운 길은 아니었지만 쌀국수 배달을 위해 포메인은 지난 7년 동안<br/>
								여러 차례의 시범운영을 통한 패키지 리뉴얼 작업, 딜리버리 매뉴얼 제작으로<br/>
								경쟁력을 쌓으며 가파르게 성장하는 딜리버리 시장에 성공적으로 안착했습니다.<br/>
								<br/>
								이제는 너도나도 쌀국수 배달에 뛰어드는 시대<br/>
								포메인의 경쟁력은 하루아침에 만들어진 게 아니라는 걸 증명하듯<br/>
								자체 개발 쌀국수 전용 패키지와 우리만의 노하우로 독보적인 서비스를 선보이고 있습니다.<br/>
								특히 배달을 받아보았을 때 쌀국수면에서 느낄 수 있는 향긋한 햅쌀밥의 향은<br/>
								애써 말하지 않아도 고객이 먼저 느끼는 포메인의 강점입니다.<br/>
								<br/>
								포메인만의 레시피로 재해석한 32가지의 베트남 요리를<br/>
								언제, 어디서든 매장에서 즐기던 맛 그대로 만나보세요.
							</span>
						</div>
						<div class="img_wrap">
							<img src="../images/content/delivery01.jpg" alt="" />
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<!-- //contents -->

	</section>
	<!--// dBody -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/company/include/companyfooter.jsp"%>
	<!--// dFoot -->

</div>

<script src="../common/js/front_ui.js"></script>
<script>
$(function(){
	$('.slider-for').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false,
		fade: true,
	});

	$('.slider-in').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		infinite: false,
		fade: true,
		dots: true
	});

	$('.slider-nav').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		asNavFor: '.slider-for',
		infinite: false,
		dots: true,
		focusOnSelect: true
	});

	$('.slider-nav .slick-prev').click(function() {
		progressbar();
		return false;
	});

	$('.slider-nav .slick-next').click(function() {
		progressbar();
		return false;
	});

	$('.slider-nav .slick-slide').click(function() {
		progressbar();
		return false;
	});

	var bar = $('.slider-progress .progress'),
		active = $('.slider-nav .slick-dots .slick-active'),
		w = active.width();

	bar.css({width: w+'px'});

	function progressbar() {
		var x = $('.slider-nav .slick-dots .slick-active').position();
		var n = x.left+w;
		bar.animate({
			width: n+'px'
		});
	}
});
</script>
</body>
</html>
