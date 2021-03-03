package com.main.admin.customer.service.impl;

import java.util.List;
import java.util.Map;

import com.main.web.brand.cscenter.web.vo.CsCenterVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("customerMapper")
public interface CustomerMapper {
	
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	int selectPointTotCnt(Map param) throws Exception;
	
	List<Map> selectPointPaging(Map param) throws Exception;
	
	int selectCouponTotCnt(Map param) throws Exception;
	
	List<Map> selectCouponPaging(Map param) throws Exception;

	void mergeCsCenter(CsCenterVo csCenter) throws Exception;

	String nextSeq() throws Exception;

	Map selectCustomerView(Map param) throws Exception;

	void mergeCustomer(Map param) throws Exception;
	
	void mergeMileage(Map param) throws Exception;
	
	void mergeCoupon(Map param) throws Exception;

	void updateApplyPoint(Map param)  throws Exception;
	
	void updateApplyCoupon(Map param)  throws Exception;
	
	List<Map> selectTbPointMerge(Map param) throws Exception;
	
}
