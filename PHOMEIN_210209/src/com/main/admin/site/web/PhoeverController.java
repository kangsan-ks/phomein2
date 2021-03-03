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

import com.main.admin.site.service.PhoeverService;
import com.main.admin.site.web.validate.PhoeverValidate;
import com.main.admin.site.web.vo.PhoeverVo;
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
public class PhoeverController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/site/";

	@Resource(name = "phoeverService")
	private PhoeverService phoeverService;

	@Resource(name = "phoeverValidator")
	private PhoeverValidate phoeverValidate;

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

	@RequestMapping(value = "pho_ever_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pho_ever_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_title,
			@RequestParam(required = false) String checkedSeqArr, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107204");
		model.addAttribute("menuCd", "107204");

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
		param.put("search_title", search_title);
		// PHO EVER 구분코드
		param.put("tb_socialcol", "PHO_EVER");

		int totalRecordCount = phoeverService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));

		model.addAttribute("resultList", phoeverService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq",
				StringUtils.isEmpty(phoeverService.nextSeq(param)) ? 1 : phoeverService.nextSeq(param));
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_title", search_title);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "pho_ever_list";
	}

	@RequestMapping(value = "pho_ever_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String pho_ever_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = true) String type, @RequestParam(required = false) String search_useyn,
			@RequestParam(required = false) String search_title,
			@RequestParam(required = false, defaultValue = "1") String pageIndex, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107204");
		model.addAttribute("menuCd", "107204");
		
		// PHO EVER 구분코드
		param.put("tb_socialcol", "PHO_EVER");
		// 사회 공헌 기본 정보
		model.addAttribute("resultView", phoeverService.selectPhoeverView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_title", search_title);

		return NAMESPACE + "pho_ever_view";
	}

	@RequestMapping(value = "/pho_ever_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> pho_ever_modify(@RequestParam Map param, @ModelAttribute PhoeverVo phoever,
			BindingResult bindingResult, Model model, HttpServletRequest request) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}		
		phoeverValidate.validate(phoever, bindingResult);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		// PC 이미지, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(phoever.getPc_img_txt()) //
				&& phoever.getPc_img() != null) { //
			String pc_img = phoeverService.saveAttachFile(phoever.getPc_img());
			phoever.setPc_img_txt(pc_img);
		}

		// MOBILE 이미지, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(phoever.getM_img_txt()) //
				&& phoever.getM_img() != null) { //
			String m_img = phoeverService.saveAttachFile(phoever.getM_img());
			phoever.setM_img_txt(m_img);
		}

		phoever.setRegid(admin.getAdminid());
		phoever.setModid(admin.getAdminid());
		// PHO EVER 기본 정보 save
		phoeverService.mergePhoever(phoever);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/pho_ever_delete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> pho_ever_delete(@RequestParam Map param, @RequestParam String seq)
			throws Exception {
		
		// PHO EVER 구분코드
		param.put("tb_socialcol", "PHO_EVER");
		param.put("seq", seq);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// PHO EVER 기본 정보 delete
		phoeverService.deletePhoever(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/update_useyn_pho_ever.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn_pho_ever(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		// PHO EVER 구분코드
		param.put("tb_socialcol", "PHO_EVER");
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		phoeverService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

}
