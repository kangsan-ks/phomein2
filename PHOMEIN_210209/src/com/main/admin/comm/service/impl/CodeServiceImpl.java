package com.main.admin.comm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.comm.service.CodeService;
import com.main.admin.comm.web.vo.CodeVo;
import com.main.domain.CodeVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {

	@Resource(name = "codeMapper")
	private CodeMapper codeMapper;

	@Override
	public List<CodeVO> selectMenuNmFirst(CodeVO searchVO) throws Exception {

		//System.out.println("::::::::::::::: " + searchVO.getMenuCd());
		return codeMapper.selectMenuNmFirst(searchVO);
	}

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return codeMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return codeMapper.selectPaging(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return codeMapper.nextSeq(param);
	}

	@Override
	public void mergeCode(CodeVo code) throws Exception {
		codeMapper.mergeCode(code);
	}

	@Override
	public void updateSortingCode(Map param) throws Exception {
		codeMapper.updateSortingCode(param);
	}

	@Override
	public void deleteCode(Map param) throws Exception {
		codeMapper.deleteCode(param);
	}

	@Override
	public int selectChildCnt(Map param) throws Exception {
		return codeMapper.selectChildCnt(param);
	}

	@Override
	public int duplicateCode(Map param) throws Exception {
		return codeMapper.duplicateCode(param);
	}

	@Override
	public List<CodeVO> selectCodeSub(CodeVO codeVO) throws Exception {
		return codeMapper.selectCodeSub(codeVO);
	}

	@Override
	public List<CodeVO> selectCodeSubSub(CodeVO codeVO) throws Exception {
		return codeMapper.selectCodeSubSub(codeVO);
	}

	@Override
	public List<CodeVO> selectRedCodeSub(CodeVO codeVO) throws Exception {
		return codeMapper.selectRedCodeSub(codeVO);
	}

	@Override
	public List<CodeVO> selectRedCodeSubSub(CodeVO codeVO) throws Exception {
		return codeMapper.selectRedCodeSubSub(codeVO);
	}

}
