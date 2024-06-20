package cms.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

/**
 * @create : 2021. 11. 3.
 * @author : KSS
 * @version : 1.0.0
 */
@Component
public class PatternUtil {
	
	private final Pattern PATTERN_NUMBER = Pattern.compile("^[0-9]+$");
	private final Pattern PATTERN_PICK_NUMBER = Pattern.compile("[0-9]+");
	private final Pattern PATTERN_INC_NUMBER = Pattern.compile(".*[0-9].*");
	private final Pattern PATTERN_DECIMAL = Pattern.compile("^[0-9]+\\.[0-9]+$");
	private final Pattern PATTERN_PICK_DECIMAL = Pattern.compile("[0-9]+\\.[0-9]+");
	private final Pattern PATTERN_ENG = Pattern.compile("^[a-zA-z]+$");
	private final Pattern PATTERN_PICK_ENG = Pattern.compile("[a-zA-z]+");
	private final Pattern PATTERN_INC_ENG = Pattern.compile(".*[a-zA-z].*");
	private final Pattern PATTERN_KOR = Pattern.compile("^[가-힣]+$");
	private final Pattern PATTERN_PICK_KOR = Pattern.compile("[가-힣]+");
	private final Pattern PATTERN_INC_KOR = Pattern.compile(".*[가-힣].*");
//	private final Pattern PATTERN_SPECIAL = 
	private final Pattern PATTERN_CONTACT = Pattern.compile("^\\d{2,3}-\\d{3,4}-\\d{4}$");
	
	public Boolean isNum(String str) {
		boolean check = false;
		try {
			check = PATTERN_NUMBER.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public Boolean isIncNum(String str) {
		boolean check = false;
		try {
			check = PATTERN_INC_NUMBER.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
		
	
	public String getNum(String str) {
		StringBuilder sb = new StringBuilder();
		try {
			Matcher matcher = PATTERN_PICK_NUMBER.matcher(str);
			while(matcher.find()) sb.append(matcher.group());
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}
	
	public Boolean isDecimal(String str) {
		boolean check = false;
		try {
			check = PATTERN_DECIMAL.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public String getDecimal(String str) {
		StringBuilder sb = new StringBuilder();
		try {
			Matcher matcher = PATTERN_PICK_DECIMAL.matcher(str);
			while(matcher.find()) sb.append(matcher.group());
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}
	
	public Boolean isEng(String str) {
		boolean check = false;
		try {
			check = PATTERN_ENG.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public Boolean isIncEng(String str) {
		boolean check = false;
		try {
			check = PATTERN_INC_ENG.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public String getEng(String str) {
		StringBuilder sb = new StringBuilder();
		try {
			Matcher matcher = PATTERN_PICK_ENG.matcher(str);
			while(matcher.find()) sb.append(matcher.group());
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}
	
	public Boolean isKor(String str) {
		boolean check = false;
		try {
			check = PATTERN_KOR.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public Boolean isIncKor(String str) {
		boolean check = false;
		try {
			check = PATTERN_INC_KOR.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	
	public String getKor(String str) {
		StringBuilder sb = new StringBuilder();
		try {
			Matcher matcher = PATTERN_PICK_KOR.matcher(str);
			while(matcher.find()) sb.append(matcher.group());
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		}
		return sb.toString();
	}
	
	public Boolean isContactNum(String str) {
		boolean check = false;
		try {
			check = PATTERN_CONTACT.matcher(str).matches();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return check;
	}

}
