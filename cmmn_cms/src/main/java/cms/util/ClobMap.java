package cms.util;

import java.io.BufferedReader;
import java.sql.Clob;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class ClobMap extends EgovMap {

	@Override
	public Object put(Object key, Object value) {
		// TODO Auto-generated method stub
		if(value instanceof Clob) {
			
			try {
				Clob clob = (Clob) value;
				BufferedReader br = new BufferedReader(clob.getCharacterStream());
				
				StringBuffer sb = new StringBuffer();
				String str = "";
				while((str = br.readLine()) != null) sb.append(str);
					
				value = sb.toString();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return super.put(key, value);
	}
}
