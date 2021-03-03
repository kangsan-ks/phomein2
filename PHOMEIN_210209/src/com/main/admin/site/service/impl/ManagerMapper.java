package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("managerMapper")
public interface ManagerMapper {

	
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	Map selectView(Map param) throws Exception;
	Map selectViewById(Map param) throws Exception;
	
	int insert(Map param) throws Exception;
	
	int update(Map param) throws Exception;
	
	int delete(Map param) throws Exception;
	
	int managerPW(Map param) throws Exception;
	
	int selectDup(Map param) throws Exception;
	
	int updateUseYn(Map param) throws Exception;
}
