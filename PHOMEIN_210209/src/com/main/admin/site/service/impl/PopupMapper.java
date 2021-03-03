package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.site.web.vo.PopupVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("popupMapper")
public interface PopupMapper {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	Map selectPopupView(Map param) throws Exception;

	void mergePopup(PopupVo popup) throws Exception;
	
	void deletePopup(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

	List<Map> showPopup(Map param) throws Exception;

}
