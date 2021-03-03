package com.main.cmmn.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class EmailUtil {

    protected Log log; 
    
    public EmailUtil(){
        this.log = LogFactory.getLog(super.getClass());
    }
    
	/**
	 * SMTP 호스트 주소
	 * (String)smtphost 
	 */
	private String smtphost = "";
	/**
	 * SMTP 포트
	 * (String)port 
	 */
	private String port = "";
	/**
	 * 보내는 사람 메일 주소
	 * (String)frommail 
	 */
	private String frommail =""; 
	/**
	 * 보내는 사람 이름
	 * (String)fName 
	 */
	private String fName ="";
	
	/**
	 * Statements
	 *
	 * @param smtphost
	 */
	public String getSmtphost() {
		return smtphost;
	}
	public void setSmtphost(String smtphost) {
		this.smtphost = smtphost;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getFrommail() {
		return frommail;
	}
	public void setFrommail(String frommail) {
		this.frommail = frommail;
	}

	public boolean sendMail(String smtpHost, final String smtpId, final String smtpPwd, String domain, String title, String toName, String toEmail, String fromName
			, String fromEmail,	String contentPage, String[] repStr1, String[] repStr2, String port) throws Exception, AddressException, MessagingException {
		
		Properties properties = System.getProperties();
		/**
		props.put("mail.smtp.user", d_email)
		props.put("mail.smtp.debug", "true");
		 */
		//SSL
		//properties.setProperty("mail.smtp.EnableSSL.enable","true");
		//properties.setProperty("mail.smtp.ssl.enable", "true");
		//properties.setProperty("mail.smtp.ssl.trust", smtpHost);
		//properties.setProperty("mail.smtp.socketFactory.port", port);
		//properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		//TLS
		properties.setProperty("mail.smtp.starttls.enable", "true"); //SSL 사용 , TLS 사용안함.
		properties.setProperty("mail.smtp.port", port);
		
		properties.setProperty("mail.smtp.host", smtpHost); //실서버용
		//properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.socketFactory.fallback", "false");
		properties.setProperty("mail.debug", "true"); 
		
		properties.setProperty("mail.smtps.quitwait", "false");

/** IF */
		//properties.setProperty("mail.smtp.auth", "false");
		//Session sessions = Session.getDefaultInstance(properties, null);
/** OR */		
		properties.setProperty("mail.smtp.auth", "true");	
		Session sessions = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
			String un = smtpId;
			String pw = smtpPwd;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		//sessions.setDebug(true);
/** END */
		
		MimeMessage message = new MimeMessage(sessions); 
		
		String content = "";
		content = fileGetContents(contentPage);
		for (int i=0; i<repStr1.length; i++) {
			content = content.replaceAll(CommonUtil.nvl(repStr1[i]), CommonUtil.nvl(repStr2[i]));
		}
		 
		Address[] toAddresses = InternetAddress.parse(toEmail);
		message.setRecipients(Message.RecipientType.TO, toAddresses);
		
		if( !"Phomein".equals(fromName) ){
			fromName = "Phomein";
		}
		
		String sender=fromName+"<"+fromEmail+">";

        try{
			InternetAddress from=new InternetAddress(sender);
			
			message.setFrom(from);
			message.setSubject(title,"UTF-8");
			message.setText(content,"UTF-8");
			message.setSentDate(new java.util.Date());
			message.setHeader("Content-type", "text/html; charset=UTF-8");
			Transport.send(message);
			
			return true;
			
        } catch ( MessagingException ex ) {
            log.error("메일 발송 에러 : "+ex);
            //System.out.println("메일 발송 에러"+ex);
        } catch ( Exception e ) {
            log.error("메일 발송 에러 : "+e);
            //System.out.println("메일 발송 에러"+e);
        }
        return false;
        
	}


	public boolean sendMail(String smtpHost, final String smtpId, final String smtpPwd, String title, String toName
			, String toEmail, String fromName, String fromEmail, String content) throws Exception, AddressException,
			MessagingException {
		
		Properties properties = System.getProperties();
		properties.setProperty("mail.smtp.host", smtpHost); //실서버용
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.auth", "false");
		Session sessions = Session.getDefaultInstance(properties, null);

		MimeMessage message = new MimeMessage(sessions); 
				 
		Address[] toAddresses = InternetAddress.parse(toEmail);
		message.setRecipients(Message.RecipientType.TO, toAddresses);
		
		if( !"Phomein".equals(fromName) ){
			fromName = "Phomein";
		}
		String sender=fromName+"<"+fromEmail+">";

        try{
			InternetAddress from=new InternetAddress(sender);
			
			message.setFrom(from);
			message.setSubject(title, "UTF-8");
			message.setText(content, "UTF-8");
			message.setSentDate(new java.util.Date());
			message.setHeader("Content-type", "text/html; charset=UTF-8");
			Transport.send(message);
			
			return true;
        } catch ( MessagingException ex ) {
            log.error("메일 발송 에러 : "+ex);
        } catch ( Exception e ) {
            log.error("메일 발송 에러 : "+e);
        }
        return false;
	}
	
	/**
	 * 이메일 발송을 발송한다. 스프링에 셋팅 된값을로 던진다.
	 * @param subjet
	 * @param tomail
	 * @param tName
	 * @param body
	 * @return
	 */
	public boolean sendMail(String subjet, String tomail, String tName, String body){
        String host = smtphost;
        String subject = subjet;
        String from = frommail; //보내는 메일
        String fromName = fName;
        String to = tomail;
        String toName = tName;
        String content = body;
        try{
            // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
            Properties props = new Properties();
            
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "false");
            
            Session mailSession = Session.getDefaultInstance(props, null);
            
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
            InternetAddress[] address = {new InternetAddress(to, MimeUtility.encodeText(toName,"UTF-8","B"))};
            
            msg.setRecipients(Message.RecipientType.TO, address);//받는 사람설정
            
            msg.setSubject(subject);// 제목 설정
            msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
            msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정 (HTML 형식)
            
            Transport.send(msg); // 메일 보내기
            
            return true;
        } catch ( MessagingException ex ) {
            log.error("메일 발송 에러 : "+ex);
        } catch ( Exception e ) {
            log.error("메일 발송 에러 : "+e);
        }
        return false;
	}
	
	
	/**
     * 이메일 발송을 발송한다. 발송자 메일과 이름을 입력할수 있다.
     * @param subjet
     * @param tomail
     * @param tName
     * @param body
     * @return
     */
    public boolean sendMail(String subjet, String tomail, String frommail, String fName, String tName, String body){
        String host = smtphost;
        String subject = subjet;
        String from = frommail; //보내는 메일
        String fromName = fName;
        String to = tomail;
        String toName = tName;
        String content = body;
        try{
            // 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
            Properties props = new Properties();
            
            props.put("mail.smtp.starttls.enable","true");
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "false");
            
            Session mailSession = Session.getDefaultInstance(props, null);
            
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
            InternetAddress[] address = {new InternetAddress(to, MimeUtility.encodeText(toName,"UTF-8","B"))};
            
            msg.setRecipients(Message.RecipientType.TO, address);//받는 사람설정
            
            msg.setSubject(subject);// 제목 설정
            msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
            msg.setContent(content,"text/html;charset=euc-kr"); // 내용 설정 (HTML 형식)
            
            Transport.send(msg); // 메일 보내기
            return true;
        } catch ( MessagingException ex ) {
            log.error("메일 발송 에러 : "+ex);
        } catch ( Exception e ) {
            log.error("메일 발송 에러 : "+e);
        }
        return false;
    }

	public static String fileGetContents(String contentPage) {
		String content = "";
		// 파일읽기
		try{
			//FileReader fr = new FileReader(contentPage); //파일읽기객체생성
			//BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(contentPage), "UTF8"));
			String line = null; 
			while((line = br.readLine())!=null){ //라인단위 읽기
				content += line + System.getProperty("line.separator"); 
			}
			br.close();
			
		}catch (IOException e) { 
			System.out.println(e.toString()); //에러 발생시 메시지 출력
			
		}
		return content;
	}
	
}
