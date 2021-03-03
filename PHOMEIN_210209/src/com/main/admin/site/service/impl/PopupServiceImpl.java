package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.service.PopupService;
import com.main.admin.site.web.vo.PopupVo;
import com.main.cmmn.util.WebFileUtil;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("popupService")
public class PopupServiceImpl extends EgovAbstractServiceImpl implements PopupService {

	private final static String UPLOAD_PATH = "site/";
	
	@Resource(name = "popupMapper")
	private PopupMapper popupMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return popupMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return popupMapper.selectPaging(param);
	}

	@Override
	public String saveAttachFile(MultipartFile popupFile) {
		UploadFileVO uploadfileVO = WebFileUtil.upload(popupFile, UPLOAD_PATH);
		return uploadfileVO.getUrl();
	}

	@Override
	public Map selectPopupView(Map param) throws Exception {
		return popupMapper.selectPopupView(param);
	}

	@Override
	public void mergePopup(PopupVo popup) throws Exception {
		popupMapper.mergePopup(popup);
	}

	@Override
	public void deletePopup(Map param) throws Exception {
		popupMapper.deletePopup(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return popupMapper.nextSeq(param);
	}

	@Override
	public void updateUseYn(Map param) throws Exception {
		popupMapper.updateUseYn(param);
	}

	@Override
	public List<Map> showPopup(Map param) throws Exception {
		return popupMapper.showPopup(param);
	}

}
