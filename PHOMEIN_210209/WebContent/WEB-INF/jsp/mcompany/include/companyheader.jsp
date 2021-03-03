<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<header id="header">
		<h1>
			<a href="/mbrand/main/main.do"><span class="blind">포메인</span></a>
		</h1>
		<div class="link">
			<a href="/mcompany/franchisee/terms.do?" class="btn_link">가맹문의</a>
		</div>
		<!-- <div class="link">
			<a href="/mcompany/main/main.do" class="btn_link">기업사이트</a>
		</div>
		<div class="link">
			<a href="/mbrand/main/main.do" class="btn_link01">브랜드사이트</a>
		</div> -->
		<div class="allmenu">
			<button type="button" class="btn_allmenu"><span class="blind">전체메뉴</span></button>
		</div>
	</header>

<style>
#resizable
{
    border: 0px;
    width: 30px;
    height: 90px;
    z-index: 1000;
    right: 20px;
    bottom: 8%;    
    position:fixed;
    background-color: transparent;
}
</style>
<div id="resizable" class="ui-widget-content" style="z-index: 1000;">
	<a href="/mbrand/main/main.do"><img style="margin-bottom:5px;" src="/brand/images/icon/m_right_fixed_ico04.png"></a>
	<a href="/mcompany/franchisee/red.do"><img style="margin-bottom:5px;" src="/brand/images/icon/m_right_fixed_ico02.png"></a>
	<a href="/company/franchisee/terms.do"><img src="/brand/images/icon/m_right_fixed_ico03.png"></a>
</div>
