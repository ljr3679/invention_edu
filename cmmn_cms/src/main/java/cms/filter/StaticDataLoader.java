package cms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import cms.data.StaticData;

public class StaticDataLoader implements Filter {

	@Override
	public void doFilter(
			ServletRequest request, 
			ServletResponse response, 
			FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		StaticData.getInstance();
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
