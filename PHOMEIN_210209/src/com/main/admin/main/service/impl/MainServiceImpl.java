package com.main.admin.main.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.main.admin.main.service.MainService;
import com.main.admin.main.vo.MainFieldVO;
import com.main.cmmn.util.CommonUtil;
import com.main.domain.ManagerVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService{

	@Resource(name="mainMapper")
	private MainMapper mainMapper;

	@Override
	public ManagerVO selectLogin(String fId, String encodeFPw, String adminType) throws Exception {
		
		ManagerVO vo = new ManagerVO();
		vo.setAdminid(fId);
		vo.setAdminpw(encodeFPw);
		vo.setAdmintype(adminType);
		ManagerVO vo2 = mainMapper.selectLogin(vo);
		Map logmap = new HashMap();
		if(vo2 == null || StringUtils.isEmpty(vo2.getAdminid()) ){
			logmap.put("id", fId);
			logmap.put("suc_yn", "F");
			return null;
		}else{
			logmap.put("id", vo2.getAdminid());
			logmap.put("suc_yn", "S");
			
			mainMapper.lastLogin(vo2);
		}
		return vo2;
	}

	@Override
	public int lastLogin(ManagerVO vo) throws Exception {
		return mainMapper.lastLogin(vo);
	}

	@Override
	public String renewMainField(MainFieldVO mainFieldVO) throws Exception {
		int resultVal = mainMapper.updateMainField(mainFieldVO);
		if (resultVal > 0) {
			return "0002";
		}
		return "0052";
	}

	@Override
	public MainFieldVO selectMainFieldDetail() throws Exception {
		return mainMapper.selectMainFieldDetail();
	}
	
	
	
}
