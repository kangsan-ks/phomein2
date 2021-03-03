package com.main.cmmn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.cmmn.service.CmmnService;
import com.main.domain.CodeVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cmmnService")
public class CmmnServiceImpl extends EgovAbstractServiceImpl implements CmmnService{

	@Resource(name = "cmmnMapper")
	private CmmnMapper cmmnMapper;

	@Override
	public List<CodeVO> selectCode(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectCode(searchVO);
	}

	@Override
	public List<CodeVO> selectCodeSub(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectCodeSub(searchVO);
	}
	
	@Override
	public CodeVO selectCodeNm(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectCodeNm(searchVO);
	}

	@Override
	public List<CodeVO> selectMenuNmFirst(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectMenuNmFirst(searchVO);
	}

	@Override
	public List<CodeVO> selectMenuNmSub(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectMenuNmSub(searchVO);
	}

	@Override
	public CodeVO selectMenuNm(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectMenuNm(searchVO);
	}

	@Override
	public List<CodeVO> selectPriceList(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectPriceList(searchVO);
	}

	@Override
	public List<CodeVO> selectPriceDetailList(CodeVO searchVO) throws Exception {
		return cmmnMapper.selectPriceDetailList(searchVO);
	}
	


}
