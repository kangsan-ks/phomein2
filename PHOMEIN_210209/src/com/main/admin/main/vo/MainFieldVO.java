package com.main.admin.main.vo;

import java.sql.Date;

public class MainFieldVO {
	private String totalSales;
	private String yearCnt;
	private String totalStore;
	private String revenue;
	private String storeBrandDt;
	private String storeEngDt;
	private String storeJpnDt;
	private String revenueBrandDt;
	private String revenueEngDt;
	private String revenueJpnDt;
	private String modId;
	private Date   modDt;
	
	
	

	public String getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(String totalSales) {
		this.totalSales = totalSales;
	}
	public String getYearCnt() {
		return yearCnt;
	}
	public void setYearCnt(String yearCnt) {
		this.yearCnt = yearCnt;
	}
	public String getTotalStore() {
		return totalStore;
	}
	public void setTotalStore(String totalStore) {
		this.totalStore = totalStore;
	}
	public String getRevenue() {
		return revenue;
	}
	public void setRevenue(String revenue) {
		this.revenue = revenue;
	}
	public String getStoreBrandDt() {
		return storeBrandDt;
	}
	public void setStoreBrandDt(String storeBrandDt) {
		this.storeBrandDt = storeBrandDt;
	}
	public String getStoreEngDt() {
		return storeEngDt;
	}
	public void setStoreEngDt(String storeEngDt) {
		this.storeEngDt = storeEngDt;
	}
	public String getStoreJpnDt() {
		return storeJpnDt;
	}
	public void setStoreJpnDt(String storeJpnDt) {
		this.storeJpnDt = storeJpnDt;
	}
	public String getRevenueBrandDt() {
		return revenueBrandDt;
	}
	public void setRevenueBrandDt(String revenueBrandDt) {
		this.revenueBrandDt = revenueBrandDt;
	}
	public String getRevenueEngDt() {
		return revenueEngDt;
	}
	public void setRevenueEngDt(String revenueEngDt) {
		this.revenueEngDt = revenueEngDt;
	}
	public String getRevenueJpnDt() {
		return revenueJpnDt;
	}
	public void setRevenueJpnDt(String revenueJpnDt) {
		this.revenueJpnDt = revenueJpnDt;
	}
	public String getModId() {
		return modId;
	}
	public void setModId(String modId) {
		this.modId = modId;
	}
	public Date getModDt() {
		return modDt;
	}
	public void setModDt(Date modDt) {
		this.modDt = modDt;
	}
	@Override
	public String toString() {
		return "MainFieldVO [totalSales=" + totalSales + ", yearCnt=" + yearCnt + ", totalStore=" + totalStore
				+ ", revenue=" + revenue + ", storeBrandDt=" + storeBrandDt + ", storeEngDt=" + storeEngDt
				+ ", storeJpnDt=" + storeJpnDt + ", revenueBrandDt=" + revenueBrandDt + ", revenueEngDt=" + revenueEngDt
				+ ", revenueJpnDt=" + revenueJpnDt + ", modId=" + modId + ", modDt=" + modDt + "]";
	}
}
