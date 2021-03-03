package com.main.admin.community.web;

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
import com.main.admin.community.service.BoardService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.json.JSONObject;

/**
 * 커뮤니티
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/community/*" })
public class BoardController extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/community/";
	
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	private final static String UPLOAD_PATH = "board/";
	
	
	// TODO /admin/community/{boardType}/community_list.do
	@RequestMapping(value = "{boardType}/community_list.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String press_list(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			@PathVariable String boardType,
			@RequestParam (required=false, defaultValue="") String useyn,
			@RequestParam (required=false, defaultValue="") String event_progress,
			@RequestParam (required=false, defaultValue="") String cate,
			@RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		CodeVO vo = new CodeVO();
		if(boardType.equals("notice")) {
			vo.setMenuCd("103201");
			model.addAttribute("menuCd", "103201");
		}else if(boardType.equals("event")) {
			vo.setMenuCd("103202");
			model.addAttribute("menuCd", "103202");
		}else if(boardType.equals("sns")) {
			vo.setMenuCd("103203");
			model.addAttribute("menuCd", "103203");
		}
		
		PaginationInfo paginationInfo = new PaginationInfo();		
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("boardType" , boardType);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex)-1))*10);
		if ( startCount == 0 ){
			startCount = 0;
		}
		param.put("startCount", startCount );
		param.put("useyn", useyn);
		param.put("event_progress", event_progress);
		param.put("cate", cate);
		int totalRecordCount = boardService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		
		model.addAttribute("resultList", boardService.selectPaging(param));
	    model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("searchVO", param);
		model.addAttribute("checkedSeqArr", checkedSeqArr);
		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);
		
		return NAMESPACE + "community_list";
	}
	
	
	// TODO 게시판 등록
	@RequestMapping(value = "{boardType}/community_write.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String board_write(
			@PathVariable String boardType,
			@RequestParam (required=false, defaultValue="") String seq,
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		CodeVO vo = new CodeVO();
		if(boardType.equals("notice")) {
			vo.setMenuCd("103201");
			model.addAttribute("menuCd", "103201");
		}else if(boardType.equals("event")) {
			vo.setMenuCd("103202");
			model.addAttribute("menuCd", "103202");
		}else if(boardType.equals("sns")) {
			vo.setMenuCd("103203");
			model.addAttribute("menuCd", "103203");
		}
		param.put("boardType", boardType);
		if(!seq.equals("")) {
			param.put("seq" , seq);
			model.addAttribute("result", boardService.selectCommunityOne(param));
		}
		
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "community_write";
	}
	
	
	// TODO 매장공지 등록/수정 처리
	@RequestMapping(value = "{boardType}/write_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String write_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response
			, MultipartHttpServletRequest mRequest
			, @PathVariable String boardType) throws Exception {
		JSONObject json = new JSONObject();
		UploadFileVO uploadfileVO = null;
		
		System.out.println("===============conts:" + param.get("conts") );
		param.put("boardType", boardType);
		param.put("contents", param.get("conts") );
		try {
				
			//session
			ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
			param.put("regid", admin.getAdminid());
			param.put("modid", admin.getAdminid());
			param.put("regip", CommonUtil.getClientIp(request));
			logger.debug("param" + param.toString());
			//fileUpload
			MultipartFile attachPcImg = mRequest.getFile("pc_img");
			if (attachPcImg != null && !attachPcImg.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attachPcImg, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("pcThimg", uploadfileVO.getUrl());
					param.put("pc_thorinm", attachPcImg.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("pc_img_txt") ) && param.get("pc_img_txt") != null ){
    			param.put("pcThimg", param.get("pc_img_txt"));
    			param.put("pc_thorinm", param.get("pc_thorinm"));
    		}else{
    			param.put("pc_img_del", "Y");
    		}
			MultipartFile attachMImg = mRequest.getFile("m_img");
			if (attachMImg != null && !attachMImg.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attachMImg, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("mThimg", uploadfileVO.getUrl());
					param.put("m_thorinm", attachMImg.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("m_img_txt") ) && param.get("m_img_txt") != null ){
    			param.put("mThimg", param.get("pc_img_txt"));
    			param.put("m_thorinm", param.get("m_thorinm"));
    		}else{
    			param.put("m_img_del", "Y");
    		}
			MultipartFile attach1 = mRequest.getFile("file01");
			if (attach1 != null && !attach1.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach1, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename1", uploadfileVO.getUrl());
					param.put("file1_orinm", attach1.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("file-name01") ) && param.get("file-name01") != null ){
    			param.put("filename1", param.get("file-name01"));
    			param.put("file1_orinm", param.get("file1_orinm"));
    		}else{
    			param.put("file01_del", "Y");
    		}
			MultipartFile attach2 = mRequest.getFile("file02");
			if (attach2 != null && !attach2.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach2, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename2", uploadfileVO.getUrl());
					param.put("file2_orinm", attach2.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("file-name02") ) && param.get("file-name02") != null ){
    			param.put("filename2", param.get("file-name02"));
    			param.put("file2_orinm", param.get("file2_orinm"));
    		}else{
    			param.put("file02_del", "Y");
    		}
			MultipartFile attach3 = mRequest.getFile("file03");
			if (attach3 != null && !attach3.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach3, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename3", uploadfileVO.getUrl());
					param.put("file3_orinm", attach3.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("file-name03") ) && param.get("file-name03") != null ){
    			param.put("filename3", param.get("file-name03"));
    			param.put("file3_orinm", param.get("file3_orinm"));
    		}else{
    			param.put("file03_del", "Y");
    		}
			MultipartFile attach4 = mRequest.getFile("file04");
			if (attach4 != null && !attach4.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach4, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename4", uploadfileVO.getUrl());
					param.put("file4_orinm", attach4.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("file-name04") ) && param.get("file-name04") != null ){
    			param.put("filename4", param.get("file-name04"));
    			param.put("file4_orinm", param.get("file4_orinm"));
    		}else{
    			param.put("file04_del", "Y");
    		}
			MultipartFile attach5 = mRequest.getFile("file05");
			if (attach5 != null && !attach5.isEmpty()) {
				uploadfileVO = WebFileUtil.upload(attach5, boardType+"/"+UPLOAD_PATH);
				if (uploadfileVO != null) {
					param.put("filename5", uploadfileVO.getUrl());
					param.put("file5_orinm", attach5.getOriginalFilename());
				}
    		}else if ( !"".equals( param.get("file-name05") ) && param.get("file-name05") != null ){
    			param.put("filename5", param.get("file-name05"));
    			param.put("file5_orinm", param.get("file5_orinm"));
    		}else{
    			param.put("file05_del", "Y");
    		}
			
			if (seq != null && !seq.equals("")) {	
				boardService.updateComuunityBoard(param);
				json.put("result", "S");
			} else {
				boardService.insertComuunityBoard(param);
				json.put("result", "S");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	
	// TODO delete_proc
	@RequestMapping(value = "{boardType}/delete_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String delete_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="0")  String seq
			, @PathVariable String boardType
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		JSONObject json = new JSONObject();
		try {
			ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
			param.put("boardType", boardType);
			if ( admin == null && param.get("seq") == null ){
				json.put("result", "F");
			}else{
				boardService.delete(param);
				json.put("result", "S");
			}
		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "F"); 
		}
		return json.toString();
		
	}
	
	@RequestMapping(value = "{boardType}/update_useyn.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		boardService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}
	
	
}
