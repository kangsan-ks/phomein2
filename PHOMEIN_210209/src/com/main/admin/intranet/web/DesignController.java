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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.intranet.service.DesignService;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONObject;

/**
 * 디자인 / 물품 신청 관리 
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/intranet/*" })
public class DesignController extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/intranet/";
	private final static String UPLOAD_PATH = "design/";
	private final static String UPLOAD_PATH2 = "design/user/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "designService")
	private DesignService designService;
	
	
		
	// TODO 디자인 발주 관리 	/admin/intranet/order_design_manage_list.do
	@RequestMapping(value = "order_design_manage_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_manage_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105203");
		model.addAttribute("menuCd", "105203");
		param.put("cate", "design");
		
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
		int totalRecordCount = designService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("resultList", designService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "order_design_manage_list";
	}
	
	// TODO 상세/수정 order_design_manage_view.jsp
	@RequestMapping(value = "order_design_manage_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_manage_view(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105203");
		model.addAttribute("menuCd", "105203");
		
		param.put("cate", "design");
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./order_design_manage_list.do";
		}
		
		model.addAttribute("result", designService.selectDesignView(param));
		
		param.put("useq", seq);
		model.addAttribute("fileresult", designService.selectDesignOrderFileView(param));
		model.addAttribute("priceList", designService.selectDesignOrderPriceView(param));
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_design_manage_view";
	}
	
	// TODO 등록 order_design_manage_write.jsp
	@RequestMapping(value = "order_design_manage_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_manage_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105203");
		model.addAttribute("menuCd", "105203");
		
		param.put("cate", "design");
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_design_manage_write";
	}
	
	// TODO 디자인 등록/수정 design_proc
	@RequestMapping(value = "design_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_proc(@RequestParam Map param
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
		
		try {
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("contents", param.get("conts") );
			logger.debug("param" + param.toString());
			//fileUpload
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("f_file1", uploadfileVO.getUrl());
					param.put("filedec1", "1");
					System.out.println("=======f_file1 : " + uploadfileVO.getUrl());
				}
    		}else{
    			if ( param.get("file-name01") != null ){
	    			String filename01 = param.get("file-name01").toString();
	    			param.put("f_file1", filename01);
	    			param.put("filedec1", "1");
    			}
    		}
			MultipartFile attach2 = mRequest.getFile("file02");
			if (attach2 != null && !attach2.isEmpty()) {
				uploadfileVO2 = WebFileUtil.upload(attach2, UPLOAD_PATH);
				if (uploadfileVO2 != null) {
					param.put("f_file2", uploadfileVO2.getUrl());
					param.put("filedec2", "2");
					System.out.println("=======f_file2 : " + uploadfileVO2.getUrl());
				}
    		}else{
    			if ( param.get("file-name02") != null ){
	    			String filename02 = param.get("file-name02").toString();
	    			param.put("f_file2", filename02);
    				param.put("filedec2", "2");
    			}
    		}
			MultipartFile attach3 = mRequest.getFile("file03");
			if (attach3 != null && !attach3.isEmpty()) {
				uploadfileVO3 = WebFileUtil.upload(attach3, UPLOAD_PATH);
				if (uploadfileVO3 != null) {
					param.put("f_file3", uploadfileVO3.getUrl());
					param.put("filedec3", "3");
					System.out.println("=======f_file3 : " + uploadfileVO3.getUrl());
				}
    		}else{
    			if ( param.get("file-name03") != null ){
	    			String filename03 = param.get("file-name03").toString();
	    			param.put("f_file3", filename03);
    				param.put("filedec3", "3");
    			}
    		}
			MultipartFile attach4 = mRequest.getFile("file04");
			if (attach4 != null && !attach4.isEmpty()) {
				uploadfileVO4 = WebFileUtil.upload(attach4, UPLOAD_PATH);
				if (uploadfileVO4 != null) {
					param.put("f_file4", uploadfileVO4.getUrl());
					param.put("filedec4", "4");
					System.out.println("=======f_file4 : " + uploadfileVO4.getUrl());
				}
    		}else{
    			if ( param.get("file-name04") != null ){
	    			String filename04 = param.get("file-name04").toString();
	    			param.put("f_file4", filename04);
    				param.put("filedec4", "4");
    			}
    		}
			MultipartFile attach5 = mRequest.getFile("file05");
			if (attach5 != null && !attach5.isEmpty()) {
				uploadfileVO5 = WebFileUtil.upload(attach5, UPLOAD_PATH);
				if (uploadfileVO5 != null) {
					param.put("f_file5", uploadfileVO5.getUrl());
					param.put("filedec5", "5");
					System.out.println("=======f_file5 : " + uploadfileVO5.getUrl());
				}
    		}else{
    			if ( param.get("file-name05") != null ){
	    			String filename05 = param.get("file-name05").toString();
	    			param.put("f_file5", filename05);
    				param.put("filedec5", "5");
    			}
    		}
			if (seq != null && !seq.equals("")) {	
				designService.update(param);
				json.put("result", "S");
			} else {
				designService.insert(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	
	
	// TODO 디자인발주 신청 order_design_write
	@RequestMapping(value = "order_design_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105204");
		model.addAttribute("menuCd", "105204");
		
		param.put("cate", "design");
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("resultList", designService.selectList(param));
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_design_write";
	}
	
	
	// TODO 디자인 관리자 신청 design_order_proc.do
	@RequestMapping(value = "design_order_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_order_proc(@RequestParam Map param
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
		
		try {
			//session		
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			
			param.put("contents", param.get("conts"));
			logger.debug("param" + param.toString());
			/*
			if (seq != null && !seq.equals("")) {	
				designService.update(param);
				json.put("result", "S");
			} else {
				designService.insert(param);
				json.put("result", "S");	
			}
			*/

			for (int i = 1; i <= 5; i++) {
				MultipartFile attach = mRequest.getFile("file0" + i);
				if (attach != null) {
					String filenameStr = "";
					String orgnameStr = "";
					if (attach != null && !attach.isEmpty()) {
						uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH2);
						if (uploadfileVO != null) {
							filenameStr = uploadfileVO.getUrl();
							orgnameStr = attach.getOriginalFilename();
						}
					}else{
						if ( param.get("file-name0" + i) != null ){
							filenameStr = param.get("file-name0" + i).toString();
							orgnameStr = param.get("orgname" + i).toString();
						}
					}
					
					if (i == 1) {
						param.put("filename", filenameStr);
						param.put("orgname", orgnameStr);
					} else {
						param.put("filename" + i, filenameStr);
						param.put("orgname" + i, orgnameStr);
					}
				}
			}
//			MultipartFile attach = mRequest.getFile("file01");
//			if (attach != null && !attach.isEmpty()) {
//				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH2);
//				if (uploadfileVO != null) {
//					param.put("filename", uploadfileVO.getUrl());
//					param.put("orgname", attach.getOriginalFilename());
//				}
//    		}else{
//    			if ( param.get("file-name01") != null ){
//	    			String filename01 = param.get("file-name01").toString();
//	    			String orgname01 = param.get("orgname").toString();
//	    			param.put("filename", filename01);
//	    			param.put("orgname", orgname01);
//    			}
//    		}
			
			designService.oderInsert(param);
			json.put("result", "S");
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	// TODO 디자인발주 신청내역	/admin/intranet/order_design_detail_list.do
	@RequestMapping(value = "order_design_detail_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_detail_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105205");
		model.addAttribute("menuCd", "105205");
		param.put("cate", "design");
		
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
		paginationInfo.setTotalRecordCount(designService.selectDesignOrderCnt(param));
		
		model.addAttribute("resultList", designService.selectDesignOrderList(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_design_detail_list";
	}
	
	// TODO 디자인발주 신청 상세 order_design_detail_view.jsp
	@RequestMapping(value = "order_design_detail_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_detail_view(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam (required=false, defaultValue="1")  String pageIndex2 ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105205");
		model.addAttribute("menuCd", "105205");
		
		param.put("cate", "design");
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./order_design_detail_list.do";
		}
		
		//model.addAttribute("result", designService.selectDesignView(param));
		
		//param.put("useq", seq);
		//model.addAttribute("fileresult", designService.selectDesignOrderFileView(param));
		//model.addAttribute("priceList", designService.selectDesignOrderPriceView(param));
		model.addAttribute("resultList", designService.selectList(param));
		
		param.put("orderseq", seq);
		
		model.addAttribute("view", designService.selectDesignOrderView(param));
		System.out.println("view seq::" + param.get("seq").toString() );
		
		model.addAttribute("buyList", designService.selectDesignOrderDetailList(param));
		System.out.println(" buyList == : " + model.get("buyList") );
		
		model.addAttribute("detailList", designService.selectdetail(param));
		System.out.println(" detailList == : " + model.get("detailList") );

		//댓글
		param.put("useq", seq);
		PaginationInfo paginationInfo = new PaginationInfo();		
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex2));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);				
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex2);
		int startCount = (((Integer.parseInt(pageIndex2)-1))*10);
		if ( startCount == 0 ){
			startCount = 0;
		}
		param.put("startCount", startCount );
		paginationInfo.setTotalRecordCount(designService.selectReplyCnt(param));
		
		model.addAttribute("replyList", designService.selectReplyPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	    
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_design_detail_view";
	}
	
	// TODO 디자인 발주신청 수정 및 상태 변경
	@RequestMapping(value = "design_order_update.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_order_update(@RequestParam Map param
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
		try {
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("contents", param.get("conts"));
			logger.debug("param" + param.toString());


			for (int i = 1; i <= 5; i++) {
				MultipartFile attach = mRequest.getFile("file0" + i);
				String filenameStr = "";
				String orgnameStr = "";
				if (attach != null && !attach.isEmpty()) {
					uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH2);
					if (uploadfileVO != null) {
						filenameStr = uploadfileVO.getUrl();
						orgnameStr = attach.getOriginalFilename();
					}
				} else {
					if (param.get("file-name0" + i) != null) {
						filenameStr = String.valueOf(param.get("file-name0" + i));
						orgnameStr  = String.valueOf(param.get("file" + i + "_orinm"));
					}
				}
				if (i == 1) {
					param.put("filename", filenameStr);
					param.put("orgname", orgnameStr);
				} else {
					param.put("filename" + i, filenameStr);
					param.put("orgname" + i, orgnameStr);
				}

			}

			designService.orderUpdate(param);
			json.put("result", "S");
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
	}
	
	
	// TODO 댓글 등록
	@RequestMapping(value = "replyProc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String replyProc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String useq
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
		try {
			//session
			param.put("useq", useq);
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("contents", param.get("conts"));
			
			UploadFileVO uploadfileVO = null;
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename", uploadfileVO.getUrl());
					param.put("orgfilename", uploadfileVO.getFileNm());
					param.put("tmpfilename", uploadfileVO.getFileTmprNm());
					System.out.println("=======getUrl : " + uploadfileVO.getUrl());
					System.out.println("=======getFileNm : " + uploadfileVO.getFileNm());
					System.out.println("=======getFileTmprNm : " + uploadfileVO.getFileTmprNm());
				}
    		}
			logger.debug("param" + param.toString());
			designService.insertReply(param);
			json.put("result", "S");
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
	}
	
	@RequestMapping(value = "/update_useyns.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyns(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn,
			HttpServletRequest request, HttpServletResponse response )
			throws Exception {

		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}
		
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		// 선택 노출, 미노출 update
		designService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}
	
	
	// TODO 물품 관리 	/admin/intranet/order_item_manage_list.do
	@RequestMapping(value = "order_item_manage_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_manage_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105206");
		model.addAttribute("menuCd", "105206");
		param.put("cate", "item");
		
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
		int totalRecordCount = designService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("resultList", designService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "order_Item_manage_list";
	}
	
	// TODO 상세/수정 order_item_manage_view.jsp
	@RequestMapping(value = "order_item_manage_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_manage_view(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105206");
		model.addAttribute("menuCd", "105206");
		
		param.put("cate", "item");
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./order_item_manage_list.do";
		}
		
		model.addAttribute("result", designService.selectDesignView(param));
		
		param.put("useq", seq);
		model.addAttribute("fileresult", designService.selectDesignOrderFileView(param));
		model.addAttribute("priceList", designService.selectDesignOrderPriceView(param));
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_Item_manage_view";
	}
	
	// TODO 등록 order_item_manage_write.jsp
	@RequestMapping(value = "order_item_manage_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_manage_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105206");
		model.addAttribute("menuCd", "105206");
		
		param.put("cate", "item");
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_Item_manage_write";
	}
	
	// TODO 물품 등록/수정 item_proc
	@RequestMapping(value = "item_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String item_proc(@RequestParam Map param
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
		
		try {
			//session
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("contents", param.get("conts") );
			logger.debug("param" + param.toString());
			//fileUpload
			MultipartFile attach = mRequest.getFile("file01");
			if (attach != null && !attach.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach, UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("f_file1", uploadfileVO.getUrl());
					param.put("filedec1", "1");
					System.out.println("=======f_file1 : " + uploadfileVO.getUrl());
				}
			}else{
				if ( param.get("file-name01") != null ){
	    			String filename01 = param.get("file-name01").toString();
	    			param.put("f_file1", filename01);
	    			param.put("filedec1", "1");
				}
			}
			MultipartFile attach2 = mRequest.getFile("file02");
			if (attach2 != null && !attach2.isEmpty()) {
				uploadfileVO2 = WebFileUtil.upload(attach2, UPLOAD_PATH);
				if (uploadfileVO2 != null) {
					param.put("f_file2", uploadfileVO2.getUrl());
					param.put("filedec2", "2");
					System.out.println("=======f_file2 : " + uploadfileVO2.getUrl());
				}
			}else{
				if ( param.get("file-name02") != null ){
	    			String filename02 = param.get("file-name02").toString();
	    			param.put("f_file2", filename02);
					param.put("filedec2", "2");
				}
			}
			MultipartFile attach3 = mRequest.getFile("file03");
			if (attach3 != null && !attach3.isEmpty()) {
				uploadfileVO3 = WebFileUtil.upload(attach3, UPLOAD_PATH);
				if (uploadfileVO3 != null) {
					param.put("f_file3", uploadfileVO3.getUrl());
					param.put("filedec3", "3");
					System.out.println("=======f_file3 : " + uploadfileVO3.getUrl());
				}
			}else{
				if ( param.get("file-name03") != null ){
	    			String filename03 = param.get("file-name03").toString();
	    			param.put("f_file3", filename03);
					param.put("filedec3", "3");
				}
			}
			MultipartFile attach4 = mRequest.getFile("file04");
			if (attach4 != null && !attach4.isEmpty()) {
				uploadfileVO4 = WebFileUtil.upload(attach4, UPLOAD_PATH);
				if (uploadfileVO4 != null) {
					param.put("f_file4", uploadfileVO4.getUrl());
					param.put("filedec4", "4");
					System.out.println("=======f_file4 : " + uploadfileVO4.getUrl());
				}
			}else{
				if ( param.get("file-name04") != null ){
	    			String filename04 = param.get("file-name04").toString();
	    			param.put("f_file4", filename04);
					param.put("filedec4", "4");
				}
			}
			MultipartFile attach5 = mRequest.getFile("file05");
			if (attach5 != null && !attach5.isEmpty()) {
				uploadfileVO5 = WebFileUtil.upload(attach5, UPLOAD_PATH);
				if (uploadfileVO5 != null) {
					param.put("f_file5", uploadfileVO5.getUrl());
					param.put("filedec5", "5");
					System.out.println("=======f_file5 : " + uploadfileVO5.getUrl());
				}
			}else{
				if ( param.get("file-name05") != null ){
	    			String filename05 = param.get("file-name05").toString();
	    			param.put("f_file5", filename05);
					param.put("filedec5", "5");
				}
			}
			if (seq != null && !seq.equals("")) {	
				designService.update(param);
				json.put("result", "S");
			} else {
				designService.insert(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}

	
	
	// TODO 물품 신청 내역
	// TODO 디자인발주 신청내역	/admin/intranet/order_item_detail_list.do
	@RequestMapping(value = "order_item_detail_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_detail_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105207");
		model.addAttribute("menuCd", "105207");
		param.put("cate", "item");
		
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
		paginationInfo.setTotalRecordCount(designService.selectDesignOrderCnt(param));
		
		model.addAttribute("resultList", designService.selectDesignOrderList(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_Item_detail_list";
	}
	
	// TODO 디자인발주 신청 상세 order_item_detail_view.jsp
	@RequestMapping(value = "order_item_detail_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_detail_view(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105207");
		model.addAttribute("menuCd", "105207");
		
		param.put("cate", "item");
		param.put("pageIndex", pageIndex);
		
		if ( seq == null ) {
			//TODO return false;
			return "redirect:./order_item_detail_list.do";
		}
		
		//model.addAttribute("result", designService.selectDesignView(param));
		
		//param.put("useq", seq);
		//model.addAttribute("fileresult", designService.selectDesignOrderFileView(param));
		//model.addAttribute("priceList", designService.selectDesignOrderPriceView(param));
		model.addAttribute("resultList", designService.selectList(param));
		
		param.put("orderseq", seq);
		
		model.addAttribute("view", designService.selectDesignOrderView(param));
		//System.out.println("view seq::" + param.get("seq").toString() );
		
		model.addAttribute("buyList", designService.selectDesignOrderDetailList(param));
		//System.out.println(" buyList == : " + model.get("buyList") );
		
		model.addAttribute("detailList", designService.selectdetail(param));
		//System.out.println(" detailList == : " + model.get("detailList") );

		//댓글
		param.put("useq", seq);
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
		paginationInfo.setTotalRecordCount(designService.selectReplyCnt(param));
		
		model.addAttribute("replyList", designService.selectReplyPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
	    
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_Item_detail_view";
	}
	
	
	@RequestMapping(value = "design_delete_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_delete_proc(@RequestParam Map param
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
				designService.delete(param);
				json.put("result", "S");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	@RequestMapping(value = "design_Reply_delete_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_Reply_delete_proc(@RequestParam Map param
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
			
			if ( admin == null && param.get("seq") == null ){
				json.put("result", "F");
			}else{
				
				Map view = designService.selectReplyOne(param);
				
				if ( "".equals(view.get("filename")) || view.get("filename") == null ){
					designService.deleteReply(param);
				}else{
					try{
						if ( !"".equals(view.get("filename").toString()) || view.get("filename").toString() != null ){
							WebFileUtil.deleteFile( view.get("filename").toString() );
						}
					}catch (Exception e) {
						// TODO: handle exception
					}
					designService.deleteReply(param);
				}
				json.put("result", "S");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	@RequestMapping(value="order_delete.do", method=RequestMethod.POST, produces="application/json;charset-8", headers="Accept=*/*")
	@ResponseBody
	public String order_design_delete(@RequestParam("seq") int seq,
			HttpServletRequest request, HttpServletResponse response,
			SessionStatus status) throws Exception{
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		
		JSONObject json = new JSONObject();
		int resultVal = designService.deleteDesignOrder(seq);
		
		if (resultVal > 0) {
			json.put("result", "S");
		} else {
			json.put("result", "F");
		}
		
		status.setComplete();
		return json.toString();
	}
}
