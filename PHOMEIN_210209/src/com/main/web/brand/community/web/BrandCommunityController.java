package com.main.web.brand.community.web;

import java.util.HashMap;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.admin.community.service.BoardService;
import com.main.cmmn.web.GOdukAbstractController;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping({ "/brand/community/*" , "/mbrand/community/*"})
public class BrandCommunityController extends GOdukAbstractController{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "brand/community/";
	
	private final String M_NAMESPACE = "mbrand/community/";
	
	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "search_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String search(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if(!deviceType.equals("normal")){
			return M_NAMESPACE + "search_list";
		}
		return NAMESPACE + "search_list";
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
		
		String nameSpace = "brand/community/";
		if (!StringUtils.equals("normal", deviceType)) {
			nameSpace = "mbrand/community/";
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
	
	// TODO /brand/community/{boardType}/community_view.do
	@RequestMapping(value = "{boardType}/community_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String community_view(
		@RequestParam Map param, 
		@RequestParam (required=false, defaultValue="1")  String pageIndex ,
		@PathVariable String boardType,
		@RequestParam (required=false, defaultValue="Y") String useyn,
		@RequestParam (required=false, defaultValue="") String event_progress,
		@RequestParam (required=false, defaultValue="") String cate,
		@RequestParam (required=false) String seq,
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
        
        String nameSpace = "brand/community/";
        if (!StringUtils.equals("normal", deviceType)) {
        	nameSpace = "mbrand/community/";
        }
        
        if (seq == null || seq.equals("")) {
        	return "redirect:/" + nameSpace + boardType + "/community_list.do";
        }
        
		param.put("seq", seq);
		param.put("boardType", boardType);
		model.addAttribute("result", boardService.selectCommunityOne(param));
		model.addAttribute("searchVO", param);
		model.addAttribute("preResult" , boardService.selectPreOne(param));
		model.addAttribute("nextResult" , boardService.selectNextOne(param));
		
		
		return nameSpace + "community_view";
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
	
}
