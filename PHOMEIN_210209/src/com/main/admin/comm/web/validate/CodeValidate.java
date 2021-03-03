package com.main.admin.comm.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.comm.web.vo.CodeVo;

@Component
public class CodeValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return CodeVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		CodeVo code = (CodeVo) target;
		if (StringUtils.isEmpty(code.getUseyn())) {
			errors.rejectValue("useyn", "사용여부를 선택하세요");
		}
		if (StringUtils.equals("code", code.getCode_type())) {
			if (StringUtils.isEmpty(code.getCode())) {
				errors.rejectValue("code", "대분류코드를 입력하세요");
			}
			if (StringUtils.isEmpty(code.getCode_name())) {
				errors.rejectValue("code_name", "대분류명을 입력하세요");
			}
			if(code.getCode().length() != 3) {
				errors.rejectValue("code", "대분류코드는 3자리 입니다");
			}
		}

		if (StringUtils.equals("sub_code", code.getCode_type())) {
			if (StringUtils.isEmpty(code.getSub_code())) {
				errors.rejectValue("sub_code", "중분류코드를 입력하세요");
			}
			if (StringUtils.isEmpty(code.getSub_code_name())) {
				errors.rejectValue("sub_code_name", "중분류명을 입력하세요");
			}
			if(code.getSub_code().length() != 6) {
				errors.rejectValue("sub_code", "중분류코드는 6자리 입니다");
			}
		}

		if (StringUtils.equals("sub_sub_code", code.getCode_type())) {
			if (StringUtils.isEmpty(code.getSub_sub_code())) {
				errors.rejectValue("sub_sub_code", "소분류코드를 입력하세요");
			}
			if (StringUtils.isEmpty(code.getSub_sub_code_name())) {
				errors.rejectValue("sub_sub_code_name", "소분류명을 입력하세요");
			}
			if(code.getSub_sub_code().length() != 9) {
				errors.rejectValue("sub_sub_code", "소분류코드는 9자리 입니다");
			}
		}
	}

}
