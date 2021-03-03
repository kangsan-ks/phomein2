package com.main.cmmn.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.transaction.annotation.Transactional;

import com.main.cmmn.util.JavaScript;


@Transactional(value="transactionManager")
public abstract class GOdukAbstractController {

	@Autowired
	protected MessageSource resourceBundleMessageSource;
	
	@Autowired
	private HttpServletRequest request;
	
	public static final String ADMIN_URI = "/admin";
	
	
	public String goPage(String page) {
		JavaScript javaScript = new JavaScript();
		javaScript.location(page);
		return goScript(javaScript);
	}
	
	public String goPage(String page, String message) {
		JavaScript javaScript = new JavaScript();
		javaScript.location(page);
		javaScript.message(message);
		return goScript(javaScript);
	}
	
	public String goBack(String message) {
		JavaScript javaScript = new JavaScript();
		javaScript.script("window.history.back()");
		javaScript.message(message);
		return goScript(javaScript);
	}
	
	
	public String goScript(JavaScript javaScript) {
		request.setAttribute("javaScript", javaScript);
		return "forward:/cmmn/javascript.do";
	}
	
	
}
