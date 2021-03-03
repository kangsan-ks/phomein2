package com.main.domain;

import java.util.List;
import java.util.Map;

public class ProductVO {

	private String seq = "";
	private String orderseq = "";
	private String productseq = "";
	private String detailseq = "";
	private String ea = "";
	private String regdt = "";
	private String subtitle = "";
	private String options  = "";
	private String price = "";
		
	private List<Map> productList; 
	
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getOrderseq() {
		return orderseq;
	}
	public void setOrderseq(String orderseq) {
		this.orderseq = orderseq;
	}
	public String getProductseq() {
		return productseq;
	}
	public void setProductseq(String productseq) {
		this.productseq = productseq;
	}
	public String getDetailseq() {
		return detailseq;
	}
	public void setDetailseq(String detailseq) {
		this.detailseq = detailseq;
	}
	public String getEa() {
		return ea;
	}
	public void setEa(String ea) {
		this.ea = ea;
	}
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
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
	public List<Map> getProductList() {
		return productList;
	}
	public void setProductList(List<Map> productList) {
		this.productList = productList;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	
	
	
	
}
