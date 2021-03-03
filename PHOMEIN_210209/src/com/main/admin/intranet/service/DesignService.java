package com.main.admin.intranet.service;

import java.util.List;
import java.util.Map;

public interface DesignService {

	int selectTotCnt(Map param) throws Exception;
	
	List<Map> selectPaging(Map param) throws Exception;
	
	Map selectDesignView(Map param) throws Exception;
	

	int insert(Map param) throws Exception;
	
	int fileInsert(Map param) throws Exception;
	
	int priceInsert(Map param) throws Exception;

	int update(Map param) throws Exception;
	
	int fileUpdate(Map param) throws Exception;
	
	int priceUpdate(Map param) throws Exception;
	
	
	List<Map> selectList(Map param) throws Exception;

	List<Map> selectDesignOrderFileView(Map param) throws Exception;
	
	List<Map> selectDesignOrderPriceView(Map param) throws Exception;
	
	// 디자인 물품 신청 등록
	int oderInsert(Map param) throws Exception;
	
	
	
	int selectDesignOrderCnt(Map param) throws Exception;
	
	List<Map> selectDesignOrderList(Map param) throws Exception;
	
	Map selectDesignOrderView(Map param) throws Exception;
	
	List<Map> selectDesignOrderDetailList(Map param) throws Exception;
	
	List<Map> selectdetail(Map param) throws Exception;
	
	// 디자인 물품 신청 수정
	int orderUpdate(Map param) throws Exception;
	
	
	
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
	
}
