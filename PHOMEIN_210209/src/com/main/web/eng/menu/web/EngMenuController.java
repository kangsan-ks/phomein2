package com.main.web.eng.menu.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import com.main.admin.comm.service.CodeService;
import com.main.admin.menu.service.ProductService;
import com.main.admin.menu.service.RedProductService;
import com.main.domain.CodeVO;

@Controller
@RequestMapping({ "/eng/menu/*", "/meng/menu/*" })
public class EngMenuController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "eng/menu/";

	private final String M_NAMESPACE = "meng/menu/";

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "redProductService")
	private RedProductService redProductService;
	
	@Resource(name = "codeService")
	private CodeService codeService;

	// 메뉴 목록
	@RequestMapping(value = "menu_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("103");
		// 영문 메뉴 카테고리 조회
		model.addAttribute("encodes", codeService.selectCodeSub(codeVO));

		param.put("pageUnit", 9999);
		int startCount = 0;

		if(!deviceType.equals("normal")){
			param.put("pageUnit", 6);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 6);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("search_site_ck", 2);
		param.put("search_useyn", 1);
		int totalRecordCount = productService.selectTotCnt(param);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageIndex", pageIndex);

		model.addAttribute("resultList", productService.selectMenuList(param));

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "menu_list";
		}
		return NAMESPACE + "menu_list";
	}

	// 메뉴 리스트 AJAX 조회
	@RequestMapping(value = "/get_menu_list_ajax.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_menu_list_ajax(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(value = "best_ck", required = false) String best_ck,
			@RequestParam(value = "hot_ck", required = false) String hot_ck,
			@RequestParam(value = "new_ck", required = false) String new_ck,
			@RequestParam(value = "menu_ck[]", required = false) String[] menu_ck,
			@RequestParam(value = "all_ck", required = false) String all_ck, HttpServletRequest request)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String deviceType = getDeviceType(request);

		param.put("pageIndex", pageIndex);
		param.put("pageUnit", 9999);
		int startCount = 0;

		if(!deviceType.equals("normal")){
			param.put("pageUnit", 6);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 6);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("best_ck", best_ck);
		param.put("hot_ck", hot_ck);
		param.put("new_ck", new_ck);
		param.put("menu_ck", menu_ck);
		param.put("all_ck", all_ck);
		param.put("search_site_ck", 2);
		// 메뉴 리스트 조회
		returnMap.put("result", productService.selectMenuList(param));
		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		returnMap.put("searchTotalCnt", productService.selectMenuList(param).size());
		returnMap.put("pageIndex", pageIndex);
		return returnMap;
	}

	// 메뉴 상세 AJAX 조회
	@RequestMapping(value = "/get_menu_view_ajax.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_menu_view_ajax(@RequestParam Map param,
			@RequestParam(value = "seq") String seq) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("103");
		// 영문 메뉴 카테고리 조회
		returnMap.put("encodes", codeService.selectCodeSub(codeVO));

		List<Map> resultList = new ArrayList<Map>();
		// 메뉴 상세 조회
		param.put("seq", seq);
		Map map = productService.selectProductView(param);
		returnMap.put("resultView", map);
		resultList.add(map);

		String[] en_menu_ck = { (String) map.get("en_code") };
		param.put("menu_ck", en_menu_ck);
		param.put("search_site_ck", 2);

		resultList.addAll(productService.selectCodeList(param));
		returnMap.put("enmenuList", resultList);

		return returnMap;
	}

	// 메뉴 상세
	@RequestMapping(value = "menu_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String menu_view(@RequestParam Map param, @RequestParam(value = "seq") String seq, HttpSession session,
			ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		param.put("seq", seq);

		// 메뉴 상세 조회
		Map map = productService.selectProductView(param);
		model.addAttribute("resultView", map);

		return M_NAMESPACE + "menu_view";
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

	//////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	// RED
	// 메뉴 목록
	@RequestMapping(value = "red_menu_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String red_menu_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("116");
		// 영문 메뉴 카테고리 조회
		model.addAttribute("encodes", codeService.selectRedCodeSub(codeVO));

		param.put("pageUnit", 9999);
		int startCount = 0;

		if(!deviceType.equals("normal")){
			param.put("pageUnit", 6);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 6);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("search_site_ck", 2);
		param.put("search_useyn", 1);
		int totalRecordCount = redProductService.selectTotCnt(param);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageIndex", pageIndex);

		model.addAttribute("resultList", redProductService.selectMenuList(param));

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "red_menu_list";
		}
		return NAMESPACE + "red_menu_list";
	}

	// 메뉴 리스트 AJAX 조회
	@RequestMapping(value = "/get_red_menu_list_ajax.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_red_menu_list_ajax(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(value = "best_ck", required = false) String best_ck,
			@RequestParam(value = "hot_ck", required = false) String hot_ck,
			@RequestParam(value = "new_ck", required = false) String new_ck,
			@RequestParam(value = "menu_ck[]", required = false) String[] menu_ck,
			@RequestParam(value = "all_ck", required = false) String all_ck, HttpServletRequest request)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String deviceType = getDeviceType(request);

		param.put("pageIndex", pageIndex);
		param.put("pageUnit", 9999);
		int startCount = 0;

		if(!deviceType.equals("normal")){
			param.put("pageUnit", 6);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 6);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("best_ck", best_ck);
		param.put("hot_ck", hot_ck);
		param.put("new_ck", new_ck);
		param.put("menu_ck", menu_ck);
		param.put("all_ck", all_ck);
		param.put("search_site_ck", 2);
		// 메뉴 리스트 조회
		returnMap.put("result", redProductService.selectMenuList(param));
		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		returnMap.put("searchTotalCnt", redProductService.selectMenuList(param).size());
		returnMap.put("pageIndex", pageIndex);
		return returnMap;
	}

	// 메뉴 상세 AJAX 조회
	@RequestMapping(value = "/get_red_menu_view_ajax.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_red_menu_view_ajax(@RequestParam Map param,
			@RequestParam(value = "seq") String seq) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("116");
		// 영문 메뉴 카테고리 조회
		returnMap.put("encodes", codeService.selectRedCodeSub(codeVO));

		List<Map> resultList = new ArrayList<Map>();
		// 메뉴 상세 조회
		param.put("seq", seq);
		Map map = redProductService.selectProductView(param);
		returnMap.put("resultView", map);
		resultList.add(map);

		String[] en_menu_ck = { (String) map.get("en_code") };
		param.put("menu_ck", en_menu_ck);
		param.put("search_site_ck", 2);

		resultList.addAll(redProductService.selectCodeList(param));
		returnMap.put("enmenuList", resultList);

		return returnMap;
	}

	// 메뉴 상세
	@RequestMapping(value = "red_menu_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String red_menu_view(@RequestParam Map param, @RequestParam(value = "seq") String seq, HttpSession session,
			ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		param.put("seq", seq);

		// 메뉴 상세 조회
		Map map = redProductService.selectProductView(param);
		model.addAttribute("resultView", map);

		return M_NAMESPACE + "red_menu_view";
	}
}
