package cms.util;

import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class CustomHttpServletRequest extends HttpServletRequestWrapper {

	private HashMap<String, Object> params;
	
	public CustomHttpServletRequest(HttpServletRequest request) {
		super(request);
		this.params = new HashMap<String, Object>(request.getParameterMap());
		// TODO Auto-generated constructor stub
	}

	@Override
	public String getParameter(String name) {
		// TODO Auto-generated method stub
		String returnValue = null;
		String[] paramArray = getParameterValues(name);
		if(paramArray != null && paramArray.length > 0) returnValue = paramArray[0];
		return returnValue;
	}
	
	@Override
	public String[] getParameterValues(String name) {
		// TODO Auto-generated method stub
		String[] result = null;
		Object temp = params.get(name);
		if(temp != null) {
			if(temp instanceof String) {
				result = new String[] {String.valueOf(temp)};
				return result;
			} else if(temp instanceof String[]) {
				result = (String[]) temp;
				return result;
			} else return super.getParameterValues(name);
		} return super.getParameterValues(name);
	}

	@Override
	public Map getParameterMap() {
		// TODO Auto-generated method stub
		return Collections.unmodifiableMap(this.params);
	}

	@Override
	public Enumeration getParameterNames() {
		// TODO Auto-generated method stub
		return Collections.enumeration(this.params.keySet());
	}
	
	public void setParameter(String key, Object value) {
		this.params.put(key, value);
	}

}
