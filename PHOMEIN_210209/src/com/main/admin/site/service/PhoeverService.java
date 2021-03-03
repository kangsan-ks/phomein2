package com.main.admin.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.web.vo.PhoeverVo;

public interface PhoeverService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String saveAttachFile(MultipartFile phoeverFile);
	
	Map selectPhoeverView(Map param) throws Exception;

	void mergePhoever(PhoeverVo phoever) throws Exception;

	void deletePhoever(Map param) throws Exception;
	
	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

}
