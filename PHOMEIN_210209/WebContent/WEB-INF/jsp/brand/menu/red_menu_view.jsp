<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!doctype html>
<html lang="ko">
<head>
<title>포메인</title>
<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>
</head>

<body>
<!-- skip-link -->
<a href="#dBody" id="skip-link">본문 바로가기</a>
<!-- //skip-link -->

<!-- wrap -->
<div id="wrap">

	<!-- dHead -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandheader.jsp"%>
	<!--// dHead -->

	<!-- dBody -->
	<!--
		00. main					:	메인
		01. phomein					:	포메인
		02. menu					:	메뉴
		03. store					:	매장안내
		04. community				:	커뮤니티
		05. cs_center				:	고객의 소리
		00. etc						:	푸터 컨텐츠
	-->

	<section id="dBody" class="cphomein">
		<!-- visual -->
		<%@ include file="/WEB-INF/jsp/brand/include/brandheadVisual.jsp"%>
		<%-- noVisual
		<%@ include file="/WEB-INF/jsp/brand/include/brandheadNoVisual.jsp"%>  --%>

		<!-- contents -->
		<div id="contents" class="content">
			<div class="inner">

				<div class="search-option">
					<div class="option">
						<p class="chk-type01"><input type="checkbox" id="check0101" name="check01" checked><label for="check0101"><span></span>ALL</label></p>
						<P class="all-num">전체 메뉴 수 <span>35개</span></P>
					</div>
					<div class="option">
						<p class="chk-type01"><input type="checkbox" id="check0201" name="check02" checked><label for="check0201"><span></span>BEST</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0202" name="check02"><label for="check0202"><span></span>SPICY</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0203" name="check02"><label for="check0203"><span></span>NEW</label></p>
					</div>
					<div class="option">
						<p class="chk-type01"><input type="checkbox" id="check0301" name="check03" checked><label for="check0301"><span></span>쌀국수</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0302" name="check03"><label for="check0302"><span></span>볶음국수</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0303" name="check03"><label for="check0303"><span></span>월남쌈</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0304" name="check03"><label for="check0304"><span></span>스페셜 메뉴</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0305" name="check03"><label for="check0305"><span></span>에피타이저</label></p>
						<p class="chk-type01"><input type="checkbox" id="check0306" name="check03"><label for="check0306"><span></span>볶음밥</label></p>
					</div>
				</div>

				<div class="menu-con">
					<!-- menu-board-list -->
					<div class="menu-board-list">
						<ul>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
										<span class="hot">HOT</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
										<span class="hot">HOT</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
										<span class="hot">HOT</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
										<span class="new">NEW</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<div class="img"><img src="../images/tmp/@img_340x340.jpg" alt=""/></div>
									<div class="icon">
										<span class="best">BEST</span>
									</div>
									<div class="name">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
									</div>
									<div class="info">
										<p class="ko-name">프리미엄 소고기 쌀국수</p>
										<p class="en-name">Top Quality of Beef Pho</p>
										<p class="txt">최고급 부위의 생고기를 넣은<br> 프리미엄 쌀국수</p>
									</div>
								</a>
							</li>
						</ul>
					</div>
					<!-- //menu-board-list -->
				</div>

			</div>
		</div>
		<!-- //contents -->


	</section>
	<!--// dBody -->

	<!-- quick-menu -->
	<!-- 20190318 수정 s -->
	<!-- 메인, 매장찾기 페이지 반영 제외 -->
	<div class="quick-menu">
		<a href="/company/franchisee/rice.do" class="btn-menu">국내유일 햅쌀면</a>
		<a href="/company/franchisee/terms.do" target="_blank" class="btn-company">가맹 상담</a>
		<a href="/brand/store/store_list.do" target="_blank" class="btn-franchisee">매장 찾기</a>
		<a href="javascript:front.common.moveScroll(0, 750);" class="btn-top">TOP</a>
	</div>
	<!-- //20190318 수정 e -->
	<!-- //quick-menu -->

	<!-- dFoot -->
	<%@ include file="/WEB-INF/jsp/brand/include/brandfooter.jsp"%>
	<!--// dFoot -->

</div>
<!-- //wrap -->

<!-- [메뉴 상세보기] 팝업 -->
<div class="menu-view-pop" style="display:none;">
	<!-- menu-tap -->
	<div class="menu-tap">
		<ul>
			<li class="actived"><a href="#">쌀국수</a></li>
			<li><a href="#">볶음국수</a></li>
			<li><a href="#">월남쌈</a></li>
			<li><a href="#">볶음밥</a></li>
			<li><a href="#">스페셜메뉴</a></li>
			<li><a href="#">에피타이져</a></li>
		</ul>
		<a href="javascript:;" class="btn-pop-close"></a>
	</div>
	<!-- //menu-tap -->
	<!-- view-con -->
	<div class="view-con">
		<!-- menu-swiper -->
		<div class="menu-swiper">
			<div class="menu-view">
				<div class="menu-view-item">
					<ul class="img">
						<li class="on"><img src="../images/tmp/@img_1000x1000_1.jpg"><span>포메인 쌀국수1</span></li>
						<li><img src="../images/tmp/@img_1000x1000_2.jpg"><span>포메인 쌀국수1</span></li>
						<li><img src="../images/tmp/@img_1000x1000_3.jpg"><span>포메인 쌀국수1</span></li>
					</ul>
					<ul class="thumbs">
						<li class="on"><a href="#"><img src="../images/tmp/@img_80x80_1.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_2.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_3.jpg"></a></li>
					</ul>
				</div>
				<div class="menu-view-item">
					<ul class="img">
						<li class="on"><img src="../images/tmp/@img_1000x1000_1.jpg"><span>프리미엄 소고기2 <br>쌀국수</span></li>
						<li><img src="../images/tmp/@img_1000x1000_2.jpg"><span>프리미엄 소고기2 <br>쌀국수</span></li>
						<li><img src="../images/tmp/@img_1000x1000_3.jpg"><span>프리미엄 소고기2 <br>쌀국수</span></li>
					</ul>
					<ul class="thumbs">
						<li class="on"><a href="#"><img src="../images/tmp/@img_80x80_1.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_2.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_3.jpg"></a></li>
					</ul>
				</div>
				<div class="menu-view-item">
					<ul class="img">
						<li class="on"><img src="../images/tmp/@img_1000x1000_1.jpg"><span>볶음국수3</span></li>
						<li><img src="../images/tmp/@img_1000x1000_2.jpg"><span>볶음국수3</span></li>
						<li><img src="../images/tmp/@img_1000x1000_3.jpg"><span>볶음국수3</span></li>
					</ul>
					<ul class="thumbs">
						<li class="on"><a href="#"><img src="../images/tmp/@img_80x80_1.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_2.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_3.jpg"></a></li>
					</ul>
				</div>
				<div class="menu-view-item">
					<ul class="img">
						<li class="on"><img src="../images/tmp/@img_1000x1000_1.jpg"><span>에피타이져4</span></li>
						<li><img src="../images/tmp/@img_1000x1000_2.jpg"><span>에피타이져4</span></li>
						<li><img src="../images/tmp/@img_1000x1000_3.jpg"><span>에피타이져4</span></li>
					</ul>
					<ul class="thumbs">
						<li class="on"><a href="#"><img src="../images/tmp/@img_80x80_1.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_2.jpg"></a></li>
						<li><a href="#"><img src="../images/tmp/@img_80x80_3.jpg"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- //menu-swiper -->

		<div class="menu-info">
			<div class="info">
				<div class="name">
					<p>
						<span class="kr-name">프리미엄 소고기 쌀국수</span>
						<span class="us-name">Top Quality of Beef Pho</span>
					</p>
					<p class="txt">깔끔하고 개운한 맛의 매운 소고기 쌀국수</p>
				</div>
				<div class="price">
					<p>
						<span><strong class="price_s"></strong>10,500원</span>
						<span><strong class="price_l"></strong>12,500원</span>
					</p>
					<!-- 단일 가격일 경우
					<p>
						<span>12,500원</span>
					</p> -->
					<p class="txt">* 매장별로 가격이 상이 할 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- //view-con -->
</div>
<!-- [메뉴 상세보기] 팝업 -->


<script src="../common/js/front_ui.js"></script>
<script src="../common/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">

	var agt = navigator.userAgent.toLowerCase();

	var menuView = $('.menu-view');

	//상세 팝업 이미지 슬라이드
	function menuSlide(){
		$('.menu-view').slick({
			centerMode: true,
			infinite: false,
			//speed: (agt.indexOf('msie 9.0') > -1) ? 0 : 300,
			slidesToShow: 3,
			slidesToScroll: 1
		});

		menuView.find('.slick-prev').click(function(){
			productImgView();
			return false;
		});

		menuView.find('.slick-next').click(function(){
			productImgView();
			return false;
		});
	};

	// 선택된 상세 메뉴 다른 이미지 보기
	function productImgView(){
		var productImg = menuView.find('.slick-current .img li'),
			productImgList = menuView.find('.slick-current .thumbs li');

		productImgList.each(function(idx){
			$(this).find('a').click(function(){
				var parent = $(this).parents('.menu-view-item');
				var imgeq = $(this).parent().index();

				$(this).parent().addClass('on').siblings().removeClass('on');
				parent.find('.img > li').eq(imgeq).addClass('on').siblings().removeClass('on');

				return false;
			});
		});
	};

	// 메뉴 클릭 시 상세 팝업 오픈
	$('.menu-board-list li a').on('click',function(){
		$('.menu-view-pop').stop(true).fadeIn(400);
		$('html').addClass('fix');
		productImgView();

		return false;
	});

	// 상세 팝업 닫기
	$('.btn-pop-close').on('click',function(){
		$('.menu-view-pop').stop(true).fadeOut(400);
		$('html').removeClass('fix');

		return false;
	});

	$(function(){
		menuSlide();
	});

	// 메뉴 인덱스 값으로 호출
	function menuDetailPopActive(idx){
		$('.menu-view').slick('slickGoTo', idx);
	};

</script>

</body>
</html>
