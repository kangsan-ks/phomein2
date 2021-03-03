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
.red02-wrap{width: 100%; margin: 0 auto 45px;}
.red02-bg{background: url(../images/red/red02-bg.jpg) center center no-repeat; background-size: 100% 100%;}
.red02-inner{text-align: center;}
.red02-tit{padding: 30px 0 25px;}
.red02-tit p{font-size: 16px; line-height:1; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in{width: 92%; margin: 20px auto 0;}
.red02-in > div{width: 48%; height: 140px; margin-right: 4%; float: left; position: relative; background: #fff; text-align: center; font-size: 0; box-shadow:3px 3px 6px 3px rgba(0,0,0,0.1);}
.red02-in > div:last-of-type{margin-right: 0;}
.red02-in > div .img-pos{top: -15px; left: 50%; margin-left: -35px; width: 70px; display: block; position: absolute;}
.red02-in > div .r-tit{margin-top: 30px; font-size: 13px; line-height:1; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in > div .r-bar{width: 10px; height: 1px; margin: 9px auto 9px; display: block; background: #ddd;}
.red02-in > div .img-icon{width: 22px; margin-bottom: 10px; display: inline-block; vertical-align:top;}
.red02-in > div .r-name{font-size: 11px; line-height:1; letter-spacing:0; font-weight: bold; color: #333;}
.red02-in > div .r-txt{margin-top: 7px; font-size: 10px; line-height:1; letter-spacing:0; font-weight: 400; color: #666; display: block;}
/* red02 */

/* red03 */
.red03-wrap{width: 100%; margin: 0 auto 36px;}
.red03-bg{background: url(../images/red/red03-bg.jpg) center center no-repeat; background-size: 100% 100%;}
.red03-inner{ text-align: center;}
.red03-tit{padding: 35px 0 13px;}
.red03-tit p{font-size: 15px; line-height:21px; letter-spacing:0; font-weight: bold; color: #fff;}
.red03-tit i{width: 17px; height: 1px; margin: 10px auto 8px; font-style: normal; display: block; background: #fff;}
.red03-tit span{font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #fff; display: block;}
.red03-in {width: 90%; margin: 0 auto;}
.red03-in > div{padding:13px 0 15px; margin-bottom: 10px; width: 100%; background: 
#fff; box-sizing:border-box; font-size: 0; border: 1px solid #ededed;}
.red03-in > div:last-of-type{margin -bottom: 0;}
.red03-in > div img{width: 56px; margin-bottom: 10px; display: inline-block; vertical-align:top;}
.red03-in > div p{font-size: 13px; line-height:1; letter-spacing:0; font-weight: 500; color: #333;}
.red03-in > div .bar{width: 17px; height: 1px; margin: 6px auto 15px; font-style: normal; display: block; background: #ccc;}
.red03-in > div span{padding-bottom: 5px; font-size: 11px; line-height:17px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
.red03-in > div span b{color: #ac1600; font-weight: bold;}
.red03-in > div strong{margin-top: 10px; font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #999; display: block; box-sizing:border-box;}
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
		<div class="sub_visual sv3" style="background-image: url('/mcompany/common/images/layout/img_sv6.jpg');">
			<h3>딜리버리 서비스</h3>
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
				<iframe width="330" height="186" src="https://www.youtube.com/embed/LInM6QPlqLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="red-con">
				<div class="red-title">
					<!-- 20190225 수정 -->
					<h3 class="h3-type">WHENEVER, WHEREVER<br/>PHOMEIN DELIVERY SERVICE</h3>
					<!-- //20190225 수정 -->
				</div>
			<div class="inner02">
				<div class="red01-wrap">
					<div class="red01-inner">
						<span>
							2014년 업계 최초로 쌀국수 배달을 시행한 베트남<br/>
							쌀국수 전문점 포메인은 언제 어디서든 쌀국수를 즐길 수 있는<br/>
							환경을 조성하고자 딜리버리 사업에 뛰어들었습니다.<br/>
							<br/>
							분명 쉬운 길은 아니었지만 쌀국수 배달을 위해 포메인은<br/>
							지난 7년 동안 여러 차례의 시범운영을 통한 패키지 리뉴얼 작업,<br/>
							딜리버리 매뉴얼 제작으로 경쟁력을 쌓으며 가파르게 성장하는<br/>
							딜리버리 시장에 성공적으로 안착했습니다.<br/>
							<br/>
							이제는 너도나도 쌀국수 배달에 뛰어드는 시대 포메인의<br/>
							경쟁력은 하루아침에 만들어진 게 아니라는 걸 증명하듯<br/>
							자체 개발 쌀국수 전용 패키지와 우리만의 노하우로<br/>
							독보적인 서비스를 선보이고 있습니다.<br/>
							<br/>
							특히 배달을 받아보았을 때 쌀국수면에서 느낄 수 있는<br/>
							향긋한 햅쌀밥의 향은 애써 말하지 않아도<br/>
							고객이 먼저 느끼는 포메인의 강점입니다.<br/>
							<br/>
							포메인만의 레시피로 재해석한 32가지의 베트남 요리를<br/>
							언제, 어디서든 매장에서 즐기던 맛 그대로 만나보세요.<br/>
						</span>
					</div>
					<div class="red01-img">
						<img src="/mcompany/images/red/red01-img01.png" alt="" />
					</div>
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
