package com.main.cmmn.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class DeviceInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String url = request.getRequestURI();
		Enumeration params = request.getParameterNames();
		String strParam = "?";
		while (params.hasMoreElements()) {
			String name = (String) params.nextElement();
			String value = request.getParameter(name);
			strParam += name + "=" + value + "&";
		}
		
		if (StringUtils.equals("normal", getDeviceType(request))) {
			if (StringUtils.equals("mbrand", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/brand";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("mcompany", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/company";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("meng", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/eng";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("mjpn", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/jpn";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
		} else {
			if (StringUtils.equals("brand", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/mbrand";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("company", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/mcompany";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("eng", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/meng";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
			if (StringUtils.equals("jpn", request.getServletPath().split("/")[1])) {
				String[] urlArr = url.split("/");
				String replaceUrl = "/mjpn";
				for (int i = 2; i < urlArr.length; i++) {
					replaceUrl += "/" + urlArr[i];
				}
				response.sendRedirect(replaceUrl + strParam);
				return false;
			}
		}
		return true;
	}

	private String getDeviceType(HttpServletRequest request) {
		Device device = DeviceUtils.getCurrentDevice(request);
		if (device == null) {
			return "deivice is null";
		}

		String deviceType = "unknown";

		if (device.isNormal()) {
			deviceType = "normal";
		} else if (device.isMobile()) {
			deviceType = "mobile";
		} else if (device.isTablet()) {
			deviceType = "tablet";
		}
		return deviceType;
	}

}
