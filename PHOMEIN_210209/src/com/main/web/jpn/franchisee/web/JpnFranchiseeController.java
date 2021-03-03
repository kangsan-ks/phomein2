package com.main.web.jpn.franchisee.web;

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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.admin.customer.service.CustomerService;
import com.main.admin.site.service.InterviewService;
import com.main.admin.store.service.StoreService;
import com.main.web.brand.cscenter.web.vo.CsCenterVo;
import com.main.web.company.franchisee.web.validate.TermsValidate;

@Controller
@RequestMapping({ "/jpn/franchisee/*", "/mjpn/franchisee/*" })
public class JpnFranchiseeController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "jpn/franchisee/";

	private final String M_NAMESPACE = "mjpn/franchisee/";

	@Resource(name = "termsValidator")
	private TermsValidate termsValidate;

	@Resource(name = "interviewService")
	private InterviewService interviewService;

	@Resource(name = "customerService")
	private CustomerService customerService;

	@Resource(name = "storeService")
	private StoreService storeService;

	@RequestMapping(value = "interior.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String interior(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		param.put("pageUnit", 9999);
		int startCount = 0;

		if (!StringUtils.equals("normal", deviceType)) {
			param.put("pageUnit", 3);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 3);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("useyn", 1);
		param.put("interioryn", "Y");
		param.put("openstatus", 2);
		model.addAttribute("resultList", storeService.selectPaging(param));
		int totalRecordCount = storeService.selectTotCnt(param);
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageIndex", pageIndex);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "interior";
		}
		return NAMESPACE + "interior";
	}

	// 매장 리스트 AJAX 조회
	@RequestMapping(value = "/get_interior_list_ajax.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_interior_list_ajax(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpServletRequest request)
			throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		String deviceType = getDeviceType(request);

		param.put("pageIndex", pageIndex);
		param.put("pageUnit", 9999);
		int startCount = 0;

		if (!StringUtils.equals("normal", deviceType)) {
			param.put("pageUnit", 3);
			startCount = (((Integer.parseInt(pageIndex) - 1)) * 3);
			if (startCount == 0) {
				startCount = 0;
			}
		}

		param.put("startCount", startCount);
		param.put("useyn", 1);
		param.put("interioryn", "Y");
		param.put("openstatus", 2);
		// 매장 리스트 조회
		returnMap.put("result", storeService.selectPaging(param));
		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		returnMap.put("searchTotalCnt", storeService.selectPaging(param).size());
		returnMap.put("pageIndex", pageIndex);
		return returnMap;
	}

	@RequestMapping(value = "terms.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String terms(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "terms";
		}
		return NAMESPACE + "terms";
	}

	@RequestMapping(value = "info.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String info(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(required = false) String chk) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			if (StringUtils.isEmpty(chk)) {
				return "redirect:/mjpn/franchisee/terms.do";
			}
		}

		if (StringUtils.isEmpty(chk)) {
			return "redirect:/jpn/franchisee/terms.do";
		}
		
		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "info";
		}
		return NAMESPACE + "info";
	}

	@RequestMapping(value = "/info_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> info_modify(@RequestParam Map param, @ModelAttribute CsCenterVo csCenter,
			BindingResult bindingResult, Model model, HttpServletRequest request) throws Exception {
		termsValidate.validate(csCenter, bindingResult);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}

		csCenter.setSeq(StringUtils.isEmpty(customerService.nextSeq()) ? "1" : customerService.nextSeq());
		// customer : 일반인, store : 가맹점
		csCenter.setCode("store");
		// Y : 접수중, N : 답변완료
		csCenter.setWorking("Y");
		csCenter.setAnsweryn("N");
		csCenter.setRegid("admin");
		csCenter.setModid("admin");
		// 고객의소리 기본 정보 save
		customerService.mergeCsCenter(csCenter);
		returnMap.put("result", "SUCCESS");
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
