package cms.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class WebRequestInfo {
	
	public String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
//        Logs.print(">>>> X-FORWARDED-FOR : " + ip);
        
//        if (ip == null) {
//            ip = request.getHeader("Proxy-Client-IP");
//            Logs.print(">>>> Proxy-Client-IP : " + ip);
//        }
//        if (ip == null) {
//            ip = request.getHeader("WL-Proxy-Client-IP");
//            Logs.print(">>>> WL-Proxy-Client-IP : " + ip);
//        }
//        if (ip == null) {
//            ip = request.getHeader("HTTP_CLIENT_IP");
//            Logs.print(">>>> HTTP_CLIENT_IP : " + ip);
//        }
//        if (ip == null) {
//            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//            Logs.print(">>>> HTTP_X_FORWARDED_FOR : " + ip);
//        }
//        if (ip == null) {
//            ip = request.getRemoteAddr();
//            Logs.print(">>>> REMOTE ADDR : " + ip);
//        }

	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("X-Real-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("X-RealIP");
	    }	    
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("REMOTE_ADDR");
	    }		    
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }        

        return ip;
	}
	
	public Boolean isMobileReq(HttpServletRequest request) {
		String userAgent = request.getHeader("user-agent");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian |Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		
		return mobile1 || mobile2;
	}
	
}
