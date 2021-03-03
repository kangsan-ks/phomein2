package com.main.admin.comm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.comm.service.MenuService;
import com.main.admin.comm.web.vo.MenuVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("menuService")
public class MenuServiceImpl extends EgovAbstractServiceImpl implements MenuService {

	@Resource(name = "menuMapper")
	private MenuMapper menuMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return menuMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return menuMapper.selectPaging(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return menuMapper.nextSeq(param);
	}

	@Override
	public void mergeMenu(MenuVo menu) throws Exception {
		menuMapper.mergeMenu(menu);
	}

	@Override
	public void updateSortingMenu(Map param) throws Exception {
		menuMapper.updateSortingMenu(param);
	}

	@Override
	public void deleteMenu(Map param) throws Exception {
		menuMapper.deleteMenu(param);
	}

	@Override
	public int selectChildCnt(Map param) throws Exception {
		return menuMapper.selectChildCnt(param);
	}

	@Override
	public int duplicateMenu(Map param) throws Exception {
		return menuMapper.duplicateMenu(param);
	}

}
