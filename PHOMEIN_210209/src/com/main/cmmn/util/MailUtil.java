package com.main.cmmn.util;

import java.io.File;
import java.io.FileReader;
import java.util.Hashtable;

import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;


/**
 * <pre>
 * Statements
 * <pre>
 *
 * @ClassName   : commonUtil.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Min KH
 * @since 2015. 5. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2015. 5. 30.    Min KH     최초 생성
 * </pre>
 */

public class MailUtil {
	

	/** 메일 본문 내용 */
	private static MimeBodyPart mbp1 = new MimeBodyPart();
	
	/** Hashtable 초기화  */
	private static Hashtable args = new Hashtable();
	
	/** 메일 본문 */
	private static Multipart mp = new MimeMultipart();
	
	public MailUtil() {
	}

	/**
	 * 파일 읽어오기
	 * @param f
	 * @throws MailSenderException
	 */
	public static String setHtml(File f) throws Exception{
		java.io.BufferedReader in = null;
		try{
			in = new java.io.BufferedReader(new FileReader(f));
			StringBuffer buffer = new StringBuffer();
			String line = null;
			
			while((line = in.readLine()) != null){
				buffer.append(line + "\n");
			}
			
			String source  = buffer.toString();
			return source;
		} catch (Exception e){
			e.printStackTrace();
			throw new Exception("HTML파일을 여는데 문제가 발생했습니다.");
		} finally{
			try{
				if(in != null) in.close();
			} catch(Exception e){}
		}
	}

	/**
	 * 발송할 메일에 분몬과 헤더를 넣는다.
	 * @param source
	 * @throws Exception
	 *//*
	public static String setHtml(String source) throws Exception{
		String content = parse(source);
		return content;
	}
	
	private static String parse(String s){
		StringBuffer content = new StringBuffer();
		while(s.length() > 0){
			int position = s.indexOf("[_");
			if(position == -1){
				content.append(s);
				break;
			}
			if(position != 0) content.append(s.substring(0,position));
			
			if(s.length() == position + 2) break;
			String remainder = s.substring(position+2);
			
			int markEndPos = remainder.indexOf("_]");
			if(markEndPos == -1) break;
			
			String argname = remainder.substring(0, markEndPos).trim();
			String value = (String)args.get(argname);
			if(value != null) content.append(value); //content.append(Utils.formatHTML(value));
			
			if(remainder.length() == markEndPos + 2) break;
			s = remainder.substring(markEndPos + 2);
		}
		
		return content.toString();
	}*/
}
