package com.main.admin.site.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.web.vo.InterviewVo;

public interface InterviewService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String saveAttachFile(MultipartFile siteFile);
	
	Map selectInterviewView(Map param) throws Exception;

	void mergeInterview(InterviewVo interview) throws Exception;

	void deleteInterview(Map param) throws Exception;
	
	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

}
