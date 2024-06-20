package cms.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import cms.util.Logs;

public class SimpleMappingException extends SimpleMappingExceptionResolver {

	@Override
	public ModelAndView resolveException(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler,
			Exception ex) {
		
		pageErrorLog(request, ex);
		request.setAttribute("msg", request.getAttribute("javax.servlet.error.status_code"));
		
		return super.resolveException(request, response, handler, ex);
	}
	
	private void pageErrorLog(HttpServletRequest request, Exception ex) {
		ex.printStackTrace();
		Logs.printError("======================= WEB "+request.getAttribute("javax.servlet.error.status_code")+" ===========================");
		Logs.printError("[SimpleMappingException - "+ex.getStackTrace()+"]");
		Logs.printError(" ");
		Logs.printError("status_code : "+ request.getAttribute("javax.servlet.error.status_code"));
		Logs.printError("exception_type : "+ request.getAttribute("javax.servlet.error.exception_type"));
		Logs.printError("message : "+ request.getAttribute("javax.servlet.error.message"));
		Logs.printError("request_uri : "+ request.getAttribute("javax.servlet.error.request_uri"));
		Logs.printError("exception : "+ request.getAttribute("javax.servlet.error.exception"));
		Logs.printError("servlet_name : "+ request.getAttribute("javax.servlet.error.servlet_name"));
		Logs.printError(" ");
		Logs.printError("======================= WEB "+request.getAttribute("javax.servlet.error.status_code")+" End =======================");
	}

}
