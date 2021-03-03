package com.main.admin.customer.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.customer.service.CustomerService;
import com.main.cmmn.util.WebFileUtil;
import com.main.uploadfile.service.UploadFileVO;
import com.main.web.brand.cscenter.web.vo.CsCenterVo;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("customerService")
public class CustomerServiceImpl extends EgovAbstractServiceImpl implements CustomerService {

	private final static String UPLOAD_PATH = "customer/";

	@Resource(name = "customerMapper")
	private CustomerMapper customerMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return customerMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return customerMapper.selectPaging(param);
	}
	
	@Override
	public int selectPointTotCnt(Map param) throws Exception {
		return customerMapper.selectPointTotCnt(param);
	}

	@Override
	public List<Map> selectPointPaging(Map param) throws Exception {
		return customerMapper.selectPointPaging(param);
	}
	
	@Override
	public int selectCouponTotCnt(Map param) throws Exception {
		return customerMapper.selectCouponTotCnt(param);
	}

	@Override
	public List<Map> selectCouponPaging(Map param) throws Exception {
		return customerMapper.selectCouponPaging(param);
	}

	@Override
	public String saveAttachFile(MultipartFile customerFile) {
		UploadFileVO uploadfileVO = WebFileUtil.upload(customerFile, UPLOAD_PATH);
		return uploadfileVO.getUrl();
	}

	@Override
	public void mergeCsCenter(CsCenterVo csCenter) throws Exception {
		customerMapper.mergeCsCenter(csCenter);
	}

	@Override
	public String nextSeq() throws Exception {
		return customerMapper.nextSeq();
	}

	@Override
	public Map selectCustomerView(Map param) throws Exception {
		return customerMapper.selectCustomerView(param);
	}

	@Override
	public void mergeCustomer(Map param) throws Exception {
		customerMapper.mergeCustomer(param);
	}
	
	@Override
	public void mergeMileage(Map param) throws Exception {
		customerMapper.mergeMileage(param);
	}

	@Override
	public void mergeCoupon(Map param) throws Exception {
		customerMapper.mergeCoupon(param);
	}

	@Override
	public void updateApplyPoint(Map param) throws Exception {
		customerMapper.updateApplyPoint(param);
	}
	
	@Override
	public void updateApplyCoupon(Map param) throws Exception {
		customerMapper.updateApplyCoupon(param);
	}
	
	@Override
	public List<Map> selectTbPointMerge(Map param) throws Exception {
		return customerMapper.selectTbPointMerge(param);
	}

}
