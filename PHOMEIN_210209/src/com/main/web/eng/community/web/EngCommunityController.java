package com.main.web.eng.community.web;

import java.beans.PropertyEditorSupport;
import java.util.Collections;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.community.service.BoardService;
import com.main.admin.customer.service.CustomerService;
import com.main.admin.store.service.StoreService;
import com.main.web.brand.cscenter.web.vo.CsCenterVo;
import com.main.web.eng.community.web.validate.AnotherCsCenterValidate;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({ "/eng/community/*", "/meng/community/*" })
public class EngCommunityController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "eng/community/";

	private final String M_NAMESPACE = "meng/community/";

	@Resource(name = "anotherCsCenterValidator")
	private AnotherCsCenterValidate csCenterValidator;

	@Resource(name = "customerService")
	private CustomerService customerService;

	@Resource(name = "storeService")
	private StoreService storeService;
	
	@Resource(name = "boardService")
	private BoardService boardService;

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

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "cs_terms";
		}
		return NAMESPACE + "cs_terms";
	}

	@RequestMapping(value = "cs_info.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cs_info(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(required = false) String chk) throws Exception {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			if (StringUtils.isEmpty(chk)) {
				return "redirect:/meng/community/cs_terms.do";
			}
		}

		if (StringUtils.isEmpty(chk)) {
			return "redirect:/eng/community/cs_terms.do";
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

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "cs_info";
		}
		return NAMESPACE + "cs_info";
	}

	@RequestMapping(value = "/cs_center_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> cs_center_modify(@RequestParam Map param,
			@ModelAttribute CsCenterVo csCenter, BindingResult bindingResult, Model model, HttpServletRequest request)
			throws Exception {
		csCenterValidator.validate(csCenter, bindingResult);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		
		// 첨부파일, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(csCenter.getF_file1_txt()) //
				&& csCenter.getF_file1() != null) { //
			String f_file1 = customerService.saveAttachFile(csCenter.getF_file1());
			csCenter.setF_file1_txt(f_file1);
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
	
	// TODO /brand/community/{boardType}/community_list.do
		@RequestMapping(value = "{boardType}/community_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
		public String community_list(
				@RequestParam Map param, 
				@RequestParam (required=false, defaultValue="1")  String pageIndex ,
				@PathVariable String boardType,
				@RequestParam (required=false, defaultValue="Y") String useyn,
				@RequestParam (required=false, defaultValue="") String event_progress,
				@RequestParam (required=false, defaultValue="") String cate,
				@RequestParam (required=false, defaultValue="Y") String front,
				HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			Device device = DeviceUtils.getCurrentDevice(request);        
	        if (device == null) {
	            return "device is null";
	        }
	        String deviceType = "unknown";
	        if (device.isNormal()) {
	            deviceType = "normal";
	        } else if (device.isMobile()) {
	            deviceType = "mobile";
	        } else if (device.isTablet()) {
	            deviceType = "tablet";
	        }
			
			int pageUnit = 0;
			if(boardType.equals("notice")) {
				pageUnit = 6;
			}else if(boardType.equals("event")) {
				pageUnit = 4;
			}else if(boardType.equals("sns")) {
				pageUnit = 12;
			}
			PaginationInfo paginationInfo = new PaginationInfo();		
			paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
			paginationInfo.setRecordCountPerPage(pageUnit);
			paginationInfo.setPageSize(pageUnit);
			
			param.put("boardType" , boardType);
			param.put("pageUnit", pageUnit);
			param.put("pageIndex", pageIndex);
			param.put("front", front);
			int startCount = (((Integer.parseInt(pageIndex)-1))*pageUnit);
			if ( startCount == 0 ){
				startCount = 0;
			}
			param.put("startCount", startCount );
			param.put("useyn", useyn);
			param.put("event_progress", event_progress);
			param.put("cate", cate);
			paginationInfo.setTotalRecordCount(boardService.selectTotCnt(param));
			if(boardType.equals("notice")) {
				model.addAttribute("resultList", boardService.selectNoticePaging(param));
			}else {
				model.addAttribute("resultList", boardService.selectPaging(param));
			}
			
		    model.addAttribute("paginationInfo", paginationInfo);
			model.addAttribute("searchVO", param);
			
			model.addAttribute("lastPage", paginationInfo.getLastPageNo());
			model.addAttribute("currentPage", paginationInfo.getCurrentPageNo());
			
			String nameSpace = "eng/community/";
			if(!deviceType.equals("normal")){
				nameSpace = "meng/community/";
			}
			
			return nameSpace + "community_list";
		}
		
		
		// TODO /brand/community/{boardType}/selectCommunityList.do
		@RequestMapping(value = "{boardType}/selectCommunityList.do", method = { RequestMethod.POST })
		public @ResponseBody Map<String, Object> selectStoreList(@RequestParam Map param, HttpSession session,
				ModelMap model, HttpServletRequest request, HttpServletResponse response
				,@RequestParam (required=false, defaultValue="1")  String pageIndex
				,@PathVariable String boardType
				,@RequestParam (required=false, defaultValue="Y") String useyn
				,@RequestParam (required=false, defaultValue="") String event_progress
				,@RequestParam (required=false, defaultValue="Y") String front
				,@RequestParam (required=false, defaultValue="") String cate) throws Exception {
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			int pageUnit = 0;
			if(boardType.equals("notice")) {
				pageUnit = 6;
			}else if(boardType.equals("event")) {
				pageUnit = 4;
			}else if(boardType.equals("sns")) {
				pageUnit = 12;
			}
			PaginationInfo paginationInfo = new PaginationInfo();		
			paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
			paginationInfo.setRecordCountPerPage(pageUnit);
			paginationInfo.setPageSize(pageUnit);
			
			param.put("boardType" , boardType);
			param.put("pageUnit", pageUnit);
			param.put("pageIndex", pageIndex);
			param.put("front", front);
			int startCount = (((Integer.parseInt(pageIndex)-1))*pageUnit);
			if ( startCount == 0 ){
				startCount = 0;
			}
			param.put("startCount", startCount );
			param.put("useyn", useyn);
			param.put("event_progress", event_progress);
			param.put("cate", cate);
			paginationInfo.setTotalRecordCount(boardService.selectTotCnt(param));
			if(boardType.equals("notice")) {
				returnMap.put("resultList", boardService.selectNoticePaging(param));
			}else {
				returnMap.put("resultList", boardService.selectPaging(param));
			}
			
			returnMap.put("searchVO", param);
			
			returnMap.put("lastPage", paginationInfo.getLastPageNo());
			returnMap.put("currentPage", paginationInfo.getCurrentPageNo());
			
			return returnMap;
		}

}
