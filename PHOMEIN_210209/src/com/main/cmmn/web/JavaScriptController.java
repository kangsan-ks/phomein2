package com.main.cmmn.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JavaScriptController {
	
	private final Logger logger = Logger.getLogger(this.getClass());	

	@RequestMapping("/cmmn/javascript.do")
	public String javaScript(Model model) {
		return "cmmn/javascript";
	}
}
