package com.main.admin.intranet.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.main.admin.intranet.service.DesignService;
import com.main.cmmn.util.WebFileUtil;
import com.main.domain.ProductVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("designService")
public class DesignServiceImpl extends EgovAbstractServiceImpl implements DesignService {

		@Resource(name="designMapper")
		private DesignMapper designMapper;

		@Override
		public int selectTotCnt(Map param) throws Exception {
			return designMapper.selectTotCnt(param);
		}

		@Override
		public List<Map> selectPaging(Map param) throws Exception {
			return designMapper.selectPaging(param);
		}

		@Override
		public List<Map> selectDesignOrderFileView(Map param) throws Exception {
			return designMapper.selectDesignOrderFileView(param);
		}

		@Override
		public List<Map> selectDesignOrderPriceView(Map param) throws Exception {
			return designMapper.selectDesignOrderPriceView(param);
		}

		@Override
		public int insert(Map param) throws Exception {
			
			// Design Insert
			int useq = 0;
			designMapper.insert(param);
			useq = Integer.parseInt( param.get("seq").toString() );
			
			//System.out.println("=== INSERT SEQ : " + useq);
			param.put("useq", useq);
			
			// File Insert
			if ( param.get("f_file1") != null ){
				param.put("filename", param.get("f_file1").toString());
				param.put("filedec", param.get("filedec1").toString());
				designMapper.fileInsert(param);
			}
			if ( param.get("f_file2") != null ){
				param.put("filename", param.get("f_file2").toString());
				param.put("filedec", param.get("filedec2").toString());
				designMapper.fileInsert(param);
			}
			if ( param.get("f_file3") != null ){
				param.put("filename", param.get("f_file3").toString());
				param.put("filedec", param.get("filedec3").toString());
				designMapper.fileInsert(param);
			}
			if ( param.get("f_file4") != null ){
				param.put("filename", param.get("f_file4").toString());
				param.put("filedec", param.get("filedec4").toString());
				designMapper.fileInsert(param);
			}
			if ( param.get("f_file5") != null ){
				param.put("filename", param.get("f_file5").toString());
				param.put("filedec", param.get("filedec5").toString());
				designMapper.fileInsert(param);
			}
			
			// Price Insert
			String price = param.get("price").toString();
			//System.out.println("=========PRICE: " + price);
			String option = param.get("option").toString();
			//System.out.println("=========OPTION: " + option);
			
			price = param.get("groupprice").toString();
			//System.out.println("=========GROUPPRICE: " + price);
			option = param.get("groupoption").toString();
			//System.out.println("=========GROUPOPTION: " + option);
			
			String[] aprice = price.split(",");
			String[] aoption = option.split(",");
			if ( option != null || !option.equals("") ){
				
				for(int i = 0; i < aoption.length; i++ ){
					if (aprice[i] == null || aprice[i].equals("")) {
						continue;
					}
					if (Integer.parseInt( aprice[i] ) > 0) {
						param.put("price", aprice[i]);
						param.put("options", aoption[i]);
						//System.out.println( "=========="+ i + "||||" + aprice[i] );
						//System.out.println( "=========="+ i + "||||" + aoption[i] );
						
						designMapper.priceInsert(param);
					}
				}
			}
			
			return 0;
		}

		@Override
		public int fileInsert(Map param) throws Exception {
			return designMapper.fileInsert(param);
		}

		@Override
		public int priceInsert(Map param) throws Exception {
			return designMapper.priceInsert(param);
		}

		@Override
		public int update(Map param) throws Exception {
			
			
			int useq = 0;
			designMapper.update(param);
			useq = Integer.parseInt( param.get("seq").toString() );
			
			param.put("useq", useq);

			designMapper.fileD(param);
			
			// File Insert
			if ( param.get("f_file1") != null ){
				param.put("filename", param.get("f_file1").toString());
				param.put("filedec", param.get("filedec1").toString());
				if ( !param.get("filename").equals("") ){
				designMapper.fileInsert(param);
				}
			}
			if ( param.get("f_file2") != null ){
				param.put("filename", param.get("f_file2").toString());
				param.put("filedec", param.get("filedec2").toString());
				if ( !param.get("filename").equals("") ){
				designMapper.fileInsert(param);
				}
			}
			if ( param.get("f_file3") != null ){
				param.put("filename", param.get("f_file3").toString());
				param.put("filedec", param.get("filedec3").toString());
				if ( !param.get("filename").equals("") ){
				designMapper.fileInsert(param);
				}
			}
			if ( param.get("f_file4") != null ){
				param.put("filename", param.get("f_file4").toString());
				param.put("filedec", param.get("filedec4").toString());
				if ( !param.get("filename").equals("") ){
				designMapper.fileInsert(param);
				}
			}
			if ( param.get("f_file5") != null ){
				param.put("filename", param.get("f_file5").toString());
				param.put("filedec", param.get("filedec5").toString());
				if ( !param.get("filename").equals("") ){
				designMapper.fileInsert(param);
				}
			}
			
			// Price Insert / update
			String seq = param.get("useq").toString();
			String del_seq = param.get("groupdelete").toString();
			String price = param.get("price").toString();
			String option = param.get("option").toString();
			//System.out.println("=========useq: " + seq);
			//System.out.println("=========groupdelete: " + del_seq);
			//System.out.println("=========PRICE: " + price);
			//System.out.println("=========OPTION: " + option);
			
			seq = param.get("groupuseq").toString();
			price = param.get("groupprice").toString();
			option = param.get("groupoption").toString();
			//System.out.println("=========groupuseq: " + seq);
			//System.out.println("=========GROUPPRICE: " + price);
			//System.out.println("=========GROUPOPTION: " + option);

			//Delete
			if ( "".equals( del_seq ) || del_seq == null ){
				
			}else{
				String[] adel = del_seq.split(",");
				for(int i = 0; i < adel.length; i++ ){
					//System.out.println(" ============== Delete : " + adel[i].toString() );
					param.put("seq", adel[i].toString());
					designMapper.priceD(param);
				}
			}
						
			String[] aseq = seq.split(",");
			String[] aprice = price.split(",");
			String[] aoption = option.split(",");
			if ( option == null || option.equals("") ){
				
			}else if ( option != null || !option.equals("") ){
				
				for(int i = 0; i < aoption.length; i++ ){
					
					if ( Integer.parseInt( aseq[i] ) == 0 ){
						if ( Integer.parseInt( aprice[i] ) > 0) {
							param.put("price", aprice[i]);
							param.put("options", aoption[i]);
							//System.out.println( "========== Insert !!");
							//System.out.println( "=========="+ i + "||||" + aprice[i] );
							//System.out.println( "=========="+ i + "||||" + aoption[i] );
							designMapper.priceInsert(param);
						}
					}else{
						param.put("seq", aseq[i]);
						param.put("price", aprice[i]);
						param.put("options", aoption[i]);
						//System.out.println( "========== Update !!");
						//System.out.println( "=========="+ i + "||||" + aseq[i] );
						//System.out.println( "=========="+ i + "||||" + aprice[i] );
						//System.out.println( "=========="+ i + "||||" + aoption[i] );
						designMapper.priceUpdate(param);
					}
				}
			}
			
			return 0;
			
		}

		@Override
		public int fileUpdate(Map param) throws Exception {
			return designMapper.fileUpdate(param);
		}

		@Override
		public int priceUpdate(Map param) throws Exception {
			return designMapper.priceUpdate(param);
		}

		@Override
		public Map selectDesignView(Map param) throws Exception {
			return designMapper.selectDesignView(param);
		}

		// 관리자 디자인 발주 신청
		@Override
		public List<Map> selectList(Map param) throws Exception {
			return designMapper.selectList(param);
		}

		// 디자인 발주 신청 프로세스
		@Override
		public int oderInsert(Map param) throws Exception {
			
			String storeseq = param.get("storeseq").toString();
			String store = param.get("store").toString();
			param.put("store", storeseq);
			param.put("storename", store);
			
			param.put("status", "O");
			
			int orderseq = 0;
			designMapper.oderInsert(param);
			orderseq = Integer.parseInt( param.get("seq").toString() );
			
			//System.out.println("=== INSERT SEQ : " + orderseq);
			param.put("orderseq", orderseq);
			
			
			String[] productseqArr = param.get("productseq").toString().split(",");
			String[] detailseqArr = param.get("detailseq").toString().split(",");
			String[] eaArr = param.get("ea").toString().split(",");
			
			//System.out.println("=======productseq LENGTH : "+ productseqArr.length );
			//System.out.println("=======detailseq LENGTH : "+ detailseqArr.length );
			
			for ( int i = 0; i < detailseqArr.length ; i++ ){
				
				//( #{orderseq}, #{productseq}, #{detailseq}, #{ea}, now() )
				String productseq = productseqArr[i].toString();
				String detailseq = detailseqArr[i].toString();
				String ea = eaArr[i].toString();
				param.put("productseq", productseq);
				param.put("detailseq", detailseq);
				param.put("ea", ea);
				designMapper.orderdetailInsert(param);
				
			}
			return 0;
		}


		@Override
		public int selectDesignOrderCnt(Map param) throws Exception {
			return designMapper.selectDesignOrderCnt(param);
		}

		@Override
		public List<Map> selectDesignOrderList(Map param) throws Exception {
			String options = (String) param.get("options");
			if (options == null || options.equals("")) {
				param.put("options", "");
			}
			return designMapper.selectDesignOrderList(param);
		}

		@Override
		public Map selectDesignOrderView(Map param) throws Exception {
			return designMapper.selectDesignOrderView(param);
		}
		
		@Override
		public List<Map> selectDesignOrderDetailList(Map param) throws Exception {
			return designMapper.selectDesignOrderDetailList(param);
		}

		@Override
		public int orderUpdate(Map param) throws Exception {
			
			designMapper.orderUpdate(param);
			param.put("orderseq", param.get("seq").toString());
			
			
			String[] productseqArr = param.get("productseq").toString().split(",");
			String[] detailseqArr = param.get("detailseq").toString().split(",");
			String[] eaArr = param.get("ea").toString().split(",");
			
			//System.out.println("=======productseq LENGTH : "+ productseqArr.length );
			//System.out.println("=======detailseq LENGTH : "+ detailseqArr.length );
			
			designMapper.orderdetailDelete(param);
			for ( int i = 0; i < detailseqArr.length ; i++ ){
				
				//( #{orderseq}, #{productseq}, #{detailseq}, #{ea}, now() )
				String productseq = productseqArr[i].toString();
				String detailseq = detailseqArr[i].toString();
				String ea = eaArr[i].toString();
				param.put("productseq", productseq);
				param.put("detailseq", detailseq);
				param.put("ea", ea);
				designMapper.orderdetailInsert(param);
				
			}
			return 0;
		}

		@Override
		public List<Map> selectdetail(Map param) throws Exception {
			return designMapper.selectdetail(param);
		}

		@Override
		public int selectReplyCnt(Map param) throws Exception {
			return designMapper.selectReplyCnt(param);
		}

		@Override
		public List<Map> selectReplyPaging(Map param) throws Exception {
			return designMapper.selectReplyPaging(param);
		}

		@Override
		public int insertReply(Map param) throws Exception {
			return designMapper.insertReply(param);
		}

		@Override
		public int updateReply(Map param) throws Exception {
			return designMapper.updateReply(param);
		}

		@Override
		public int deleteReply(Map param) throws Exception {
			return designMapper.deleteReply(param);
		}

		@Override
		public Map selectReplyOne(Map param) throws Exception {
			return designMapper.selectReplyOne(param);
		}

		@Override
		public int updateUseYn(Map param) throws Exception {
			return designMapper.updateUseYn(param);
		}

		@Override
		public int delete(Map param) throws Exception {
			return designMapper.delete(param);
		}

		@Override
		public int deleteDesignOrder(int seq) throws Exception {
			int resultVal = designMapper.deleteDesignOrder(seq);
			
			if (resultVal > 0) {
				designMapper.deleteDesignOrderReply(seq);
				return resultVal;
				
			}
			return resultVal;
		}
		
		
}
