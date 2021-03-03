package com.main.admin.site.web;

import java.beans.PropertyEditorSupport;
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
import org.springframework.web.util.WebUtils;

import com.main.admin.site.service.InterviewService;
import com.main.admin.site.web.validate.InterviewValidate;
import com.main.admin.site.web.vo.InterviewVo;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 사이트 관리
 * 
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/site/*" })
public class InterviewController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/site/";

	@Resource(name = "interviewService")
	private InterviewService interviewService;

	@Resource(name = "interviewValidator")
	private InterviewValidate interviewValidate;

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

	@RequestMapping(value = "best_store_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String best_store_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_store,
			@RequestParam(required = false) String checkedSeqArr, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107205");
		model.addAttribute("menuCd", "107205");

		//System.out.println("Integer.parseInt(pageIndex) ================== :" + Integer.parseInt(pageIndex));
		//System.out.println(
		//		" (Integer.parseInt(pageIndex)-1*10 ================== :" + ((Integer.parseInt(pageIndex) - 1) * 10));

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex)-1))*10);
		if ( startCount == 0 ){
			startCount = 0;
		}
		param.put("startCount", startCount );
		param.put("search_useyn", search_useyn);
		param.put("search_store", search_store);

		int totalRecordCount = interviewService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));

		model.addAttribute("resultList", interviewService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq",
				StringUtils.isEmpty(interviewService.nextSeq(param)) ? 1 : interviewService.nextSeq(param));
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_store", search_store);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "best_store_list";
	}

	@RequestMapping(value = "best_store_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String best_store_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = true) String type, @RequestParam(required = false) String search_useyn,
			@RequestParam(required = false) String search_store,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107205");
		model.addAttribute("menuCd", "107205");
		
		// 우수 매장 인터뷰 관리 기본 정보
		model.addAttribute("resultView", interviewService.selectInterviewView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_store", search_store);

		return NAMESPACE + "best_store_view";
	}

	@RequestMapping(value = "/best_store_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> best_store_modify(@RequestParam Map param,
			@ModelAttribute InterviewVo interview, BindingResult bindingResult, Model model, HttpServletRequest request)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}		
		interviewValidate.validate(interview, bindingResult);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		// 메인 이미지, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(interview.getMain_img_txt()) //
				&& interview.getMain_img() != null) { //
			String main_img = interviewService.saveAttachFile(interview.getMain_img());
			interview.setMain_img_txt(main_img);
		}
		
		// PC 이미지, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(interview.getPc_img_txt()) //
				&& interview.getPc_img() != null) { //
			String pc_img = interviewService.saveAttachFile(interview.getPc_img());
			interview.setPc_img_txt(pc_img);
		}

		// MOBILE 이미지, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(interview.getM_img_txt()) //
				&& interview.getM_img() != null) { //
			String m_img = interviewService.saveAttachFile(interview.getM_img());
			interview.setM_img_txt(m_img);
		}

		interview.setRegid(admin.getAdminid());
		interview.setModid(admin.getAdminid());
		// 우수 매장 인터뷰 관리 기본 정보 save
		interviewService.mergeInterview(interview);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/best_store_delete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> best_store_delete(@RequestParam Map param, @RequestParam String seq)
			throws Exception {
		param.put("seq", seq);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 우수 매장 인터뷰 관리 기본 정보 delete
		interviewService.deleteInterview(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/update_useyn_best_store.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn_best_store(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		interviewService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

}
