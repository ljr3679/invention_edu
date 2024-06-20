package cms.api;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import cms.constant.Const;

public class MailAuth extends Authenticator {
 
	PasswordAuthentication pa;
    
    public MailAuth() {
    	String mail_id = Const.SMTP_EMAIL_USERNAME;
    	String mail_pw = Const.SMTP_EMAIL_PASSWORD;
        //System.out.print("===========================" + mail_id);
        //System.out.print("===========================" + mail_pw);
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
	
}
