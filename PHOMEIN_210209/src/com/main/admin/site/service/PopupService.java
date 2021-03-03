package com.main.admin.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.web.vo.PopupVo;

public interface PopupService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String saveAttachFile(MultipartFile popupFile);
	
	Map selectPopupView(Map param) throws Exception;

	void mergePopup(PopupVo popup) throws Exception;

	void deletePopup(Map param) throws Exception;
	
	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

	List<Map> showPopup(Map param) throws Exception;

}
