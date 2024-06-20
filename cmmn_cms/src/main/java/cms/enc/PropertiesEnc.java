package cms.enc;


import java.util.Calendar;
import java.util.UUID;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cms.util.PatternUtil;


public class PropertiesEnc {

	//로그
	private static final Logger LOGGER = LoggerFactory.getLogger(PropertiesEnc.class);
	
	private static TextEncryptionService textService;
	
	public static void main(String[] args) throws Exception {
		textService = new TextEncryptionService();
	}
	
}
