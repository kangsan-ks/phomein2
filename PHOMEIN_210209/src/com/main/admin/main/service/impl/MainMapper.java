package com.main.admin.main.service.impl;

import com.main.admin.main.vo.MainFieldVO;
import com.main.domain.ManagerVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("mainMapper")
public interface MainMapper {
	
	ManagerVO selectLogin(ManagerVO vo) throws Exception;
	
	int lastLogin(ManagerVO vo) throws Exception;

	int updateMainField(MainFieldVO mainFieldVO) throws Exception;
	MainFieldVO selectMainFieldDetail() throws Exception;
}
