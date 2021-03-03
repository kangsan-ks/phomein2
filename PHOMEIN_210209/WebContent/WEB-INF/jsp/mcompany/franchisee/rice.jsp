<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page buffer="none"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta name="keywords" content="">
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/mcompany/include/head.jspf"%>

<style>
/* reset */
html { color: -internal-root-color;}
body { width: 100%; color: #222; font-family: 'Noto Sans KR', 'Malgun Gothic', dotum, gulim, verdana, sans-serif; font-weight: 400; font-size: 14px; letter-spacing: -0.05em; word-break: break-all;}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, input, select, textarea, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video { margin: 0px; padding: 0px; vertical-align: top;}
h1, h2, h3, h4, h5, h6, th {font-weight: 400;}
.mt80 {margin-top: 30px !important;}

.clear:after{content:""; display: block; clear:both;}

/* content */
.inner02 { position: relative; width: 100%; height: 100%; }
.red-con{padding-top: 30px;}
.red-title { text-align: center; }
.red-title h3.h3-type { display: block; color: #222; font-size: 24px; line-height: 40px; font-weight: 500; letter-spacing: -1px;}
.red-title .n-txt {margin-top: 10px; display: block; color: #999; font-size: 8px; 
line-height: 1; letter-spacing: -0.5px; font-weight: 400;}
.red-title .n-txt b{color: #ac1600;}

/* red01 */
.red01-wrap{}
.red01-inner{margin-top: 20px; position: relative; text-align: center; font-size: 0;}
.red01-inner::after{position: absolute; top: 44px; left: 50%; width: 1px; height: 40px; display: none; content:""; z-index: 1; background: #d4c7b1;}
.red01-inner > img{width: 78px; margin-bottom:60px; display: inline-block; vertical-align:top;}
.red01-inner p{font-size: 15px; line-height:21px; letter-spacing:0; font-weight: 500; color: #333;}
.red01-inner span{margin: 20px 0 50px; font-size: 12px; line-height:25px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red01 */

/* red02 */
.red02-wrap{width: 100%; margin: 0 auto 45px; text-align: center;}
.red02-wrap{background: url('../common/images/content/red02-wrap_bg.jpg') no-repeat top; background-size: 100%;}
.red02-wrap .box{font-size: 0;}
.red02-wrap .blank_area{padding-bottom: 35%;}
.red02-wrap .box li{box-shadow: 0px 6px 6.93px 0.07px rgba(0, 0, 0, 0.3); text-align: center; padding: 35px 25px; width: 80%; font-size: 13px; font-weight: lighter; background-color: #fff; box-sizing: border-box; display: block; box-sizing: border-box; margin: auto; margin-bottom: 30px;}
.red02-wrap .box li:first-child{}
.red02-wrap .box li .img_box{padding: 0 20px;}
.red02-wrap .box li p{font-weight: 500; font-size: 25px; margin: 30px 0;}
.red02-wrap .box li:nth-child(2){}
/* red02 */

/* red03 */
.red03-wrap{text-align: center; margin-bottom: 0;}
.red03-wrap h2{font-size: 24px; line-height: 40px; margin-bottom: 30px; font-weight: 400; color: #000;}
.red03-wrap p{font-size: 12px; font-weight: 300; color: #000;}
/* red03 */

/* red04 */
.red04-wrap{}
.red04-inner{width: 100%; margin: 0 auto 15px; text-align: center;}
.red04-inner > img{width: 100%; display: block;}
.red04-inner p{padding: 15px 0 10px; font-size: 15px; line-height:21px; letter-spacing:0; font-weight: bold; color: #333;}
.red04-inner span{font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red04 */

/* red05 */
.red05-wrap{}
.red05-inner{padding-top: 36px; width: 92%; margin: 0 auto 18px; box-sizing:border-box;}
.red05-inner table{width: 100%; box-sizing:border-box; border-top: 2px solid #8a382c; border-spacing: 0;}
.red05-inner table tr th{border-bottom: 1px solid #ccc;}
.red05-inner table tr td{border-bottom: 1px solid #ccc;}
.red05-inner table tr th.th-cen{padding: 28px 0; font-size: 16px; line-height:10px; letter-spacing:0; font-weight: 400; color: #8a382c; background: #f5f5f5; text-align: center; box-sizing:border-box;}
.red05-inner table tr th.th-pos{padding-top: 17px; background: #f5f5f5; position: relative; text-align: center;}
.red05-inner table tr th.th-pos img{margin-left: -26px; width: 52px; height: 52px; top: -36px; left: 50%; position: absolute; display: block;}
.red05-inner table tr th.th-pos p{font-size: 13px; line-height:17px; letter-spacing:0; font-weight: bold; color: #333; padding: 16px 0;}
.red05-inner table tr th.th-pos p.p2{padding: 7px 0 10px;}
.red05-inner table tr td.td-icon{padding: 13px 0; text-align: center;}
.red05-inner table tr td.td-icon.pt21{padding-top: 21px;}
.red05-inner table tr td.td-icon.pt27{padding-top: 27px;}
.red05-inner table tr td.td-icon.pt33{padding-top: 33px;}
.red05-inner table tr td.td-icon img{width: 43px; margin: 0 auto; display: block;}
.red05-inner table tr td.td-icon p{margin-top: 8px; font-size: 10px; line-height:15px; letter-spacing:0; font-weight: 400; color: #666;}
.red05-inner table tr td.td-icon p b{font-size: 10px; font-weight: bold; color: #333;}
/* .red05-inner table tr td.td-icon p.m2{margin-top: 20px;} */
.red05-inner table tr td.td-bg{padding: 20px 0; text-align: center; background: #f5f5f5; position: relative;}
.red05-inner table tr td.td-bg p{font-size: 11px; line-height:17px; letter-spacing:0; font-weight: bold; color: #333; top: 50%; left: 0; width: 100%; transform:translate(0,-50%); -webkit-transform:translate(0,-50%); -moz-transform:translate(0,-50%); -o-transform:translate(0,-50%); -ms-transform:translate(0,-50%); position: absolute;}
/* red05 */

/* red06 */
.red06-wrap{width: 100%; margin: 0 auto; padding-bottom: 15px;}
.red06-inner{ text-align: center;}
.red06-tit{padding-top: 30px; height: 173px; box-sizing:border-box; background: url(../images/red/red06-bg.jpg) center center no-repeat; background-size: 100% 100%; width: 100%;}
.red06-tit p{font-size: 15px; line-height:21px; letter-spacing:0; font-weight: bold; color: #fff;}
.red06-tit i{width: 17px; height: 1px; margin: 8px auto 8px; font-style: normal; display: block; background: #fff;}
.red06-tit span{font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #fff; display: block;}
.red06-in {width: 100%; margin: 30px auto 0; text-align: center;}
.red06-in > div{margin-bottom: 40px; width: 100%; box-sizing:border-box; font-size: 0;}
.red06-in > div img{margin-bottom: 15px; width: 100px; display: inline-block; vertical-align:top;}
.red06-in > div p{font-size: 15px; line-height:1; letter-spacing:0; font-weight: 500; color: #333;}
.red06-in > div strong{margin-top: 5px; font-size: 11px; line-height:1; letter-spacing:0; font-weight: 400; color: #8a382c; display: block;}
.red06-in > div .bar{width: 17px; height: 1px; margin: 8px auto 8px; font-style: normal; display: block; background: #ddd;}
.red06-in > div span{ font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red06 */

/* red07 */
.red07-wrap{}
.red07-inner{width: 92%; margin: 0 auto 30px; position: relative; text-align: center;}
.red07-inner > img{margin:0 auto 5px; width: 100%; display: block;}
.red07-inner > p{font-size: 11px; line-height:17px; letter-spacing:0; font-weight: 400; color: #333;}
.red07-inner .hbar{width: 1px; height: 30px; background: #ccc; display: block; margin: 18px auto 18px;}
.red07-in{height: 392px; background: url(../images/red/red07-bg.png) center center no-repeat; background-size: 100% 100%; position: relative;}
.red07-in .red07-tit01{font-size: 13px; line-height:1; letter-spacing:0; font-weight: 400; color: #333; display: inline-block; vertical-align:top;}
.red07-in .red07-tit02{margin-top: 15px; font-size: 26px; line-height:13px; letter-spacing:0; font-weight: 400; color: #333;}
.red07-in .bar{width: 17px; height: 1px; background: #8a382c; display: block; margin: 15px auto 15px;}
.red07-in .red07-txt01{font-size: 11px; line-height:18px; letter-spacing:0; font-weight: 400; color: #333; margin-bottom: 15px; display: block;}
.red07-in .red07-txt02{font-size: 10px; line-height:18px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
.red07-in > img{margin: 10px auto 10px; width: 27px; height: 27px; display: block;}
.red07-in .red07-txt03{font-size: 11px; line-height:1; letter-spacing:0; font-weight: 400; color: #333; display: block;}
.red07-in .red07-txt03 b{margin-top: 5px; font-size: 15px; font-weight: 500; color: #8a382c; display: block;}
.red07-in > img.red07-posimg{margin-left: -54.5px; position: absolute; bottom: 0; left: 50%; width: 109px; height: 71px; display: block;}
/* red07 */

/* red08 */
.red08-wrap{}
.red08-inner{width: 92%; margin: 0 auto; position: relative; text-align: center; padding-bottom:80px;}
.red08-inner > img{width: 78px; margin:40px 0 15px; display: inline-block; vertical-align:top;}
.red08-tit01{font-size: 13px; line-height:1; letter-spacing:0; font-weight: 400; color: #333; vertical-align:top;}
.red08-tit02{margin: 50px 0; font-size: 26px; line-height:13px; letter-spacing:0; font-weight: 400; color: #333;}
.red08-in {width: 92%;  margin: 0 auto }
.red08-in > img {width: 100%; display:block; margin: 20px auto 0;}
.red08-info {}
.red08-info > table {width:100%; margin:0 auto;}
.red08-info > table td {padding:10px 0; border-bottom:1px solid #6d6e70;}
.red08-info > table .title_td > img {width: 27px; vertical-align:middle;}
.red08-info > table .title_td > span {font-size:13px; color:#89382b; font-weight:bold; vertical-align:middle;}
.red08-info > table .info_td > span {font-size:12px; color:#404041; vertical-align:middle;}
/* red08 */
/* red09 */
.red09-wrap{}
.red09-inner{width: 92%; margin: 0 auto; position: relative; text-align: center;}
.red09-tit02{margin: 30px 0; font-size: 26px; line-height:13px; letter-spacing:0; font-weight: 400; color: #333;}
.red09-tit03{font-size:16px; line-height:28px; color:#333; margin-bottom:50px;}
.red09-inner > img {width: 140px;}
.red09-inner > .red09-img-span {display:block; font-size:12px; padding:10px 0 50px;}
.red09-inner > .interview_con {position:relative; width: 100%; margin:0 auto; background-color:#f8eeed; padding:30px 0;}
.red09-inner > .interview_con > .icon {position:absolute; top:-22px; right:10px;}
.red09-inner > .interview_con >  ul > li {display:block; position:relative; padding: 0 20px 20px 30px; text-align:left;}
.red09-inner > .interview_con >  ul > li > img {width: 14px; position:absolute;top:3px; left:10px;}
.red09-inner > .interview_con >  ul > li > b {font-size:14px; font-weight:500; color:#333;}
.red09-inner > .interview_con >  ul > li > p {font-size:12px; color:#333; line-height:20px; margin-top:10px;}
/* red09 */

</style>
</head>

<body>
<!-- wrap -->
<div id="wrap">
	<!-- skip nav -->
	<div id="skip_nav">
        <a href="#content">본문 바로가기</a>
    </div>
    <!-- //skip nav -->
	<!-- header -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyheader.jsp"%>
	<!-- //header -->

	<!-- gnb -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companygnb.jsp"%>
	<!-- //gnb -->
	<!-- container -->
	<div id="container">
		<!-- sub visual -->
		<div class="sub_visual sv3" style="background-image: url('/mcompany/common/images/layout/img_sv7.jpg');">
			<h3>국내유일 햅쌀면</h3>
		</div>
		<!-- 상단비쥬얼 영역
			회사소개	: class="sub_visual sv1"
			연구개발	: class="sub_visual sv2"
			가맹개설정보 : class="sub_visual sv3"
			사회공헌 	: class="sub_visual sv4"
			POLICY	   : class="sub_visual sv5"
		-->
		<!-- //sub visual -->
		<%@ include file="/WEB-INF/jsp/mcompany/include/companylnb.jsp"%>
		<!-- //lnb -->
		<!-- content -->
		<div id="content" class="franchisee">
			<div class="video_con" style="text-align:center;">
				<iframe width="330" height="186" src="https://www.youtube.com/embed/Ohz1c_XOeiI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="red-con">
				<div class="inner02">
					<div class="red01-wrap">
						<div class="red01-inner">
							<span>
								국내 1위 베트남 쌀국수 전문점 포메인은<br/>
								베트남 외식 문화의 선구자로서 쌀국수 "면"의<br/>
								건강한 변화가 필요하다고 판단하였습니다.<br/>
								<br/>
								기존의 밀가루 또는 묵을쌀로 만든 면이 아닌 건강한 면을<br/>
								만들기 위해 베트남 현지 쌀국수 제조공장 포시즌을<br/>
								설립하였으며 3모작이 가능한 베트남에서 1년 내내<br/>
								 영양이 가득한 햅쌀을 공급받고 있습니다.<br/>
								<br/>
								수많은 테스트와 시행착오 끝에 독자기술로 완성한<br/>
								햅쌀 쌀국수면은 별도의 화학첨가물 없이 오직 햅쌀과<br/>
								정제수만으로 햅쌀 본연의 맛과 향<br/>
								그리고 식감을 담아내는데 성공했습니다.<br/>
								<br/>
								쌀국수에 햅쌀이라는 우리만의 기술을 입히고<br/>
								세상에 없던 쌀국수를 선보이는 포메인에서 우리 아이,<br/>
								우리 가족이 안심하고 먹을 수 있는 건강한 쌀국수를 맛보세요.<br/>
							</span>
						</div>
					</div>
					<div class="red02-wrap">
						<div class="blank_area"></div>
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
		<!-- //content -->
	</div>
	<!-- //container -->

	<!-- footer -->
	<%@ include file="/WEB-INF/jsp/mcompany/include/companyfooter.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrap -->

<script src="../common/js/jquery-1.12.4.min.js"></script>
<script src="../common/js/swiper.min.js"></script>
<script src="../common/js/common.js"></script>
<script type="text/javascript">
$(function(){
	// 카테고리 메뉴
	cateNav();
	// Swiper
	defaultSwiper();
});
</script>
</body>
</html>
