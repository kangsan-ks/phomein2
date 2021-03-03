package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.site.service.ManagerService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("managerService")
public class ManagerServiceImpl extends EgovAbstractServiceImpl implements ManagerService {

	@Resource(name = "managerMapper")
	private ManagerMapper managerMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return managerMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return managerMapper.selectPaging(param);
	}

	@Override
	public Map selectView(Map param) throws Exception {
		return managerMapper.selectView(param);
	}

	@Override
	public int insert(Map param) throws Exception {
		return managerMapper.insert(param);
	}

	@Override
	public int update(Map param) throws Exception {
		return managerMapper.update(param);
	}

	@Override
	public int delete(Map param) throws Exception {
		return managerMapper.delete(param);
	}

	@Override
	public int managerPW(Map param) throws Exception {
		return managerMapper.managerPW(param);
	}

	@Override
	public int selectDup(Map param) throws Exception {
		return managerMapper.selectDup(param);
	}

	@Override
	public int updateUseYn(Map param) throws Exception {
		return managerMapper.updateUseYn(param);
	}

	@Override
	public Map selectViewById(Map param) throws Exception {
		return managerMapper.selectViewById(param);
	}
	
	
	
	
}
