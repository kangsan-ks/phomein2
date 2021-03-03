package com.main.admin.menu.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.menu.web.vo.RedProductVo;

public interface RedProductService {

	int selectTotCnt(Map param) throws Exception;

	List<Map> selectPaging(Map param) throws Exception;

	String saveAttachFile(MultipartFile productFile);
	
	String saveExcelFile(Workbook wb, HttpServletRequest request, String siteName);

	Map selectProductView(Map param) throws Exception;

	void mergeProduct(RedProductVo product) throws Exception;

	void deleteProduct(Map param) throws Exception;
	
	String nextSeq(Map param) throws Exception;

	void updateUseYn(Map param) throws Exception;

	int duplicateProductCnt(Map param) throws Exception;

	List<Map> selectMenuList(Map param) throws Exception;
	
	List<Map> selectCodeList(Map param) throws Exception;

}
