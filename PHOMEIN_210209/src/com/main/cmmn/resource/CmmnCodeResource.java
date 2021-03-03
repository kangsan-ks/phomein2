package com.main.cmmn.resource;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang.StringEscapeUtils;

import com.main.admin.comm.service.CodeService;
import com.main.cmmn.service.CmmnService;
import com.main.domain.CodeVO;


public class CmmnCodeResource {
	private static CmmnCodeResource instance = new CmmnCodeResource();
	
	private static CmmnService cmmnService;
	
	private static CodeService codeService;	

	public static CmmnCodeResource getInstance() {
		return instance;
	}
	
	public CodeService getCodeService() {
		return codeService;
	}

	public void setCodeService(CodeService codeService){
		getInstance().codeService = codeService;
		//codeReload1();
	}
	/*
	public static void codeReload1(){
		CodeVO searchVO = new CodeVO();
		List<CodeVO> list;
		try {
			list = codeService.selectCodeList(searchVO);
			System.out.println("sitecode list size : " + list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	public static String getDecode(String code) throws Exception{
		
		String decodeNm = "";
		if(!code.equals("")){
			decodeNm = StringEscapeUtils.unescapeJava(code );
		}
		
		return decodeNm;
	}
	
	public CmmnService getCmmnService() {
		return cmmnService;
	}
	
	public void setCmmnService(CmmnService cmmnService){
		getInstance();
		CmmnCodeResource.cmmnService = cmmnService;
		//codeReload1();
	}

	public static void codeReload(){
		CodeVO searchVO = new CodeVO();
		List<CodeVO> list;
		try {
			list = cmmnService.selectCode(searchVO);
			System.out.println("sitecode list size : " + list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public static List<CodeVO> getCodeList(String code)
			throws Exception {

			CodeVO searchVO = new CodeVO();
			searchVO.setCode(code);
			List<CodeVO> vo = cmmnService.selectCode(searchVO); 
			if ( vo.size() > 0 ){
				return vo;
			}else{
				return null;
			}
	}
	
	public static List<CodeVO> getCodeListSub(String code)
			throws Exception {

			CodeVO searchVO = new CodeVO();
			searchVO.setCode(code);
			List<CodeVO> vo = cmmnService.selectCodeSub(searchVO); 
			if ( vo.size() > 0 ){
				return vo;
			}else{
				return null;
			}
	}	
	
	public static String getCodeNm(String code) throws Exception {
		CodeVO vo = new CodeVO();
		vo.setCode(code);			
		vo = cmmnService.selectCodeNm(vo);
		if(vo != null && vo.getName() != null){
			return vo.getName();
		}else{
			return "";
		}
	}
	//
	public static List<CodeVO> getMenuNmFirst(String code)
			throws Exception {

			CodeVO searchVO = new CodeVO();
			searchVO.setMenuCd(code);
			List<CodeVO> vo = cmmnService.selectMenuNmFirst(searchVO); 
			if ( vo.size() > 0 ){
				return vo;
			}else{
				return null;
			}
	}	
	public static List<CodeVO> getMenuListSub(String code)
			throws Exception {
		
		CodeVO searchVO = new CodeVO();
		searchVO.setMenuCd(code);
		List<CodeVO> vo = cmmnService.selectMenuNmSub(searchVO); 
		if ( vo.size() > 0 ){
			return vo;
		}else{
			return null;
		}
	}	
	
	/**
	 *  상품 종류 및 가격 불러오기
	 */
	public static List<CodeVO> getPriceList(String useq) throws Exception{
		
		CodeVO searchVO = new CodeVO();
		searchVO.setUseq( Integer.parseInt(useq) );
		List<CodeVO> vo = cmmnService.selectPriceList(searchVO);
		if ( vo.size() > 0){
			return vo;
		}else{
			return null;
		}
	}
	
	public static List<CodeVO> getPriceDetailList(String useq, int orderseq) throws Exception{
		
		CodeVO searchVO = new CodeVO();
		searchVO.setUseq( Integer.parseInt(useq) );
		searchVO.setOrderseq( orderseq );
		List<CodeVO> vo = cmmnService.selectPriceDetailList(searchVO);
		if ( vo.size() > 0){
			return vo;
		}else{
			return null;
		}
	}
	
	
	/*
	* Clob 를 String 으로 변경
	*/
	public static String clobToString(Clob clob) throws SQLException,IOException {
		
		if (clob == null) {
			return "";
		}
		
		StringBuffer strOut = new StringBuffer();
		String str = "";
		BufferedReader br = new BufferedReader(clob.getCharacterStream());
		while ((str = br.readLine()) != null) {
			strOut.append(str);
		}
			return strOut.toString();
	}



}