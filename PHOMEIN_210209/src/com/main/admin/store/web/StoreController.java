package com.main.admin.store.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
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
 * 매장관리
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/store/*" })
public class StoreController extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/store/";
	private final static String UPLOAD_PATH = "store/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "storeService")
	private StoreService storeService;
	
	
	// TODO 매장관리 /admin/store/store_list.do
	@RequestMapping(value = "store_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String store_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("102201");
		model.addAttribute("menuCd", "102201");
		
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
		int totalRecordCount = storeService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		//System.out.println("========StartCount :" + (((Integer.parseInt(pageIndex)-1))*10) );
		
		model.addAttribute("resultList", storeService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	    
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "store_list";
	}
	
	// TODO 매장공지 view
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "store_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String store_view(
			@RequestParam String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("102201");
		model.addAttribute("menuCd", "102201");
		
		param.put("seq", seq);
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./store_list.do";
		}
		model.addAttribute("result", storeService.selectView(param));
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "store_view";
	}
	
	// TODO store 등록
	@RequestMapping(value = "store_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String store_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("102201");
		model.addAttribute("menuCd", "102201");
		
		param.put("cate", 1);
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "store_write";
	}
	
	// TODO store 등록/수정 처리
	@RequestMapping(value = "store_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String store_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, MultipartHttpServletRequest mRequest) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		JSONObject json = new JSONObject();
		UploadFileVO uploadfileVO = null;
		UploadFileVO uploadfileVO2 = null;
		UploadFileVO uploadfileVO3 = null;
		UploadFileVO uploadfileVO4 = null;
		UploadFileVO uploadfileVO5 = null;
		UploadFileVO uploadfileVO6 = null;
		UploadFileVO uploadfileVO7 = null;
		UploadFileVO uploadfileVO8 = null;
		
		try {
				
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			logger.debug("param" + param.toString());
			
			//fileUpload
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					//param.put("attach_flnm", uploadfileVO.getFileNm());
					param.put("f_file1", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name01") ) && param.get("file-name01") != null ){
    			//param.put("file01_del", "Y");
    			param.put("f_file1", param.get("file-name01"));
    		}else{
    			param.put("file01_del", "Y");
    		}
			MultipartFile attach2 = mRequest.getFile("file02");
			if (attach2 != null && !attach2.isEmpty()) {
				uploadfileVO2 = WebFileUtil.upload(attach2, UPLOAD_PATH);
				if (uploadfileVO2 != null) {
					param.put("f_file2", uploadfileVO2.getUrl());
				}
			}else if ( !"".equals( param.get("file-name02") ) && param.get("file-name02") != null ){
    			//param.put("file02_del", "Y");
    			param.put("f_file2", param.get("file-name02"));
    		}else{
    			param.put("file02_del", "Y");
    		}
			MultipartFile attach3 = mRequest.getFile("file03");
			if (attach3 != null && !attach3.isEmpty()) {
				uploadfileVO3 = WebFileUtil.upload(attach3, UPLOAD_PATH);
				if (uploadfileVO3 != null) {
					param.put("f_file3", uploadfileVO3.getUrl());
				}
			}else if ( !"".equals( param.get("file-name03") ) && param.get("file-name03") != null ){
    			//param.put("file03_del", "Y");
				param.put("f_file3", param.get("file-name03"));
    		}else{
    			param.put("file03_del", "Y");
    		}
			MultipartFile attach4 = mRequest.getFile("file04");
			if (attach4 != null && !attach4.isEmpty()) {
				uploadfileVO4 = WebFileUtil.upload(attach4, UPLOAD_PATH);
				if (uploadfileVO4 != null) {
					param.put("f_file4", uploadfileVO4.getUrl());
				}
			}else if ( !"".equals( param.get("file-name04") ) && param.get("file-name04") != null ){
    			//param.put("file04_del", "Y");
				param.put("f_file4", param.get("file-name04"));
    		}else{
    			param.put("file04_del", "Y");
    		}
			MultipartFile attach5 = mRequest.getFile("file05");
			if (attach5 != null && !attach5.isEmpty()) {
				uploadfileVO5 = WebFileUtil.upload(attach5, UPLOAD_PATH);
				if (uploadfileVO5 != null) {
					param.put("f_file5", uploadfileVO5.getUrl());
				}
			}else if ( !"".equals( param.get("file-name05") ) && param.get("file-name05") != null ){
    			//param.put("file05_del", "Y");
				param.put("f_file5", param.get("file-name05"));
    		}else{
    			param.put("file05_del", "Y");
    		}
			
			MultipartFile attach6 = mRequest.getFile("file06");
			if (attach6 != null && !attach6.isEmpty()) {
				uploadfileVO6 = WebFileUtil.upload(attach6, UPLOAD_PATH);
				if (uploadfileVO6 != null) {
					param.put("f_file6", uploadfileVO6.getUrl());
				}
			}else if ( !"".equals( param.get("file-name06") ) && param.get("file-name06") != null ){
				param.put("f_file6", param.get("file-name06"));
    		}else{
    			param.put("file06_del", "Y");
    		}
			MultipartFile attach7 = mRequest.getFile("file07");
			if (attach7 != null && !attach7.isEmpty()) {
				uploadfileVO7 = WebFileUtil.upload(attach7, UPLOAD_PATH);
				if (uploadfileVO7 != null) {
					param.put("f_file7", uploadfileVO7.getUrl());
				}
			}else if ( !"".equals( param.get("file-name07") ) && param.get("file-name07") != null ){
				param.put("f_file7", param.get("file-name07"));
    		}else{
    			param.put("file07_del", "Y");
    		}
			MultipartFile attach8 = mRequest.getFile("file08");
			if (attach8 != null && !attach8.isEmpty()) {
				uploadfileVO8 = WebFileUtil.upload(attach8, UPLOAD_PATH);
				if (uploadfileVO8 != null) {
					param.put("f_file8", uploadfileVO8.getUrl());
				}
			}else if ( !"".equals( param.get("file-name08") ) && param.get("file-name08") != null ){
				param.put("f_file8", param.get("file-name08"));
    		}else{
    			param.put("file08_del", "Y");
    		}
			
			
			if (seq != null && !seq.equals("")) {	
				storeService.update(param);
				json.put("result", "S");
			} else {
				storeService.insert(param);
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
				storeService.delete(param);
				json.put("result", "S");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	@RequestMapping(value = "/update_useyn_store.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn_product(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		storeService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}
	
	// TODO 매장관리 /admin/store/store_list.do
	@RequestMapping(value = "get_store_list_ajax.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public @ResponseBody Map<String, Object> get_store_list_ajax(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		PaginationInfo paginationInfo = new PaginationInfo();		
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);				
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		param.put("startCount", ((Integer.parseInt(pageIndex)-1)*10) );
		paginationInfo.setTotalRecordCount(storeService.selectTotCnt(param));
		
		returnMap.put("result", storeService.selectPaging(param));
		returnMap.put("paginationInfo", paginationInfo);
		
		return returnMap;
	}
	
	// TODO 
	@RequestMapping(value = "excelDwn.do")
    public ModelAndView downloadExcel(Model model
    		,@RequestParam Map param,@RequestParam(defaultValue = "1") int pageNo,
    		HttpServletRequest request, HttpServletResponse response) {
        
		try {
            ModelAndView mav = new ModelAndView();
            
            List<Map> list = storeService.selectExcel(param);
            mav.addObject("listData", list);
            mav.setViewName("StoreExcelView");
            return mav;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
}
