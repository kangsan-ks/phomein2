package com.main.cmmn.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hsqldb.lib.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.main.cmmn.util.ftp.FtpUpload;
import com.main.uploadfile.service.UploadFileVO;

/**
 * <pre>
 * 업로드, 다운로드  파일을 컨트롤 하는 유틸 클래스
 * 
 * <pre>
 * 
 * @ClassName   : WebFileUtil.java
 * @Description : 업로드, 다운로드  파일을 컨트롤 하는 유틸 클래스 
 * @author jkKim
 * @since 2012. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2012. 10. 10.     jkKim     최초 생성
 * </pre>
 */
public class WebFileUtil {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * 파일이름시퀀스 (int)fileNameSeq
	 */
	private static int fileNameSeq;

	private static String imagePath = "/upload";

	private static String uploadPath = "/upload";

	private static String downloadPath = "";
	
	@Autowired
	private FtpUpload ftpUpload;

	/**
	 * Statements
	 * 
	 */
	public WebFileUtil() {
	}

	public static String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		WebFileUtil.imagePath = imagePath;
	}

	public static String getUploadPath() {
		return uploadPath;
	}

	public FtpUpload getFtpUpload() {
		return ftpUpload;
	}

	public void setFtpUpload(FtpUpload ftpUpload) {
		this.ftpUpload = ftpUpload;
	}

	public void setUploadPath(String uploadPath) {
		WebFileUtil.uploadPath = uploadPath;
	}

	public String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		WebFileUtil.downloadPath = downloadPath;
	}

	/**
	 * 유니크한 파일명을 만들어 낸다.
	 * 
	 * @return String 파일명
	 */
	private static String getFileNameSeq() {
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS", Locale.KOREA);
		return dataFormat.format(new Date()) + String.format("%03d", (++fileNameSeq % 1000));

	}

	public UploadFileVO upload(MultipartFile uploadFile) {
		return upload(uploadFile, "test");
	}

	public UploadFileVO realUpload(MultipartFile uploadFile, String path) {

		if (uploadFile.isEmpty()) {
			return null;
		}
		UploadFileVO fileVO = new UploadFileVO();
		try {
			fileVO.setFileNm(uploadFile.getOriginalFilename());
			SimpleDateFormat dataFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
			String uploadDate = path;
			fileVO.setFilePath(imagePath + "/" + uploadDate);
			fileVO.setFileTmprNm(fileVO.getFileNm());
			fileVO.setFileSize(uploadFile.getSize());
			FileUtil.makeDirectories(uploadPath + "/" + uploadDate);
			//File file = new File(uploadPath + "/" + uploadDate + fileVO.getFileNm());
			File file = new File(uploadPath + "/" + uploadDate + "/" + fileVO.getFileTmprNm());

			uploadFile.transferTo(file);
//			ftpUpload.fileUpload(imagePath + "/" + uploadDate, uploadFile);

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return null;

		}// try end;

		return fileVO;
	}

	public static UploadFileVO upload(MultipartFile uploadFile, String path) {
		if (uploadFile.isEmpty()) {
			return null;
		}
		UploadFileVO fileVO = new UploadFileVO();
		try {
			fileVO.setFileNm(uploadFile.getOriginalFilename());
			if( fileCheck(uploadFile) ){
				SimpleDateFormat dataFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
				String uploadDate = path + dataFormat.format(new Date());
				fileVO.setFilePath(imagePath + "/" + uploadDate);
				String filePrefix = fileVO.getFileNm().substring(fileVO.getFileNm().lastIndexOf("."));
				fileVO.setFileTmprNm(getFileNameSeq() + filePrefix);
				fileVO.setFileSize(uploadFile.getSize());
				FileUtil.makeDirectories(uploadPath + "/" + uploadDate);
				File file = new File(uploadPath + "/" + uploadDate + "/" + fileVO.getFileTmprNm());
				
				String fileMime = new MimetypesFileTypeMap().getContentType(file);
				//System.out.println("==========================fileMime:" + fileMime);
				//System.out.println("==========================fileMime-indexOf:" + fileMime.toString().indexOf("image/"));
				//System.out.println("==========================fileMime-indexOf:" + fileMime.toString().indexOf("application/octet-stream"));
				
				//'hwp' => array('application/haansofthwp', 'application/x-hwp', 'application/unknown', 'application/msword', 'application/octet-stream', 'application/zip', 'text/plain', 'text/xml'),
				if ( fileMime.toString().indexOf("image/") < 0 && fileMime.indexOf("application/octet-stream") < 0 && fileMime.indexOf("application/haansofthwp") < 0 && fileMime.indexOf("application/x-hwp") < 0 && fileMime.indexOf("text/plain") < 0 ){ //
					return null; 
				}
							
				//System.out.println(fileVO.getFileSize()+ "=============================");
				uploadFile.transferTo(file);
								
	//			ftpUpload.fileUpload(uploadDate, uploadFile, fileVO.getFileTmprNm());
			}else{
				return null; 
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
			return null;

		}// try end;

		return fileVO;
	}

	public List<UploadFileVO> upload(MultipartFile[] uploadFiles, String uploadPath) {

		List<UploadFileVO> fileList = new ArrayList<UploadFileVO>();
		for (int i = 0; i < uploadFiles.length; i++) {
			MultipartFile uploadFile = uploadFiles[i];

			if (uploadFile.isEmpty()) {
				continue;
			}
			try {
				fileList.add(upload(uploadFile, uploadPath));

			} catch (Exception e) {
				e.printStackTrace();

			}// try end;
		}
		return fileList;
	}

	public void downloadFile(HttpServletRequest request, HttpServletResponse response, String file, String fileName) throws Exception {
		//file.replaceAll("", "");
		File f = new File(downloadPath+file);
		System.out.println(downloadPath+file);
		downloadFile(request, response, f, fileName);
	}
	
	public void downloadExcelFile(HttpServletRequest request, HttpServletResponse response, String file, String fileName) throws Exception {
		//file.replaceAll("", "");
		File f = new File(uploadPath+file);
		System.out.println(uploadPath+file);
		downloadFile(request, response, f, fileName);
	}
	
	public static Boolean imageCheck(MultipartFile uploadFile) {
		if (uploadFile.isEmpty()) {
			return null;
		}
		String filstr = ".bmp|.gif|.jpg|.jpeg|.png";
		String [] st = filstr.split(",");
		UploadFileVO fileVO = new UploadFileVO();
		try {
			fileVO.setFileNm(uploadFile.getOriginalFilename());
			String filePrefix = fileVO.getFileNm().substring(fileVO.getFileNm().lastIndexOf(".")).toLowerCase();
			if(filstr.indexOf(filePrefix) > 0){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}// try end;
	}
	
	public static Boolean fileCheck(MultipartFile uploadFile) {
		if (uploadFile.isEmpty()) {
			return null;
		}
		String filstr = ".bmp|.gif|.jpg|.jpeg|.png|.pdf|.zip|.hwp|.doc|.docx|.ppt|.pptx|.xls|.xlsx|.txt";
		String [] st = filstr.split(",");
		UploadFileVO fileVO = new UploadFileVO();
		try {
			fileVO.setFileNm(uploadFile.getOriginalFilename());
			String filePrefix = fileVO.getFileNm().substring(fileVO.getFileNm().lastIndexOf(".")).toLowerCase();
			if(filstr.indexOf(filePrefix) > 0){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}// try end;
	}
	
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, File file, String fileName) throws Exception {

		String strClient = request.getHeader("User-Agent");
		String fileType;

		if (strClient.indexOf("MSIE 5.5") != -1) {
			response.setHeader("Content-Disposition", "filename=" + new String(fileName.getBytes("euc-kr"), "8859_1") + ";");
			fileType = "doesn/matter";
		} else {
			response.setHeader("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("euc-kr"), "8859_1") + "\";");
			fileType = "application/octet-stream";
		}

		response.setContentType(fileType);
		BufferedInputStream bufferIn = null;
		BufferedOutputStream bufferOut = null;
		if (file.exists()) {
			try {
				bufferIn = new BufferedInputStream(new FileInputStream(file));
				bufferOut = new BufferedOutputStream(response.getOutputStream());
				int read = 0;

				while ((read = bufferIn.read()) != -1) {
					bufferOut.write(read);
				}
				bufferOut.flush();
			} catch (Exception e) {
				// log.error("파일 다운로드에 실패하였습니다.");
			} finally {
				try {
					if (bufferOut != null)
						bufferOut.close();
				} catch (IOException ie) {
				}

				try {
					if (bufferIn != null)
						bufferIn.close();
				} catch (IOException ie) {
				}
			}

		}
	}
	
	
	   //이미지 파일 체크 로직
	   public boolean isImageFile(String szFilePath){
	        boolean isRst = false;
	        String szFileHeader = "";
	        String [] szArrImgHeader = 
	             {"47494638", "474946383761","474946383761","474946383761" //GIF Header 
	              ,"89504E470D0A1A0A0000000D49484452" // PNG Header
	              , "FFD8FF" //JPG Header
	              , "424D" //BMP Header
	             };
	        try{
	             if(szFilePath != null && !szFilePath.equals("")) {
	            	 if(fileUploadCheckJpg(szFilePath)){
	                    szFileHeader = fileToByte(szFilePath); //업로드 하려는 파일 헤더 체크 

	                    if(szFileHeader != null && !szFileHeader.equals("")) {
	                        for(int i=0;i<szArrImgHeader.length;i++) {
	                           int len = szArrImgHeader[i].length();
	                           if(szArrImgHeader[i].equals(szFileHeader.substring(0, len))) {
	                              isRst = true;
	                              break;
	                           }
	                       }
	                    }
	               }
	            }
	        }catch(Exception e){
	        }
	      return isRst;
	   }

	   //파일 헤더 체크
	   public String fileToByte(String szFilePath)throws Exception{
	       byte [] b = new byte[16];
	       String szFileHeader = "";
	       DataInputStream in = null;
	       try{
	            //파일을 DataInputStream에 넣고 byte array로 읽어들임.(담기)
	            in = new DataInputStream(new FileInputStream(szFilePath));
	            in.read(b);
	            for(int i=0;i<b.length;i++) {
	                szFileHeader += byteToHex(b[i]);  
	            } 
	       }catch(Exception e){

	      }finally{
	        if(in != null){in.close();}
	      }  
	     return szFileHeader;
	  }

	   //byte -> Hex(String)로 변경
	  public String byteToHex(byte in) {
	      byte ch = 0x00;
	      String pseudo[] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"};
	      StringBuffer out = new StringBuffer();

	      ch = (byte) (in & 0xF0);
	      ch = (byte) (ch >>> 4);
	      ch = (byte) (ch & 0x0F);
	        
	      out.append(pseudo[ (int) ch]);
	      ch = (byte) (in & 0x0F);
	      out.append(pseudo[ (int) ch]);

	      String rslt = new String(out);
	      return rslt;
	  }



	  //파일 확장자 체크
	  public boolean fileUploadCheckJpg(String fileName){
	      boolean result= false;
	      String check = fileName.substring(fileName.lastIndexOf("."));
	      if(check.equalsIgnoreCase(".jpg")||check.equalsIgnoreCase(".bmp")
	      ||check.equalsIgnoreCase(".gif")||check.equalsIgnoreCase(".png")){
	          result = true; 
	      }
	      return result;
	  }

	
	  public static void deleteFile(String fileName) throws Exception {
		  
			File file = new File(downloadPath+fileName);
			System.out.println(downloadPath+fileName);
			try{
				if( file.exists() ){ //파일존재여부확인
		            if(file.isDirectory()){ //파일이 디렉토리인지 확인
		                File[] files = file.listFiles();
		                for( int i=0; i<files.length; i++){
		                    if( files[i].delete() ){
		                        System.out.println(files[i].getName()+" 삭제성공");
		                    }else{
		                        System.out.println(files[i].getName()+" 삭제실패");
		                    }
		                }
		            }
		            if(file.delete()){
		                System.out.println("파일삭제 성공");
		            }else{
		                System.out.println("파일삭제 실패");
		            }
		             
		        }else{
		            System.out.println("파일이 존재하지 않습니다.");
		        }
			}catch (Exception e) {
				// TODO: handle exception
			}
	  }
	
	
	  
}
