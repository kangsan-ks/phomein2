package com.main.admin.store.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.store.service.StoreService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("storeService")
public class StoreServiceImpl extends EgovAbstractServiceImpl implements StoreService {

	@Resource(name = "storeMapper")
	private StoreMapper storeMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return storeMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return storeMapper.selectPaging(param);
	}

	@Override
	public List<Map> selectPaging2(Map param) throws Exception {
		return storeMapper.selectPaging2(param);
	}
	
	@Override
	public Map selectView(Map param) throws Exception {
		return storeMapper.selectView(param);
	}

	@Override
	public int insert(Map param) throws Exception {
		
		int useq = 0;
		storeMapper.insert(param);
		useq = Integer.parseInt( param.get("seq").toString() );
		param.put("useq", useq);
		
		
		
		return 0;
	}

	@Override
	public int update(Map param) throws Exception {
		return storeMapper.update(param);
	}

	@Override
	public int delete(Map param) throws Exception {
		return storeMapper.delete(param);
	}

	@Override
	public List<Map> selectInfo(Map param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertinfo(Map param) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateinfo(Map param) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> selectoption(Map param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertoption(Map param) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateoption(Map param) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateUseYn(Map param) throws Exception {
		return storeMapper.updateUseYn(param);
	}

	@Override
	public List<Map> selectExcel(Map param) throws Exception {
		return storeMapper.selectExcel(param);
	}
	
	
	
	
}
