package com.main.admin.store.service;

import java.util.List;
import java.util.Map;

public interface StoreService {

	
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	List<Map> selectPaging2(Map param) throws Exception;
	
	Map selectView(Map param) throws Exception;
	
	int insert(Map param) throws Exception;
	
	int update(Map param) throws Exception;
	
	int delete(Map param) throws Exception;
	
	List<Map> selectInfo(Map param) throws Exception;
	
	int insertinfo(Map param) throws Exception;
	
	int updateinfo(Map param) throws Exception;
	
	List<Map> selectoption(Map param) throws Exception;
	
	int insertoption(Map param) throws Exception;
	
	int updateoption(Map param) throws Exception;
	
	int updateUseYn(Map param) throws Exception;
	
	List<Map> selectExcel(Map param) throws Exception;
}
