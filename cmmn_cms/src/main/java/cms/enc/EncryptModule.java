package cms.enc;

import java.security.MessageDigest;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component("encryptModule")
public class EncryptModule {
	
	@Resource(name = "textEncryptionService")
	protected TextEncryptionService textEncryptionService;
	
	public String encryptSHA256(String encryptText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(encryptText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16)
						.substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public String encryptAREA(String encryptText) {
		String returnStr = "";
		if(returnStr.equals("null")) return null;
		
		try {
			returnStr = textEncryptionService.encrypt(encryptText);
		} catch(Exception e) {
			returnStr = "ERROR";
		}
		return returnStr;
	}
	
	public String encryptAREA(Object encryptText) {
		String returnStr = "";
		if(returnStr.equals("null")) return null;
		
		try {
			returnStr = textEncryptionService.encrypt(String.valueOf(encryptText));
		} catch(Exception e) {
			returnStr = "ERROR";
		}
		return returnStr;
	}
	
	public String decryptAREA(String decryptText) {
		String returnStr = "";
		try {
			returnStr = textEncryptionService.decrypt(decryptText);
		} catch(Exception e) {
			returnStr = "ERROR";
		}
		return returnStr;
	}
	
	public String decryptAREA(Object decryptText) {
		String returnStr = "";
		try {
			returnStr = textEncryptionService.decrypt(String.valueOf(decryptText));
		} catch(Exception e) {
			returnStr = "ERROR";
		}
		return returnStr;
	}
	
}
