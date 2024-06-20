package web.home.kor.admin.homepage.message.ctr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cms.api.MessagemeService;
import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.site.category.svc.CMSCategoryMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.message.svc.HomeKorAdminHomepageMessageSvc;
import whois.whoisSMS;

@Controller
@RequestMapping(value="/homepage/message/")
public class HomeKorAdminHomepageMessageCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepageMessageSvc")
	private HomeKorAdminHomepageMessageSvc homeKorAdminHomepageMessageSvc; 

	@Resource(name="CMSCategoryMngSvc")
	private CMSCategoryMngSvc CMSCategoryMngSvc;	
	
	@Resource(name="messagemeService")
	private MessagemeService messagemeService;
	
	/*@Resource(name="whoisSMS")
	private WhoisSMS whoisSMS;*/
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		String sCash = messagemeService.remainCash();
		model.addAttribute("sCash", sCash);
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminHomepageMessageSvc.selectHomeKorAdminHomepageMessageList(vo);
				Integer totalCnt = homeKorAdminHomepageMessageSvc.selectHomeKorAdminHomepageMessageListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}

	
	@RequestMapping(value="indexLog.do")
	public void indexLog(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminHomepageMessageSvc.selectHomeKorAdminHomepageMessageLogList(vo);
				Integer totalCnt = homeKorAdminHomepageMessageSvc.selectHomeKorAdminHomepageMessageLogListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}	
	
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		String code = "Ci0T891Y3T";
		List<EgovMap> codetList = (List<EgovMap>) CMSCategoryMngSvc.selectCategorySubDataList(code);
		model.addAttribute("codeData", codetList);
		
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			EgovMap resultData = homeKorAdminHomepageMessageSvc.selectHomeKorAdminHomepageMessage(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="member_popup.do")
	public void member_popup(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		setPaging2(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList2 = homeKorAdminHomepageMessageSvc.selectMemberDataList(vo);
				Integer totalCnt2 = homeKorAdminHomepageMessageSvc.selectMemberDataListCnt(vo);
				return new Object[] {resultList2, totalCnt2};
			}
		}, 10, 10);
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				sendSms(vo.getAdm_idx(), vo.getParamKey1(), vo.getParamKey2(), vo.getParamKey3(), vo.getParamKey4());
				homeKorAdminHomepageMessageSvc.insertHomeKorAdminHomepageMessage(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				sendSms(vo.getAdm_idx(), vo.getParamKey1(), vo.getParamKey2(), vo.getParamKey3(), vo.getParamKey4());
				homeKorAdminHomepageMessageSvc.updateHomeKorAdminHomepageMessage(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminHomepageMessageSvc.deleteHomeKorAdminHomepageMessage(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminHomepageMessageSvc.deleteHomeKorAdminHomepageMessageList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
	private void sendSms(String adminIdx, String sender, String receipter, String subject, String contents) throws Exception {
	    //String[] receipterArr = receipter.split(";");
		CommonVO vo = new CommonVO();
	
	    // 보내는 사람번호
	    String sms_from = sender.replace("-", "");	    
	    //System.out.println(receipter);
	    // 보내는 메세지제목
	    String sms_subj = subject;
	    // 보내는 메세지
	    String sms_msg = contents.replace("&", "%26");
	    //String strReceipter = receipter.replace("-", "").replace(";", "|").replace("\r\n", "|");
	    String strReceipter = receipter.replace("-", "").replace("\r\n", ";");


	    String[] receipterArr = strReceipter.split(";");

		//for(String receipt : receipterArr) whoisSMS.sendSms(receipt, sender, contents);
	    for(String receipt : receipterArr) {
	    	
	    	String resultCode = null;
		    // 받는사람번호
		   String sms_to = receipt;
		   
		   if(!sms_to.isEmpty()) {
			   resultCode = messagemeService.sendSms(sms_from, sms_to, sms_subj, sms_msg);
			   		   			   
			   if(!resultCode.isEmpty()) {
				   vo.setAdm_idx(adminIdx);
				   vo.setParamKey1(sms_from);
				   vo.setParamKey2(sms_to);
				   vo.setParamKey3(sms_subj);
				   vo.setParamKey4(sms_msg);   
				   vo.setParamKey5(resultCode);
				   homeKorAdminHomepageMessageSvc.insertHomeKorAdminHomepageMessageLog(vo);
			   }
			   
		   }
	    	
	    }
	}
	
//	private void sendWhoisSms(String sender, String receipter, String contents) throws Exception {
//	    String[] receipterArr = receipter.split(";");
//	    whoisSMS whoisSms = new whoisSMS();
//	    String sms_id = Const.WHO_IS_ID;
//	    String sms_passwd = Const.WHO_IS_PW;
//	    String sms_type = "L";	// 설정 하지 않는다면 80byte 넘는 메시지는 쪼개져서 sms로 발송, L 로 설정하면 80byte 넘으면 자동으로 lms 변환
//	    
//	    whoisSms.login(sms_id, sms_passwd); 
//
//	    // 보내는 사람번호
//	    String sms_from = sender;	    
//
//	    // 보내는 메세지
//	    String sms_msg = contents;
//	    
//	    // 발송시간을 파라메터로 받지 못한경우 현재시간을 입력해줍니다.
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREA);
//		Date cNow = new Date();
//		String sms_date = sdf.format(cNow);
//
//		//for(String receipt : receipterArr) whoisSMS.sendSms(receipt, sender, contents);
//	    for(String receipt : receipterArr) {
//
//		    // 받는사람번호
//		    String sms_to = receipt;
//
//	    	// UTF-8 설정
//	    	whoisSms.setUtf8();
//	    	
//	    	// 파라메터 설정
//	    	whoisSms.setParams (sms_to,sms_from,sms_msg,sms_date, sms_type);
//	    	
//	    	// 문자발송
//	    	whoisSms.emmaSend();
//	    	
//	    	// 결과값 가져오기
//	    	int retCode = whoisSms.getRetCode();
//	    	System.out.println("----------------------------" + retCode);
//
//	    	// 발송결과 메세지
//	    	String retMessage = whoisSms.getRetMessage();
//	    	System.out.println("----------------------------" + retMessage);
//	    	
//	    	
//	    }
//	}	
	
}