package cms.util;

import java.text.DecimalFormat;

import org.springframework.stereotype.Component;

/**
 * @create : 2021. 11. 3.
 * @author : KSS
 * @version : 1.0.0
 */
@Component
public class FormatUtil {
	
	private DecimalFormat decFormat = new DecimalFormat("###,###");
	
	public String prefixZero(Integer number, int digit) {
		String returnValue = "";
		try {
			returnValue = String.format("%0"+digit+"d", number);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String prefixZero(String number, int digit) {
		String returnValue = "";
		try {
			returnValue = String.format("%0"+digit+"d", Integer.parseInt(number));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String commaFormat(Integer number) {
		String returnValue = "";
		try {
			returnValue = decFormat.format(number);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String commaFormat(String number) {
		String returnValue = "";
		try {
			returnValue = decFormat.format(Integer.parseInt(number));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String decimalPoint(Float number, int digit) {
		String returnValue = "";
		try {
			returnValue = String.format("%."+digit+"f", number);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String decimalPoint(Double number, int digit) {
		String returnValue = "";
		try {
			returnValue = String.format("%."+digit+"f", number);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
	public String decimalPoint(String number, int digit) {
		String returnValue = "";
		try {
			returnValue = String.format("%."+digit+"f", Double.parseDouble(number));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	
}
