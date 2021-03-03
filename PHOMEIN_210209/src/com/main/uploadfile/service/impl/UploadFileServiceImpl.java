package com.main.uploadfile.service.impl;

import java.util.List; 

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl; 
import egovframework.rte.fdl.idgnr.EgovIdGnrService; 

import com.main.uploadfile.service.UploadFileVO; 
import com.main.uploadfile.service.UploadFileSearchVO; 
import com.main.uploadfile.service.UploadFileService; 

@Service("uploadFileService")
public class UploadFileServiceImpl extends EgovAbstractServiceImpl implements UploadFileService {

    /** uploadFileIdGnrService *//*
    @Resource(name = "uploadFileIdGnrService")
    private EgovIdGnrService idGnrService;*/

    /** uploadFileMapper */
    @Resource(name = "uploadFileMapper")
    private UploadFileMapper uploadFileMapper;

	@Override
    public List<UploadFileVO> selectUploadFileList(UploadFileSearchVO searchVO) throws Exception {
		return uploadFileMapper.selectUploadFileList(searchVO);
	}

	@Override
	public UploadFileVO selectUploadFile(UploadFileVO vo) throws Exception {
		return uploadFileMapper.selectUploadFile(vo);
	}

	@Override
	public int insertUploadFile(UploadFileVO vo) throws Exception {
		/*vo.setFileSn(idGnrService.getNextIntegerId());*/
		return uploadFileMapper.insertUploadFile(vo);
	}

	@Override
	public int deleteUploadFile(UploadFileVO vo) throws Exception{
		return uploadFileMapper.deleteUploadFile(vo);
	}

	@Override
	public int updateUploadFile(UploadFileVO vo) throws Exception {
		return uploadFileMapper.updateUploadFile(vo);
	}
	@Override
	public int selectUploadFileListTotCnt(UploadFileSearchVO searchVO) throws Exception {
		return uploadFileMapper.selectUploadFileListTotCnt(searchVO);
	}

}