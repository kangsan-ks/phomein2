package com.main.admin.menu.service.impl;

import java.util.List;
import java.util.Map;

import com.main.admin.menu.web.vo.ProductVo;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("productMapper")
public interface ProductMapper {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	Map selectProductView(Map param) throws Exception;

	void mergeProduct(ProductVo product) throws Exception;
	
	void deleteProduct(Map param) throws Exception;

	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

	int duplicateProductCnt(Map param) throws Exception;

	List<Map> selectMenuList(Map param) throws Exception;
	
	List<Map> selectCodeList(Map param) throws Exception;

}
