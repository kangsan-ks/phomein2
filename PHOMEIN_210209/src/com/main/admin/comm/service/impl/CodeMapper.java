package com.main.admin.comm.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.comm.web.vo.CodeVo;
import com.main.domain.CodeVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("codeMapper")
public interface CodeMapper {
	
	List<CodeVO> selectMenuNmFirst(CodeVO searchVO) throws Exception;

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void mergeCode(CodeVo code) throws Exception;

	void updateSortingCode(Map param) throws Exception;

	void deleteCode(Map param) throws Exception;

	int selectChildCnt(Map param) throws Exception;

	int duplicateCode(Map param) throws Exception;

	List<CodeVO> selectCodeSub(CodeVO codeVO) throws Exception;

	List<CodeVO> selectCodeSubSub(CodeVO codeVO) throws Exception;

	List<CodeVO> selectRedCodeSub(CodeVO codeVO) throws Exception;

	List<CodeVO> selectRedCodeSubSub(CodeVO codeVO) throws Exception;

}
