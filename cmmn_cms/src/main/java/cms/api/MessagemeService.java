package cms.api;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MessagemeService {

	public String sendSms(String callback, String dstaddr, String subj, String msg) throws Exception {
		String apiUrl = "http://221.139.14.136/APIV2/API/sms_send";			
		URL url = null;
	    String readLine = null;
	    StringBuilder buffer = null;
	    OutputStream outputStream = null;
	    BufferedReader bufferedReader = null;
	    BufferedWriter bufferedWriter = null;
	    HttpURLConnection urlConnection = null;
	    String resultCode = null;
	    
	    int connTimeout = 5000;
	    int readTimeout = 3000;

	    HashMap<String, Object> resultMap = new HashMap();
	    //resultMap.put("api_key", StaticData.getInstance().getGlobalsProp().getProperty(Const.MESSAGEME_API_KEY));    //파라미터 설정
	    resultMap.put("api_key","GXI5CJC5V5R0805");
	    resultMap.put("subject", subj);	//메시지 내용
	    resultMap.put("msg", msg);	//메시지 내용
	    resultMap.put("callback", callback);	//발신번호
	    resultMap.put("dstaddr", dstaddr);	//수신번호
	    resultMap.put("send_reserve", "0");  //즉시발송
	    resultMap.put("call_block", "0");	//080 수신거부사용안함
	    ObjectMapper mapper = new ObjectMapper();
	    
	    String smsTxt = "api_key=GXI5CJC5V5R0805&msg="+msg+"&subject="+subj+"&callback="+callback+"&dstaddr="+dstaddr+"&send_reserve=0&call_block=0";
	    
	    
	    
	    String sendData = mapper.writeValueAsString(resultMap);
	    
		try {
			url = new URL(apiUrl);
	        urlConnection = (HttpURLConnection)url.openConnection();
	        urlConnection.setRequestMethod("POST");			
	        urlConnection.setConnectTimeout(connTimeout);
	        urlConnection.setReadTimeout(readTimeout);
	        urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;");
	        //urlConnection.setRequestProperty("message body", "application/x-www-form-urlencoded;");
	        urlConnection.setDoOutput(true);
	        urlConnection.setInstanceFollowRedirects(true);
	        
	        outputStream = urlConnection.getOutputStream();
	        
	        bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream,"UTF-8"));
	        
	        //System.out.println(smsTxt);
	        
	        bufferedWriter.write(smsTxt);
	        bufferedWriter.flush();	        
	        
	        if(urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) 
	        {
	            bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
	            
	            readLine = bufferedReader.readLine();
	            JSONParser parser = new JSONParser();

	            Object obj = parser.parse(readLine);
	            
	            JSONObject jsonObj = (JSONObject) obj;
	            resultCode = (String) jsonObj.get("result");
	            //	            while((readLine = bufferedReader.readLine()) != null) 
//	            {
//	                buffer.append(readLine).append("\n");
//	            }
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");	            
	        }
	        else 
	        {
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");
	        }	        

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        try 
	        {
	            if (bufferedWriter != null) { bufferedWriter.close(); }
	            if (outputStream != null) { outputStream.close(); }
	            if (bufferedReader != null) { bufferedReader.close(); }
	        }
	        catch(Exception ex) 
	        { 
	            ex.printStackTrace();
	        }
	    }
		
		//System.out.println("결과 : " + readLine);		
		return resultCode;
	}	
	
	public String sendSmsReserve(String callback, String dstaddr, String sendreservedate, String subj, String msg) throws Exception {
		String apiUrl = "http://221.139.14.136/APIV2/API/sms_send";			
		URL url = null;
	    String readLine = null;
	    StringBuilder buffer = null;
	    OutputStream outputStream = null;
	    BufferedReader bufferedReader = null;
	    BufferedWriter bufferedWriter = null;
	    HttpURLConnection urlConnection = null;
	    String resultCode = null;
	    
	    int connTimeout = 5000;
	    int readTimeout = 3000;

	    HashMap<String, Object> resultMap = new HashMap();
	    //resultMap.put("api_key", StaticData.getInstance().getGlobalsProp().getProperty(Const.MESSAGEME_API_KEY));    //파라미터 설정
	    resultMap.put("api_key","GXI5CJC5V5R0805");
	    resultMap.put("subject", subj);	//메시지 내용
	    resultMap.put("msg", msg);	//메시지 내용
	    resultMap.put("callback", callback);	//발신번호
	    resultMap.put("dstaddr", dstaddr);	//수신번호
	    resultMap.put("send_reserve", "1");  //예약발송
	    resultMap.put("send_reserve_date", sendreservedate);  //발송시간 2020|09|24|13|20|00
	    resultMap.put("call_block", "0");	//080 수신거부사용안함
	    ObjectMapper mapper = new ObjectMapper();
	    
	    String smsTxt = "api_key=GXI5CJC5V5R0805&msg="+msg+"&subject="+subj+"&callback="+callback+"&dstaddr="+dstaddr+"&send_reserve=1&send_reserve_date="+sendreservedate+"&call_block=0";
	    
	    
	    
	    String sendData = mapper.writeValueAsString(resultMap);
	    
		try {
			url = new URL(apiUrl);
	        urlConnection = (HttpURLConnection)url.openConnection();
	        urlConnection.setRequestMethod("POST");			
	        urlConnection.setConnectTimeout(connTimeout);
	        urlConnection.setReadTimeout(readTimeout);
	        urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;");
	        //urlConnection.setRequestProperty("message body", "application/x-www-form-urlencoded;");
	        urlConnection.setDoOutput(true);
	        urlConnection.setInstanceFollowRedirects(true);
	        
	        outputStream = urlConnection.getOutputStream();
	        
	        bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream,"UTF-8"));
	        
	        //System.out.println(smsTxt);
	        
	        bufferedWriter.write(smsTxt);
	        bufferedWriter.flush();	        
	        
	        if(urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) 
	        {
	            bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
	            
	            readLine = bufferedReader.readLine();
	            JSONParser parser = new JSONParser();

	            Object obj = parser.parse(readLine);
	            
	            JSONObject jsonObj = (JSONObject) obj;
	            resultCode = (String) jsonObj.get("result");
	            //	            while((readLine = bufferedReader.readLine()) != null) 
//	            {
//	                buffer.append(readLine).append("\n");
//	            }
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");	            
	        }
	        else 
	        {
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");
	        }	        

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        try 
	        {
	            if (bufferedWriter != null) { bufferedWriter.close(); }
	            if (outputStream != null) { outputStream.close(); }
	            if (bufferedReader != null) { bufferedReader.close(); }
	        }
	        catch(Exception ex) 
	        { 
	            ex.printStackTrace();
	        }
	    }
		
		//System.out.println("결과 : " + readLine);		
		return resultCode;
	}		
	
	
	public String remainCash() throws Exception {
		String apiUrl = "http://221.139.14.136/APIV2/API/remainCash";
		URL url = null;
	    String readLine = null;
	    StringBuilder buffer = null;
	    OutputStream outputStream = null;
	    BufferedReader bufferedReader = null;
	    BufferedWriter bufferedWriter = null;
	    HttpURLConnection urlConnection = null;
        String remainCash = null;
            
	    
	    int connTimeout = 5000;
	    int readTimeout = 3000;

	    HashMap<String, Object> resultMap = new HashMap();
	    //resultMap.put("api_key", StaticData.getInstance().getGlobalsProp().getProperty(Const.MESSAGEME_API_KEY));    //파라미터 설정
	    resultMap.put("api_key","GXI5CJC5V5R0805");
	    ObjectMapper mapper = new ObjectMapper();
	    
	    String smsTxt = "api_key=GXI5CJC5V5R0805";
	    
	    
	    
	    String sendData = mapper.writeValueAsString(resultMap);
	    
		try {
			url = new URL(apiUrl);
	        urlConnection = (HttpURLConnection)url.openConnection();
	        urlConnection.setRequestMethod("POST");			
	        urlConnection.setConnectTimeout(connTimeout);
	        urlConnection.setReadTimeout(readTimeout);
	        urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;");
	        //urlConnection.setRequestProperty("message body", "application/x-www-form-urlencoded;");
	        urlConnection.setDoOutput(true);
	        urlConnection.setInstanceFollowRedirects(true);
	        
	        outputStream = urlConnection.getOutputStream();
	        
	        bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream,"UTF-8"));
	        
	        //System.out.println(smsTxt);
	        
	        bufferedWriter.write(smsTxt);
	        bufferedWriter.flush();	        
	        
	        if(urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) 
	        {
	            bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
	            
	            readLine = bufferedReader.readLine();
	            JSONParser parser = new JSONParser();

	            Object obj = parser.parse(readLine);
	            
	            JSONObject jsonObj = (JSONObject) obj;
	            remainCash = (String) jsonObj.get("remainCash");
	            
//	            while((readLine = bufferedReader.readLine()) != null) 
//	            {
//	                buffer.append(readLine).append("\n");
//	            }
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");	            
	        }
	        else 
	        {
	            //buffer.append("\"code\" : \""+urlConnection.getResponseCode()+"\"");
	            //buffer.append(", \"message\" : \""+urlConnection.getResponseMessage()+"\"");
	        }	        

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	        try 
	        {
	            if (bufferedWriter != null) { bufferedWriter.close(); }
	            if (outputStream != null) { outputStream.close(); }
	            if (bufferedReader != null) { bufferedReader.close(); }
	        }
	        catch(Exception ex) 
	        { 
	            ex.printStackTrace();
	        }
	    }
		
		return remainCash;		
	}		
	
	
	
}
