package com.main.admin.menu.web;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.main.admin.comm.service.CodeService;
import com.main.admin.menu.service.ProductService;
import com.main.admin.menu.web.validate.ProductValidate;
import com.main.admin.menu.web.vo.ProductVo;
import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.domain.CodeVO;
import com.main.domain.ManagerVO;

import com.main.admin.menu.service.RedProductService;
import com.main.admin.menu.web.vo.RedProductVo;
import com.main.admin.menu.web.validate.RedProductValidate;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 제품 메뉴 관리
 * 
 * @author G-Oduk.com
 *
 */
@Controller
@RequestMapping({ "/admin/menu/*" })
public class ProductController extends GOdukAbstractController {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final String NAMESPACE = "cms/menu/";

	@Resource(name = "codeService")
	private CodeService codeService;

	@Resource(name = "productService")
	private ProductService productService;

	@Resource(name = "productValidator")
	private ProductValidate productValidate;

	@Resource(name = "redProductService")
	private RedProductService redProductService;

	@Resource(name = "redProductValidator")
	private RedProductValidate redProductValidate;

	@Autowired
	private WebFileUtil webFileUtil;

	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		binder.registerCustomEditor(MultipartFile.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				logger.debug("initBinder MultipartFile.class: {}; set null;", text);
				setValue(null);
			}
		});
	}

	@RequestMapping(value = "product_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String product_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_site_ck,
			@RequestParam(required = false) String search_name, @RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101201");
		model.addAttribute("menuCd", "101201");

		// System.out.println("Integer.parseInt(pageIndex) ================== :"
		// + Integer.parseInt(pageIndex));
		// System.out.println(
		// " (Integer.parseInt(pageIndex)-1*10 ================== :" +
		// ((Integer.parseInt(pageIndex) - 1) * 10));

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
		param.put("search_useyn", search_useyn);
		param.put("search_site_ck", search_site_ck);
		param.put("search_name", search_name);

		int totalRecordCount = productService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));

		model.addAttribute("resultList", productService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq",
				StringUtils.isEmpty(productService.nextSeq(param)) ? 1 : productService.nextSeq(param));
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_site_ck", search_site_ck);
		model.addAttribute("search_name", search_name);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "product_list";
	}

	@RequestMapping(value = "product_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String product_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = true) String type,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_site_ck,
			@RequestParam(required = false) String search_name, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101201");
		model.addAttribute("menuCd", "101201");

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("102");
		// 국문 메뉴 카테고리 정보
		model.addAttribute("kr_code", codeService.selectCodeSub(codeVO));
		codeVO.setCode("103");
		// 영문 메뉴 카테고리 정보
		model.addAttribute("en_code", codeService.selectCodeSub(codeVO));
		codeVO.setCode("104");
		// 일문 메뉴 카테고리 정보
		model.addAttribute("jp_code", codeService.selectCodeSub(codeVO));

		// 제품 상세 기본 정보
		model.addAttribute("resultView", productService.selectProductView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_site_ck", search_site_ck);
		model.addAttribute("search_name", search_name);

		return NAMESPACE + "product_view";
	}

	@RequestMapping(value = "/product_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> product_modify(@RequestParam Map param, @ModelAttribute ProductVo product,
			BindingResult bindingResult, Model model, HttpServletRequest request) throws Exception {
		productValidate.validate(product, bindingResult);
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return null;
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101201");
		model.addAttribute("menuCd", "101201");

		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		// 첨부파일1, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(product.getF_file1_txt()) //
				&& product.getF_file1() != null) { //
			String f_file1 = productService.saveAttachFile(product.getF_file1());
			product.setF_file1_txt(f_file1);
		}
		product.setRegid(admin.getAdminid());
		product.setModid(admin.getAdminid());
		// 제품 기본 정보 save
		productService.mergeProduct(product);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/product_delete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> product_delete(@RequestParam Map param, @RequestParam String seq)
			throws Exception {
		param.put("seq", seq);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 제품 기본 정보 delete
		productService.deleteProduct(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "excelDown.do")
	public void excelDown(@RequestParam Map param, @RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_site_ck,
			@RequestParam(required = false) String search_name, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("product");
		sheet.setColumnWidth(0, (short) 8192);
		sheet.setColumnWidth(1, (short) 8192);
		sheet.setColumnWidth(2, (short) 8192);
		sheet.setColumnWidth(3, (short) 8192);
		sheet.setColumnWidth(4, (short) 8192);
		sheet.setColumnWidth(5, (short) 8192);
		HSSFCellStyle cellStyle = (HSSFCellStyle) wb.createCellStyle();
		CreationHelper createHelper = wb.getCreationHelper();

		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 헤더 생성
		row = sheet.createRow(rowNo++);

		cell = row.createCell(0);
		cell.setCellValue("사용범위");

		cell = row.createCell(1);
		cell.setCellValue("카테고리");

		cell = row.createCell(2);
		cell.setCellValue("제품코드");

		cell = row.createCell(3);
		cell.setCellValue("제품명");

		cell = row.createCell(4);
		cell.setCellValue("등록일");

		cell = row.createCell(5);
		cell.setCellValue("수정일");

		param.put("pageUnit", 9999);
		param.put("startCount", 0);
		param.put("pageIndex", pageIndex);
		param.put("search_useyn", search_useyn);
		param.put("search_site_ck", search_site_ck);
		param.put("search_name", search_name);
		List<Map> list = productService.selectPaging(param);
		String siteName = "";

		// 데이터 부분 생성
		for (Map map : list) {

			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);
			String site_ck = "";
			if (StringUtils.isNotEmpty((String) map.get("kr_ck"))
					&& StringUtils.equals("Y", (String) map.get("kr_ck"))) {
				site_ck += "국문사이트,";
			}
			if (StringUtils.isNotEmpty((String) map.get("en_ck"))
					&& StringUtils.equals("Y", (String) map.get("en_ck"))) {
				site_ck += "영문사이트,";
			}
			if (StringUtils.isNotEmpty((String) map.get("jp_ck"))
					&& StringUtils.equals("Y", (String) map.get("jp_ck"))) {
				site_ck += "일문사이트,";
			}
			if (site_ck.endsWith(",")) {
				site_ck = site_ck.substring(0, site_ck.length() - 1);
			}
			cell.setCellValue(site_ck);

			// 엑셀 파일명 생성 시 필요한 사이트명
			siteName = StringUtils.equals("국문사이트", cell.getStringCellValue().split(",")[0]) ? "Kor"
					: (StringUtils.equals("영문사이트", cell.getStringCellValue().split(",")[0]) ? "Eng"
							: (StringUtils.equals("일문사이트", cell.getStringCellValue().split(",")[0]) ? "Jap" : ""));

			cell = row.createCell(1);
			String code_name = "";
			if (StringUtils.isNotEmpty((String) map.get("kr_code"))) {
				code_name += (String) map.get("kr_code") + ",";
			}
			if (StringUtils.isNotEmpty((String) map.get("en_code"))) {
				code_name += (String) map.get("en_code") + ",";
			}
			if (StringUtils.isNotEmpty((String) map.get("jp_code"))) {
				code_name += (String) map.get("jp_code") + ",";
			}
			if (code_name.endsWith(",")) {
				code_name = code_name.substring(0, code_name.length() - 1);
			}
			cell.setCellValue(code_name);

			cell = row.createCell(2);
			cell.setCellValue((String) map.get("pcode"));

			cell = row.createCell(3);
			cell.setCellValue((String) map.get("name"));

			cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-MM-dd hh:mm"));
			cell = row.createCell(4);
			cell.setCellValue((Date) map.get("regdt"));
			cell.setCellStyle(cellStyle);

			cellStyle.setDataFormat(createHelper.createDataFormat().getFormat("yyyy-MM-dd hh:mm"));
			cell = row.createCell(5);
			cell.setCellValue((Date) map.get("moddt"));
			cell.setCellStyle(cellStyle);
		}

		// excel 파일 저장
		String filePath = productService.saveExcelFile(wb, request, siteName);
		webFileUtil.downloadExcelFile(request, response, filePath.substring(webFileUtil.getUploadPath().length()),
				filePath.substring(filePath.lastIndexOf("/") + 1));
	}

	@RequestMapping(value = "/update_useyn_product.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update_useyn_product(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		productService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");

		return returnMap;
	}

	@RequestMapping(value = "/product_check.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> product_check(@RequestParam Map param, @RequestParam String pcode)
			throws Exception {
		param.put("pcode", pcode);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 제품 기본 정보 delete
		int checkCnt = productService.duplicateProductCnt(param);
		if (checkCnt > 0) {
			returnMap.put("result", "FAIL");
		} else {
			returnMap.put("result", "SUCCESS");
		}
		return returnMap;
	}

	@RequestMapping(value = "/sub_sub_codes.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sub_sub_codes(@RequestParam Map param, @RequestParam String code)
			throws Exception {
		CodeVO codeVO = new CodeVO();
		codeVO.setCode(code);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("data", codeService.selectCodeSubSub(codeVO));
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	
	////////////////////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////////////
	// RED
	@RequestMapping(value = "red_product_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String red_product_list(@RequestParam Map param,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_site_ck,
			@RequestParam(required = false) String search_name, @RequestParam(required = false) String checkedSeqArr,
			HttpSession session, ModelMap model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101221");
		model.addAttribute("menuCd", "101221");

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
		param.put("search_useyn", search_useyn);
		param.put("search_site_ck", search_site_ck);
		param.put("search_name", search_name);

		int totalRecordCount = redProductService.selectTotCnt(param);
		paginationInfo.setTotalRecordCount(totalRecordCount);
		model.addAttribute("pagePerCount", Integer.parseInt(pageIndex) * 10 < totalRecordCount ? 10
				: 10 - (Integer.parseInt(pageIndex) * 10 - totalRecordCount));

		model.addAttribute("resultList", redProductService.selectPaging(param));
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", param);

		model.addAttribute("seq",
				StringUtils.isEmpty(redProductService.nextSeq(param)) ? 1 : redProductService.nextSeq(param));
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_site_ck", search_site_ck);
		model.addAttribute("search_name", search_name);
		model.addAttribute("checkedSeqArr", checkedSeqArr);

		int checkedSeqArrCnt = StringUtils.countMatches(checkedSeqArr, ",");
		model.addAttribute("checkedSeqArrCnt", StringUtils.isEmpty(checkedSeqArr) ? 0 : checkedSeqArrCnt + 1);

		return NAMESPACE + "red_product_list";
	}

	@RequestMapping(value = "red_product_view.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String red_product_view(@RequestParam Map param, @RequestParam(required = true) String seq,
			@RequestParam(required = true) String type,
			@RequestParam(required = false, defaultValue = "1") String pageIndex,
			@RequestParam(required = false) String search_useyn, @RequestParam(required = false) String search_site_ck,
			@RequestParam(required = false) String search_name, HttpSession session, ModelMap model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return "redirect:/admin/login.do";
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101221");
		model.addAttribute("menuCd", "101221");

		CodeVO codeVO = new CodeVO();
		codeVO.setCode("118");
		// 국문 메뉴 카테고리 정보
		model.addAttribute("kr_code", codeService.selectRedCodeSub(codeVO));
		codeVO.setCode("116");
		// 영문 메뉴 카테고리 정보
		model.addAttribute("en_code", codeService.selectRedCodeSub(codeVO));
		codeVO.setCode("117");
		// 일문 메뉴 카테고리 정보
		model.addAttribute("jp_code", codeService.selectRedCodeSub(codeVO));

		// 제품 상세 기본 정보
		model.addAttribute("resultView", redProductService.selectProductView(param));

		model.addAttribute("seq", seq);
		model.addAttribute("type", type);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("search_useyn", search_useyn);
		model.addAttribute("search_site_ck", search_site_ck);
		model.addAttribute("search_name", search_name);

		return NAMESPACE + "red_product_view";
	}

	@RequestMapping(value = "/red_product_modify.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> red_product_modify(@RequestParam Map param, @ModelAttribute RedProductVo redProduct,
			BindingResult bindingResult, Model model, HttpServletRequest request) throws Exception {
		redProductValidate.validate(redProduct, bindingResult);
		ManagerVO admin = (ManagerVO) WebUtils.getSessionAttribute(request, "adminSession");
		if (admin == null || !admin.getAdmintype().equals("111201")) {
			return null;
		}
		CodeVO vo = new CodeVO();
		vo.setMenuCd("101221");
		model.addAttribute("menuCd", "101221");

		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (bindingResult.hasErrors()) {
			List<FieldError> fieldError = bindingResult.getFieldErrors();
			returnMap.put("errors", fieldError);
			return returnMap;
		}
		// 첨부파일1, 물리적인 파일 객체 업로드 save
		if (StringUtils.isNotEmpty(redProduct.getF_file1_txt()) //
				&& redProduct.getF_file1() != null) { //
			String f_file1 = redProductService.saveAttachFile(redProduct.getF_file1());
			redProduct.setF_file1_txt(f_file1);
		}
		redProduct.setRegid(admin.getAdminid());
		redProduct.setModid(admin.getAdminid());
		// 제품 기본 정보 save
		redProductService.mergeProduct(redProduct);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/red_product_delete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> red_product_delete(@RequestParam Map param, @RequestParam String seq)
			throws Exception {
		param.put("seq", seq);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 제품 기본 정보 delete
		redProductService.deleteProduct(param);
		returnMap.put("result", "SUCCESS");
		return returnMap;
	}

	@RequestMapping(value = "/red_update_useyn_product.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> red_update_useyn_product(@RequestParam Map param,
			@RequestParam(value = "checkedSeqArr[]") String[] checkedSeqArr, @RequestParam String useyn)
			throws Exception {
		param.put("checkedSeqArr", checkedSeqArr);
		param.put("useyn", useyn);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 선택 노출, 미노출 update
		redProductService.updateUseYn(param);
		returnMap.put("result", "SUCCESS");

		return returnMap;
	}

	@RequestMapping(value = "/red_product_check.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> red_product_check(@RequestParam Map param, @RequestParam String pcode)
			throws Exception {
		param.put("pcode", pcode);
		Map<String, Object> returnMap = new HashMap<String, Object>();

		// 제품 기본 정보 delete
		int checkCnt = redProductService.duplicateProductCnt(param);
		if (checkCnt > 0) {
			returnMap.put("result", "FAIL");
		} else {
			returnMap.put("result", "SUCCESS");
		}
		return returnMap;
	}
}
