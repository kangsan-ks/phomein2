package com.main.web.company.rnd.web;

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
@RequestMapping({ "/company/rnd/*", "/mcompany/rnd/*" })
public class CompanyRndController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "company/rnd/";

	private final String M_NAMESPACE = "mcompany/rnd/";

	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = "phoseason.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String phoseason(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "phoseason";
		}
		return NAMESPACE + "phoseason";
	}

	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = { "greenfood.do", "mou.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String greenfood(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "mou";
		}
		return NAMESPACE + "greenfood";
	}

	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = { "educ.do", "education.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String educ(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "education";
		}
		return NAMESPACE + "educ";
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
