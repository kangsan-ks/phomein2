package com.main.admin.site.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.site.web.vo.PopupVo;

@Component
public class PopupValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return PopupVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		PopupVo popup = (PopupVo) target;
		if (StringUtils.isEmpty(popup.getUseyn())) {
			errors.rejectValue("useyn", "공개여부를 선택하세요");
		}
		if (StringUtils.isEmpty(popup.getCate())) {
			errors.rejectValue("cate", "노출여부를 선택하세요");
		}
		if (StringUtils.isEmpty(popup.getTitle())) {
			errors.rejectValue("title", "제목을 입력하세요");
		}
		if (StringUtils.isEmpty(popup.getStartdtstr())) {
			errors.rejectValue("startdt", "시작일을 설정하세요");
		}
		if (StringUtils.isEmpty(popup.getEnddtstr())) {
			errors.rejectValue("enddt", "종료일을 설정하세요");
		}
		if (StringUtils.isEmpty(popup.getViewtop())) {
			errors.rejectValue("viewtop", "TOP 위치를 입력하세요");
		}
		if (StringUtils.isEmpty(popup.getViewleft())) {
			errors.rejectValue("viewleft", "LEFT 위치를 입력하세요");
		}
		if (StringUtils.isEmpty(popup.getPopupsizew())) {
			errors.rejectValue("popupsizew", "WIDTH 를 입력하세요");
		}
		if (StringUtils.isEmpty(popup.getPopupsizeh())) {
			errors.rejectValue("popupsizeh", "HEIGHT 를 입력하세요");
		}
		if (StringUtils.isEmpty(popup.getPc_alt())) {
			errors.rejectValue("pc_alt", "PC 대체텍스트를 입력하세요");
		}

		// 첨부 파일 validation 체크 (필수 여부, 파일 사이즈, 파일 확장자 check)
		attachFileCheck(popup, errors);
	}

	private void attachFileCheck(PopupVo popup, Errors errors) {
		// PC 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(popup.getPc_img_txt()) && //
				popup.getPc_img() != null) { //
			int pos = popup.getPc_img().getOriginalFilename().lastIndexOf(".");
			if (!popup.getPc_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("pc_img", "파일 형식을 확인하세요");
			}
			if (popup.getPc_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("pc_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(popup.getPc_img_txt()) && //
				popup.getPc_img() == null) { //
			// notting
		}
		// 필수 여부 validation check
		else {
			errors.rejectValue("pc_img", "PC 이미지를 등록하세요");
		}

		// Mobile 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(popup.getM_img_txt()) && //
				popup.getM_img() != null) { //
			int pos = popup.getM_img().getOriginalFilename().lastIndexOf(".");
			if (!popup.getM_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("m_img", "파일 형식을 확인하세요");
			}
			if (popup.getM_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("m_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(popup.getM_img_txt()) && //
				popup.getM_img() == null) { //
			// notting
		}
	}

}
