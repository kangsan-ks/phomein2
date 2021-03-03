package com.main.admin.comm.web;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.comm.web.validate.CodeValidate;
import com.main.admin.comm.web.vo.CodeVo;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 공통관리 > 코드관리
 * 
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/comm/*" })
public class CodeController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/comm/";

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "codeValidator")
	private CodeValidate codeValidator;

	@RequestMapping(value = { "code_list.do", "code_list2.do", "code_list3.do" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String code_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String seq, @RequestParam(required = false) String useyn,
			@RequestParam(required = false) String code, @RequestParam(required = false) String pcode,
			@RequestParam(required = false) String code_name,
			@RequestParam(required = false, defaultValue = "code") String code_type,
			@RequestParam(required = false, defaultValue = "reg") String type, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("109201");
		model.addAttribute("menuCd", "109201");

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
		param.put("code", code);
		param.put("code_type", code_type);
		param.put("useyn", useyn);

		int totalRecordCount = codeService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));

		model.addAttribute("resultList", codeService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq", StringUtils.isNotEmpty(seq) ? seq : codeService.nextSeq(param));
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("useyn", useyn);
		model.addAttribute("code", code);
		model.addAttribute("code_name", code_name);
		model.addAttribute("pcode", code);
		model.addAttribute("type", type);

		if (StringUtils.contains(request.getRequestURI(), "code_list2.do")) {
			model.addAttribute("pcode", StringUtils.isEmpty(pcode) ? code.substring(0, 3) : pcode);
			return NAMESPACE + "code_list2";
		} else if (StringUtils.contains(request.getRequestURI(), "code_list3.do")) {
			model.addAttribute("pcode", StringUtils.isEmpty(pcode) ? code.substring(0, 6) : pcode);
			return NAMESPACE + "code_list3";
		}
		return NAMESPACE + "code_list";
	}

	@RequestMapping(value = "/code_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> code_modify(@RequestParam Map param,
			@RequestParam(required = false) String seq, @ModelAttribute CodeVo code, BindingResult bindingResult,
			Model model, HttpServletRequest request) throws Exception {
		codeValidator.validate(code, bindingResult);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}

		code.setSeq(StringUtils.isNotEmpty(seq) ? seq : codeService.nextSeq(param));

		param.put("code", code.getCode());

		if (StringUtils.equals("sub_code", code.getCode_type())) {
			code.setCode(code.getSub_code());
			code.setCode_name(code.getSub_code_name());
			param.put("code", code.getSub_code());
		}

		if (StringUtils.equals("sub_sub_code", code.getCode_type())) {
			code.setCode(code.getSub_sub_code());
			code.setCode_name(code.getSub_sub_code_name());
			param.put("code", code.getSub_sub_code());
		}

		if (StringUtils.isEmpty(code.getType()) || StringUtils.equals("reg", code.getType())) {
			// 코드 중복 체크
			int duplicateCnt = codeService.duplicateCode(param);

			if (duplicateCnt > 0) {
				returnMap.put("result", "FAIL");
				return returnMap;
			}
		}

		returnMap.put("result", "SUCCESS");

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		code.setRegid(admin.getAdminid());
		code.setModid(admin.getAdminid());
		// 코드 관리 save
		codeService.mergeCode(code);

		return returnMap;
	}

	@RequestMapping(value = "/update_sorting_code.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_sorting_code(@RequestParam Map param,
			@RequestParam(value = "sortingArr[]") String[] sortingArr) throws Exception {
		param.put("sortingArr", sortingArr);
		// 코드 관리 정렬 update
		codeService.updateSortingCode(param);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/code_delete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> code_delete(@RequestParam Map param, @RequestParam String seq)
			throws Exception {
		param.put("seq", seq);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		int childCnt = codeService.selectChildCnt(param);

		if (childCnt > 0) {
			returnMap.put("result", "FAIL");
			return returnMap;
		}

		// 코드 관리 delete
		codeService.deleteCode(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

}
