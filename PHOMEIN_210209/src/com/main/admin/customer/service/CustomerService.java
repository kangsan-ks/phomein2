package com.main.admin.customer.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.main.web.brand.cscenter.web.vo.CsCenterVo;

public interface CustomerService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;
	
	int selectPointTotCnt(Map param) throws Exception;

	List<Map> selectPointPaging(Map param) throws Exception;
	
	int selectCouponTotCnt(Map param) throws Exception;

	List<Map> selectCouponPaging(Map param) throws Exception;

	String saveAttachFile(MultipartFile customerFile);

	void mergeCsCenter(CsCenterVo csCenter) throws Exception;

	String nextSeq() throws Exception;

	Map selectCustomerView(Map param) throws Exception;

	void mergeCustomer(Map param) throws Exception;

	void mergeMileage(Map param) throws Exception;

	void mergeCoupon(Map param) throws Exception;

	void updateApplyPoint(Map param) throws Exception;
	
	void updateApplyCoupon(Map param) throws Exception;
	
	List<Map> selectTbPointMerge(Map param) throws Exception ;

}
