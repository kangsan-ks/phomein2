package com.main.web.brand.main.web;

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

import com.main.admin.community.service.BoardService;
import com.main.admin.main.service.MainService;
import com.main.admin.site.service.PopupService;

@Controller
@RequestMapping({ "/brand/main/*", "/mbrand/main/*" })
public class BrandController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "brand/main/";

	private final String M_NAMESPACE = "mbrand/main/";

	@Resource(name = "mainService")
	private MainService mainService;
	
	@Resource(name = "popupService")
	private PopupService popupService;

	@Resource(name = "boardService")
	private BoardService boardService;

	// TODO /brand/community/{boardType}/community_list.do
	@RequestMapping(value = "main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String brandHome(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("useyn", "Y");

		param.put("boardType", "notice");
		model.addAttribute("noticeList", boardService.selectPaging(param));

		param.put("boardType", "event");
		model.addAttribute("eventList", boardService.selectPaging(param));

		param.put("boardType", "sns");
		model.addAttribute("snsList", boardService.selectPaging(param));
		
		model.addAttribute("mainFieldVO", mainService.selectMainFieldDetail());

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "main";
		}
		return NAMESPACE + "main";
	}

	@RequestMapping(value = "/show_popup.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> show_popup(@RequestParam Map param) throws Exception {
		param.put("cate", "115201"); // 釉뚮옖�뱶�궗�씠�듃
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
