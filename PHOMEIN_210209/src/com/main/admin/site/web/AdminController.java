package com.main.admin.site.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.site.service.ManagerService;
import com.main.admin.store.service.StoreService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONObject;


/**
 * 사이트관리 > 관리자 관리
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/site/*" })
public class AdminController extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/site/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "managerService")
	private ManagerService managerService;
	
	@Resource(name = "storeService")
	private StoreService storeService;
	
	
	// TODO 관리자 관리
	@RequestMapping(value = "manager_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String manager_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107201");
		model.addAttribute("menuCd", "107201");
		
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
		int totalRecordCount = managerService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("resultList", managerService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "manager_list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "manager_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String manager_view(
			@RequestParam String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107201");
		model.addAttribute("menuCd", "107201");
		
		param.put("seq", seq);
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./manager_list.do";
		}
		model.addAttribute("result", managerService.selectView(param));
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "manager_view";
	}
	
	// TODO manager 등록
	@RequestMapping(value = "manager_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String manager_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("107201");
		model.addAttribute("menuCd", "107201");
		
		param.put("cate", 1);
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "manager_write";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "jsonList.do" , method = RequestMethod.POST, produces="application/json;charset=utf8") //produces="text/plain;charset=UTF-8" 
	public String cateList(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex2 ,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
			JSONObject json = new JSONObject();
			try {				
				
				PaginationInfo paginationInfo = new PaginationInfo();		
				paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex2));
				paginationInfo.setRecordCountPerPage(10);
				paginationInfo.setPageSize(10);				
				param.put("pageUnit", 10);
				param.put("pageIndex2", pageIndex2);
				int startCount = (((Integer.parseInt(pageIndex2)-1))*10);
				if ( startCount == 0 ){
					startCount = 0;
				}
				param.put("startCount", startCount );
				paginationInfo.setTotalRecordCount(storeService.selectTotCnt(param));
						
				json.put("result", "S");
				json.put("list", storeService.selectPaging(param));	
				json.put("paginationInfo", paginationInfo);
				
	
			} catch (Exception e) {
				e.printStackTrace();
				json.put("result", "overFalse"); 
			}
			return json.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "pwd_proc.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String pwd_pop(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		JSONObject json = new JSONObject();
		try {
			
			String fPw = param.get("adminpw1").toString();
			String fPw2 = param.get("adminpw2").toString();
			
			if ( !fPw.equals(fPw2) ){
				json.put("result", "NotMatch");
				return json.toString();
			}
			String encodePwd = CommonUtil.shaEncdoing( fPw, request ); 
			
			//System.out.println("encodePwd : "+ encodePwd);
			
			param.put("adminpw", encodePwd);
			managerService.managerPW(param);
			json.put("result", "S");	
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "dup_proc.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String dup_proc(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		JSONObject json = new JSONObject();
		try {
						
			int cnt = managerService.selectDup(param);
			if ( cnt == 0 ){
				json.put("result", "S");	
			}else{
				json.put("result", "Dup");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
	}
	
	
	// TODO manager 등록/수정 처리
	@RequestMapping(value = "manager_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String manager_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		JSONObject json = new JSONObject();
		try {
			
			System.out.println("==================SEQ :" + seq);
			System.out.println("==================param.get(seq) :" + param.get("seq"));
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			logger.debug("param" + param.toString());
			if ( param.get("seq") != null && !param.get("seq").equals("")){
				seq = param.get("seq").toString();
			}
			if (seq != null && !seq.equals("")) {	
				managerService.update(param);
				json.put("result", "S");
			} else {
				
				String fPw = param.get("adminpw").toString();
				String fPw2 = param.get("adminpw2").toString();
				if ( !fPw.equals(fPw2) ){
					json.put("result", "NotMatch");
					return json.toString();
				}
				String encodePwd = CommonUtil.shaEncdoing( fPw, request ); 
				//System.out.println("encodePwd : "+ encodePwd);
				param.put("adminpw", encodePwd);
				managerService.insert(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	@RequestMapping(value = "delete_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String delete_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="0")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		JSONObject json = new JSONObject();
		try {
			
			System.out.println("================" + seq);
			System.out.println("================" + param.get("seq") );
			//param.put("seq", seq);
			//session
			if ( admin == null && param.get("seq") == null ){
				json.put("result", "F");
			}else{
				managerService.delete(param);
				json.put("result", "S");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	@RequestMapping(value = "/update_useyn.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		managerService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}
	
}
