package com.main.web.company.main.web;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.admin.site.service.InterviewService;
import com.main.admin.site.service.PopupService;

@Controller
@RequestMapping({ "/company/main/*", "/mcompany/main/*" })
public class CompanyController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "company/main/";

	private final String M_NAMESPACE = "mcompany/main/";
	
	@Resource(name = "interviewService")
	private InterviewService interviewService;
	
	@Resource(name = "popupService")
	private PopupService popupService;

	// TODO /company/community/{boardType}/community_list.do
	@RequestMapping(value = "/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String companybrandHome(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("search_useyn", 1);
		model.addAttribute("resultList", interviewService.selectPaging(param));
		int totalRecordCount = interviewService.selectTotCnt(param);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageIndex", pageIndex);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "main";
		}
		return NAMESPACE + "main";
	}
	
	@RequestMapping(value = "/show_popup.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> show_popup(@RequestParam Map param) throws Exception {
		param.put("cate", "115202"); // 브랜드사이트
		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("resultList", popupService.showPopup(param));
		return returnMap;
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
