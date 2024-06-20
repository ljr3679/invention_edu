package cms.enc;




/**
 * 
 * TEXT 암호화/복호화 service.
 * @version 1.0.0
 * @date 2013. 7. 4.
 * 
 * 
 */
public class TextEncryptionService {

	/**
	 * ARIA 암복호화 Class
	 */
	private CipherService cipherService = null;

	/**
	 * text 암복호화를 위한 key 세팅.
	 */
	private String encryptKey = "ztxHSTBWuMmdi/Eu9yN1vzGAUEOD5JZPq2ayFr5lzwI=";
	
	
	/**
	 * TEXT 암호화 설정(password 재설정).
	 * 
	 * @param setKey
	 * @throws Exception
	 * 
	 */
	private void setConfig(final String setKey) throws Exception 	{
		cipherService = new CipherService();

		if (setKey == null || "".equals(setKey)) {
			cipherService.setPassword(encryptKey);
		} else {
			cipherService.setPassword(setKey);
		}

	}
	/**
	 * 메소드 설명
	 * 
	 * @param plainString
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 */
	public String encrypt(String plainString, String key) throws Exception {
		setConfig(key);
		
		String returnValue = "";
		byte[] returnByte;

		try	{
			returnByte = cipherService.encrypt(plainString);
			returnValue = this.bytesToHex(returnByte);
		} catch (Exception e) {
			throw e;
		}

		return returnValue;
	}

	/**
	 * 메소드 설명
	 * 
	 * @param plainString
	 * @return
	 * @throws Exception
	 * 
	 */
	public String encrypt(String plainString) throws Exception	{
		return encrypt(plainString, null);
	}

	/**
	 * 메소드 설명
	 * 
	 * @param encryptedString
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 */
	public String decrypt(String encryptedString, String key) throws Exception	{
		
		setConfig(key);

		byte[] encryptedByte = this.hexToBytes(encryptedString);
		String returnValue = "";
		byte[] returnByte;

		try {
			returnByte = cipherService.decrypt(encryptedByte);
			returnValue = new String(returnByte);
		} catch (Exception e) {
			throw e;
		}
		

		return returnValue;
	}

	/**
	 * 메소드 설명
	 * 
	 * @param encryptedString
	 * @return
	 * @throws Exception
	 * 
	 */
	public String decrypt(String encryptedString) throws Exception	{
		return decrypt(encryptedString, null);
	}

	/**
	 * 메소드 설명
	 * 
	 * @param plainByte
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 */
	public byte[] encrypt(byte[] plainByte, String key) throws Exception	{
		
		setConfig(key);
		
		byte[] returnByte;

		try	{
			returnByte = cipherService.encrypt(plainByte);
		} catch (Exception e) {
			throw e;
		}

		return returnByte;
	}

	/**
	 * 메소드 설명
	 * 
	 * @param plainByte
	 * @return
	 * @throws Exception
	 * 
	 */
	public byte[] encrypt(byte[] plainByte) throws Exception {
		return encrypt(plainByte, null);
	}

	/**
	 * 메소드 설명
	 * 
	 * @param encryptedByte
	 * @param key
	 * @return
	 * @throws Exception
	 * 
	 */
	public byte[] decrypt(byte[] encryptedByte, String key) throws Exception {
		
		setConfig(key);

		byte[] returnByte;

		try	{
			returnByte = cipherService.decrypt(encryptedByte);
		} catch (Exception e) {
			throw e;
		}
		

		return returnByte;
	}

	/**
	 * 메소드 설명
	 * 
	 * @param encryptedByte
	 * @return
	 * @throws Exception
	 * 
	 */
	public byte[] decrypt(byte[] encryptedByte) throws Exception {
		return decrypt(encryptedByte, null);
	}

	private String bytesToHex(byte[] data) {
		if (data == null) {
			return "";
		}

		int len = data.length;
		StringBuffer sb = new StringBuffer();
		//String str = "";

		// 0x는 16진수를 나타낸다.
		// 0xff는 10진수로 치면 255
		// 1111 1111 => 128 + 64 + 32 +16 + 8 + 4 + 2 + 1 = 255
		for (int i = 0; i < len; i++) {
			if ((data[i] & 0xFF) < 16) { // 2자리 포맷 맞춰주기
				//str = str + "0" + Integer.toHexString(data[i] & 0xFF);
				sb.append("0");
				sb.append(Integer.toHexString(data[i] & 0xFF));
			} else {
				//str = str + Integer.toHexString(data[i] & 0xFF);
				sb.append(Integer.toHexString(data[i] & 0xFF));
			}
		}
		return sb.toString();
	}
	
	private byte[] hexToBytes(String str) {
		
		byte[] buffer = null;
		
		if (str == null) {
			return buffer;
		} else if (str.length() < 2) {
			return buffer;
		} else {
			int len = str.length() / 2;
			if(len<0) return null;
			buffer = new byte[len];
			for (int i = 0; i < len; i++) {
				// 16진수 이므로 숫자 변환시 radix를 명시 한다.
				buffer[i] = (byte) Integer.parseInt(
						str.substring(i * 2, i * 2 + 2), 16);
			}
			return buffer;
		}
	}
	
	/**
	 * 
	 * 난수(6자리) 발생시키는 메소드
	 * 
	 * @return buffer.toString()
	 */
	public String randomnum(){
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
}