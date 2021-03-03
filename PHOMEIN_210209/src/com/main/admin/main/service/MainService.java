package com.main.admin.main.service;

import com.main.admin.main.vo.MainFieldVO;
import com.main.domain.ManagerVO;

public interface MainService {

	ManagerVO selectLogin(String fId, String encodeFPw, String adminType) throws Exception;
	
	int lastLogin(ManagerVO vo) throws Exception;

	String renewMainField(MainFieldVO mainFieldVO) throws Exception;
	MainFieldVO selectMainFieldDetail() throws Exception;
}
