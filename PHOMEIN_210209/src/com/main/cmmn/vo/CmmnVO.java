package com.main.cmmn.vo;
/*
import org.apache.commons.lang3.builder.ToStringBuilder;
*/
public class CmmnVO {
	
	/**
	 * 등록 구분
	 */
	private String proc;
	
	/**
	 * 공통코드 Start
	 */
	private String code = "";
	
	private String name = "";
	
	private Integer ordr = 0;
	
	private String useyn = "";
	// END
	
	/**
	 * 메뉴코드 Start
	 */
	private String menuNm = "";
	
	private String link = "";
	// END	
	

	public String getProc() {
		return proc;
	}
	public void setProc(String proc) {
		this.proc = proc;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getOrdr() {
		return ordr;
	}
	public void setOrdr(Integer ordr) {
		this.ordr = ordr;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	
	
/*	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}*/

}