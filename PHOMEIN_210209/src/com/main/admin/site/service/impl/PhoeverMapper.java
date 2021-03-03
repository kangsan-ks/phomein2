package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.site.web.vo.PhoeverVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("phoeverMapper")
public interface PhoeverMapper {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	Map selectPhoeverView(Map param) throws Exception;

	void mergePhoever(PhoeverVo phoever) throws Exception;
	
	void deletePhoever(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

}
