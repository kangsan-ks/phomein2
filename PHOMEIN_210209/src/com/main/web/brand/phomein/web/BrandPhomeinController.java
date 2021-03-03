package com.main.web.brand.phomein.web;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.admin.customer.service.CustomerService;
import com.main.admin.site.service.PhoeverService;
import com.main.web.brand.phomein.service.PhomeinService;

@Controller
@RequestMapping({ "/brand/phomein/*", "/mbrand/phomein/*" })
public class BrandPhomeinController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private final String NAMESPACE = "brand/phomein/";

	private final String M_NAMESPACE = "mbrand/phomein/";

	@Resource(name = "phomeinService")
	private PhomeinService phomeinService;

	@Resource(name = "phoeverService")
	private PhoeverService phoeverService;

	@Resource(name = "customerService")
	private CustomerService customerService;

	// TODO /brand/community/{boardType}/community_list.do
	@RequestMapping(value = "about.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String brandHome(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "about";
		}
		return NAMESPACE + "about";
	}

	// 멤버십 안내
	@RequestMapping(value = "member_ship.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String member_ship(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "member_ship";
		}
		return NAMESPACE + "member_ship";
	}

	// 휴대폰 본인인증
	@RequestMapping(value = { "mileage_01.do", "mileage_03.do", "coupon_02.do" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String mileage_01(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

		String sSiteCode = "G3999"; // NICE로부터 부여받은 사이트 코드
		String sSitePassword = "VN1UOX5TSKAT"; // NICE로부터 부여받은 사이트 패스워드

		String sRequestNumber = "REQ0000000001"; // 요청 번호, 이는 성공/실패후에 같은 값으로
													// 되돌려주게 되므로
													// 업체에서 적절하게 변경하여 쓰거나, 아래와
													// 같이 생성한다.
		sRequestNumber = niceCheck.getRequestNO(sSiteCode);
		session.setAttribute("REQ_SEQ", sRequestNumber); // 해킹등의 방지를 위하여 세션을
															// 쓴다면, 세션에 요청번호를
															// 넣는다.

		String sAuthType = ""; // 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서

		String popgubun = "N"; // Y : 취소버튼 있음 / N : 취소버튼 없음
		String customize = ""; // 없으면 기본 웹페이지 / Mobile : 모바일페이지

		String sGender = ""; // 없으면 기본 선택 값, 0 : 여자, 1 : 남자

		// CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
		// 리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~
		// 리턴 url :
		// http://www.~
		String sReturnUrl = "http://www.phomein.com/brand/phomein/checkplus_success.do"; // 성공시
																							// 이동될
																							// URL

		if (!StringUtils.equals("normal", deviceType)) {
			sReturnUrl = "http://www.phomein.com/mbrand/phomein/checkplus_success.do"; // 성공시
																								// 이동될
																								// URL
		}

		String sErrorUrl = "http://www.phomein.com/brand/phomein/checkplus_fail.do"; // 실패시
																						// 이동될
																						// URL

		if (!StringUtils.equals("normal", deviceType)) {
			sErrorUrl = "http://www.phomein.com/mbrand/phomein/checkplus_fail.do"; // 실패시
																							// 이동될
																							// URL
		}

		// 입력될 plain 데이타를 만든다.
		String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber + "8:SITECODE"
				+ sSiteCode.getBytes().length + ":" + sSiteCode + "9:AUTH_TYPE" + sAuthType.getBytes().length + ":"
				+ sAuthType + "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl + "7:ERR_URL"
				+ sErrorUrl.getBytes().length + ":" + sErrorUrl + "11:POPUP_GUBUN" + popgubun.getBytes().length + ":"
				+ popgubun + "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + "6:GENDER"
				+ sGender.getBytes().length + ":" + sGender;

		String sMessage = "";
		String sEncData = "";

		int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
		if (iReturn == 0) {
			sEncData = niceCheck.getCipherData();
		} else if (iReturn == -1) {
			sMessage = "암호화 시스템 에러입니다.";
		} else if (iReturn == -2) {
			sMessage = "암호화 처리오류입니다.";
		} else if (iReturn == -3) {
			sMessage = "암호화 데이터 오류입니다.";
		} else if (iReturn == -9) {
			sMessage = "입력 데이터 오류입니다.";
		} else {
			sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
		}
		model.addAttribute("encData", sEncData);
		model.addAttribute("message", sMessage);

		if (StringUtils.contains(request.getRequestURL().toString(), "mileage_03")) {
			if (!StringUtils.equals("normal", deviceType)) {
				return M_NAMESPACE + "mileage_03";
			} else {
				return NAMESPACE + "mileage_03";
			}
		} else if (StringUtils.contains(request.getRequestURL().toString(), "coupon_02")) {
			if (!StringUtils.equals("normal", deviceType)) {
				return M_NAMESPACE + "coupon_02";
			} else {
				return NAMESPACE + "coupon_02";
			}
		}

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "mileage_01";
		}
		return NAMESPACE + "mileage_01";
	}

	// 휴대폰 본인인증 성공
	@RequestMapping(value = "checkplus_success.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkplus_success(@RequestParam Map param, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

		String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

		String sSiteCode = "G3999"; // NICE로부터 부여받은 사이트 코드
		String sSitePassword = "VN1UOX5TSKAT"; // NICE로부터 부여받은 사이트 패스워드
		String sName = ""; // 성명
		String sMobileNo = ""; // 휴대폰번호
		String sRequestNumber = ""; // 요청 번호
		String sMessage = "";
		String sPlainData = "";

		int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		if (iReturn == 0) {
			sPlainData = niceCheck.getPlainData();

			// 데이타를 추출합니다.
			java.util.HashMap mapresult = niceCheck.fnParse(sPlainData);

			sRequestNumber = (String) mapresult.get("REQ_SEQ");
			sName = (String) mapresult.get("NAME");
			sMobileNo = (String) mapresult.get("MOBILE_NO");

			String session_sRequestNumber = (String) session.getAttribute("REQ_SEQ");
			if (!sRequestNumber.equals(session_sRequestNumber)) {
				sMessage = "세션값이 다릅니다. 올바른 경로로 접근하시기 바랍니다.";
			}
			model.addAttribute("name", sName);
			model.addAttribute("mobileNo", sMobileNo);
			model.addAttribute("message", sMessage);
		}

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "checkplus_success";
		}
		return NAMESPACE + "checkplus_success";
	}

	// 휴대폰 본인인증 실패
	@RequestMapping(value = "checkplus_fail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String checkplus_fail(@RequestParam Map param, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

		String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");

		String sSiteCode = "G3999"; // NICE로부터 부여받은 사이트 코드
		String sSitePassword = "VN1UOX5TSKAT"; // NICE로부터 부여받은 사이트 패스워드
		String sMessage = "";

		int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);

		if (iReturn == -1) {
			sMessage = "복호화 시스템 에러입니다.";
		} else if (iReturn == -4) {
			sMessage = "복호화 처리오류입니다.";
		} else if (iReturn == -5) {
			sMessage = "복호화 해쉬 오류입니다.";
		} else if (iReturn == -6) {
			sMessage = "복호화 데이터 오류입니다.";
		} else if (iReturn == -9) {
			sMessage = "입력 데이터 오류입니다.";
		} else if (iReturn == -12) {
			sMessage = "사이트 패스워드 오류입니다.";
		} else {
			sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
		}

		model.addAttribute("message", sMessage);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "checkplus_fail";
		}
		return NAMESPACE + "checkplus_fail";
	}

	// 결과 확인
	@RequestMapping(value = "mileage_02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mileage_02(@RequestParam Map param, HttpSession session, @RequestParam(required = false) String name,
			@RequestParam(required = false) String mobileNo, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
				return "redirect:/mbrand/phomein/mileage_01.do";
			}
		}

		if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
			return "redirect:/brand/phomein/mileage_01.do";
		}

		model.addAttribute("mobileNo", mobileNo);
		String mobileNoRegEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		if (Pattern.matches(mobileNoRegEx, mobileNo))
			mobileNo = mobileNo.replaceAll(mobileNoRegEx, "$1-$2-$3");

		// 핸드폰 번호로 마일리지 API 조회
		Map<String, Object> resultMap = phomeinService.getMobileNoToMilage(mobileNo);

		model.addAttribute("name", name);
		model.addAttribute("regMobileNo", mobileNo);
		model.addAttribute("mileage", resultMap.get("mileage"));
		model.addAttribute("message", resultMap.get("message"));

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "mileage_02";
		}
		return NAMESPACE + "mileage_02";
	}

	// 카드번호로 마일리지 조회
	@RequestMapping(value = "/get_card_to_mileage.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> get_card_to_mileage(@RequestParam Map param, @RequestParam String cardNo) {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		// 카드번호로 마일리지 API 조회
		returnMap.put("result", phomeinService.getCardToMilage(cardNo));
		return returnMap;
	}

	// 마일리지 통합 신청
	@RequestMapping(value = "mileage_04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String mileage_04(@RequestParam Map param, HttpSession session, ModelMap model,
			@RequestParam(required = false) String name, @RequestParam(required = false) String cardNo,
			@RequestParam(required = false) String cardMileage, @RequestParam(required = false) String mobileNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
				return "redirect:/mbrand/phomein/mileage_03.do";
			}
		}

		if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
			return "redirect:/brand/phomein/mileage_03.do";
		}

		model.addAttribute("cardNo", cardNo);
		String cardNoRegEx = "(\\d{4})(\\d{4})(\\d{4})(\\d{4})";
		if (Pattern.matches(cardNoRegEx, cardNo))
			cardNo = cardNo.replaceAll(cardNoRegEx, "$1-$2-$3-$4");

		model.addAttribute("mobileNo", mobileNo);
		String mobileRegEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		if (Pattern.matches(mobileRegEx, mobileNo))
			mobileNo = mobileNo.replaceAll(mobileRegEx, "$1-$2-$3");

		// 핸드폰 번호로 마일리지 API 조회
		Map<String, Object> resultMap = phomeinService.getMobileNoToMilage(mobileNo);

		model.addAttribute("name", name);
		model.addAttribute("regCardNo", cardNo);
		model.addAttribute("cardMileage", cardMileage);
		model.addAttribute("regMobileNo", mobileNo);
		model.addAttribute("mileage", resultMap.get("mileage"));
		model.addAttribute("message", resultMap.get("message"));

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "mileage_04";
		}
		return NAMESPACE + "mileage_04";
	}

	@RequestMapping(value = "mileage_proc.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mileage_proc(@RequestParam Map param,
			@RequestParam(required = false) String name, @RequestParam(required = false) String cardNo,
			@RequestParam(required = false) String mobileNo, @RequestParam(required = false) String cardMileage,
			@RequestParam(required = false) String mileage, @RequestParam(required = false) String totMileage)
			throws Exception {
		param.put("cardno", cardNo);
		param.put("hp", mobileNo);
		param.put("apoint", cardMileage);
		param.put("bpoint", mileage);
		param.put("totpoint", totMileage);
		param.put("regid", "admin");
		param.put("modid", "admin");
		param.put("working", "Y");
		// 마일리지 통합 신청
		
				
		customerService.mergeMileage(param);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		//returnMap.put("result", phomeinService.mergeCardToMilage(param));
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	// 상품권 안내
	@RequestMapping(value = "coupon_01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String coupon_01(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "coupon_01";
		}
		return NAMESPACE + "coupon_01";
	}

	// 상품권 교환 신청/완료
	@RequestMapping(value = "coupon_03.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String coupon_03(@RequestParam Map param, HttpSession session, @RequestParam(required = false) String name,
			@RequestParam(required = false) String mobileNo, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		String deviceType = getDeviceType(request);

		if (!StringUtils.equals("normal", deviceType)) {
			if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
				return "redirect:/mbrand/phomein/coupon_01.do";
			}
		}

		if (StringUtils.isEmpty(name) || StringUtils.isEmpty(mobileNo)) {
			return "redirect:/brand/phomein/coupon_01.do";
		}

		model.addAttribute("mobileNo", mobileNo);
		String mobileRegEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		if (Pattern.matches(mobileRegEx, mobileNo))
			mobileNo = mobileNo.replaceAll(mobileRegEx, "$1-$2-$3");

		// 핸드폰 번호로 마일리지 API 조회
		Map<String, Object> resultMap = phomeinService.getMobileNoToMilage(mobileNo);

		model.addAttribute("name", name);
		model.addAttribute("regMobileNo", mobileNo);
		model.addAttribute("mileage", resultMap.get("mileage"));
		model.addAttribute("message", resultMap.get("message"));

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "coupon_03";
		}
		return NAMESPACE + "coupon_03";
	}

	@RequestMapping(value = "coupon_proc.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> coupon_proc(@RequestParam Map param,
			@RequestParam(required = false) String name, @RequestParam(required = false) String mobileNo,
			@RequestParam(required = false) String mileage, @RequestParam(required = false) String cnt,
			@RequestParam(required = false) String address) throws Exception {
		param.put("name", name);
		param.put("hp", mobileNo);
		param.put("point", mileage);
		param.put("qty", cnt);
		param.put("addr", address);
		param.put("regid", "admin");
		param.put("modid", "admin");
		param.put("working", "Y");
		customerService.mergeCoupon(param);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "phoever.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String phoever(@RequestParam Map param, HttpSession session, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String deviceType = getDeviceType(request);

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("search_useyn", 1);
		param.put("tb_socialcol", "PHO_EVER");
		model.addAttribute("resultList", phoeverService.selectPaging(param));

		if (!StringUtils.equals("normal", deviceType)) {
			return M_NAMESPACE + "phoever";
		}
		return NAMESPACE + "phoever";
	}

	public String requestReplace(String paramValue, String gubun) {

		String result = "";

		if (paramValue != null) {

			paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

			paramValue = paramValue.replaceAll("\\*", "");
			paramValue = paramValue.replaceAll("\\?", "");
			paramValue = paramValue.replaceAll("\\[", "");
			paramValue = paramValue.replaceAll("\\{", "");
			paramValue = paramValue.replaceAll("\\(", "");
			paramValue = paramValue.replaceAll("\\)", "");
			paramValue = paramValue.replaceAll("\\^", "");
			paramValue = paramValue.replaceAll("\\$", "");
			paramValue = paramValue.replaceAll("'", "");
			paramValue = paramValue.replaceAll("@", "");
			paramValue = paramValue.replaceAll("%", "");
			paramValue = paramValue.replaceAll(";", "");
			paramValue = paramValue.replaceAll(":", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll("#", "");
			paramValue = paramValue.replaceAll("--", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll(",", "");

			if (gubun != "encodeData") {
				paramValue = paramValue.replaceAll("\\+", "");
				paramValue = paramValue.replaceAll("/", "");
				paramValue = paramValue.replaceAll("=", "");
			}

			result = paramValue;

		}
		return result;
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
