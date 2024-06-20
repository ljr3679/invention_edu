package cms.api;

import org.springframework.stereotype.Component;

import cms.constant.Const;
import cms.data.StaticData;
import cms.enc.EncryptModule;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

@Component
public class EmailService {
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;

	
	public String sendEmail(String senderInfo, String receipter, String subject, String body, List<EgovMap> fileInfo) throws Exception {
		try {
			Properties props = new Properties();
            String host = encryptModule.decryptAREA(StaticData.getInstance().getGlobalsProp().getProperty(Const.SMTP_EMAIL_HOST));
            String port = encryptModule.decryptAREA(StaticData.getInstance().getGlobalsProp().getProperty(Const.SMTP_EMAIL_PORT));
            String[] senderSp = senderInfo.split("[|]");
            String email = senderSp[0];
            String sender = senderSp[1];
            
    		props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", port); 

    		Session session = Session.getDefaultInstance(props, null); 
    		
    		MimeMessage mimeMessage = new MimeMessage(session);
    		mimeMessage.setHeader("Content-Type", "text/html; charset=UTF-8");
    		mimeMessage.setFrom(new InternetAddress(email,sender,"UTF-8"));
    		mimeMessage.setRecipients(Message.RecipientType.TO, receipter);
    		mimeMessage.setSubject(subject);
           
    		if(fileInfo != null && fileInfo.size() > 0) {
    			Multipart mp = new MimeMultipart();
    			
    	        MimeBodyPart htmlPart = new MimeBodyPart();
    	        htmlPart.setContent(getMailForm(subject, body), "text/html; charset=UTF-8" );
    	        mp.addBodyPart(htmlPart);
    	        
    	        for(Map file : fileInfo) {
    	        	MimeBodyPart mbp2 = new MimeBodyPart();
    	        	String realPath = StaticData.getInstance().getAttachPath() + file.get("attachReName");
    	        	FileDataSource fds = new FileDataSource(realPath);
    	        	mbp2.setDataHandler(new DataHandler(fds));
    	        	mbp2.setFileName(MimeUtility.encodeText(String.valueOf(file.get("attachName")), "UTF-8", "B"));
    	        	mp.addBodyPart(mbp2);
    	        }
                
//                mimeMessage.setContent(mp, "text/html; charset=UTF-8");
                mimeMessage.setContent(mp);
    		} else mimeMessage.setContent(body, "text/html; charset=UTF-8");
    		
            Transport.send(mimeMessage);
            return "Y";
		}catch(AddressException address){
			address.printStackTrace();
			return "N";
        //}catch(SMTPAddressFailedException smtpAddress){
        //	smtpAddress.printStackTrace();
        //	return "N";
        }catch(SendFailedException sendFail){
        	sendFail.printStackTrace();
        	return "N";
        }catch(MessagingException Messaging){
        	Messaging.printStackTrace();
        	return "N";
        }catch(java.io.IOException io){
        	io.printStackTrace();
        	return "N";
        }
	}

	
   public void MailSend(String senderInfo, String receipter, String subject, String body, List<EgovMap> fileInfo) throws Exception {
  
	   Properties props = System.getProperties();
	   
	   

	   
//	    props.put("mail.imap.ssl.enable", "true"); // required for Gmail
//	    props.put("mail.imap.auth.mechanisms", "XOAUTH2");
//	    Session session = Session.getInstance(props);
//	    Store store = session.getStore("imap");
//	    store.connect("imap.gmail.com", username, oauth2_access_token);
	    
//        props.put("mail.smtp.starttls.enable", Const.SMTP_EMAIL_STARTTLS);
//        props.put("mail.smtp.host", Const.SMTP_EMAIL_HOST);
//        props.put("mail.smtp.auth", Const.SMTP_EMAIL_AUTH);
//        props.put("mail.smtp.port", Const.SMTP_EMAIL_PORT);

	    //System.out.print("========================"+Const.SMTP_EMAIL_HOST);
        props.put("mail.smtp.host", Const.SMTP_EMAIL_HOST); 
        props.put("mail.smtp.port", Const.SMTP_EMAIL_PORT); 
        props.put("mail.smtp.auth", Const.SMTP_EMAIL_AUTH); 
        props.put("mail.smtp.ssl.enable", "true"); 
        props.put("mail.smtp.ssl.trust", Const.SMTP_EMAIL_HOST);        
        
       
        Authenticator auth = new MailAuth();
       

    
        try {
            String[] senderSp = senderInfo.split("[|]");
            String email = senderSp[0];
            String sender = senderSp[1];	   

            //Session session = Session.getDefaultInstance(props, auth);
            Session session = Session.getInstance(props, auth);
            //System.out.print(session);
            MimeMessage msg = new MimeMessage(session);            
            
        	
        	msg.setHeader("Content-Type", "text/html; charset=UTF-8");
        	msg.setFrom(new InternetAddress(email,sender,"UTF-8"));
        	msg.setRecipients(Message.RecipientType.TO, receipter);        	
        	
        	
        	//msg.setFrom(new InternetAddress("polox940@gmail.com"));        	
            
            //msg.setRecipients(
            //        Message.RecipientType.TO,
            //        InternetAddress.parse("polox940@gmail.com, polox94@naver.com")    
            //);            
            
            msg.setSentDate(new Date());
            
            //msg.setFrom(new InternetAddress("polox94@hanmail.com", "VISITOR"));
            //InternetAddress to = new InternetAddress("polox94@naver.com");         
            //msg.setRecipient(Message.RecipientType.TO, to);            
            msg.setSubject(subject,"UTF-8");            
            
    		// 메일 콘텐츠 설정
            
       		if(fileInfo != null && fileInfo.size() > 0) {
       			
    			Multipart mp = new MimeMultipart();
    			
    	        MimeBodyPart htmlPart = new MimeBodyPart();
    	        htmlPart.setContent(getMailForm(subject, body), "text/html; charset=UTF-8" );
    	        mp.addBodyPart(htmlPart);
    	        
    	        for(Map file : fileInfo) {
    	        	MimeBodyPart mbp2 = new MimeBodyPart();
    	        	String realPath = StaticData.getInstance().getAttachPath() + file.get("attachReName");
    	        	FileDataSource fds = new FileDataSource(realPath);
    	        	mbp2.setDataHandler(new DataHandler(fds));
    	        	mbp2.setFileName(MimeUtility.encodeText(String.valueOf(file.get("attachName")), "UTF-8", "B"));
    	        	mp.addBodyPart(mbp2);
    	        }
                
//                mimeMessage.setContent(mp, "text/html; charset=UTF-8");
                msg.setContent(mp);
    		} else msg.setContent(body, "text/html; charset=UTF-8");

            Transport.send(msg);
            
        } catch(AddressException ae) {            
            //System.out.println("AddressException : " + ae.getMessage());           
        } catch(MessagingException me) {            
            //System.out.println("MessagingException : " + me.getMessage());
        } 
        catch(UnsupportedEncodingException e) {
            //System.out.println("UnsupportedEncodingException : " + e.getMessage());
        }
                
    }	
	
	
	private String getMailForm(String subject, String contents) throws Exception {
		String html = "";
		html += "<!DOCTYPE HTML>";
		html += "<html lang=\"ko\">";
		html += "<head>";
		html += "</head>";
		html += "	<body style=\"font-family: 'Noto Sans KR', sans-serif;\">";
		html += "		<table style=\"width: 100%; max-width: 1200px; border: 4px solid #e9ecef; margin: 0 auto; border-collapse: separate; padding: 46px 87px 54px 82px;\">";
		html += "			<tbody>";
		html += "				<tr>";
		html += "					<td colspan=\"2\" style=\"width: 100%; max-width: 1200px;\">";
		html += "						<img src=\"http://www.didpdda.or.kr/images/home/kor/admin/email_logo.png\" alt=\"대전디자인진흥원\">";
		html += "					</td>";
		html += "				</tr>";
		html += "				<tr>";
		html += "					<td colspan=\"2\" style=\"width: 100%; height: 13px;\"></td>";
		html += "				</tr>";
		html += "				<tr>";
		html += "					<td colspan=\"1\" style=\"width: 100%;\">";
		html += "						<table style=\"width: 100%;\">";
		html += "							<caption style=\"display: none; height: 0; width: 0; opacity: 0; overflow: hidden;\"></caption>";
		html += "							<colgroup>";
		html += "								<col style=\"width: 100%;\">";
		html += "							</colgroup>";
		html += "							<tbody>";
		html += "								<tr>";
		html += "									<td style=\"font-family: 'GmarketSans'; font-weight: 500; font-size: 34px; line-height: 51px; color: #1e1e1e;\">"+subject+"</td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td colspan=\"2\" style=\"width: 100%; height: 36px;\"></td>";
		html += "								</tr>";
		html += "								<tr style=\"width: 100%; height: 1px;\">";
		html += "									<td colspan=\"2\" style=\"width: 100%; height: 1px; background-color: #dbdbdb;\"></td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td colspan=\"2\" style=\"width: 100%; height: 56px;\"></td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td style=\"font-family: 'GmarketSans'; font-size: 22px; line-height: 33px; color: #1e1e1e;\">"+contents+"</td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td colspan=\"2\" style=\"width: 100%; height: 31px;\"></td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td colspan=\"2\"><a href=\"http://www.didpdda.or.kr/\" target=\"_blank\"><img src=\"http://www.didpdda.or.kr/images/home/kor/admin/email_btn.png\" alt=\"대전디자인진흥원 홈페이지 바로가기\"></a></td>";
		html += "								</tr>";
		html += "							</tbody>";
		html += "						</table>";
		html += "					</td>";
		html += "				</tr>";
		html += "				<tr>";
		html += "					<td colspan=\"2\" style=\"width: 100%; height: 81px;\"></td>";
		html += "				</tr>";
		html += "				<tr>";
		html += "					<td colspan=\"2\" style=\"border-top: 1px solid #dbdbdb;\">";
		html += "						<table style=\"width: 100%;\">";
		html += "							<tbody>";
		html += "								<tr>";
		html += "									<td colspan=\"2\" style=\"width: 100%; height: 25px;\"></td>";
		html += "								</tr>";
		html += "								<tr>";
		html += "									<td style=\"font-family: 'Noto Sans KR'; font-weight: 400; font-size: 15px; line-height: 24px; color: #8c8c8c;\">";
		html += "										COPYRIGHT©2021 대전디자인진흥원 All Right Reserved.";
		html += "									</td>";
		html += "								</tr>";
		html += "							</tbody>";
		html += "						</table>";
		html += "					</td>";
		html += "				</tr>";
		html += "			</tbody>";
		html += "		</table>";
		html += "	</body>";
		html += "</html>";
		
		return html;
	}
	
}
