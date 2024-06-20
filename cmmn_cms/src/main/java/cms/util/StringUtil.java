package cms.util;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("stringUtil")
public class StringUtil {
	
	public boolean isNotEmpty(Object obj) {
		
		if(obj == null) return false;
		
		if(obj instanceof String) {
			String str = String.valueOf(obj).trim();
			if(str.equals("null") || str.equals("")) return false;
			
			return true;
		}
		
		if(obj instanceof List) {
			List list = (List) obj;
			if(list.size() == 0 || list.isEmpty()) return false;
			
			return true;
		}
		
		if(obj instanceof Map) {
			Map map = (Map) obj;
			if(map.size() == 0 || map.isEmpty()) return false;
			
			return true;
		}
		
		if(obj instanceof Object[]) {
			if(Array.getLength(obj) != 0) return false;
			
			return true;
		}
		
		return true;
	}
	
	public boolean isEmpty(Object obj) {
		return !isNotEmpty(obj);
	}
	
	public Map<String,String> queryStringSpliter(String queryString) {
		Map<String,String> entry = new HashMap<String, String>();
		if(queryString.indexOf("?") != -1) queryString = queryString.substring(1,queryString.length());
		String temp = "";
		
		if(queryString.indexOf("&") != -1) {
			while(queryString.indexOf("&") != -1) {
				temp = queryString.substring(0,queryString.indexOf("&"));
				queryString = queryString.substring(queryString.indexOf("&")+1,queryString.length());
				List<String> sp = stringToArr(temp,"=");
				entry.put(sp.get(0), sp.get(1));
			}
			
			temp = queryString;
			List<String> sp = stringToArr(temp,"=");
			entry.put(sp.get(0), sp.get(1));
		}
	
		return entry;
	}
	
	public String arrToString(List<String> list, String split_str) {
		if(isEmpty(list)) return "";
		String temp = "";
		
		for(String str : list) temp += (str + split_str);
		
		return temp.substring(0, temp.length() - split_str.length());
	}
	
	public List<String> stringToArr(String str, String split_str) {
		List<String> list = new ArrayList<String>();
		
		if(isEmpty(str)) return list;
		if(str != null && !str.equals("") && !str.toLowerCase().equals("null")) {
			while(str.indexOf(split_str) != -1) {
				list.add(str.substring(0,str.indexOf(split_str)));
				str = replaceFst(str,str.substring(0,str.indexOf(split_str))+split_str,"");
			}
			list.add(str.substring(0,str.length()));
		}
		
		return list;
	}
	
    public String replaceFst(String string, String toReplace, String replacement) {
        int pos = string.indexOf(toReplace);
        if (pos > -1) return string.substring(0, pos)+ replacement + string.substring(pos + toReplace.length(), string.length());
        else return string;
    }
    
    public String removeHttpTag(String str) {
		if(isEmpty(str)) return "";
		String html = str.replaceAll("\\<.*?\\>", "");
    	return html;
	}
    
    public String escapeXml(String str) {
    	if(isEmpty(str)) return str;
    	
    	str = str.replace("&lt;", "<");
    	str = str.replace("&gt;", ">");
    	str = str.replace("&#40;", "(");
    	str = str.replace("&#41;", ")");
    	str = str.replace("&#35;", "#");
    	str = str.replace("&#38;", "&");
    	str = str.replace("&amp;", "&");
    	str = str.replace("&apos;", "'");
    	str = str.replace("&quot;", "\"");
    	
    	return str;
    }
    
    public String removeXSSNew(String text) throws Exception {
    	if(isEmpty(text)) return text;
    	
    	//String[] xssArr = {"svg", "msscsc", "xss", "script", "javascript", "onload", "alert", "embed", "<input", "document", "vbscript", "cookie", "location", "iframe"};
    	String[] xssArr = {"svg", "msscsc", "xss", "<script", "javascript", "onload", "alert", "<input", "vbscript", "cookie", "location"};
    	String temp = text.toLowerCase();
    	
    	for(String xss : xssArr) {
    		if(temp.contains(xss)) {
    			temp = temp.replace(xss, "");
    			text = temp.replace(xss, "");
    		}
    	}
		
		return text;
    }
    
    public String removeInvalidTags(String param) {
		String str = param;
		String start_tag_list[] = {"<script","<javascript"};
		String end_tag_list[] = {"</script>","</javascript>"};
		int i = 0;
		
		for(String tag : start_tag_list) {
			while(str.indexOf(tag) != -1) {
				if(i == 1) break;
				str = str.substring(0, str.indexOf(tag)) + 
						str.substring((str.indexOf(end_tag_list[i])+end_tag_list[i].length()), str.length());
			}
			i++;
		}
		
		return str;
	}
    
    public String nl2br(String str) {
    	str = str.replaceAll("\r\n", "<br>");
    	str = str.replaceAll("\r", "<br>");
    	str = str.replaceAll("\n", "<br>");
    	
    	return str;
   }
    
}
