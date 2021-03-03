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
.red01-wrap{}
.red01-inner{position: relative; text-align: center; font-size: 0;}
.red01-inner > img{width: 199px; height: 83px; margin-bottom:190px; display: inline-block; vertical-align:top;}
.red01-inner p{font-size: 25px; line-height:40px; letter-spacing:0; font-weight: 500; color: #333;}
.red01-inner span{margin: 25px 0 108px; font-size: 19px; line-height:30px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red01 */

/* red02 */
.red02-wrap{width: 100%; max-width:1800px; margin: 0 auto 130px;}
.red02-bg{height: 586px; background: url(../images/red/red02-bg.jpg) center center no-repeat; background-size: cover;}
.red02-inner{text-align: center;}
.red02-tit{padding: 95px 0 90px;}
.red02-tit p{font-size: 50px; line-height:32px; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in{width: 1040px; margin: 43px auto 0;}
.red02-in > div{width: 460px; height: 320px; margin-right: 120px; float: left; position: relative; background: #fff; text-align: center; font-size: 0; box-shadow:3px 3px 6px 3px rgba(0,0,0,0.1);}
.red02-in > div:last-of-type{margin-right: 0;}
.red02-in > div .img-pos{top: -43px; left: 50%; margin-left: -105px; width: 210px; height: 87px; display: block; position: absolute;}
.red02-in > div .r-tit{margin-top: 70px; font-size: 25px; line-height:32px; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in > div .r-bar{width: 30px; height: 2px; margin: 20px auto 30px; display: block; background: #ddd;}
.red02-in > div .img-icon{margin-bottom: 20px; display: inline-block; vertical-align:top;}
.red02-in > div .r-name{font-size: 19px; line-height:32px; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in > div .r-txt{font-size: 19px; line-height:32px; letter-spacing:0; font-weight: 400; color: #666; display: block;}

/* red02 */

/* red03 */
.red03-wrap{width: 100%; max-width:1800px; margin: 0 auto 120px;}
.red03-bg{height: 831px; background: url(../images/red/red03-bg.jpg) center center no-repeat; background-size: cover;}
.red03-inner{ text-align: center;}
.red03-tit{padding: 110px 0 50px;}
.red03-tit p{font-size: 38px; line-height: 1; letter-spacing:0; font-weight: bold; color: #fff;}
.red03-tit i{width: 30px; height: 2px; margin: 20px auto 15px; font-style: normal; display: block; background: #fff;}
.red03-tit span{font-size: 19px; line-height:32px; letter-spacing:0; font-weight: 400; color: #fff; display: block;}
.red03-in {width: 1200px; box-sizing:border-box; border: 1px solid #ccc; border-bottom: 3px solid #ccc; margin: 0 auto;}
.red03-in > div{padding-top: 50px; width: 33%; height: 538px; background: #fff; float: left; box-sizing:border-box; font-size: 0;}
.red03-in > div:nth-of-type(2){width: 34%; box-sizing:border-box; border-left: 1px solid #ccc; border-right: 1px solid #ccc;}
.red03-in > div img{margin-bottom: 15px; display: inline-block; vertical-align:top;}
.red03-in > div p{font-size: 30px; line-height:40px; letter-spacing:0; font-weight: 500; color: #333;}
.red03-in > div .bar{width: 30px; height: 2px; margin: 20px auto 15px; font-style: normal; display: block; background: #ccc;}
.red03-in > div span{padding-bottom: 10px; font-size: 17px; line-height:28px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
.red03-in > div span b{color: #ac1600; font-weight: bold;}
.red03-in > div strong{padding: 0 60px; margin-top: 15px; font-size: 14px; line-height:24px; letter-spacing:0; font-weight: 400; color: #999; display: block; text-align: left; box-sizing:border-box;}
.red03-in > div strong i{width: 17px; display: inline-block; vertical-align:top;}
/* red03 */

/* red04 */
.red04-wrap{}
.red04-inner{width: 100%; max-width:1200px; margin: 0 auto 47px; overflow: hidden;}
.red04-inner .red04-left{width: 520px; height: 350px; float: left; background: url(../images/red/red04-bg01.jpg) center center no-repeat; background-size: 100% 100%;}
.red04-inner .red04-left p{padding: 80px 0 40px; font-size: 39px; line-height:54px; letter-spacing:0; font-weight: bold; color: #333;}
.red04-inner .red04-left span{font-size: 19px; line-height:30px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
.red04-inner .red04-right{width: 680px; height: 350px; float: left;}
.red04-inner .red04-right img{width: 100%; height: 100%; display: block;}
/* red04 */

/* red05 */
.red05-wrap{}
.red05-inner{padding-top: 114px; width: 100%; max-width:1200px; margin: 0 auto 160px; box-sizing:border-box;}
.red05-inner table{width: 100%; box-sizing:border-box; border-top: 2px solid #8a382c; border-spacing: 0;}
.red05-inner table tr th{border-bottom: 1px solid #ccc;}
.red05-inner table tr td{border-bottom: 1px solid #ccc;}
.red05-inner table tr th.th-cen{padding: 50px 0; font-size: 40px; line-height:30px; letter-spacing:0; font-weight: 400; color: #8a382c; background: #f5f5f5; text-align: center; box-sizing:border-box;}
.red05-inner table tr th.th-pos{padding-top: 43px; background: #f5f5f5; position: relative; text-align: center;}
.red05-inner table tr th.th-pos img{margin-left: -78px; width: 156px; height: 156px; top: -114px; left: 50%; position: absolute; display: block;}
.red05-inner table tr th.th-pos p{font-size: 30px; line-height:1; letter-spacing:0; font-weight: bold; color: #333; padding: 25px 0;}
.red05-inner table tr td.td-icon{padding: 33px 0; text-align: center;}
.red05-inner table tr td.td-icon img{width: 100px; height: 100px; margin: 0 auto; display: block;}
.red05-inner table tr td.td-icon p{margin-top: 35px; font-size: 17px; line-height:28px; letter-spacing:0; font-weight: 400; color: #666;}
.red05-inner table tr td.td-icon p b{font-weight: bold; color: #333;}
.red05-inner table tr td.td-icon p.m2{margin-top: 20px;}
.red05-inner table tr td.td-bg{padding: 44px 0; text-align: center;}
.red05-inner table tr td.td-bg p{font-size: 20px; width: 153px; height: 153px; line-height:153px; letter-spacing:0; font-weight: bold; color: #333; background: url(../images/red/red05-tbl-bg01.png) center center no-repeat; background-size: cover; margin: 0 auto;}
/* red05 */

/* red06 */
.red06-wrap{width: 100%; max-width:1800px; margin: 0 auto 60px;}
.red06-bg{height: 875px; background: url(../images/red/red06-bg.jpg) center center no-repeat; background-size: cover;}
.red06-inner{ text-align: center;}
.red06-tit{padding: 105px 0 40px;}
.red06-tit p{font-size: 40px; line-height: 1; letter-spacing:0; font-weight: bold; color: #fff;}
.red06-tit i{width: 30px; height: 2px; margin: 20px auto 15px; font-style: normal; display: block; background: #fff;}
.red06-tit span{font-size: 19px; line-height:30px; letter-spacing:0; font-weight: 400; color: #fff; display: block;}
.red06-in {width: 1200px; margin: 0 auto;}
.red06-in > div{width: 33%; height: 526px; float: left; box-sizing:border-box; font-size: 0;}
.red06-in > div:nth-of-type(2){width: 34%;}
.red06-in > div img{margin-bottom: 30px; width: 220px; height: 220px; display: inline-block; vertical-align:top;}
.red06-in > div p{font-size: 25px; line-height:32px; letter-spacing:0; font-weight: 500; color: #333;}
.red06-in > div strong{font-size: 20px; line-height:32px; letter-spacing:0; font-weight: 400; color: #8a382c; display: block;}
.red06-in > div .bar{width: 30px; height: 2px; margin: 15px auto 15px; font-style: normal; display: block; background: #ddd;}
.red06-in > div span{ font-size: 17px; line-height:28px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red06 */

/* red07 */
.red07-wrap{}
.red07-inner{width: 100%; max-width:1200px; margin: 0 auto 250px; position: relative; text-align: center;}
.red07-inner::after{top: 770px; left: 50%; width: 1px; height: 70px; background: #ccc; position: absolute; content:""; display: block;}
.red07-inner > img{margin-bottom: 15px; height: 635px; width: 100%; display: block;}
.red07-inner > p{font-size: 19px; line-height:30px; letter-spacing:0; font-weight: 400; color: #333;}
.red07-in{height: 859px; margin-top: 130px; background: url(../images/red/red07-bg.png) center center no-repeat; background-size: cover;}
.red07-in .red07-tit01{font-size: 40px; line-height:1; letter-spacing:0; font-weight: 400; color: #333; display: inline-block; vertical-align:top;}
.red07-in .red07-tit02{margin-top: 40px; font-size: 80px; line-height:60px; letter-spacing:0; font-weight: 400; color: #333;}
.red07-in .bar{width: 30px; height: 2px; background: #8a382c; display: block; margin: 48px auto 40px;}
.red07-in .red07-txt01{font-size: 19px; line-height:38px; letter-spacing:0; font-weight: 400; color: #333; margin-bottom: 30px; display: block;}
.red07-in .red07-txt02{font-size: 17px; line-height:32px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
.red07-in > img{margin: 40px auto 40px; width: 44px; height: 44px; display: block;}
.red07-in .red07-txt03{font-size: 19px; line-height:32px; letter-spacing:0; font-weight: 400; color: #333; display: block;}
.red07-in .red07-txt03 b{margin-top: 5px; font-size: 30px; font-weight: 500; color: #8a382c; display: block;}
/* red07 */

/* red08 */
.red08-wrap{}
.red08-inner{width: 100%; max-width:1200px; margin: 0 auto 250px; position: relative; text-align: center;}
.red08-tit01{margin: 30px 0 60px; font-size: 36px; line-height:1; letter-spacing:0; font-weight: 400; color: #333; vertical-align:top;}
.red08-tit02{margin-bottom:130px; font-size: 80px; line-height:60px; letter-spacing:0; font-weight: 400; color: #333;}
.red08-in {margin-bottom:120px;}
.red08-info {width: 800px; margin:0 auto;}
.red08-info > table {width: 100%;}
.red08-info > table td {padding:18px 0; border-bottom:1px solid #6d6e70;}
.red08-info > table .title_td {width: 300px;}
.red08-info > table .title_td > img{vertical-align:middle;}
.red08-info > table .title_td > span{vertical-align:middle; font-size:21px; color:#89382b; font-weight:600; margin-left:10px;}
.red08-info > table .info_td {vertical-align:middle;}
.red08-info > table .info_td > span {font-size:18px; color:#404041; vertical-align:middle;}

/* red08 */
/* red09 */
.red09-wrap{}
.red09-inner{width: 100%; max-width:1200px; margin: 0 auto 250px; position: relative; text-align: center; padding-bottom:50px;}
.red09-tit02{margin-bottom:80px; font-size: 80px; line-height:60px; letter-spacing:0; font-weight: 400; color: #333;}
.red09-tit03 {font-size:30px; line-height:40px; color:#333; margin-bottom:80px;}
.red09-img-span {display:block; font-size:15px; margin:20px 0 100px;}
.red09-inner > .interview_con {position:relative; width: 100%; max-width:800px; margin:0 auto; background-color:#f8eeed; padding:80px 0;}
.red09-inner > .interview_con > .icon {position:absolute; top:-44px; right:30px;}
.red09-inner > .interview_con > ul > li {display:block; position:relative; text-align:left; padding:0 70px 60px 100px;}
.red09-inner > .interview_con > ul > li > img {width: 22px; position:absolute; top:5px; left:70px;}
.red09-inner > .interview_con > ul > li > b {font-size:22px; font-weight:600;}
.red09-inner > .interview_con > ul > li > p {font-size:18px; line-height:32px; margin-top:13px;}
/* red09 */

.red02-wrap{background-image: url('../images/content/red02-wrap_bg.jpg'); height: 938px; margin-bottom: 320px;}
.red02-wrap .box{font-size: 0; position: relative; top: 420px;}
.red02-wrap .box li{box-shadow: 0px 11px 12.87px 0.13px rgb(0 0 0 / 30%);text-align: center;padding: 5% 0%;width: 29%;font-size: 22px;font-weight: lighter;background-color: #fff;box-sizing: border-box;display: inline-block;box-sizing: border-box;margin-left: 3.333333%;}
.red02-wrap .box li p{font-weight: 500; font-size: 45px; margin: 30px 0;}
.red02-wrap .box li:nth-child(2){}
.red02-wrap .box li span{letter-spacing: -1px;}

.red03-wrap{text-align: center; margin-bottom: 0;}
.red03-wrap h2{font-size: 60px; line-height: 100px; margin-bottom: 60px;}
.red03-wrap p{font-size: 20px; }
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
			<div class="visual" style="background-image:url('../images/content/sub_visual_07.jpg');"></div>
			<h2 class="h2-type">국내유일 햅쌀면</h2>
			<!-- <span class="txt">소자본 쌀국수 창업 프랜차이즈의 새로운 패러다임을 제시합니다.</span> -->
		</div>
		<!-- //page-title -->

		<%@ include file="/WEB-INF/jsp/company/include/companyMenuHead.jsp"%>

		<div id="contents" class="content">
			<div class="video_con">
				<iframe width="1050" height="590" src="https://www.youtube.com/embed/Ohz1c_XOeiI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="red-con">
				<div class="mt80">
					<div class="red01-wrap">
						<div class="red01-inner">
							<span>
								국내 1위 베트남 쌀국수 전문점 포메인은 베트남 외식 문화의 선구자로서<br/>
								쌀국수 "면"의 건강한 변화가 필요하다고 판단하였습니다.<br/>
								<br/>
								기존의 밀가루 또는 묵을쌀로 만든 면이 아닌 건강한 면을 만들기 위해<br/>
								베트남 현지 쌀국수 제조공장 포시즌을 설립하였으며, 3모작이 가능한<br/>
								베트남에서 1년 내내 영양이 가득한 햅쌀을 공급받고 있습니다.<br/>
								<br/>
								수많은 테스트와 시행착오 끝에 독자기술로 완성한 햅쌀 쌀국수면은<br/>
								별도의 화학첨가물 없이 오직 햅쌀과 정제수만으로 햅쌀 본연의<br/>
								맛과 향 그리고 식감을 담아내는데 성공했습니다.<br/>
								<br/>
								쌀국수에 햅쌀이라는 우리만의 기술을 입히고 세상에 없던 쌀국수를 선보이는 포메인에서<br/>
								우리 아이, 우리 가족이 안심하고 먹을 수 있는 건강한 쌀국수를 맛보세요.
							</span>
						</div>
					</div>
					<div class="red02-wrap">
						<ul class="box">
							<li>
								<div class="img_box">
									<img src="/company/images/content/rice_01.jpg" alt="" />
								</div>
								<div class="text_box">
									<p>FRESH</p>
									<span>1년 365일 갓 수확한 햅쌀 사용으로<br/>갓 지은 햅쌀밥의 향을 자랑합니다.</span>
								</div>
							</li>
							<li>
								<div class="img_box">
									<img src="/company/images/content/rice_02.jpg" alt="" />
								</div>
								<div class="text_box">
									<p>CLEAN</p>
									<span>오직 깨끗한 햅쌀과 정제수 사용으로<br/>햅쌀의 맑고 투명한 빛깔을 담았습니다.</span>
								</div>
							</li>
							<li>
								<div class="img_box">
									<img src="/company/images/content/rice_03.jpg" alt="" />
								</div>
								<div class="text_box">
									<p>TECHNOLOGY</p>
									<span>독자적인 기계건조, 저온숙성 기술로<br/>부드럽고 쫀득한 식감을 완성했습니다.</span>
								</div>
							</li>
						</ul>
					</div>
					<div class="red03-wrap">
						<h2>
							포메인 “면”은 다릅니다.<br/>포메인이 독자기술로 만들어낸<br/>건강한 “햅쌀면” 입니다.
						</h2>
						<p>※ 포메인, 포메인 RED 전 메뉴에는 햅쌀 쌀국수면이 사용됩니다.</p>
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
