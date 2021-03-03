package com.main.uploadfile.service.impl;

import java.util.List; 

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import com.main.uploadfile.service.UploadFileVO; 
import com.main.uploadfile.service.UploadFileSearchVO; 

@Mapper("uploadFileMapper")
public interface UploadFileMapper {

	/**
	 * 리스트를 가져온다.
	 * 
	 * @param searchVO
	 * @return
	 */
	List<UploadFileVO> selectUploadFileList(UploadFileSearchVO searchVO) throws Exception;
	
	/**
	 * 새로운 내용을 등록한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int insertUploadFile(UploadFileVO vo) throws Exception;
	/**
	 * 기존 내용을 삭제한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int deleteUploadFile(UploadFileVO vo) throws Exception;
	
	/**
	 * 기존 내용을 수정한다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int updateUploadFile(UploadFileVO vo) throws Exception;
	
	/**
	 * 
	 * 상세내용을 가져온다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	UploadFileVO selectUploadFile(UploadFileVO vo) throws Exception;

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