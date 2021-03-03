package com.main.web.jpn.store.web;

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

import com.main.admin.store.service.StoreService;

@Controller
@RequestMapping({ "/jpn/store/*", "/mjpn/store/*" })
public class JpnStoreController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "jpn/store/";

	private final String M_NAMESPACE = "mjpn/store/";

	@Resource(name = "storeService")
	private StoreService storeService;

	@RequestMapping(value = "store_best.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String store_best(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("useyn", 1);
		param.put("bestcode", "106202");
		model.addAttribute("resultList", storeService.selectPaging(param));

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "store_best";
		}
		return NAMESPACE + "store_best";
	}

	// TODO /brand/store/store_list.do
	@RequestMapping(value = "store_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String storeList(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value = "", required = false) String storeName)
			throws Exception {
		String deviceType = getDeviceType(request);

		if (!"".equals(param.get("storeName"))) {
			model.addAttribute("storeName", param.get("storeName"));
		}
		if (!"".equals(param.get("best"))) {
			model.addAttribute("best", param.get("best"));
		}

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "store_list";
		}
		return NAMESPACE + "store_list";
	}
	
	// TODO /brand/store/store_view.do
	@RequestMapping(value = "store_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String store_view(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response ,@RequestParam(required = true) String seq) throws Exception {
		
		param.put("seq" , seq);
		model.addAttribute("result", storeService.selectView(param));
		return NAMESPACE + "store_view";
	}
	
	

	// TODO /brand/store/selectStoreList.do
	@RequestMapping(value = "selectStoreList.do", method = { RequestMethod.POST })
	public @ResponseBody Map<String, Object> selectStoreList(@RequestParam Map param, HttpSession session,
			ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("totalCnt", storeService.selectTotCnt(param));
		returnMap.put("resultList", storeService.selectPaging2(param));

		return returnMap;
	}

	// TODO /brand/store/selectStoreList.do
	@RequestMapping(value = "selectStore.do", method = { RequestMethod.POST })
	public @ResponseBody Map<String, Object> selectStore(@RequestParam Map param, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();

		returnMap.put("result", storeService.selectView(param));

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
