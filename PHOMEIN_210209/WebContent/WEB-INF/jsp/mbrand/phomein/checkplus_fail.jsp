
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mbrand/include/head.jspf"%>

<input type="hidden" name="message" id="message" value="${message }"/>
		
<script>

$(function(){	
	// 에러 메시지 처리
	if($("#message").val() != '') {
		alert($("#message").val());
	}
	self.close();
});

</script>
