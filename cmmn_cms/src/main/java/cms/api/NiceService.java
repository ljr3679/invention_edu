package cms.api;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import NiceID.Check.CPClient;
import cms.constant.Const;
import cms.enc.EncryptModule;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Component
public class NiceService {

	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;

	public EgovMap nicePrepare(HttpSession session, String successCall, String failureCall) {
		CPClient niceCheck = new CPClient();
		
		String niceSiteCode = encryptModule.decryptAREA(propertiesService.getString(Const.NICE_SITE_CODE));
		String niceSitePassword = encryptModule.decryptAREA(propertiesService.getString(Const.NICE_SITE_PASS));
		
		String sRequestNumber = niceCheck.getRequestNO(niceSiteCode);
		session.setAttribute("REQ_SEQ", sRequestNumber);
		
		String sAuthType = "";
		//M(휴대폰), X(인증서공통), U(공동인증서), F(금융인증서), S(PASS인증서), C(신용카드) -> default OK
		String customize = "";
		//Mobile : 모바일페이지 -> default OK
		
		String sReturnUrl = successCall;
		String sErrorUrl = failureCall;
		String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber + "8:SITECODE" + niceSiteCode.getBytes().length + ":" + niceSiteCode + "9:AUTH_TYPE" + sAuthType.getBytes().length + ":" + sAuthType + "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl + "7:ERR_URL" + sErrorUrl.getBytes().length + ":" + sErrorUrl + "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize;
		
		String sMessage = "";
	    String sEncData = "";
	    
	    int iReturn = niceCheck.fnEncode(niceSiteCode, niceSitePassword, sPlainData);
	    switch (iReturn) {
			case 0: sEncData = niceCheck.getCipherData(); break;
			case -1: sMessage = "암호화 시스템 에러입니다."; break;
			case -2: sMessage = "암호화 처리오류입니다."; break;
			case -3: sMessage = "암호화 데이터 오류입니다."; break;
			case -9: sMessage = "입력 데이터 오류입니다."; break;
			default: sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn; break;
		}
		
	    EgovMap resultMap = new EgovMap();
	    resultMap.put("result", iReturn);
	    resultMap.put("msg", sMessage);
	    resultMap.put("encData", sEncData);
	    
	    return resultMap;
	}
	
	public EgovMap niceSuccess(HttpServletRequest request) {
		CPClient niceCheck = new CPClient();
		
		String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
		
		String niceSiteCode = encryptModule.decryptAREA(propertiesService.getString(Const.NICE_SITE_CODE));
		String niceSitePassword = encryptModule.decryptAREA(propertiesService.getString(Const.NICE_SITE_PASS));
	    
		int iReturn = niceCheck.fnDecode(niceSiteCode, niceSitePassword, sEncodeData);
		String sMessage = "";
		
		EgovMap resultMap = new EgovMap();
			switch (iReturn) {
			case 0:
				String sPlainData = niceCheck.getPlainData();
				
				HashMap mapresult = niceCheck.fnParse(sPlainData);
				
				String sCipherTime								= niceCheck.getCipherDateTime();			// 복호화한 시간
			    String sRequestNumber							= (String) mapresult.get("REQ_SEQ");      	// 요청 번호
			    String sResponseNumber							= (String) mapresult.get("RES_SEQ");      	// 인증 고유번호
			    String sAuthType								= (String) mapresult.get("AUTH_TYPE");    	// 인증 수단
			    String sName									= (String) mapresult.get("NAME");         	// 성명
			    String sDupInfo									= (String) mapresult.get("DI");    			// 중복가입 확인값 (DI_64 byte)
			    String sConnInfo								= (String) mapresult.get("CI");      		// 연계정보 확인값 (CI_88 byte)
			    String sBirthDate								= (String) mapresult.get("BIRTHDATE"); 		// 생년월일(YYYYMMDD)
			    String sGender									= (String) mapresult.get("GENDER");         // 성별
			    String sNationalInfo							= (String) mapresult.get("NATIONALINFO");   // 내/외국인정보 (개발가이드 참조)
				String sMobileNo								= (String) mapresult.get("MOBILE_NO");    	// 휴대폰번호
				String sMobileCo								= (String) mapresult.get("MOBILE_CO");    	// 통신사
				
				String session_sRequestNumber = (String) request.getSession().getAttribute("REQ_SEQ");
			    if(!sRequestNumber.equals(session_sRequestNumber)) {
			    	sMessage = "세션값 불일치 오류입니다.";
		            sResponseNumber = "";
		            sAuthType = "";
			    } else {
			    	resultMap.put("unique", sDupInfo);
			    	resultMap.put("name", sName);
			    	resultMap.put("birth", sBirthDate);
			    	resultMap.put("gender", sGender);
			    	
			    	String phone1 = sMobileNo.substring(0, 3);
					String phone2 = sMobileNo.substring(3, 7);
					String phone3 = sMobileNo.substring(7, 11);
			    	resultMap.put("phone", phone1+"-"+phone2+"-"+phone3);
			    }
				break;
			case -1: sMessage = "복호화 시스템 오류입니다."; break;
			case -4: sMessage = "복호화 처리 오류입니다."; break;
			case -5: sMessage = "복호화 해쉬 오류입니다."; break;
			case -6: sMessage = "복호화 데이터 오류입니다."; break;
			case -9: sMessage = "입력 데이터 오류입니다."; break;
			case -12: sMessage = "사이트 패스워드 오류입니다."; break;
			default: sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn; break;
		}
	    
		
	    resultMap.put("result", iReturn);
	    resultMap.put("msg", sMessage);
        
		return resultMap;
	}
	
	public String requestReplace(String paramValue, String gubun) {
		String result = "";
        
		if (paramValue != null) {
			paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
			paramValue = paramValue.replaceAll("\\*", "");
			paramValue = paramValue.replaceAll("\\?", "");
			paramValue = paramValue.replaceAll("\\[", "");
			paramValue = paramValue.replaceAll("\\{", "");
			paramValue = paramValue.replaceAll("\\(", "");
			paramValue = paramValue.replaceAll("\\)", "");
			paramValue = paramValue.replaceAll("\\^", "");
			paramValue = paramValue.replaceAll("\\$", "");
			paramValue = paramValue.replaceAll("'", "");
			paramValue = paramValue.replaceAll("@", "");
			paramValue = paramValue.replaceAll("%", "");
			paramValue = paramValue.replaceAll(";", "");
			paramValue = paramValue.replaceAll(":", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll("#", "");
			paramValue = paramValue.replaceAll("--", "");
			paramValue = paramValue.replaceAll("-", "");
			paramValue = paramValue.replaceAll(",", "");
        	
			if(gubun != "encodeData"){
				paramValue = paramValue.replaceAll("\\+", "");
				paramValue = paramValue.replaceAll("/", "");
				paramValue = paramValue.replaceAll("=", "");
			}
        	
			result = paramValue;
		}
		
		return result;
	}
	
}
