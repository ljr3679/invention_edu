package cms.util;

import java.lang.reflect.Method;

public final class Serialize {

	public final static String build(Object c) {
		StringBuilder sb = new StringBuilder(); 
		try {
			Method[] ms = c.getClass().getDeclaredMethods();
			sb.append("======================================= TOSTRING BUILD =======================================\n");
			for(Method m : ms) {
				String getName = m.getName();
				if(getName.startsWith("get") || getName.startsWith("is")) {
					Object o = null;
					if((o = m.invoke(c)) != null && String.valueOf(o).length() > 0) {
						sb.append(String.valueOf(getName.charAt(getName.startsWith("get") ?3 :2)).toLowerCase()+getName.substring(getName.startsWith("get") ?4 : 3)+":"+o+"\n");	
					}
				}
			}
			sb.append("======================================= TOSTRING BUILD =======================================\n");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return sb.toString();
	}
	
}
