package cms.api;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.sci.v2.pccv2.secu.SciSecuManager;

import cms.constant.Const;
import cms.enc.EncryptModule;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Component
public class BizsirenMobileService {
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="encryptModule")
	private EncryptModule encryptModule;
	
	public EgovMap bizsirenMobilePrepare(String successCall) {
		String id = encryptModule.decryptAREA(propertiesService.getString(Const.BIZSIREN_MOBILE_ID));
		String pw = encryptModule.decryptAREA(propertiesService.getString(Const.BIZSIREN_MOBILE_PW));
		String srvNo = encryptModule.decryptAREA(propertiesService.getString(Const.BIZSIREN_MOBILE_SRVNO));
		String reqNum = "123456789";
		String exVar    = "0000000000000000";
		Calendar today = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss",Locale.KOREA);
		String certDate = sdf.format(today.getTime());
		String certGb = "H";
		String addVar = "";
		
		String encStr = "";
		String reqInfo = id+"^"+srvNo+"^"+reqNum+"^"+certDate+"^"+certGb+"^"+addVar+"^"+exVar;
		
		SciSecuManager seed = new SciSecuManager();
		seed.setInfoPublic(id,pw);
		
		encStr = seed.getEncPublic(reqInfo);
		
		String hmacMsg = seed.getEncReq(encStr,"HMAC");
		reqInfo = seed.getEncPublic(encStr + "^" + hmacMsg + "^" + "0000000000000000");
		reqInfo = seed.EncPublic(reqInfo + "^" + id + "^"  + "00000000");
		
		EgovMap resultMap = new EgovMap();
	    resultMap.put("reqInfo", reqInfo);
	    resultMap.put("successCall", successCall);
		
		return resultMap;
	}
	
	public EgovMap bizsirenMobileSuccess(HttpServletRequest request) {
		String enc_retInfo = request.getParameter("retInfo").trim();
		
		String retInfo		= enc_retInfo;																// 결과정보

		String id			= encryptModule.decryptAREA(propertiesService.getString(Const.BIZSIREN_MOBILE_ID));                                                               //회원사 비즈사이렌아이디
		String pw 			= encryptModule.decryptAREA(propertiesService.getString(Const.BIZSIREN_MOBILE_PW));
		String name			= "";                                                               //성명
		String sex			= "";																//성별
		String birYMD		= "";																//생년월일
		String fgnGbn		= "";																//내외국인 구분값
		String scCode		= "";																//가상식별번호
	    String di			= "";																//DI
	    String ci1			= "";																//CI
	    String ci2			= "";																//CI
	    String civersion    = "";                                                               //CI Version
	    
	    String reqNum		= "";                                                               // 본인확인 요청번호
	    String result		= "";                                                               // 본인확인결과 (Y/N)
	    String certDate		= "";                                                               // 검증시간
	    String certGb		= "";                                                               // 인증수단
		String cellNo		= "";																// 핸드폰 번호
		String cellCorp		= "";																// 이동통신사
		String addVar		= "";

		//예약 필드
		String ext1			= "";
		String ext2			= "";
		String ext3			= "";
		String ext4			= "";
		String ext5			= "";

		//복화화용 변수
		String encPara		= "";
		String encMsg		= "";
		String msgChk       = "N";  
		
		reqNum = "123456789";
		
		EgovMap resultMap = new EgovMap();
		
		try {
			SciSecuManager sciSecuMg = new SciSecuManager();
			sciSecuMg.setInfoPublic(id,pw);
			
			retInfo  = sciSecuMg.getDec(retInfo, reqNum);
			
			String[] aRetInfo1 = retInfo.split("\\^");
			encPara  = aRetInfo1[0];
			encMsg   = aRetInfo1[1];
			
			String encMsg2   = sciSecuMg.getMsg(encPara);
			
			if(encMsg2.equals(encMsg)) msgChk="Y";
	        
			if(msgChk.equals("N")) {
				resultMap.put("result", "N");
			} else {
				retInfo  = sciSecuMg.getDec(encPara, reqNum);

		        String[] aRetInfo = retInfo.split("\\^");
				
		        name		= aRetInfo[0];
				birYMD		= aRetInfo[1];
		        sex			= aRetInfo[2];        
		        fgnGbn		= aRetInfo[3];
		        di			= aRetInfo[4];
		        ci1			= aRetInfo[5];
		        ci2			= aRetInfo[6];
		        civersion	= aRetInfo[7];
		        reqNum		= aRetInfo[8];
		        result		= aRetInfo[9];
		        certGb		= aRetInfo[10];
				cellNo		= aRetInfo[11];
				cellCorp	= aRetInfo[12];
		        certDate	= aRetInfo[13];
				addVar		= aRetInfo[14];

				//예약 필드
				ext1		= aRetInfo[15];
				ext2		= aRetInfo[16];
				ext3		= aRetInfo[17];
				ext4		= aRetInfo[18];
				ext5		= aRetInfo[19];
				
				resultMap.put("result", "Y");
				resultMap.put("unique", di);
		    	resultMap.put("name", name);
		    	resultMap.put("birth", birYMD);
		    	resultMap.put("gender", sex);
		    	
		    	String phone1 = cellNo.substring(0, 3);
				String phone2 = cellNo.substring(3, 7);
				String phone3 = cellNo.substring(7, 11);
		    	resultMap.put("phone", phone1+"-"+phone2+"-"+phone3);
			}
		} catch(Exception e) {
			e.printStackTrace();
			resultMap.put("result", "N");
		}
		
		return resultMap;
	}
	

}
