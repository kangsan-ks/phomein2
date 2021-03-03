package com.main.uploadfile.web;

import java.net.URLDecoder;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.main.cmmn.util.WebFileUtil;
import com.main.cmmn.vo.S3UploadResult;
import com.main.cmmn.web.GOdukAbstractController;
import com.main.uploadfile.service.UploadFileService;
import com.main.uploadfile.service.UploadFileVO;

@Controller
@RequestMapping("/uploadfile/*")
public class UploadFileController extends GOdukAbstractController {

	@Resource(name = "uploadFileService")
	private UploadFileService uploadFileService;

	private final static String UPLOAD_PATH = "editor/";

	String resultcode = "";
	String resultmessage = "";
	ExceptionHandler handler = null;

	@Autowired(required = false)
	private WebFileUtil webFileUtil;

	public UploadFileController() {
		super();
	}

	/**
	 * 에디터 파입 업로더
	 * @param searchVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "fileUploader.do", method = RequestMethod.POST)
	public String fileUploader(@RequestParam(value = "Filedata", required = false) MultipartFile image,
			@RequestParam("callback_func") String callbackFunc,
			@RequestParam("callback") String callback,HttpSession session, ModelMap model, HttpServletRequest request) throws Exception {
		
		if (image != null && !image.isEmpty()) {
			// 아이디를 가져온다.
			UploadFileVO uploadFileVO = webFileUtil.upload(image, UPLOAD_PATH);
			return "redirect:/editor/photo_uploader/popup/callback.html?bNewLine=true&sFileName="+ URLDecoder.decode(uploadFileVO.getFileNm())
					+"&sFileURL="+ URLDecoder.decode(uploadFileVO.getUrl())+"&callback_func="+callbackFunc;
		}
		return "redirect:"+callback;
	}

	/**
	 * 에디터 파입 업로더
	 * 
	 * @param searchVO
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "fileUploader2.do", method = RequestMethod.POST)
	@ResponseBody
	public String fileUploader2(
			@RequestParam(value = "Filedata", required = false) MultipartFile image,
			HttpSession session, ModelMap model, HttpServletRequest request)
			throws Exception {

		if (image != null && !image.isEmpty()) {

			if (webFileUtil.fileCheck(image)) {
				S3UploadResult result = FileUploader.uploadBoardImage(
						UPLOAD_PATH, image);

				if (result.getFileName() != null) {
					return URLDecoder.decode(result.getFilePath());
				} else {
					return "F";
				}
			} else {
				return "F";
			}
		}
		return "F";
	}

}