<% response.setStatus(200); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/declare.jspf"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
	window.onload = function() {
		var url = location.href;
		var site = '/common/';
		
		if (url.includes('mbrand')) {
			site += 'mbrand';
		} 
		else if (url.includes('mcompany')) {
			site += 'mcompany';
		} 
		else if (url.includes('meng')) {
			site += 'meng';
		}
		else if (url.includes('mjpn')) {
			site += 'mjpn';
		}
		else if (url.includes('jpn')) {
			site += 'jpn';
		}
		else if (url.includes('eng')) {
			site += 'eng';
		}
		else if (url.includes('company')) {
			site += 'company';
		} 
		else {
			site += 'brand';
		}
		location.href = site +  '_error_404.jsp';
	};
</script>
</head>
<body>

</body>
</html>