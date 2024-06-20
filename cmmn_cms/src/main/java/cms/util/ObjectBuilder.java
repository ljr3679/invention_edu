package cms.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

@Component("objectBuilder")
public class ObjectBuilder {
	
	private JSONObject json = new JSONObject();
	
	public HashMap<?,?> jsonParse(String jsonStr) {
		HashMap<Object, Object> reusltMap = new HashMap<Object, Object>();
		try {
			JSONParser json = new JSONParser();
			this.json = (JSONObject) json.parse(jsonStr);
			Iterator<?> iterator = this.json.keySet().iterator();
			
			while(iterator.hasNext()) {
				Object key = iterator.next();
				Object value = this.json.get(key);
				if(value instanceof String) {
					reusltMap.put(key.toString(), value.toString());
				} else if(value instanceof JSONArray) {
					JSONParser innerJsonParse = new JSONParser();
					JSONObject innerJson = new JSONObject();
					JSONArray innerArray = new JSONArray();
					innerArray = (JSONArray) innerJsonParse.parse(value.toString());
					
					List<Object> resultList = new ArrayList<Object>(); 
					
					for(int i=0; i<innerArray.size(); i++) {
						innerJson = (JSONObject) innerArray.get(i);
						
						Iterator<?> innerIterator = innerJson.keySet().iterator();
						
						while(innerIterator.hasNext()) {
							HashMap<Object, Object> innerMap = new HashMap<Object, Object>();
							Object innerKey = innerIterator.next();
							Object innerValue = innerJson.get(innerKey);
							innerMap.put(innerKey.toString(), innerValue.toString());
							resultList.add(innerMap);
						}
					}
					reusltMap.put(key, resultList);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return reusltMap;
	}
	
	public ObjectBuilder jsonArrayBuild(String resultKey, String key, List<?> values) {
		JSONArray arrayJson = new JSONArray();
		for(Object value : values) {
			JSONObject json = new JSONObject();
			json.put(key, value);
			arrayJson.add(json);
		}
		this.json.put(resultKey, arrayJson);
		return ObjectBuilder.this;
	}

	public ObjectBuilder jsonBulid(String key, Object value) {
		this.json.put(key, value);
		return ObjectBuilder.this;
	}
	
	public JSONObject build() {
		JSONObject clone = (JSONObject) this.json.clone();
		this.json.clear();
		return clone;
	}
	
	public void init() {
		this.json.clear();
	}
	
	public Object cusSetter(Object obj, String methodName, Object[] objList) {
        Method[] methods = obj.getClass().getMethods();
        
        for(int i=0; i<methods.length; i++) {
                if(methods[i].getName().equals(methodName)) {
                        try {
                                if (methods[i].getReturnType().getName().equals("void")) {
                                        methods[i].invoke(obj, objList);        
                                } else {
                                        return methods[i].invoke(obj, objList);
                                }
                        } catch(IllegalAccessException lae) {
                                
                        } catch(InvocationTargetException ite) {
                                
                        }
                }
        }
        return null;
	}
	
	public JSONObject mapToJson(Map map) {
		Iterator it = map.keySet().iterator();
		while(it.hasNext()) {
			Object key = it.next();
			Object value = map.get(key);
			
			this.json.put(key, value);
		}
		return this.build();
	}
	
	public JSONObject listMapToJson(String objectKey, List<Map> listMap) {
		JSONArray arrays = new JSONArray();
		for(Map map : listMap) {
			JSONObject tmpObj = new JSONObject(); 
			Iterator it = map.keySet().iterator();
			while(it.hasNext()) {
				Object key = it.next();
				Object value = map.get(key);
				
				tmpObj.put(key, value);
			}
			arrays.add(tmpObj);
		}
		
		this.json.put(objectKey, arrays);
		
		return this.build();
	}
	
	@Override
	public String toString() {
		return json.toString();
	}
	
}
