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
.red-title h3.h3-type { display: block; color: #222; font-size: 26px; line-height:1; font-weight: 500; letter-spacing: -1px;}
.red-title .n-txt {margin-top: 10px; display: block; color: #999; font-size: 8px; 
line-height: 1; letter-spacing: -0.5px; font-weight: 400;}
.red-title .n-txt b{color: #ac1600;}

/* red01 */
.red01-wrap{}
.red01-inner{margin-top: 20px; position: relative; text-align: center; font-size: 0;}
.red01-inner::after{position: absolute; top: 44px; left: 50%; width: 1px; height: 40px; display: block; content:""; z-index: 1; background: #d4c7b1;}
.red01-inner > img{width: 78px; margin-bottom:60px; display: inline-block; vertical-align:top;}
.red01-inner p{font-size: 15px; line-height:21px; letter-spacing:0; font-weight: 500; color: #333;}
.red01-inner span{margin: 20px 0 50px; font-size: 10px; line-height:16px; letter-spacing:0; font-weight: 400; color: #666; display: block;}
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
		<div class="sub_visual sv1_2">
			<h3>포메인 RED</h3>
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
				<iframe width="330" height="200" src="https://www.youtube.com/embed/De_4ozeCBd0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<div class="red-con">
				<div class="red-title">
					<!-- 20190225 수정 -->
					<h3 class="h3-type">포메인 RED</h3>
					<p class="n-txt"><b>R</b>ice noodle <b>E</b>xpress <b>D</b>elivery</p>
					<!-- //20190225 수정 -->
				</div>
			<div class="inner02">
				<div class="red01-wrap">
					<div class="red01-inner">
						<img src="../images/red/phomein-brown.png" alt="phomein">
						<p>소자본 쌀국수 창업 프랜차이즈의<br/>새로운 패러다임을 제시합니다.</p>
						<span>㈜데일리킹은 2006년 설립되어 국내에<br/>쌀국수 프랜차이즈 브랜드 ‘포메인’을 정착시키고,<br/>베트남 요리 외식 문화를 대중화시킨 법인 기업입니다.<br/>또한 변화하는 트렌드와 시장 환경에 맞춰<br/>소자본 창업 브랜드 ‘포메인 RED’를 런칭하였습니다.<br/><br/>투명한 경영방침으로 15년 동안 ‘포메인’을 운영해온<br/>프랜차이즈 전문 기업 ㈜데일리킹이 만든 브랜드로<br/>업계 1위 장수 브랜드의 노하우와 견고한 운영체계가 결집된<br/>‘확실한 경쟁력’을 보장합니다.</span>
					</div>
				</div>
				<div class="red02-wrap red02-bg">
					<div class="red02-inner">
						<div class="red02-tit">
							<p>DAILYKING INC</p>
						</div>
						<div class="red02-in clear">
							<div class="r-box">
								<img src="../images/red/phomein-green.png" alt="phomein" class="img-pos">
								<p class="r-tit">포메인</p>
								<span class="r-bar"></span>
								<img src="../images/red/restaurant-icon.png" alt="레스토랑형" class="img-icon">
								<p class="r-name">레스토랑형</p>
								<span class="r-txt">(1.5~2억 / 30평~)</span>
							</div>
							<div class="r-box">
								<img src="../images/red/phomein-brown.png" alt="phomein" class="img-pos">
								<p class="r-tit">포메인 R.E.D</p>
								<span class="r-bar"></span>
								<img src="../images/red/express-icon.png" alt="익스프레스형" class="img-icon">
								<p class="r-name">익스프레스형</p>
								<span class="r-txt">(1억 / 10~15평)</span>
							</div>
						</div>
					</div>
				</div>
				<div class="red03-wrap red03-bg">
					<div class="red03-inner">
						<div class="red03-tit">
							<p>프리미엄 소규모 쌀국수 브랜드,<br/>포메인 RED</p>
							<i></i>
							<span>포메인 RED는 변화하는 외식업 시장 트렌드 선점과<br/>부부 창업, 초보자 창업을 핵심 동력으로한 브랜드입니다.</span>
						</div>
						<div class="red03-in clear">
							<div class="red03-box">
								<img src="../images/red/red03-icon01.png" alt="소자본 1억 창업">
								<p>소자본 창업</p>
								<i class="bar"></i>
								<span>국내 프랜차이즈 평균 창업비용 대비<br/>
								<b>약 15% 낮은 비용</b>으로<br/>
								창업 비용 부담을 줄였습니다.</span>
								<strong>※ 2015년도 통계청 통계플러스(KOSTAT)<br/>프랜차이즈 현황 자료 발췌</strong>
							</div>
							<div class="red03-box">
								<img src="../images/red/red03-icon02.png" alt="안정적인 수익률">
								<p>안정적인 수익률</p>
								<i class="bar"></i>
								<span>국내 프랜차이즈 평균 대비<br/>
								<b>약 242% 이상의 높은 기대수익률</b>과<br/>
								매출 대비 <b>안정적인 수익률을 창출</b>합니다.</span>
								<strong>※ 2015년도 통계청 통계플러스(KOSTAT)<br/>프랜차이즈 현황 자료 발췌</strong>
								<strong>※ 점주 상주 및 총 매출액(3천 만원) 대비<br/>딜리버리 매출 30% 가정 </strong>
							</div>
							<div class="red03-box">
								<img src="../images/red/red03-icon03.png" alt="딜리버리 특화">
								<p>딜리버리 특화</p>
								<i class="bar"></i>
								<span><b>2014년 업계 최초 딜리버리서비스<br/>
								도입</b>으로 쌓은 쌀국수 포장·딜리버리에 대한<br/>노하우와 수 차례 연구로 개발한<br/>특허 받은 패키지로 꾸준한 매출 상승세와<br/>신규 고객을 창출합니다.</span>
							</div>
						</div>
					</div>
				</div>
				<div class="red04-wrap">
					<div class="red04-inner">
						<img src="../images/red/red04-bg.jpg" alt="사진">
						<p>포메인 RED,<br/>트렌드에 녹여낸 15년 노하우</p>
						<span>메뉴 개발, 인테리어, 입지 선정 등 더욱 엄격해진 기준과<br/>
						프랜차이즈 브랜드 15년 운영 노하우를 뒷받침으로<br/>
						가맹점주님들의 성공적인 미래를 준비합니다.</span>
					</div>
				</div>
				<div class="red05-wrap">
					<div class="red05-inner">
						<table>
							<colgroup>
								<col width="40%">
								<col width="20%">
								<col width="40%">
							</colgroup>
							<thead>
								<tr>
									<th class="th-pos">
										<img src="../images/red/red05-top-img01.png" alt="기존저가 소형업체">
										<p class="p2">기존 저가·소형<br/>업체</p>
									</th>
									<th class="th-cen">VS</th>
									<th class="th-pos">
										<img src="../images/red/red05-top-img02.png" alt="포메인 RED">
										<p>포메인 RED</p>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="td-icon pt21">
										<img src="../images/red/red05-tbl-img01.png" alt="아이콘">
										<p>신생 기업으로<br/>파악 불가</p>
									</td>
									<td class="td-bg">
										<p>본사<br/>경쟁력</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img02-15.png" alt="아이콘">
										<p class="m2">프랜차이즈 브랜드<br/>‘포메인’ 보유<br/><b>15년 운영 업력</b></p>
									</td>
								</tr>
								<tr>
									<td class="td-icon pt27">
										<img src="../images/red/red05-tbl-img03.png" alt="아이콘">
										<p>태국·베트남<br/>수입산 쌀국수면</p>
									</td>
									<td class="td-bg">
										<p>쌀국수면</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img04.png" alt="아이콘">
										<p class="m2">(주)데일리킹 베트남 법인<br/>쌀국수 공장 ‘포시즌’<br/><b>자가제면 햅쌀<br/>쌀국수면</b></p>
										<p class="m2"><b>햅쌀 쌀국수면 point!</b><br/>· 갓 지은 햅쌀밥의 향<br/>· 맑고 투명한 빛깔<br/>· 부드럽고 쫀득한 식감</p>
									</td>
								</tr>
								<tr>
									<td class="td-icon pt33">
										<img src="../images/red/red05-tbl-img05.png" alt="아이콘">
										<p>액상 스프·분말·<br/>과립형 제품 혼용</p>
									</td>
									<td class="td-bg">
										<p>육수</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img06.png" alt="아이콘">
										<p class="m2"><b>9가지 상급<br/>천연 향신료</b>로 만든<br/>‘Herb-Bags’과<br/><b>호주산 청정우</b> 사용하여<br/>14시간 끓여내 사용</p>
									</td>
								</tr>
								<tr>
									<td class="td-icon pt27">
										<img src="../images/red/red05-tbl-img07.png" alt="아이콘">
										<p>분식집 스타일</p>
									</td>
									<td class="td-bg">
										<p>인테리어</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img08.png" alt="아이콘">
										<p class="m2">오래 봐도 질리지 않는<br/><b>미니멀&amp;모던 인테리어</b></p>
									</td>
								</tr>
								<tr>
									<td class="td-icon pt21">
										<img src="../images/red/red05-tbl-img09.png" alt="아이콘">
										<p>전무하거나<br/>창업 모집 광고</p>
									</td>
									<td class="td-bg">
										<p>언론<br/>홍보</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img10.png" alt="아이콘">
										<p class="m2">브랜드 스토리를 담은<br/>보도자료 배포로<br/><b>신뢰 및 인지도 구축</b></p>
									</td>
								</tr>
								<tr>
									<td class="td-icon pt21">
										<img src="../images/red/red05-tbl-img11.png" alt="아이콘">
										<p>공식 SNS<br/>채널 X</p>
									</td>
									<td class="td-bg">
										<p>SNS</p>
									</td>
									<td class="td-icon">
										<img src="../images/red/red05-tbl-img12.png" alt="아이콘">
										<p class="m2"><b>공식 SNS 채널<br/>3개 보유</b><br/>(블로그, 유튜브, 인스타그램)</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="red06-wrap">
					<div class="red06-inner">
						<div class="red06-tit">
							<p>포메인 RED,<br/>맛과 품질로 쌓은 브랜드 파워</p>
							<i></i>
							<span>포메인 RED는 번거로운 작업 환경을 개선한 최적화된 시스템으로<br/>오직 쌀국수 연구에만 집중할 수 있는 환경을 구축하였습니다.<br/>또한 보이지 않는 곳에서 변화를 주도해온 장인의 철학처럼<br/>쌀국수의 품격과 미래 비전을 제시합니다.</span>
						</div>
						<div class="red06-in clear">
							<div class="red06-box">
								<img src="../images/red/red06-icon01.png" alt="사진">
								<p>현대그린푸드</p>
								<strong>‘안전한 식자재 공급’ MOU</strong>
								<i class="bar"></i>
								<span>‘위해상품 차단 시스템’을 갖춘<br/>
								종합식품기업 ‘현대그린푸드’와<br/>
								업무협약을 체결하여 각 가맹점에<br/>
								안전한 식자재를 공급합니다.</span>
							</div>
							<div class="red06-box">
								<img src="../images/red/red06-icon02.png" alt="사진">
								<p>베트남 현지 법인</p>
								<strong>쌀국수 공장 포시즌(PHO SEASON)</strong>
								<i class="bar"></i>
								<span>‘안전한 식재료 정직한 먹거리’라는<br/>
								이념아래 포시즌(PHO SEASON)을 설립,<br/>
								독자적인 연구개발로 쌀국수면과<br/>
								육수용 허브백(Herb-Bags)을 자체 생산합니다.</span>
							</div>
							<div class="red06-box">
								<img src="../images/red/red06-icon03.png" alt="사진">
								<p>국내 브랜드 유일</p>
								<strong>햅쌀로 만든 ‘햅쌀 쌀국수면’</strong>
								<i class="bar"></i>
								<span>묵은쌀로 만든 수입 쌀국수면에 의존한<br/>
								쌀국수 시장에서 햅쌀로 자가제면한<br/>
								‘햅쌀 쌀국수면’은 브랜드 파워인 동시에<br/>
								고객 약속의 결실입니다.</span>
							</div>
						</div>
					</div>
				</div>
				<div class="red07-wrap">
					<div class="red07-inner">
						<img src="../images/red/red07-img.png" alt="사진">
						<p>베트남 쌀국수 대표 브랜드 ‘포메인’을 운영해온 <br/>㈜데일리킹은
						15년 전을 거슬러 현재를 보는 안목과 <br/>변치 않는 초심으로 다가올 10년을 향해 <br/>도약하고자 합니다.</p>
						<div class="hbar"></div>
						<div class="red07-in">
							<img src="../images/red/red07-poslogo.png" alt="로고" class="red07-posimg">
							<p class="red07-tit01">名品 쌀국수</p>
							<h4 class="red07-tit02">포메인 RED</h4>
							<i class="bar"></i>
							<span class="red07-txt01">수많은 외식 브랜드가 범람하는 환경에서<br/>‘쌀국수’만은 최고라는 ‘자부심’과<br/>‘名品 쌀국수’를 연구하는 ‘장인정신’으로<br/>포메인 RED의 역사와 미래를 함께 하실<br/>또 한 분의 가족을 모십니다.</span>
							<span class="red07-txt02">기타 자세한 내용은 문의 부탁드립니다.</span>
							<img src="../images/red/red07-service.png" alt="고객센터">
							<span class="red07-txt03">가맹점 상담문의<br/><b>1899-2422</b></span>
						</div>
						</div>						
					</div>
				</div>

				<div class="red08-wrap">
					<div class="red08-inner">
						<!--img src="../images/red/phomein-brown.png" alt="phomein">
						<p class="red08-tit01">포메인 RED 1호점</p-->
						<h4 class="red08-tit02">INTERIOR</h4>
						<!--p class="red08-tit01">도곡점</p-->
						<div class="red08-in" style="margin-bottom:80px;">
							<img src="../images/red/red8-img.png" alt="">
						</div>
						<!-- 2020-04-01 숨김요청
						<h4 class="red08-tit02">INFOMATION</h4>
						<div class="red08-info">
							<table>
								<tbody>
									<tr>
										<td align="left" class="title_td">
											<img src="../images/red/red8-icon1.png" alt="">
											<span>매장 주소</span>
										</td>
										<td align="left" class="info_td">
											<span>서울특별시 강남구 언주로 30길 21<br>아카데미 프라자 1층</span>
										</td>
									</tr>
									<tr>
										<td align="left" class="title_td">
											<img src="../images/red/red8-icon2.png" alt="">
											<span>매장 전화</span>
										</td>
										<td align="left" class="info_td">
											<span>02-3463-8880</span>
										</td>
									</tr>
									<tr>
										<td align="left" class="title_td">
											<img src="../images/red/red8-icon3.png" alt="">
											<span>운영 시간</span>
										</td>
										<td align="left" class="info_td">
											<span>11:00AM - 21:30PM</span>
										</td>
									</tr>
									<tr>
										<td align="left" class="title_td">
											<img src="../images/red/red8-icon4.png" alt="">
											<span>이용가능서비스</span>
										</td>
										<td align="left" class="info_td">
											<span>매장내식사 / 포장 / 딜리버리 / 주차</span>
										</td>
									</tr>
									<tr>
										<td align="left" class="title_td">
											<img src="../images/red/red8-icon5.png" alt="">
											<span>시그니쳐 메뉴</span>
										</td>
										<td align="left" class="info_td">
											<span>레드 포</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						-->

						<h4 class="red08-tit02">MENU</h4>
						<div class="red08-in">
							<img src="../images/red/red8-img01.png" alt="">
						</div>
					</div>
				</div>

				<div class="red09-wrap">
						<div class="red09-inner">
							<h4 class="red09-tit02">INTERVIEW</h4>
							<p class="red09-tit03">지난 10년은 포메인에서<br>오는 10년은 포메인 레드에서</p>
							<img src="../images/red/red9-img.png" alt="">
							<span class="red09-img-span">포메인 레드 1호점 - 도곡점 김지현 점주</span>
							<div class="interview_con">
								<div class="icon">
									<img src="../images/red/red9-icon.png" alt="" style="width:50px;">
								</div>
								<ul>
									<li>
										<img src="../images/red/red9-icon1.png" alt="">
										<b>간략한 자기소개 부탁드립니다.</b>
										<p>포메인을 운영하다 2019년 11월 포메인 레드 1호 도곡점을 오픈한 김지현 점주입니다.</p>
									</li>
									<li>
										<img src="../images/red/red9-icon1.png" alt="">
										<b>포메인 양재역점을 운영하다 포메인레드를 창업하게 된 계기는?</b>
										<p>포메인 양재역점을 10년 동안 운영했어요. 그러나 매년 오르는 인건비와 계속 상승하는 임차료로 인한 건물주와의 의견 차이를 좁힐 수 없어 폐업을 결정하게 됐어요. 양재역 사거리 1층이라는 메인상권이 암초로 작용한 것 같아요. 어쩔 수 없는 폐업이었기에 아쉬움이 굉장히 컸는데 마침 그 즈음에 포메인 레드가 런칭했어요. 그동안 찾아주시는 단골분들도 눈에 밟히고 포메인 본사와의 신뢰도 탄탄했기에 포메인 레드 창업을 결정하게 됐어요.</p>
									</li>
									<li>
										<img src="../images/red/red9-icon1.png" alt="">
										<b>포메인 레드 경쟁력이 무엇인지?</b>
										<p>메뉴의 맛과 품질은 기본이고, 소규모 매장에 무인결제 시스템 도입으로 인건비 부담 없이 매장을 운영할 수 있다는 점이 큰 경쟁력이라 판단했어요. 최소 인력으로 유연하게 운영할 수 있고 초보자도 어렵지 않게 맛을 낼 수 있어서 전문 주방 인력을 고용하지 않아도 돼 인건비 절약에 일석이조였죠. 포메인 레드는 빠른 회전율과 포장배달을 전문화한 매장이어서 작은 규모지만 규모의 경제가 가능한 브랜드라서 소자본이지만 안정적인 매출을 찾는 예비창업자, 창업 초보자분에게 딱 부합하는 브랜드인 것 같아요. 또 본사와 슈퍼바이저 분들과 10년 동안 쌓아온 신뢰가 한몫했죠. 준비 단계부터 오픈 후에도 내 가게처럼 챙겨주시니까요. 본사 마진이 아니라 ‘함께’ 성장하려는 상생 경영이 참 든든했습니다. 주변에서 본사에서 그렇게까지 신경 써준다고? 하고 놀랄 정도예요.</p>
									</li>
									<li>
										<img src="../images/red/red9-icon1.png" alt="">
										<b>매출은 만족하시는지?</b>
										<p>아직 오픈 초기 단계라 매출 실적을 논하기에는 조금 조심스럽지만 일 매출, 월 매출 모두 기대 수익 이상을 달성하고 있어요. 오픈전부터 오픈 날짜를 물어보는 분들이 많았는데, 그게 대박 조짐이었던 거 같아요.(웃음) 포메인 양재역점도 꽤 높은 월매출을 달성했었는데 인건비, 임대료 등 매장운영비를 제하면 순수익률은 포메인 레드가 훨씬 더 좋아요. 실질적으로 포메인 레드가 운영 관리에 신경을 덜 쓸 수 있는 시스템이다 보니 공수는 줄고 매출은 보장되는 더 합리적인 브랜드라는 생각이 들어요.</p>
									</li>
									<li>
										<img src="../images/red/red9-icon1.png" alt="">
										<b>예비 창업주들에게 간략한 조언과 앞으로의 포부 부탁드린다.</b>
										<p>안정적인 소자본 창업, 소규모 창업을 고민 중이라면 유행하는 아이템은 지양하고 트렌드를 읽을 줄 아는 눈이 필요해요. 혼밥, 배달, 인건비 절감 등의 키워드를 무시할 수 없더라고요. 또 기본적으로 프랜차이즈를 운영해온 본사 업력과 오픈 후 사후관리, 경영방침 등 면밀한 검토가 필요해요. 지난 10년을 포메인과 함께 해오면서 앞으로의 10년도 포메인 레드와 함께 하기로 결심한 데는 이를 뒷받침하는 본사와의 긴밀한 신뢰가 있어서 가능했어요. 특히 이미 쌀국수 대표 브랜드로 시장의 정상에 자리매김하고도 메뉴 개발과 소통을 게을리하지 않는 모습에 깊은 감명을 받았었거든요. 수년간 연구개발로 성공한 햅쌀면 생산은 묵은쌀로 만든 쌀국수 공산품을 사용하는 타 브랜드와는 비교 불허한, 차원이 다른 경쟁력이 틀림없다고 생각해요. 가맹점 늘리기에만 급급한 여타 프랜차이즈와는 달리 상생의 길을 걸어가고 있는 포메인 레드 본사처럼 당장에 매출이 아니라 맛과 품질 모두 가장 완벽한 쌀국수를 먹을 수 있는 도곡점이 되기 위해 노력하겠습니다.</p>
									</li>
								</ul>
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
