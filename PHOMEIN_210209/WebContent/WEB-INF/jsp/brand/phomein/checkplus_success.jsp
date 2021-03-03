<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/brand/include/head.jspf"%>

<input type="hidden" name="name" id="name" value="${name }"/>
<input type="hidden" name="mobileNo" id="mobileNo" value="${mobileNo }"/>
<input type="hidden" name="message" id="message" value="${message }"/>
		
<script>

$(function(){	
	// 에러 메시지 처리
	if($("#message").val() != '') {
		alert($("#message").val());
	} else {
		alert('인증되었습니다.');
		opener.setChildValue($("#name").val(), $("#mobileNo").val());
	}
	window.close();
});

</script>
