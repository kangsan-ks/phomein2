package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.service.PhoeverService;
import com.main.admin.site.web.vo.PhoeverVo;
import com.main.cmmn.util.WebFileUtil;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("phoeverService")
public class PhoeverServiceImpl extends EgovAbstractServiceImpl implements PhoeverService {

	private final static String UPLOAD_PATH = "site/";
	
	@Resource(name = "phoeverMapper")
	private PhoeverMapper phoeverMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return phoeverMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return phoeverMapper.selectPaging(param);
	}

	@Override
	public String saveAttachFile(MultipartFile phoeverFile) {
		UploadFileVO uploadfileVO = WebFileUtil.upload(phoeverFile, UPLOAD_PATH);
		return uploadfileVO.getUrl();
	}

	@Override
	public Map selectPhoeverView(Map param) throws Exception {
		return phoeverMapper.selectPhoeverView(param);
	}

	@Override
	public void mergePhoever(PhoeverVo phoever) throws Exception {
		phoeverMapper.mergePhoever(phoever);
	}

	@Override
	public void deletePhoever(Map param) throws Exception {
		phoeverMapper.deletePhoever(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return phoeverMapper.nextSeq(param);
	}

	@Override
	public void updateUseYn(Map param) throws Exception {
		phoeverMapper.updateUseYn(param);
	}

}
