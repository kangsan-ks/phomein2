package com.main.admin.comm.service;

import java.util.List;
import java.util.Map;

import com.main.admin.comm.web.vo.MenuVo;

public interface MenuService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void mergeMenu(MenuVo menu) throws Exception;

	void updateSortingMenu(Map param) throws Exception;

	void deleteMenu(Map param) throws Exception;

	int selectChildCnt(Map param) throws Exception;

	int duplicateMenu(Map param) throws Exception;

}
