package com.main.uploadfile.service;

import java.util.Date; 

public class UploadFileVO extends UploadFileSearchVO {


	/** 파일_시컨스 */
	private Integer fileSn;

	/** 파일이름 */
	private String fileNm;

	/** 임시파일이름 */
	private String fileTmprNm;

	/** 파일종류 */
	private String fileKnd;

	/** 파일사이즈 */
	private Long fileSize;

	/** 파일경로 */
	private String filePath;

	/** 파일URL */
	private String fileUrl;

	/** 다운로드 수 */
	private Integer dwldCo;

	/** 다운로드여부 */
	private String dwldAt;

	/** 등록ID */
	private String register;

	/** 등록일 */
	private Date rgsde;

	public void setFileSn(Integer fileSn) {
		this.fileSn = fileSn;
	}
	public Integer getFileSn() {
		return fileSn;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	public String getFileNm() {
		return fileNm;
	}

	public void setFileTmprNm(String fileTmprNm) {
		this.fileTmprNm = fileTmprNm;
	}
	public String getFileTmprNm() {
		return fileTmprNm;
	}

	public void setFileKnd(String fileKnd) {
		this.fileKnd = fileKnd;
	}
	public String getFileKnd() {
		return fileKnd;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public Long getFileSize() {
		return fileSize;
	}

	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public void setDwldCo(Integer dwldCo) {
		this.dwldCo = dwldCo;
	}
	public Integer getDwldCo() {
		return dwldCo;
	}

	public void setDwldAt(String dwldAt) {
		this.dwldAt = dwldAt;
	}
	public String getDwldAt() {
		return dwldAt;
	}

	public void setRegister(String register) {
		this.register = register;
	}
	public String getRegister() {
		return register;
	}

	public void setRgsde(Date rgsde) {
		this.rgsde = rgsde;
	}
	public Date getRgsde() {
		return rgsde;
	}


	public String getUrl(){
		return this.getFilePath() +"/" + this.getFileTmprNm();
	}
	
}