package com.main.store.intranet.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.main.admin.intranet.service.DesignService;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONObject;

@Controller
@RequestMapping({ "/store/intranet/*" })
public class StoreDesignController  extends GOdukAbstractController{

	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "franchisee/intranet/";
	private final static String UPLOAD_PATH = "design/";
	private final static String UPLOAD_PATH2 = "design/user/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "designService")
	private DesignService designService;
	
	
	// TODO 디자인발주 신청 order_design_write
	@RequestMapping(value = "order_design_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
	
	
	// TODO 디자인 스토어 신청 design_order_proc.do
	@RequestMapping(value = "design_order_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String design_order_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, MultipartHttpServletRequest mRequest) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
	
	
	// TODO 디자인발주 신청내역	/store/intranet/order_design_detail_list.do
	@RequestMapping(value = "order_design_detail_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_design_detail_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105205");
		model.addAttribute("menuCd", "105205");
		param.put("cate", "design");
		
		param.put("adminid", admin.getAdminid());
		
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
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
			, HttpServletResponse response, MultipartHttpServletRequest mRequest) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
		    			filenameStr = param.get("file-name0" + i).toString();
		    			orgnameStr  = param.get("file" + i + "_orinm").toString();
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
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
		
		
	
	// TODO 물품 신청 관리
	// TODO 디자인발주 신청 order_item_write
	@RequestMapping(value = "order_item_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_write(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105206");
		model.addAttribute("menuCd", "105206");
		
		param.put("cate", "item");
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("resultList", designService.selectList(param));
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "order_Item_write";
	}
	
	
	
	// TODO  신청내역	/store/intranet/order_item_detail_list.do
	@RequestMapping(value = "order_item_detail_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String order_item_detail_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("105207");
		model.addAttribute("menuCd", "105207");
		param.put("cate", "item");
		
		param.put("adminid", admin.getAdminid());
		
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
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		if( admin == null || !admin.getAdmintype().equals("111202") ){
			return "redirect:/store/login.do";
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
		System.out.println("view seq::" + param.get("seq").toString() );
		
		model.addAttribute("buyList", designService.selectDesignOrderDetailList(param));
		System.out.println(" buyList == : " + model.get("buyList") );
		
		model.addAttribute("detailList", designService.selectdetail(param));
		System.out.println(" detailList == : " + model.get("detailList") );

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
		
		
	
}
