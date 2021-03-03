package com.main.web.brand.cscenter.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.web.brand.cscenter.web.vo.CsCenterVo;

@Component
public class CsCenterValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return CsCenterVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CsCenterVo csCenter = (CsCenterVo) target;
		if (StringUtils.isEmpty(csCenter.getCate())) {
			errors.rejectValue("cate", "문의구분을 선택하세요");
		}
		if (StringUtils.equals("store", csCenter.getCate())) {
			if (StringUtils.isEmpty(csCenter.getVisitstore())) {
				errors.rejectValue("visitstore", "방문매장을 선택하세요");
			}
			if (StringUtils.isEmpty(csCenter.getVisitdatestr())) {
				errors.rejectValue("visitdatestr", "방문일을 선택하세요");
			}
		}
		if (StringUtils.isEmpty(csCenter.getTitle())) {
			errors.rejectValue("title", "제목을 입력하세요");
		}
		if (StringUtils.isEmpty(csCenter.getConts())) {
			errors.rejectValue("conts", "내용을 입력하세요");
		}
		if (StringUtils.isEmpty(csCenter.getName())) {
			errors.rejectValue("name", "이름을 입력하세요");
		}
		if (StringUtils.isEmpty(csCenter.getHp())) {
			errors.rejectValue("hp1", "연락처를 입력하세요");
		}
		if (StringUtils.isNotEmpty(csCenter.getHp())) {
			// 정규식 -전화번호 유효성 검사
			String regPhone = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$";

			if (!csCenter.getHp().matches(regPhone)) {
				errors.rejectValue("hp1", "연락처 형식이 맞지 않습니다");
			}
		}
		if (StringUtils.isEmpty(csCenter.getEmail())) {
			errors.rejectValue("email1", "이메일을 입력하세요");
		}
		if (StringUtils.isNotEmpty(csCenter.getEmail())) {
			// 정규식 -이메일 유효성 검사
			String regEmail = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";

			if (!csCenter.getEmail().matches(regEmail)) {
				errors.rejectValue("email1", "이메일 형식이 맞지 않습니다");
			}
		}
		if (StringUtils.isEmpty(csCenter.getFeed_kind())) {
			errors.rejectValue("feed_kind", "회신방법을 선택하세요");
		}

		// 첨부 파일 validation 체크 (필수 여부, 파일 사이즈, 파일 확장자 check)
		attachFileCheck(csCenter, errors);
	}

	private void attachFileCheck(CsCenterVo csCenter, Errors errors) {
		// 첨부파일
		// 파일 확장자, 파일 사이즈 validation check
		if (StringUtils.isNotEmpty(csCenter.getF_file1_txt()) && //
				csCenter.getF_file1() != null) { //
			int pos = csCenter.getF_file1().getOriginalFilename().lastIndexOf(".");
			if (!csCenter.getF_file1().getOriginalFilename().substring(pos + 1)
					.matches("png|jpg|jpeg|gif|hwp|txt|ppt|pptx|doc|docx|xls|pdf|zip")) {
				errors.rejectValue("f_file1", "파일 형식을 확인하세요");
			}
			if (csCenter.getF_file1().getSize() > 1024 * 1024 * 5) {
				errors.rejectValue("f_file1", "파일 용량을 확인하세요");
			}
		}
	}

}
