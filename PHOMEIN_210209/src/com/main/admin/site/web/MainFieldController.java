package com.main.admin.site.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.WebUtils;

import com.main.admin.main.service.MainService;
import com.main.admin.main.vo.MainFieldVO;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.ManagerVO;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/site/*")
public class MainFieldController extends GOdukAbstractController {
	private static final Logger LOGGER = LoggerFactory.getLogger(MainFieldController.class);
	private static final String NAMESPACE = "/cms/site";
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="mainFieldView.do")
	public String mainFieldView(ModelMap model) throws Exception {
		model.put("mainFieldVO", mainService.selectMainFieldDetail());
		model.put("menuCd", "107203");
		return NAMESPACE + "/main_field_view";
	}
	
	@RequestMapping(value="mainFieldProc.do", method=RequestMethod.POST, produces="application/json;charset=utf-8", headers="Accept=*/*")
	@ResponseBody
	public String mainFieldProc(@ModelAttribute("mainFieldVO") MainFieldVO mainFieldVO
			, BindingResult bindingResult
			, HttpServletRequest request, HttpServletResponse response
			, SessionStatus status) throws Exception {
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		JSONObject json = new JSONObject();
		
		mainFieldVO.setModId(admin.getAdminid());
		String resultCode = mainService.renewMainField(mainFieldVO);
		
		json.put("resultCode", resultCode);
		
		status.setComplete();
		return json.toString();
	}

}
