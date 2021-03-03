package com.main.admin.site.web.vo;

import org.springframework.web.multipart.MultipartFile;

public class PhoeverVo {
	private String seq;

	private String useyn;

	private String title;

	private MultipartFile pc_img;
	
	private String pc_img_txt;

	private String pc_alt;

	private String pc_contents;

	private MultipartFile m_img;
	
	private String m_img_txt;

	private String m_alt;

	private String m_contents;
	
	private int hitcnt;

	private String tb_socialcol;
	
	private String regid;
	
	private String modid;

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getUseyn() {
		return useyn;
	}

	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public MultipartFile getPc_img() {
		return pc_img;
	}

	public void setPc_img(MultipartFile pc_img) {
		this.pc_img = pc_img;
	}

	public String getPc_img_txt() {
		return pc_img_txt;
	}

	public void setPc_img_txt(String pc_img_txt) {
		this.pc_img_txt = pc_img_txt;
	}

	public String getPc_alt() {
		return pc_alt;
	}

	public void setPc_alt(String pc_alt) {
		this.pc_alt = pc_alt;
	}

	public String getPc_contents() {
		return pc_contents;
	}

	public void setPc_contents(String pc_contents) {
		this.pc_contents = pc_contents;
	}

	public MultipartFile getM_img() {
		return m_img;
	}

	public void setM_img(MultipartFile m_img) {
		this.m_img = m_img;
	}

	public String getM_img_txt() {
		return m_img_txt;
	}

	public void setM_img_txt(String m_img_txt) {
		this.m_img_txt = m_img_txt;
	}

	public String getM_alt() {
		return m_alt;
	}

	public void setM_alt(String m_alt) {
		this.m_alt = m_alt;
	}

	public String getM_contents() {
		return m_contents;
	}

	public void setM_contents(String m_contents) {
		this.m_contents = m_contents;
	}

	public int getHitcnt() {
		return hitcnt;
	}

	public void setHitcnt(int hitcnt) {
		this.hitcnt = hitcnt;
	}

	public String getTb_socialcol() {
		return tb_socialcol;
	}

	public void setTb_socialcol(String tb_socialcol) {
		this.tb_socialcol = tb_socialcol;
	}

	public String getRegid() {
		return regid;
	}

	public void setRegid(String regid) {
		this.regid = regid;
	}

	public String getModid() {
		return modid;
	}

	public void setModid(String modid) {
		this.modid = modid;
	}

}
