package com.main.admin.menu.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.menu.web.vo.ProductVo;

@Component
public class ProductValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return ProductVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ProductVo product = (ProductVo) target;
		if (StringUtils.isEmpty(product.getUseyn())) {
			errors.rejectValue("useyn", "노출여부를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getName())) {
			errors.rejectValue("name", "제품명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getKr_ck())) {
			errors.rejectValue("kr_ck", "국문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getEn_ck())) {
			errors.rejectValue("en_ck", "영문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getJp_ck())) {
			errors.rejectValue("jp_ck", "일문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getKr_code())) {
			errors.rejectValue("kr_code", "국문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getEn_code())) {
			errors.rejectValue("en_code", "영문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getJp_code())) {
			errors.rejectValue("jp_code", "일문 카테고리를 선택하세요");
		}
		if (StringUtils.isEmpty(product.getKr_name())) {
			errors.rejectValue("kr_name", "국문 제품명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getEn_name())) {
			errors.rejectValue("en_name", "영문 제품명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getJp_name())) {
			errors.rejectValue("jp_name", "일문 제품명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getC_yn())) {
			errors.rejectValue("c_yn", "가격설정을 선택/입력하세요");
		}
		if (StringUtils.isEmpty(product.getKr_menu())) {
			errors.rejectValue("kr_menu", "국문 메뉴설명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getEn_menu())) {
			errors.rejectValue("en_menu", "영문 메뉴설명을 입력하세요");
		}
		if (StringUtils.isEmpty(product.getJp_menu())) {
			errors.rejectValue("jp_menu", "일문 메뉴설명을 입력하세요");
		}
		if (StringUtils.equals("reg", product.getType())) {
			if (StringUtils.isEmpty(product.getPcode())) {
				errors.rejectValue("pcode", "제품코드를 입력하세요");
			}
			if (StringUtils.isEmpty(product.getPcodeYn())) {
				errors.rejectValue("pcodeYn", "중복체크를 해주세요");
			}
		}

		// 첨부 파일 validation 체크 (파일 사이즈, 파일 확장자 check)
		attachFileCheck(product, errors);
	}

	private void attachFileCheck(ProductVo product, Errors errors) {
		// 제품이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(product.getF_file1_txt()) && //
				product.getF_file1() != null) { //
			int pos = product.getF_file1().getOriginalFilename().lastIndexOf(".");
			if (!product.getF_file1().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("f_file1", "파일 형식을 확인하세요");
			}
			if (product.getF_file1().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("f_file1", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(product.getF_file1_txt()) && //
				product.getF_file1() == null) { //
			// notting
		}
		// 필수 여부 validation check
		else {
			errors.rejectValue("f_file1", "제품이미지를 등록하세요");
		}
	}

}