package com.main.admin.intranet.service;

import java.util.List;
import java.util.Map;

public interface IntranetBoardService {

	
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	Map selectInView(Map param) throws Exception;
	
	int insert(Map param) throws Exception;
	
	int update(Map param) throws Exception;

	int updatecnt(Map param) throws Exception;
	
	int updateuseyn(Map param) throws Exception;
	
	int delete(Map param) throws Exception;
	
	List<Map> selectTopList(Map param) throws Exception;
	
	int updateUseYns(Map param) throws Exception;
	
	
}
