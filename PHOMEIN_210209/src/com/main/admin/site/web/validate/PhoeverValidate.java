package com.main.admin.site.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.site.web.vo.PhoeverVo;

@Component
public class PhoeverValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return PhoeverVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PhoeverVo phoever = (PhoeverVo) target;
		if (StringUtils.isEmpty(phoever.getUseyn())) {
			errors.rejectValue("useyn", "노출여부를 선택하세요");
		}
		if (StringUtils.isEmpty(phoever.getTitle())) {
			errors.rejectValue("title", "제목을 입력하세요");
		}
		if (StringUtils.isEmpty(phoever.getPc_alt())) {
			errors.rejectValue("pc_alt", "PC 대체텍스트를 입력하세요");
		}
		if (StringUtils.isEmpty(phoever.getPc_contents())) {
			errors.rejectValue("pc_contents", "PC 내용을 입력하세요");
		}

		// 첨부 파일 validation 체크 (필수 여부, 파일 사이즈, 파일 확장자 check)
		attachFileCheck(phoever, errors);
	}

	private void attachFileCheck(PhoeverVo phoever, Errors errors) {
		// PC 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(phoever.getPc_img_txt()) && //
				phoever.getPc_img() != null) { //
			int pos = phoever.getPc_img().getOriginalFilename().lastIndexOf(".");
			if (!phoever.getPc_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("pc_img", "파일 형식을 확인하세요");
			}
			if (phoever.getPc_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("pc_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(phoever.getPc_img_txt()) && //
				phoever.getPc_img() == null) { //
			// notting
		}
		// 필수 여부 validation check
		else {
			errors.rejectValue("pc_img", "PC 이미지를 입력하세요");
		}

		// Mobile 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(phoever.getM_img_txt()) && //
				phoever.getM_img() != null) { //
			int pos = phoever.getM_img().getOriginalFilename().lastIndexOf(".");
			if (!phoever.getM_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("m_img", "파일 형식을 확인하세요");
			}
			if (phoever.getM_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("m_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(phoever.getM_img_txt()) && //
				phoever.getM_img() == null) { //
			// notting
		}
	}

}
