package com.main.admin.customer.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.customer.service.CustomerService;
import com.main.cmmn.util.CommonUtil;
import com.main.cmmn.util.DateUtil;
import com.main.cmmn.util.EmailUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;
import com.main.web.brand.phomein.service.PhomeinService;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 문의관리
 * 
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/customer/*" })
public class CustomerController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/customer/";

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "customerService")
	private CustomerService customerService;
	
	@Resource(name = "phomeinService")
	private PhomeinService phomeinService;
	
	@Value("#{ defaultProperty['htmlpath.email'] }")
	private String HTMLPATH_EMAIL;
	
	@Value("#{ defaultProperty['domain'] }")
	private String DOMAIN;
	
	@Value("#{ defaultProperty['phomein_smtp_host'] }")
	private String SMTP_HOST;
	
	@Value("#{ defaultProperty['phomein_smtp_port'] }")
	private String SMTP_PORT;
	
	@Value("#{ defaultProperty['phomein_smtp_id'] }")
	private String SMTP_ID;
	
	@Value("#{ defaultProperty['phomein_smtp_pwd'] }")
	private String SMTP_PWD;
	
	@Value("#{ defaultProperty['mail_to.member'] }")
	private String MAIL_TO_MEMBER;
	
	@Value("#{ defaultProperty['mail_to.member.name'] }")
	private String MAIL_TO_NAME_MEMBER;
	

	// TODO 고객의소리 /admin/customer/customer_list.do
	@RequestMapping(value = "customer_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String customer_list(@RequestParam Map param, @RequestParam(required = false) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String type, @RequestParam(required = false) String search_cate,
			@RequestParam(required = false) String search_working, @RequestParam(required = false) String search_name,
			@RequestParam(required = false) String search_hp, @RequestParam(required = false) String search_email,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104201");
		model.addAttribute("menuCd", "104201");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex) - 1)) * 10);
		if (startCount == 0) {
			startCount = 0;
		}
		param.put("startCount", startCount);
		param.put("search_cate", search_cate);
		param.put("search_working", search_working);
		param.put("search_name", search_name);
		param.put("search_hp", search_hp);
		param.put("search_email", search_email);
		param.put("code", "customer");

		paginationInfo.setTotalRecordCount(customerService.selectTotCnt(param));

		model.addAttribute("resultList", customerService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("type", type);
		model.addAttribute("search_cate", search_cate);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_name", search_name);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("search_email", search_email);

		return NAMESPACE + "customer_list";
	}

	// TODO 고객의소리 /admin/customer/customer_view.do
	@RequestMapping(value = "customer_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String customer_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String type, @RequestParam(required = false) String search_cate,
			@RequestParam(required = false) String search_working, @RequestParam(required = false) String search_name,
			@RequestParam(required = false) String search_hp, @RequestParam(required = false) String search_email,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104201");
		model.addAttribute("menuCd", "104201");
		
		param.put("code", "customer");
		// 고객의소리 기본 정보
		model.addAttribute("resultView", customerService.selectCustomerView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("type", type);
		model.addAttribute("search_cate", search_cate);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_name", search_name);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("search_email", search_email);

		return NAMESPACE + "customer_view";
	}

	@RequestMapping(value = "/customer_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> customer_modify(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "N") String answeryn,
			@RequestParam(required = false, defaultValue = "Y") String working, @RequestParam String seq,
			@RequestParam(required = false) String answer,
			@RequestParam(required = false) String code, Model model,
			HttpServletRequest request) throws Exception {
		
		//@RequestParam(required = false, defaultValue = "customer") String code, Model model,
		
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		/*
		if (StringUtils.isEmpty(answer)) {
			returnMap.put("result", "FAIL");
			return returnMap;
		}
		*/
		param.put("seq", seq);
		param.put("answer", answer);
		param.put("answeryn", answeryn);
		param.put("working", working);
		param.put("code", code);

		param.put("regid", admin.getAdminid());
		param.put("modid", admin.getAdminid());
		
		// 고객의소리 기본 정보
		Map result = customerService.selectCustomerView(param);
		
		String feedkind = "";
		if ( "".equals( result.get("feedkind") ) || result.get("feedkind") == null ){
			
		} else if ( result.get("feedkind").equals("mobile") ){
			feedkind = "유선";
		} else if ( result.get("feedkind").equals("email") ){
			feedkind = "이메일";
				
		//try{
			/** 메일 수신자 이메일 */
			String recvEmail = result.get("email").toString();
			//recvEmail = CommonUtil.setEmailMasking(recvEmail, 3);
			String recvName = result.get("name").toString();
			String recvId="";
			/*문의구분*/
			String catenm = result.get("catenm").toString();
			/*매장명*/
			String visitstore = result.get("visitstore").toString();
			/*방문일*/
			String visitdate = result.get("visitdate").toString();
			/*연락처*/
			String hp = result.get("hp").toString();
			hp = CommonUtil.setPhoneMasking(hp);
			/*회신요청*/
			
			/*제목*/
			String title = result.get("title").toString();
			/*내용*/
			String contents = result.get("contents").toString();
			/*첨부파일*/
			String filename1 = result.get("filename1").toString();
			
			/** 메일 발신일자 */
			String sendDate = DateUtil.getDateByFormat(new Date(), "yyyy.MM.dd");
			
			/** 메일 제목 / 메일 내용 / 메일 발신자 이름 / 메일 발신자 이메일 */
			String mailTitle = "[포메인] 문의에 대한 답변 드립니다. ";
			String mailContentHtmlName = "";
			
			if ( catenm.equals("매장서비스") ){
				if( filename1.equals("") || filename1 == null ) {
					//매장명 있는 경우 | 파일 없는 경우
					mailContentHtmlName = HTMLPATH_EMAIL + "/email02.html";	
				}else {
					//매장명 있는 경우 | 파일 있는 경우
					mailContentHtmlName = HTMLPATH_EMAIL + "/email01.html";
				}
			}else{
				if( filename1.equals("") || filename1 == null ) {
					//매장명 없는 경우 | 파일 없는 경우
					mailContentHtmlName = HTMLPATH_EMAIL + "/email04.html";	
				}else {
					//매장명 없는 경우 | 파일 있는 경우
					mailContentHtmlName = HTMLPATH_EMAIL + "/email03.html";
				}
			}
			if ( visitdate.length() > 10 ){
				visitdate = visitdate.substring(0, 10);
			}
			
			
			String fromName = MAIL_TO_NAME_MEMBER;
			String fromEmail = MAIL_TO_MEMBER;
			
			/** 본문 치환 변수1 / 본문 대입 변수2 */
			String str1[] = null;
			String str2[] = null;
			
			str1 = new String[]{"#domain#", "#recvName#", "#recvEmail#", "#catenm#", "#visitstore#", "#visitdate#", "#hp#", "#feedkind#", "#title#", "#contents#"
					, "#filename1#", "#answer#", "#sendDate#" };
			str2 = new String[]{DOMAIN, recvName, recvEmail, catenm, visitstore,visitdate, hp,feedkind, title, contents, filename1, answer, sendDate };
									
			EmailUtil mail = new EmailUtil();
			
			String port = SMTP_PORT;
			
			/*
			System.out.println("=================SMTP_PORT:"+SMTP_PORT);
			System.out.println("=================SMTP_HOST:"+SMTP_HOST);
			System.out.println("=================SMTP_ID:"+SMTP_ID);
			System.out.println("=================SMTP_PWD:"+SMTP_PWD);
			System.out.println("=================DOMAIN:"+DOMAIN);
			System.out.println("=================mailTitle:"+mailTitle);
			System.out.println("=================recvName:"+recvName);
			System.out.println("=================recvEmail:"+recvEmail);
			System.out.println("=================fromName:"+fromName);
			System.out.println("=================fromEmail:"+fromEmail);
			System.out.println("=================mailContentHtmlName:"+mailContentHtmlName);
			System.out.println("=================str1:"+str1.toString());
			System.out.println("=================str2:"+str2.toString());
			System.out.println("=================END");
			*/
			
			mail.sendMail(SMTP_HOST, SMTP_ID, SMTP_PWD, DOMAIN, mailTitle, recvName, recvEmail, fromName, fromEmail, mailContentHtmlName, str1, str2, port);
		/*	
		} catch (Exception e) {
			//e.printStackTrace();
		}
		*/
		}
			
		// 답변등록 정보 save
		customerService.mergeCustomer(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	// TODO 가맹점 문의 /admin/customer/store_inquiry_list.do
	@RequestMapping(value = "store_inquiry_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String store_inquiry_list(@RequestParam Map param, @RequestParam(required = false) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_working, @RequestParam(required = false) String search_name,
			@RequestParam(required = false) String search_hp, @RequestParam(required = false) String search_email,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104202");
		model.addAttribute("menuCd", "104202");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex) - 1)) * 10);
		if (startCount == 0) {
			startCount = 0;
		}
		param.put("startCount", startCount);
		param.put("search_working", search_working);
		param.put("search_name", search_name);
		param.put("search_hp", search_hp);
		param.put("search_email", search_email);
		param.put("code", "store");

		paginationInfo.setTotalRecordCount(customerService.selectTotCnt(param));

		model.addAttribute("resultList", customerService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_name", search_name);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("search_email", search_email);

		return NAMESPACE + "store_inquiry_list";
	}

	// TODO 가맹점문의 /admin/customer/store_inquiry_view.do
	@RequestMapping(value = "store_inquiry_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String store_inquiry_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_working, @RequestParam(required = false) String search_name,
			@RequestParam(required = false) String search_hp, @RequestParam(required = false) String search_email,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}		
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104202");
		model.addAttribute("menuCd", "104202");
		
		param.put("code", "store");
		// 가맹점문의 기본 정보
		model.addAttribute("resultView", customerService.selectCustomerView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_name", search_name);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("search_email", search_email);

		return NAMESPACE + "store_inquiry_view";
	}

	@RequestMapping(value = "/store_inquiry_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> store_inquiry_modify(@RequestParam Map param, @RequestParam String seq,
			@RequestParam(required = false, defaultValue = "N") String answeryn,
			@RequestParam(required = false, defaultValue = "Y") String working, Model model, HttpServletRequest request)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return null;
		}		
		param.put("seq", seq);
		param.put("answeryn", answeryn);
		param.put("working", working);
		param.put("code", "store");

		param.put("regid", admin.getAdminid());
		param.put("modid", admin.getAdminid());
		// 가맹점문의 답변 정보 save
		customerService.mergeCustomer(param);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "point_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String point_list(@RequestParam Map param, @RequestParam(required = false) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String checkedSeqArr, @RequestParam(required = false) String search_working,
			@RequestParam(required = false) String search_cardno, @RequestParam(required = false) String search_hp,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104204");
		model.addAttribute("menuCd", "104204");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex) - 1)) * 10);
		if (startCount == 0) {
			startCount = 0;
		}
		param.put("startCount", startCount);
		param.put("search_working", search_working);
		param.put("search_cardno", search_cardno);
		param.put("search_hp", search_hp);

		int totalRecordCount = customerService.selectPointTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		model.addAttribute("resultList", customerService.selectPointPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_cardno", search_cardno);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "point_list";
	}

	@RequestMapping(value = "coupon_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String coupon_list(@RequestParam Map param, @RequestParam(required = false) String seq,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String checkedSeqArr, @RequestParam(required = false) String search_working,
			@RequestParam(required = false) String search_name, @RequestParam(required = false) String search_hp,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if( admin == null || !admin.getAdmintype().equals("111201") ){
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("104205");
		model.addAttribute("menuCd", "104205");

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(pageIndex));
		paginationInfo.setRecordCountPerPage(10);
		paginationInfo.setPageSize(10);
		param.put("pageUnit", 10);
		param.put("pageIndex", pageIndex);
		int startCount = (((Integer.parseInt(pageIndex) - 1)) * 10);
		if (startCount == 0) {
			startCount = 0;
		}
		param.put("startCount", startCount);
		param.put("search_working", search_working);
		param.put("search_name", search_name);
		param.put("search_hp", search_hp);

		int totalRecordCount = customerService.selectCouponTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));
		model.addAttribute("resultList", customerService.selectCouponPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq", seq);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_working", search_working);
		model.addAttribute("search_name", search_name);
		model.addAttribute("search_hp", search_hp);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "coupon_list";
	}

	@RequestMapping(value = "/update_apply_point.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_apply_complete(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String applyyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("applyyn", applyyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
			// 선택 통합완료 update
			List<Map> tbPointMergeList = customerService.selectTbPointMerge(param);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			//통합신청 api 변경
			for(int i=0; i < tbPointMergeList.size(); i++) {
				System.out.println("================= mergeCardToMilage ===================");
				System.out.println("========"+ tbPointMergeList.get(i).get("cardno") +"===========");
				System.out.println("========"+ tbPointMergeList.get(i).get("hp") +"===========");
				System.out.println("========"+ tbPointMergeList.get(i).get("seq") +"===========");
				System.out.println("================= mergeCardToMilage ===================");
				param.put("cardno" , tbPointMergeList.get(i).get("cardno"));
				param.put("hp" , tbPointMergeList.get(i).get("hp"));
				param.put("seq" , tbPointMergeList.get(i).get("seq"));
				
				resultMap = phomeinService.mergeCardToMilage(param);
				customerService.updateApplyPoint(param);
				
			}
			returnMap.put("result" , resultMap.get("result").toString() );
			returnMap.put("code" , resultMap.get("code").toString() );
			returnMap.put("message", resultMap.get("message").toString() );
		}catch (Exception e){
			returnMap.put("message", "시스템 관리자에게 문의하세요");
		}
		return returnMap;
	}

	@RequestMapping(value = "/update_apply_coupon.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_apply_coupon(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String applyyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("applyyn", applyyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 배송완료 update
		customerService.updateApplyCoupon(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

}
