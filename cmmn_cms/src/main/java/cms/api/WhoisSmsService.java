package cms.api;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Vector;

import javax.annotation.Resource;

import org.apache.xmlrpc.XmlRpcClient;
import org.apache.xmlrpc.XmlRpcException;
import org.springframework.stereotype.Component;

import cms.constant.Const;
import cms.data.StaticData;
import cms.enc.EncryptModule;

@Component
public class WhoisSmsService {
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;

	private String mId;
	private String mPass;
	private String mTo;
	private String mFrom;
	private String mMessage;
	private String mDate;
	private String mYear;
	private String mMonth;
	private String mSmsType;
	private int mRetCode;
	private String mRetMessage;
	private Hashtable mStatistic;
	private int mLastPoint;
	private static String server_url = "http://www.whoisweb.net/emma/API/EmmaSend_JSP.php";
	
	public void setId(String arg) {
		this.mId = arg;
	}
	  
	public void setPass(String arg) {
		this.mPass = arg;
	}
	  
	public void setTo(String arg) {
		this.mTo = arg;
	}
	  
	public void setFrom(String arg) {
		this.mFrom = arg;
	}
	  
	public void setMessage(String arg) {
		this.mMessage = arg;
	}
	  
	public void setDate(String arg) {
		this.mDate = arg;
	}
	  
	public void setYear(Integer arg) {
		this.mYear = arg.toString();
	}
	  
	public void setMonth(Integer arg) {
		this.mMonth = arg.toString();
	}
	  
	public void setSmsType(String arg) {
		this.mSmsType = arg;
	}
	  
	public String getDate() {
		return this.mYear + "-" + this.mMonth;
	}
	  
	public void login(String pId, String pPass) {
		setId(pId);
		setPass(pPass);
	}
	  
	public void setParams(String pId, String pPass, String pTo, String pFrom, String pMessage, String pDate) {
		setId(pId);
		setPass(pPass);
		setTo(pTo);
		setFrom(pFrom);
		setMessage(pMessage);
		setDate(pDate);
	}
	  
	public void setParams(String pTo, String pFrom, String pMessage, String pDate) {
		setTo(pTo);
		setFrom(pFrom);
		setMessage(pMessage);
	    setDate(pDate);
	}
	  
	public void setParams(String pTo, String pFrom, String pMessage, String pDate, String pSmsType) {
		setTo(pTo);
		setFrom(pFrom);
		setMessage(pMessage);
		setDate(pDate);
		setSmsType(pSmsType);
	}
	  
	public void setParams(String pId, String pPass, Integer pYear, Integer pMonth) {
		setId(pId);
		setPass(pPass);
		setYear(pYear);
		setMonth(pMonth);
	}
	  
	public void setParams(Integer pYear, Integer pMonth) {
		setYear(pYear);
		setMonth(pMonth);
	}
	  
	public void setUtf8() {
		server_url = "http://www.whoisweb.net/emma/API/EmmaSend_JSP_All.php";
	}
	  
	public int getRetCode() {
		return this.mRetCode;
	}
	  
	public String getRetMessage() {
		return this.mRetMessage;
	}
	  
	public int getLastPoint() {
		return this.mLastPoint;
	}
	  
	public Hashtable getStatistic() {
		return this.mStatistic;
	}
	  
	public void emmaSend() {
		try {
			XmlRpcClient server = new XmlRpcClient(server_url);
			
			Vector params = new Vector();
	      
			params.addElement(this.mId);
			params.addElement(this.mPass);
			params.addElement(this.mTo);
			params.addElement(this.mFrom);
			params.addElement(this.mMessage);
			params.addElement(this.mDate);
			if (this.mSmsType == null) {
				//this.mSmsType = new String();
				this.mSmsType = "";
			}
			params.addElement(this.mSmsType);
	      
			Hashtable result = (Hashtable)server.execute("EmmaSend", params);
			if ((result.get("Code") instanceof String)) {
				String retCode = (String)result.get("Code");
				this.mRetCode = new Integer(retCode).intValue();
			} else {
				this.mRetCode = ((Integer)result.get("Code")).intValue();
			}
			if (this.mRetCode == 0) {
				this.mLastPoint = ((Integer)result.get("LastPoint")).intValue();
			}
			this.mRetMessage = result.get("CodeMsg").toString();
		} catch (XmlRpcException exception) {
			//System.err.println("JavaClient: XML-RPC Fault #" + Integer.toString(exception.code) + ": " + exception.toString());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
	  
	public void emmaPoint() {
		try {
			XmlRpcClient server = new XmlRpcClient(server_url);
	      
			Vector params = new Vector();
	      
			params.addElement(this.mId);
			params.addElement(this.mPass);
	      
			Hashtable result = (Hashtable)server.execute("EmmaPoint", params);
			if ((result.get("Code") instanceof String)) {
				String retCode = (String)result.get("Code");
				this.mRetCode = new Integer(retCode).intValue();
			} else {
				this.mRetCode = ((Integer)result.get("Code")).intValue();
			}
			if (this.mRetCode == 0) {
				this.mLastPoint = ((Integer)result.get("Point")).intValue();
			}
			this.mRetMessage = result.get("CodeMsg").toString();
		} catch (XmlRpcException exception) {
			//System.err.println("JavaClient: XML-RPC Fault #" + 	Integer.toString(exception.code) + ": " + exception.toString());
		} catch (Exception exception) {
			//System.err.println("JavaClient: " + exception.toString());
			exception.printStackTrace();
		}
	}
	  
	public void emmaStatistic() {
		try {
			XmlRpcClient server = new XmlRpcClient(server_url);
	      
			Vector params = new Vector();
	      
			params.addElement(this.mId);
			params.addElement(this.mPass);
			params.addElement(getDate());
	      
			Hashtable result = (Hashtable)server.execute("EmmaStatistic", params);
			if ((result.get("Code") instanceof String)) {
				String retCode = (String)result.get("Code");
				this.mRetCode = new Integer(retCode).intValue();
			} else {
				this.mRetCode = ((Integer)result.get("Code")).intValue();
			}
			if (this.mRetCode == 0) {
				this.mLastPoint = ((Integer)result.get("Point")).intValue();
				this.mStatistic = ((Hashtable)result.get("Statistics"));
			}
			this.mRetMessage = result.get("CodeMsg").toString();
		} catch (XmlRpcException exception) {
			//System.err.println("JavaClient: XML-RPC Fault #" + Integer.toString(exception.code) + ": " + exception.toString());
		} catch (Exception exception) {
			//System.err.println("JavaClient: " + exception.toString());
		}
	}
	
	public void sendSms(String receipt, String sender, String msg) throws Exception {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
		    Date cNow = new Date();
		    String toDayTime = sdf.format(cNow);
		    
			setUtf8();
		    login(encryptModule.decryptAREA(StaticData.getInstance().getGlobalsProp().getProperty(Const.WHO_IS_ID)), encryptModule.decryptAREA(StaticData.getInstance().getGlobalsProp().getProperty(Const.WHO_IS_PW)));
		    setParams(receipt, sender, new String(msg.getBytes(),"ISO-8859-1"), toDayTime, "L");	
		    emmaSend();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	  
}
