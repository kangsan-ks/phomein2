package com.main.cmmn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.main.cmmn.util.WebFileUtil;

@Controller
@RequestMapping("/*")
public class CommonController {

	
	@Autowired
	private WebFileUtil webFileUtil;

	
	
	/**
	 * 파일 다운로드 
	 * @param vo
	 * @param session
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/download.do", method = RequestMethod.GET)
	public void download(@RequestParam(value = "path") String path,
			@RequestParam(value = "fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws Exception {
		webFileUtil.downloadFile(request, response, path, fileName);
	}
	
	
	@RequestMapping(value = "*/imageView.do", method = RequestMethod.GET)
	public String imageView(@RequestParam(value = "imageSrc") String imageSrc, HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		model.put("imageSrc", imageSrc);
		return "imageView";
	}	
}
