package com.main.cmmn.util.ftp;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FtpUpload {
	private static Logger log = Logger.getLogger(FtpUpload.class);

	private static String ip;

	private static String port;

	private static String id;

	private static String password;

	private FTPClient ftp;

	/**
	 * 파일이름시퀀스 (int)fileNameSeq
	 */
	private static int fileNameSeq;

	/**
	 * 유니크한 파일명을 만들어 낸다.
	 * 
	 * @return String 파일명
	 */
	private String getFileNameSeq() {
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.KOREA);
		return dataFormat.format(new Date()) + String.format("%03d", (++fileNameSeq % 1000));

	}

	public boolean fileUpload(String save_dir, MultipartFile[] multipartFiles) {
		boolean isSuccess = false;
		ftpConnection(save_dir);
		for (MultipartFile multipartFile : multipartFiles) {
			isSuccess = fileUpload(multipartFile);
		}

		return isSuccess;
	}

	public boolean fileUpload(MultipartFile multipartFile) {

		boolean isSuccess = false;
		FileInputStream fis = null;
		fis = null;
		String filePrefix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
		String fileName = getFileNameSeq() + filePrefix;
		try {
			System.out.println(fileName + " :전송시작");
			isSuccess = ftp.storeFile(fileName, multipartFile.getInputStream());

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e2) {
				}
			}
		}
		return isSuccess;
	}

	public boolean fileUpload(String save_dir, MultipartFile multipartFile) {

		ftpConnection(save_dir);

		boolean isSuccess = false;
		FileInputStream fis = null;
		fis = null;
		String filePrefix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
		String fileName = getFileNameSeq() + filePrefix;
		try {
			ftp.makeDirectory(save_dir);
			ftp.changeWorkingDirectory(save_dir);
			isSuccess = ftp.storeFile(fileName, multipartFile.getInputStream());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e2) {
				}
			}
		}
		return isSuccess;
	}

	private boolean ftpConnection(String save_dir) {
		log.debug(ip + " : " + port + " : " + id + " : " + password);

		boolean isLogin = false;
		int reply = 0;

		try {
			ftp = new FTPClient();// ftp client 생성
			ftp.setControlEncoding("UTF-8");
			log.debug("response ok");// 응답이 정상.
			System.out.println(port);
			System.out.println(ip);
			ftp.connect(ip, Integer.parseInt(port));
			isLogin = ftp.login(id, password);// ftp 로그인

			log.debug("isLogin???    :::" + isLogin);

			reply = ftp.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				log.debug("FTP server refused connection");
				ftp.disconnect();
			} else {
				log.debug("connect Successful");
				ftp.enterLocalPassiveMode();
				ftp.setKeepAlive(true);
				ftp.setControlKeepAliveTimeout(30);
				//ftp.addProtocolCommandListener(new PrintCommandListener(System.out, true));
				ftp.setBufferSize(1024000);
				ftp.setFileType(FTP.BINARY_FILE_TYPE); //이미지는 바이너리로
				ftp.setFileTransferMode(FTP.STREAM_TRANSFER_MODE);
				ftp.changeWorkingDirectory(save_dir);
				

			}
			if (!isLogin) {
				ftp.logout();
				log.debug("login fail");
				isLogin = false;
			}

		} catch (SocketException se) {
			se.printStackTrace();
			log.debug("se   ::::   " + se.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("eee   ::::   " + e.getMessage());
		} finally {
			
		}//try

		return isLogin;
	}
	
	private void ftpDisconnect(){
		log.debug("ftp disconnect");
		if (ftp != null && ftp.isConnected()) {
			try {
				ftp.disconnect();
			} catch (IOException e) {
			}
		}//if
	}

	public void setIp(String ip) {
		FtpUpload.ip = ip;
	}

	public void setPort(String port) {
		FtpUpload.port = port;
	}

	public void setId(String id) {
		FtpUpload.id = id;
	}

	public void setPassword(String password) {
		FtpUpload.password = password;
	}
	
	public static void main(String[] args) {
		FtpUpload.ip = "127.0.0.1";
		FtpUpload.port = "21";
		FtpUpload.id = ip;
		FtpUpload.password = ip;
	}
}