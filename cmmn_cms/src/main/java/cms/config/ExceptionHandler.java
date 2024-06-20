package cms.config;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.constant.Const;
import cms.util.Logs;

@Controller
@RequestMapping(value="/common/error/")
public class ExceptionHandler {
	
	@RequestMapping(value = {"throwable.error", "exception.error", "400.error", "403.error", "404.error", "405.error", "500.error", "503.error"})
	public String handler(
			HttpServletRequest request, 
			ModelMap model) {
		String uri = request.getRequestURI();
		String error = "";
		String msg = "";
		if(uri.indexOf("throwable") != -1) {
			error = "throwable";
			msg = "예외가 발생하였습니다.";
		}
		else if(uri.indexOf("exception") != -1) {
			error = "exception";
			msg = "예외가 발생하였습니다.";
		}
		else if(uri.indexOf("400") != -1) {
			error = "400 ERROR";
			msg = "잘못된 요청입니다.";
		}
		else if(uri.indexOf("403") != -1) {
			error = "403 ERROR";
			msg = "접근이 금지되었습니다.";
		}
		else if(uri.indexOf("404") != -1) {
			error = "404 ERROR";
			msg = "요청하신 페이지는 존재하지 않습니다.";
		}
		else if(uri.indexOf("405") != -1) {
			error = "405 ERROR";
			msg = "요청된 메소드가 허용되지 않습니다.";
		}
		else if(uri.indexOf("500") != -1) {
			error = "500 ERROR";
			msg = "서버에 오류가 발생하였습니다.";
		}
		else if(uri.indexOf("503") != -1) {
			error = "503 ERROR";
			msg = "서비스를 사용할 수 없습니다.";
		}
		
		pageErrorLog(request, error);
		model.addAttribute("msg", msg);
		
		return Const.ERROR_HANDER;
	}

	private void pageErrorLog(HttpServletRequest request, String error) {
		Logs.printError("======================= WEB "+request.getAttribute("javax.servlet.error.status_code")+" ===========================");
		Logs.printError("[Exception - "+error+"]");
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
