package com.main.admin.menu.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.menu.service.RedProductService;
import com.main.admin.menu.web.vo.RedProductVo;
import com.main.cmmn.util.WebFileUtil;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("redProductService")
public class RedProductServiceImpl extends EgovAbstractServiceImpl implements RedProductService {

	private final static String UPLOAD_PATH = "product/";

	@Resource(name = "redProductMapper")
	private RedProductMapper redProductMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return redProductMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return redProductMapper.selectPaging(param);
	}

	@Override
	public String saveAttachFile(MultipartFile productFile) {
		UploadFileVO uploadfileVO = WebFileUtil.upload(productFile, UPLOAD_PATH);
		return uploadfileVO.getUrl();
	}

	@Override
	public String saveExcelFile(Workbook wb, HttpServletRequest request, String siteName) {
		FileOutputStream fileOut = null;
		Date date = new Date();
		long time = date.getTime();
		String filePath = "";
		File path = null;
		File xlsFile = null;
		SimpleDateFormat formatDate = null;
		String now = "";
		try {
			filePath = WebFileUtil.getUploadPath();
			path = new File(filePath + "/" + time);

			if (!path.exists())
				path.mkdirs();

			formatDate = new SimpleDateFormat("yyyy-MM-dd");
			now = formatDate.format(date);

			xlsFile = new File(filePath + "/" + time + "/PhoMenu " + siteName + "(" + now + ").xls");
			fileOut = new FileOutputStream(xlsFile);
			wb.write(fileOut);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
			}
		}
		return filePath + "/" + time + "/PhoMenu " + siteName + "(" + now + ").xls";
	}

	@Override
	public Map selectProductView(Map param) throws Exception {
		return redProductMapper.selectProductView(param);
	}

	@Override
	public void mergeProduct(RedProductVo redProduct) throws Exception {
		redProductMapper.mergeProduct(redProduct);
	}

	@Override
	public void deleteProduct(Map param) throws Exception {
		redProductMapper.deleteProduct(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return redProductMapper.nextSeq(param);
	}

	@Override
	public void updateUseYn(Map param) throws Exception {
		redProductMapper.updateUseYn(param);
	}

	@Override
	public int duplicateProductCnt(Map param) throws Exception {
		return redProductMapper.duplicateProductCnt(param);
	}

	@Override
	public List<Map> selectMenuList(Map param) throws Exception {
		return redProductMapper.selectMenuList(param);
	}

	@Override
	public List<Map> selectCodeList(Map param) throws Exception {
		return redProductMapper.selectCodeList(param);
	}
}
