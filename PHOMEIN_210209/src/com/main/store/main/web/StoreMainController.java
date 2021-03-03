package com.main.store.main.web;

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
import com.main.admin.site.service.ManagerService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;

import net.sf.json.JSONObject;

@Controller
@RequestMapping({ "/store/*" })
public class StoreMainController  extends GOdukAbstractController{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "franchisee/";
	
	@Resource(name = "codeService")
	private CodeService codeService;	
	
	@Resource(name = "mainService")
	private MainService mainService;

	@Resource(name = "managerService")
	private ManagerService managerService;
	
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
			String adminType = "111202";
			
			ManagerVO vo = mainService.selectLogin(fId, encodePwd, adminType);				
			if(vo == null) {
				json.put("result", "F");
			}else{
				WebUtils.setSessionAttribute(request, "storeSession", vo);
				session.setAttribute("storeSession", vo);
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
		return "redirect:/store/login.do";
	}
	

	// TODO Left 메뉴
	@RequestMapping(value = "include/storelnb.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String leftmenu(
			@RequestParam Map param,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		String menuCd = request.getParameter("menuCd");
		//System.out.println("==LNB MenuCD==: " + menuCd );
		CodeVO vo = new CodeVO();
		vo.setMenuCd(menuCd);
		model.addAttribute("MenuList", codeService.selectMenuNmFirst(vo));

		return "/include/storelnb";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "manager_view.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String manager_view(
			@RequestParam Map param, 
			@RequestParam (required=false, defaultValue="1")  String pageIndex ,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

		CodeVO vo = new CodeVO();
		vo.setMenuCd("110");
		model.addAttribute("menuCd", "110");
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
		param.put("adminid", admin.getAdminid() );
		
		param.put("pageIndex", pageIndex);
		
		model.addAttribute("result", managerService.selectViewById(param));
	
		model.addAttribute("searchVO", param);
		
		return NAMESPACE + "mypage/my_info";
	}
	
	@ResponseBody
	@RequestMapping(value = "pwd_proc.do" , method = {RequestMethod.GET, RequestMethod.POST}) 
	public String pwd_pop(
			@RequestParam (required=false) String seq,
			@RequestParam Map param, 
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {		

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
	
	
	@RequestMapping(value = "manager_proc.do", method = RequestMethod.POST) 
	@ResponseBody
	public String manager_proc(@RequestParam Map param
			, @RequestParam (required = false, defaultValue="")  String seq
			, ModelMap model
			, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) throws Exception {
		
		JSONObject json = new JSONObject();
		try {
			
			System.out.println("==================SEQ :" + seq);
			System.out.println("==================param.get(seq) :" + param.get("seq"));
			//session
			ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "storeSession");
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
}
