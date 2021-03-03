package com.main.cmmn.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class StoreLoginInterceptor extends HandlerInterceptorAdapter{


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception  {

		final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

		HttpSession session = request.getSession();
		
		if (request.getRequestURI().indexOf("/top.do") > -1 || request.getRequestURI().indexOf("/login.do") > -1
				|| request.getRequestURI().indexOf("/logout.do") > -1 || request.getRequestURI().indexOf("/loginProc.do") > -1 ) {
		    return true;
		}	

		 // TODO 사이트 구분 [ 통합관리자 | 가맹점주 관리자 ]
		
		 // TODO 세션 체크 
		/*		*/
		if(session.getAttribute("storeSession") == null){
			response.sendRedirect("/store/login.do");
			return false;
		}else{
			return true;
		}

		
		/*		
		// 허용 IP
		String[] allowIP = { "119.196.16.248", "112.217.179.250", "127.0.0.1" };

		String path = new UrlPathHelper().getPathWithinApplication(request);
		String IP = getRemoteIPAddress(request);
	    logger.info(IP + " " + (!Arrays.asList(allowIP).contains(IP) ? "Deny" : "Allow"));

	    if (!Arrays.asList(allowIP).contains(IP) || session.getAttribute("adminSession") == null ) { // 허용 IP가 아니면 점검 페이지로
	    	logger.info("Deny IP : " + IP);
	            try {
	                response.sendRedirect("/");
	                return false;
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	    }
		// 허용 IP는 모두 패스
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		return true;
		*/
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
		
		if(modelAndView != null){
			//System.out.println(modelAndView.getViewName());
		}
	}

	
	public String getRemoteIPAddress(HttpServletRequest request) {

        String ipAddress = request.getHeader("X-Forwarded-For");

        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }

        return ipAddress;
    }
}
