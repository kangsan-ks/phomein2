package com.main.admin.site.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.site.web.vo.InterviewVo;

@Component
public class InterviewValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return InterviewVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		InterviewVo interview = (InterviewVo) target;
		if (StringUtils.isEmpty(interview.getUseyn())) {
			errors.rejectValue("useyn", "노출여부를 선택하세요");
		}
		if (StringUtils.isEmpty(interview.getStore())) {
			errors.rejectValue("store", "매장명을 입력하세요");
		}
		if (StringUtils.isEmpty(interview.getTitle())) {
			errors.rejectValue("title", "점주명을 입력하세요");
		}
		if (StringUtils.isEmpty(interview.getPc_alt())) {
			errors.rejectValue("pc_alt", "PC 대체텍스트를 입력하세요");
		}
		if (StringUtils.isEmpty(interview.getPc_contents())) {
			errors.rejectValue("pc_contents", "PC 내용을 입력하세요");
		}

		// 첨부 파일 validation 체크 (필수 여부, 파일 사이즈, 파일 확장자 check)
		attachFileCheck(interview, errors);
	}

	private void attachFileCheck(InterviewVo interview, Errors errors) {
		// 메인 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(interview.getMain_img_txt()) && //
				interview.getMain_img() != null) { //
			int pos = interview.getMain_img().getOriginalFilename().lastIndexOf(".");
			if (!interview.getMain_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("main_img", "파일 형식을 확인하세요");
			}
			if (interview.getMain_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("main_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(interview.getMain_img_txt()) && //
				interview.getMain_img() == null) { //
			// notting
		}
		// 필수 여부 validation check
		else {
			errors.rejectValue("main_img", "메인 이미지를 입력하세요");
		}

		// PC 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(interview.getPc_img_txt()) && //
				interview.getPc_img() != null) { //
			int pos = interview.getPc_img().getOriginalFilename().lastIndexOf(".");
			if (!interview.getPc_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("pc_img", "파일 형식을 확인하세요");
			}
			if (interview.getPc_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("pc_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(interview.getPc_img_txt()) && //
				interview.getPc_img() == null) { //
			// notting
		}
		// 필수 여부 validation check
		else {
			errors.rejectValue("pc_img", "PC 이미지를 입력하세요");
		}

		// Mobile 이미지
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(interview.getM_img_txt()) && //
				interview.getM_img() != null) { //
			int pos = interview.getM_img().getOriginalFilename().lastIndexOf(".");
			if (!interview.getM_img().getOriginalFilename().substring(pos + 1).matches("png|jpeg|jpg|gif")) {
				errors.rejectValue("m_img", "파일 형식을 확인하세요");
			}
			if (interview.getM_img().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("m_img", "파일 용량을 확인하세요");
			}
		}
		// 파일 수정 없이 save 할 경우는 validation pass
		else if (StringUtils.isNotEmpty(interview.getM_img_txt()) && //
				interview.getM_img() == null) { //
			// notting
		}
	}

}
