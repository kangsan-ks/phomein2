package com.main.admin.community.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.community.service.BoardService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService {
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return boardMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return boardMapper.selectPaging(param);
	}
	
	@Override
	public List<Map> selectNoticePaging(Map param) throws Exception {
		return boardMapper.selectNoticePaging(param);
	}
	
	@Override
	public int delete(Map param) throws Exception {
		return boardMapper.delete(param);
	}
	
	@Override
	public int insertComuunityBoard(Map param) throws Exception {
		return boardMapper.insertComuunityBoard(param);
	}

	@Override
	public int updateComuunityBoard(Map param) throws Exception {
		return boardMapper.updateComuunityBoard(param);
	}
	
	@Override
	public Map selectCommunityOne(Map param) throws Exception {
		return boardMapper.selectCommunityOne(param);
	}
	
	@Override
	public Map selectPreOne(Map param) throws Exception {
		return boardMapper.selectPreOne(param);
	}
	
	@Override
	public Map selectNextOne(Map param) throws Exception {
		return boardMapper.selectNextOne(param);
	}

	@Override
	public int updateUseYn(Map param) throws Exception {
		return boardMapper.updateUseYn(param);
	}

}
