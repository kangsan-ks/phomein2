package com.main.admin.intranet.web;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.intranet.service.IntranetBoardService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONObject;

/**
 * 인트라넷
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/intranet/*" })
public class IntranetBoardController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/intranet/";
	private final static String UPLOAD_PATH = "board/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "intranetService")
	private IntranetBoardService intranetService;
	
	
	
	
	// TODO 매장공지	/admin/intranet/board_list.do
	@RequestMapping(value = "board_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String board_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105201");
		model.addAttribute("menuCd", "105201");
		
		param.put("cate", 1);
		param.put("seq", null);
		
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
		int totalRecordCount = intranetService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("topList", intranetService.selectTopList(param));
		
		model.addAttribute("resultList", intranetService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "board_list";
	}
	
	// TODO 매장공지 view
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "board_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String board_view(
			@RequestParam String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105201");
		model.addAttribute("menuCd", "105201");
		
		param.put("cate", 1);
		param.put("seq", seq);
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./board_list.do";
		}
		intranetService.updatecnt(param);
		model.addAttribute("result", intranetService.selectInView(param));
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "board_view";
	}
	
	
	// TODO 매장공지 등록
	@RequestMapping(value = "board_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String board_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105201");
		model.addAttribute("menuCd", "105201");
		
		param.put("cate", 1);
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "board_write";
	}
	
	// TODO 매장공지 등록/수정 처리
	@RequestMapping(value = "board_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String board_proc(@RequestParam Map param
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
		
		System.out.println("===============conts:" + param.get("conts") );
		param.put("cate", "notice");
		param.put("contents", param.get("conts") );
		try {
				
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("regip", CommonUtil.getClientIp(request));
			logger.debug("parma" + param.toString());
			//fileUpload
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename1", uploadfileVO.getFileNm());
					param.put("filename1", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name01") ) && param.get("file-name01") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename1", param.get("file-name01"));
    		}else{
    			param.put("file01_del", "Y");
    		}
			
			attach = mRequest.getFile("file02");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename2", uploadfileVO.getFileNm());
					param.put("filename2", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name02") ) && param.get("file-name02") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename2", param.get("file-name02"));
    		}else{
    			param.put("file02_del", "Y");
    		}

			attach = mRequest.getFile("file03");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename3", uploadfileVO.getFileNm());
					param.put("filename3", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name03") ) && param.get("file-name03") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename3", param.get("file-name03"));
    		}else{
    			param.put("file03_del", "Y");
    		}

			attach = mRequest.getFile("file04");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename4", uploadfileVO.getFileNm());
					param.put("filename4", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name04") ) && param.get("file-name04") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename4", param.get("file-name04"));
    		}else{
    			param.put("file04_del", "Y");
    		}
			
			attach = mRequest.getFile("file05");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename5", uploadfileVO.getFileNm());
					param.put("filename5", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name05") ) && param.get("file-name05") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename5", param.get("file-name05"));
    		}else{
    			param.put("file05_del", "Y");
    		}
			
			if (seq != null && !seq.equals("")) {	
				intranetService.update(param);
				json.put("result", "S");
			} else {
				intranetService.insert(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	
	
	// TODO 자료실		/admin/intranet/reference_list.do
	@RequestMapping(value = "reference_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String reference_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105202");
		model.addAttribute("menuCd", "105202");
		
		param.put("cate", 2);
		
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
		int totalRecordCount = intranetService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("topList", intranetService.selectTopList(param));
		
		model.addAttribute("resultList", intranetService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "reference_list";
	}
	
	

	// TODO 자료실 view
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "reference_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String reference_view(
			@RequestParam String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105202");
		model.addAttribute("menuCd", "105202");
		
		param.put("cate", 2);
		param.put("seq", seq);
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./reference_list.do";
		}
		intranetService.updatecnt(param);
		model.addAttribute("result", intranetService.selectInView(param));
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "reference_view";
	}
	
	
	// TODO 자료실 등록
	@RequestMapping(value = "reference_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String reference_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105202");
		model.addAttribute("menuCd", "105202");
		
		param.put("cate", 2);
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "reference_write";
	}
	
	// TODO 자료실 등록/수정 처리
	@RequestMapping(value = "reference_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String reference_proc(@RequestParam Map param
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
		
		System.out.println("===============conts:" + param.get("conts") );
		param.put("cate", "data");
		param.put("contents", param.get("conts") );
		try {
				
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("regip", CommonUtil.getClientIp(request));
			logger.debug("parma" + param.toString());
			//fileUpload
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename1", uploadfileVO.getFileNm());
					param.put("filename1", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name01") ) && param.get("file-name01") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename1", param.get("file-name01"));
    		}else{
    			param.put("file01_del", "Y");
    		}
			
			attach = mRequest.getFile("file02");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename2", uploadfileVO.getFileNm());
					param.put("filename2", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name02") ) && param.get("file-name02") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename2", param.get("file-name02"));
    		}else{
    			param.put("file02_del", "Y");
    		}

			attach = mRequest.getFile("file03");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename3", uploadfileVO.getFileNm());
					param.put("filename3", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name03") ) && param.get("file-name03") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename3", param.get("file-name03"));
    		}else{
    			param.put("file03_del", "Y");
    		}

			attach = mRequest.getFile("file04");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename4", uploadfileVO.getFileNm());
					param.put("filename4", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name04") ) && param.get("file-name04") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename4", param.get("file-name04"));
    		}else{
    			param.put("file04_del", "Y");
    		}
			
			attach = mRequest.getFile("file05");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("orgfilename5", uploadfileVO.getFileNm());
					param.put("filename5", uploadfileVO.getUrl());
				}
    		}else if ( !"".equals( param.get("file-name05") ) && param.get("file-name05") != null ){
    			//param.put("file01_del", "Y");
    			param.put("filename5", param.get("file-name05"));
    		}else{
    			param.put("file05_del", "Y");
    		}
						
			
			if (seq != null && !seq.equals("")) {	
				intranetService.update(param);
				json.put("result", "S");
			} else {
				intranetService.insert(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	
	// TODO delete_proc
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
				intranetService.delete(param);
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
		intranetService.updateUseYns(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}
	
	
	
}
