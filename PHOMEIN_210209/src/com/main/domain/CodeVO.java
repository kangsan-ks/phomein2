package com.main.domain;

import com.main.cmmn.vo.CmmnSearchVO;

public class CodeVO extends CmmnSearchVO{

	/**
	 * 공통코드 Start
	 */
	private String code = "";
	
	private String name = "";
	
	private Integer ordr = 0;
	
	private String useyn = "";
	
	private String krmenucode = "";
	
	private String enmenucode = "";
	
	private String jpmenucode = "";
	
	
	// END
	
	/**
	 * 메뉴코드 Start
	 */
	private String menuNm = "";
	
	private String link = "";
	// END	
	
	private int useq = 0;
	
	private String options = "";
	
	private String price = "";
	
	private String productseq = "";
	
	private String ea = "";

	private int orderseq = 0;
	
	
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

	public int getUseq() {
		return useq;
	}

	public void setUseq(int useq) {
		this.useq = useq;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getProductseq() {
		return productseq;
	}

	public void setProductseq(String productseq) {
		this.productseq = productseq;
	}

	public String getEa() {
		return ea;
	}

	public void setEa(String ea) {
		this.ea = ea;
	}

	public int getOrderseq() {
		return orderseq;
	}

	public void setOrderseq(int orderseq) {
		this.orderseq = orderseq;
	}

	public String getKrmenucode() {
		return krmenucode;
	}

	public void setKrmenucode(String krmenucode) {
		this.krmenucode = krmenucode;
	}

	public String getEnmenucode() {
		return enmenucode;
	}

	public void setEnmenucode(String enmenucode) {
		this.enmenucode = enmenucode;
	}

	public String getJpmenucode() {
		return jpmenucode;
	}

	public void setJpmenucode(String jpmenucode) {
		this.jpmenucode = jpmenucode;
	}
	
}
