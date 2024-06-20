package cms.enc;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;


public class PropertyPlaceholderConfigurerWithCrypt extends PropertyPlaceholderConfigurer {
	 
	private TextEncryptionService textService;
	
	public void setTextEncryptionService(TextEncryptionService textService) {
		this.textService = textService;
	}
	
	@Override
	protected String convertPropertyValue(String value) {
	
		String propertyValue = value;
		
		if (propertyValue.startsWith("ENC(")) {
		    
			propertyValue = propertyValue.substring(4, propertyValue.length()-1);

		    try {
		    	propertyValue = textService.decrypt(propertyValue);
			} catch (Exception e) {
				e.printStackTrace();
			}
		    
		} 
		
		return propertyValue;
	}
}