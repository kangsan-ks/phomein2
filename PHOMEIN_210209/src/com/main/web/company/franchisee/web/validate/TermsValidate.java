package com.main.web.company.franchisee.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.web.brand.cscenter.web.vo.CsCenterVo;

@Component
public class TermsValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return CsCenterVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CsCenterVo csCenter = (CsCenterVo) target;
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
			
			if(!csCenter.getHp().matches(regPhone)) {
				errors.rejectValue("hp1", "연락처 형식이 맞지 않습니다");
			}
		}
		if (StringUtils.isEmpty(csCenter.getEmail())) {
			errors.rejectValue("email", "이메일을 입력하세요");
		}
		if (StringUtils.isNotEmpty(csCenter.getEmail())) {
			// 정규식 -이메일 유효성 검사
			String regEmail = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
			
			if(!csCenter.getEmail().matches(regEmail)) {
				errors.rejectValue("email", "이메일 형식이 맞지 않습니다");
			}
		}
	}

}
