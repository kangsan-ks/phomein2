package com.main.uploadfile.service;

import java.util.List; 


public interface UploadFileService {

  /**
     * 리스트를 가져온다.
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<UploadFileVO> selectUploadFileList(UploadFileSearchVO searchVO) throws Exception;
    
    /**
     * 
     * 상세 정보를 가져온다.
     * 
     * @param searchVO
     * @return
     * @throws Exception
     */
    UploadFileVO selectUploadFile(UploadFileVO vo) throws Exception;
    
    /**
     * 새로운 정보를 등록한다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    int insertUploadFile(UploadFileVO vo) throws Exception;
    
    /**
     * 기존 정보를 삭제한다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    int deleteUploadFile(UploadFileVO vo) throws Exception;
    
    /**
     * 기존정보를 수정한다.
     *
     * @param vo
     * @return
     * @throws Exception
     */
    int updateUploadFile(UploadFileVO vo) throws Exception;
	/**
	 * 
	 * 글 총 갯수를 가져온다.
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	int selectUploadFileListTotCnt(UploadFileSearchVO searchVO) throws Exception;

}