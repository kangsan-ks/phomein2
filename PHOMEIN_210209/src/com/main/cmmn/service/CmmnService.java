package com.main.cmmn.service;


import java.util.List;

import com.main.domain.CodeVO;

public interface CmmnService {

	List<CodeVO> selectCode(CodeVO searchVO) throws Exception;

	List<CodeVO> selectCodeSub(CodeVO searchVO) throws Exception;
	
	CodeVO selectCodeNm(CodeVO searchVO) throws Exception;

	
	List<CodeVO> selectMenuNmFirst(CodeVO searchVO) throws Exception;

	List<CodeVO> selectMenuNmSub(CodeVO searchVO) throws Exception;
	
	CodeVO selectMenuNm(CodeVO searchVO) throws Exception;
	
	
	
	List<CodeVO> selectPriceList(CodeVO searchVO) throws Exception;

	List<CodeVO> selectPriceDetailList(CodeVO searchVO) throws Exception;
	
}
