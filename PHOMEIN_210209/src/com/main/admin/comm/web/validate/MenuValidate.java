package com.main.admin.comm.web.validate;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.main.admin.comm.web.vo.MenuVo;

@Component
public class MenuValidate implements Validator {
	@Override
	public boolean supports(Class<?> clazz) {
		return MenuVo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MenuVo menu = (MenuVo) target;
		if (StringUtils.isEmpty(menu.getUseyn())) {
			errors.rejectValue("useyn", "사용여부를 선택하세요");
		}
		if (StringUtils.equals("code", menu.getCode_type())) {
			if (StringUtils.isEmpty(menu.getCode())) {
				errors.rejectValue("code", "상위메뉴코드를 입력하세요");
			}
			if (StringUtils.isEmpty(menu.getCode_name())) {
				errors.rejectValue("code_name", "상위메뉴명을 입력하세요");
			}
			if (menu.getCode().length() != 3) {
				errors.rejectValue("code", "상위메뉴코드는 3자리 입니다");
			}
			if (StringUtils.isEmpty(menu.getLink())) {
				errors.rejectValue("link", "상위메뉴링크를 입력하세요");
			}
		}

		if (StringUtils.equals("sub_code", menu.getCode_type())) {
			if (StringUtils.isEmpty(menu.getSub_code())) {
				errors.rejectValue("sub_code", "하위메뉴코드를 입력하세요");
			}
			if (StringUtils.isEmpty(menu.getSub_code_name())) {
				errors.rejectValue("sub_code_name", "하위메뉴명을 입력하세요");
			}
			if (menu.getSub_code().length() != 6) {
				errors.rejectValue("sub_code", "하위메뉴코드는 6자리 입니다");
			}
			if (StringUtils.isEmpty(menu.getLink())) {
				errors.rejectValue("link", "하위메뉴링크를 입력하세요");
			}
		}
	}

}
