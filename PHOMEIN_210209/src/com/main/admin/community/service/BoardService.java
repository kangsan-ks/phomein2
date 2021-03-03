package com.main.admin.community.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	List<Map> selectNoticePaging(Map param) throws Exception;
	
	Map selectCommunityOne(Map param) throws Exception;
	
	int delete(Map param) throws Exception;
	
	int updateComuunityBoard(Map param) throws Exception;
	
	int insertComuunityBoard(Map param) throws Exception;
	
	Map selectPreOne(Map param) throws Exception;
	
	Map selectNextOne(Map param) throws Exception;
	
	int updateUseYn(Map param) throws Exception;
	
}
