package com.main.admin.site.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.main.admin.site.service.InterviewService;
import com.main.admin.site.web.vo.InterviewVo;
import com.main.cmmn.util.WebFileUtil;
import com.main.uploadfile.service.UploadFileVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("interviewService")
public class InterviewServiceImpl extends EgovAbstractServiceImpl implements InterviewService {

	private final static String UPLOAD_PATH = "site/";
	
	@Resource(name = "interviewMapper")
	private InterviewMapper interviewMapper;

	@Override
	public int selectTotCnt(Map param) throws Exception {
		return interviewMapper.selectTotCnt(param);
	}

	@Override
	public List<Map> selectPaging(Map param) throws Exception {
		return interviewMapper.selectPaging(param);
	}

	@Override
	public String saveAttachFile(MultipartFile siteFile) {
		UploadFileVO uploadfileVO = WebFileUtil.upload(siteFile, UPLOAD_PATH);
		return uploadfileVO.getUrl();
	}

	@Override
	public Map selectInterviewView(Map param) throws Exception {
		return interviewMapper.selectInterviewView(param);
	}

	@Override
	public void mergeInterview(InterviewVo interview) throws Exception {
		interviewMapper.mergeInterview(interview);
	}

	@Override
	public void deleteInterview(Map param) throws Exception {
		interviewMapper.deleteInterview(param);
	}

	@Override
	public String nextSeq(Map param) throws Exception {
		return interviewMapper.nextSeq(param);
	}

	@Override
	public void updateUseYn(Map param) throws Exception {
		interviewMapper.updateUseYn(param);
	}

}
