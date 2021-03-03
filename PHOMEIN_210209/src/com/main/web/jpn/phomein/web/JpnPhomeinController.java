package com.main.web.jpn.phomein.web;

import java.util.Map;

import javax.annotation.Resource;
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

import com.main.admin.customer.service.CustomerService;
import com.main.admin.site.service.PhoeverService;
import com.main.web.brand.phomein.service.PhomeinService;

@Controller
@RequestMapping({ "/jpn/phomein/*", "/mjpn/phomein/*" })
public class JpnPhomeinController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "jpn/phomein/";

	private final String M_NAMESPACE = "mjpn/phomein/";

	@Resource(name = "phomeinService")
	private PhomeinService phomeinService;

	@Resource(name = "phoeverService")
	private PhoeverService phoeverService;

	@Resource(name = "customerService")
	private CustomerService customerService;

	// DAILYKING
	@RequestMapping(value = "dailyking.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String dailyking(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "dailyking";
		}
		return NAMESPACE + "dailyking";
	}

	// CEO
	@RequestMapping(value = "ceo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ceo(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "ceo";
		}
		return NAMESPACE + "ceo";
	}

	// About phomein
	@RequestMapping(value = "about.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String about(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "about";
		}
		return NAMESPACE + "about";
	}

	// PHO SEASON
	@RequestMapping(value = "phoseason.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String phoseason(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "phoseason";
		}
		return NAMESPACE + "phoseason";
	}

	// Relief Phomein
	@RequestMapping(value = "greenfood.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String greenfood(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "greenfood";
		}
		return NAMESPACE + "greenfood";
	}

	// CSR
	@RequestMapping(value = "phoever.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String phoever(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "phoever";
		}
		return NAMESPACE + "phoever";
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
