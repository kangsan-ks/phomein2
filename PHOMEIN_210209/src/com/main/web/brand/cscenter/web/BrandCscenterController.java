package com.main.web.brand.cscenter.web;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.customer.service.CustomerService;
import com.main.admin.store.service.StoreService;
import com.main.web.brand.cscenter.web.validate.CsCenterValidate;
import com.main.web.brand.cscenter.web.vo.CsCenterVo;

@Controller
@RequestMapping({ "/brand/cs_center/*", "/mbrand/cs_center/*" })
public class BrandCscenterController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "brand/cs_center/";

	private final String M_NAMESPACE = "mbrand/cs_center/";

	@Resource(name = "csCenterValidator")
	private CsCenterValidate csCenterValidate;

	@Resource(name = "customerService")
	private CustomerService customerService;

	@Resource(name = "storeService")
	private StoreService storeService;

	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		binder.registerCustomEditor(MultipartFile.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				logger.debug("initBinder MultipartFile.class: {}; set null;", text);
				setValue(null);
			}
		});
	}

	@RequestMapping(value = "cs_terms.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cs_terms(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "cs_terms";
		}
		return NAMESPACE + "cs_terms";
	}

	@RequestMapping(value = "cs_info.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cs_info(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(required = false) String chk) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			if (StringUtils.isEmpty(chk)) {
				return "redirect:/mbrand/cs_center/cs_terms.do";
			}
		}

		if (StringUtils.isEmpty(chk)) {
			return "redirect:/brand/cs_center/cs_terms.do";
		}

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("useyn", 1);
		List<Map> resultList = storeService.selectPaging(param);
		// 방문매장 리스트 조회
		Collections.sort(resultList, new Comparator<Map>() {
			@Override
			public int compare(Map o1, Map o2) {
				return ((String) o1.get("name")).compareTo((String) o2.get("name"));
			}
		});
		model.addAttribute("resultList", resultList);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "cs_info";
		}
		return NAMESPACE + "cs_info";
	}

	@RequestMapping(value = "/cs_center_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> cs_center_modify(@RequestParam Map param,
			@ModelAttribute CsCenterVo csCenter, BindingResult bindingResult, Model model, HttpServletRequest request)
			throws Exception {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		/*
		csCenterValidate.validate(csCenter, bindingResult);
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		 */

		try{
			if(StringUtils.equals("110201", csCenter.getVisitstore())) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date visitDate = sdf.parse(csCenter.getVisitdatestr());
				csCenter.setVisitdate(visitDate);
			}

			// 첨부파일, 물리적인 파일 객체 업로드 save
			if (StringUtils.isNotEmpty(csCenter.getF_file1_txt()) //
					&& csCenter.getF_file1() != null) { //
				String f_file1 = customerService.saveAttachFile(csCenter.getF_file1());
				csCenter.setF_file1_txt(f_file1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("---");
		}

		csCenter.setSeq(StringUtils.isEmpty(customerService.nextSeq()) ? "1" : customerService.nextSeq());
		// customer : 일반인, store : 가맹점
		csCenter.setCode("customer");
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
