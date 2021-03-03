package com.main.web.company.company.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
@RequestMapping({ "/company/company/*", "/mcompany/company/*" })
public class CompanyCompanyController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "company/company/";

	private final String M_NAMESPACE = "mcompany/company/";

	@RequestMapping(value = "dailyking.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dailyking(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "dailyking";
		}
		return NAMESPACE + "dailyking";
	}

	@RequestMapping(value = "phomein.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String phomein(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "phomein";
		}
		return NAMESPACE + "phomein";
	}

	@RequestMapping(value = { "brownsugar.do", "family.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String brownsugar(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "family";
		}
		return NAMESPACE + "brownsugar";
	}

	@RequestMapping(value = "ceo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceo(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "ceo";
		}
		return NAMESPACE + "ceo";
	}

	@RequestMapping(value = "location.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String location(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "location";
		}
		return NAMESPACE + "location";
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
