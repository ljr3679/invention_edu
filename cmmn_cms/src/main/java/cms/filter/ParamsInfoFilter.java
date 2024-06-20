package cms.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;

import cms.data.StaticData;
import cms.util.Logs;

public class ParamsInfoFilter implements Filter {

	@Override
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain chain
			) throws IOException, ServletException {
		Logs.print("---------------------------- PARAMS INFOMATION ----------------------------");
		Enumeration<?> params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = String.valueOf(params.nextElement());
		    String value = String.valueOf(request.getParameter(name));
		    if(!value.equals("null") && value.trim().length() > 0) Logs.print(name + " : " +value);
		}
		Logs.print("---------------------------- PARAMS INFOMATION ----------------------------");
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
