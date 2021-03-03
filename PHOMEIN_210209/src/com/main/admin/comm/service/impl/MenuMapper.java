package com.main.admin.comm.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.comm.web.vo.MenuVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("menuMapper")
public interface MenuMapper {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void mergeMenu(MenuVo menu) throws Exception;

	void updateSortingMenu(Map param) throws Exception;

	void deleteMenu(Map param) throws Exception;

	int selectChildCnt(Map param) throws Exception;

	int duplicateMenu(Map param) throws Exception;

}
