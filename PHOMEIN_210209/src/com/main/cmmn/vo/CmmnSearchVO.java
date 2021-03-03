package com.main.cmmn.vo;

import java.io.Serializable;
/*
import org.apache.commons.lang3.builder.ToStringBuilder;*/

public class CmmnSearchVO implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 7951010248699621964L;

	/** 검색조건 */
	private String searchCondition = "";
	
	private String searchCondition2 = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색Keyword */
	private String searchKeywordTemp = "";
	
	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지갯수 */
	private int pageUnitRecent = 5;
	
	/** 페이지갯수 */
	private int pageUnitPhoto = 9;
	
	/** 페이지갯수 */
	private int pageUnitEvent = 5;
	
	/** 페이지사이즈 */
	private int pageSize = 10;

	/** 사용자 페이지사이즈 한페이지 사용시 */
	private int frontPageSize = 10;
	
	/** 사용자 페이지갯수 */
	private int frontPageUnit = 10;
	
	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

	/** seq */
	private Integer seq = 0;

	private String type = ""; 
	
	private int totalcnt = 0;
	
	private String atchmnfl = "";
	
	private String atchmnflNm = "";
	
	private String regId;
	
	private String regDt;
	
	private String modId;
	
	private String modDt;
	
	private String delgb;
	
	private String upgb;
	
	private String viewgb;

	private String lang;
	
	private String menuCd;
	
	private String submenuCd;

	private String flag;
	
	private String searchType;
	
	/** 검색 시작일 */
	private String searchStDt = "";	
	/** 검색 종료일 */
	private String searchEdDt = "";
	
	
	
	public String getSearchStDt() {
		return searchStDt;
	}

	public void setSearchStDt(String searchStDt) {
		this.searchStDt = searchStDt;
	}

	public String getSearchEdDt() {
		return searchEdDt;
	}

	public void setSearchEdDt(String searchEdDt) {
		this.searchEdDt = searchEdDt;
	}

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public int getFrontPageSize() {
		return frontPageSize;
	}

	public void setFrontPageSize(int frontPageSize) {
		this.frontPageSize = frontPageSize;
	}

	public int getFrontPageUnit() {
		return frontPageUnit;
	}

	public void setFrontPageUnit(int frontPageUnit) {
		this.frontPageUnit = frontPageUnit;
	}

	public String getMenuCd() {
		return menuCd;
	}

	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}

	public String getSubmenuCd() {
		return submenuCd;
	}

	public void setSubmenuCd(String submenuCd) {
		this.submenuCd = submenuCd;
	}

	public int getPageUnitEvent() {
		return pageUnitEvent;
	}

	public void setPageUnitEvent(int pageUnitEvent) {
		this.pageUnitEvent = pageUnitEvent;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getDelgb() {
		return delgb;
	}

	public void setDelgb(String delgb) {
		this.delgb = delgb;
	}

	public String getUpgb() {
		return upgb;
	}

	public void setUpgb(String upgb) {
		this.upgb = upgb;
	}

	public String getViewgb() {
		return viewgb;
	}

	public void setViewgb(String viewgb) {
		this.viewgb = viewgb;
	}

	public String getAtchmnfl() {
		return atchmnfl;
	}

	public void setAtchmnfl(String atchmnfl) {
		this.atchmnfl = atchmnfl;
	}

	public String getAtchmnflNm() {
		return atchmnflNm;
	}

	public void setAtchmnflNm(String atchmnflNm) {
		this.atchmnflNm = atchmnflNm;
	}
	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getSearchKeywordTemp() {
		return searchKeywordTemp;
	}

	public void setSearchKeywordTemp(String searchKeywordTemp) {
		this.searchKeywordTemp = searchKeywordTemp;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public String getSearchUseYn() {
		return searchUseYn;
	}

	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	public int getPageUnitRecent() {
		return pageUnitRecent;
	}

	public void setPageUnitRecent(int pageUnitRecent) {
		this.pageUnitRecent = pageUnitRecent;
	}

	public int getPageUnitPhoto() {
		return pageUnitPhoto;
	}

	public void setPageUnitPhoto(int pageUnitPhoto) {
		this.pageUnitPhoto = pageUnitPhoto;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	
	/*@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}*/
}