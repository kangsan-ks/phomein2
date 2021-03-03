package com.main.web.company.etc.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.DeviceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({ "/company/etc/*", "/mcompany/etc/*" })
public class CompanyEtcController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "company/etc/";
	
	private final String M_NAMESPACE = "mcompany/etc/";

	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = "terms.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String terms(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "terms";
		}
		return NAMESPACE + "terms";
	}
	
	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = "privacy.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String privacy(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "privacy";
		}
		return NAMESPACE + "privacy";
	}
	
	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = "email.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String email(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "email";
		}
		return NAMESPACE + "email";
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
