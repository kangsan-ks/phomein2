package com.main.admin.main.web;

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
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.main.service.MainService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;

import net.sf.json.JSONObject;

@Controller
@RequestMapping({ "/admin/*" })
public class MainController extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/";
	
	@Resource(name = "codeService")
	private CodeService codeService;	
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	
	@RequestMapping(value = { "login.do" }, method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@RequestParam Map param, @RequestParam(required = false, defaultValue = "1") String pageIndex,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		
		return NAMESPACE + "login";
	}
	
	
	// TODO 로그인 처리
	@ResponseBody 
	@RequestMapping(value = "loginProc.do", method = RequestMethod.POST, produces="application/json;charset=utf8")
	public String loginProc(
			@RequestParam(value = "fId") String fId, @RequestParam(value = "fPw") String fPw, 			
			HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		JSONObject json = new JSONObject();
		try {
			// 패스워드 단방향 암호화 체크
			//String encodePwd = CommonUtil.encryptSHA256( fPw );
			String encodePwd = CommonUtil.shaEncdoing( fPw, request ); 
			
			//System.out.println("encodePwd : "+ encodePwd);
			
			if( encodePwd.equals("100")){
				json.put("result", "F");
				return json.toString();
			}
			// 패스워드 단방향 암호화 체크 끝
			String adminType = "111201";
			
			ManagerVO vo = mainService.selectLogin(fId, encodePwd, adminType);				
			if(vo == null) {
				json.put("result", "F");
			}else{
				WebUtils.setSessionAttribute(request, "adminSession", vo);
				session.setAttribute("adminSession", vo);
				json.put("permission", vo.getMenu());
				json.put("result", "S");
			}

		} catch (Exception e) {
			e.printStackTrace();
			json.put("result", "overFalse"); 
		}
		
		System.out.println("====" + json );
		return json.toString();
		
	}
	
	// TODO 로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logOut(HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		session.invalidate();
		return "redirect:/admin/login.do";
	}
	
	
	// TODO 메인 페이지
	
	
	
	
	// TODO Left 메뉴
	@RequestMapping(value = "include/lnb.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String leftmenu(
			@RequestParam Map param,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		String menuCd = request.getParameter("menuCd");
		//System.out.println("==LNB MenuCD==: " + menuCd );
		CodeVO vo = new CodeVO();
		vo.setMenuCd(menuCd);
		model.addAttribute("MenuList", codeService.selectMenuNmFirst(vo));

		return "/include/lnb";
	}
	
	
}
