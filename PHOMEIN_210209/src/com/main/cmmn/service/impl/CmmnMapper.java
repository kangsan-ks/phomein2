package com.main.cmmn.service.impl;

import java.util.List;

import com.main.domain.CodeVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("cmmnMapper")
public interface CmmnMapper {

	List<CodeVO> selectCode(CodeVO searchVO) throws Exception;

	List<CodeVO> selectCodeSub(CodeVO searchVO) throws Exception;
	
	CodeVO selectCodeNm(CodeVO searchVO) throws Exception;
	
	
	List<CodeVO> selectMenuNmFirst(CodeVO searchVO) throws Exception;

	List<CodeVO> selectMenuNmSub(CodeVO searchVO) throws Exception;
	
	CodeVO selectMenuNm(CodeVO searchVO) throws Exception;
	
	
	List<CodeVO> selectPriceList(CodeVO searchVO) throws Exception;
	
	List<CodeVO> selectPriceDetailList(CodeVO searchVO) throws Exception;
}
