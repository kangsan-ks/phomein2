package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.site.web.vo.InterviewVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("interviewMapper")
public interface InterviewMapper {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	Map selectInterviewView(Map param) throws Exception;

	void mergeInterview(InterviewVo interview) throws Exception;
	
	void deleteInterview(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

}
