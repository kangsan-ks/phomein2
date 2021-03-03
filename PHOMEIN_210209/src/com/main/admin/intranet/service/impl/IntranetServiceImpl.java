package com.main.admin.intranet.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.intranet.service.IntranetBoardService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("intranetService")
public class IntranetServiceImpl extends EgovAbstractServiceImpl implements IntranetBoardService {

	@Resource(name = "intranetMapper")
	private IntranetMapper intranetMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return intranetMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return intranetMapper.selectPaging(param);
	}

	@Override
	public Map selectInView(Map param) throws Exception {
		return intranetMapper.selectInView(param);
	}

	@Override
	public int insert(Map param) throws Exception {
		return intranetMapper.insert(param);
	}

	@Override
	public int update(Map param) throws Exception {
		return intranetMapper.update(param);
	}

	@Override
	public int updatecnt(Map param) throws Exception {
		return intranetMapper.updatecnt(param);
	}

	@Override
	public int updateuseyn(Map param) throws Exception {
		return intranetMapper.updateuseyn(param);
	}

	@Override
	public int delete(Map param) throws Exception {
		return intranetMapper.delete(param);
	}

	@Override
	public List<Map> selectTopList(Map param) throws Exception {
		return intranetMapper.selectTopList(param);
	}

	@Override
	public int updateUseYns(Map param) throws Exception {
		return intranetMapper.updateUseYns(param);
	}
	
	
	
}
