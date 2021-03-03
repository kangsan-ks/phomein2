package com.main.admin.intranet.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("designMapper")
public interface DesignMapper {

	// 디자인 발주 목록
	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	Map selectDesignView(Map param) throws Exception;
	
	int insert(Map param) throws Exception;
	
	int fileInsert(Map param) throws Exception;
	
	int priceInsert(Map param) throws Exception;
	
	int update(Map param) throws Exception;
	
	int fileUpdate(Map param) throws Exception;
	
	int priceUpdate(Map param) throws Exception;
	
	int fileD(Map param) throws Exception;
	int priceD(Map param) throws Exception;
	

	// 디자인 발주 신청 - 관리자 / 가맹점
	List<Map> selectList(Map param) throws Exception;
	
	// 디자인 서브 테이블 (파일 / 종류 / 가격)
	List<Map> selectDesignOrderFileView(Map param) throws Exception;
	
	List<Map> selectDesignOrderPriceView(Map param) throws Exception;
	
	// 디자인 물품 신청 등록
	int oderInsert(Map param) throws Exception;
	
	int orderdetailInsert(Map param) throws Exception;
	//
	
	
	// 디자인 발주 신청 내역
	int selectDesignOrderCnt(Map param) throws Exception;
	
	List<Map> selectDesignOrderList(Map param) throws Exception;
	
	Map selectDesignOrderView(Map param) throws Exception;
	
	List<Map> selectDesignOrderDetailList(Map param) throws Exception;
	
	List<Map> selectdetail(Map param) throws Exception;
	
	// 디자인 물품 신청 수정
	int orderUpdate(Map param) throws Exception;
	// 디자인 물품 신청 수정 : 삭제 후 등록
	int orderdetailDelete(Map param) throws Exception;
	
	
	
	// 댓글
	int selectReplyCnt(Map param) throws Exception;
	
	List<Map> selectReplyPaging(Map param) throws Exception;
	
	int insertReply(Map param) throws Exception;
	
	int updateReply(Map param) throws Exception;
	
	int deleteReply(Map param) throws Exception;
	
	Map selectReplyOne(Map param) throws Exception;
	
	
	
	
	int delete(Map param) throws Exception;
	
	int updateUseYn(Map param) throws Exception;
	
	int deleteDesignOrder(int seq) throws Exception;
	int deleteDesignOrderReply(int useq) throws Exception;
	
}
