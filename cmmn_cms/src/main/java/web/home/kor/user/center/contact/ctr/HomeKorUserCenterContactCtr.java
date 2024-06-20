package web.home.kor.user.center.contact.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.api.EmailService;
import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;
import web.home.kor.user.center.contact.svc.HomeKorUserCenterContactSvc;
import web.home.kor.user.center.find.svc.HomeKorUserCenterFindSvc;

@Controller
@RequestMapping(value="/center/contact/")
public class HomeKorUserCenterContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserCenterContactSvc")
	private HomeKorUserCenterContactSvc homeKorUserCenterContactSvc; 
	
	@Resource(name="emailService")
	private EmailService emailService;
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		if(stringUtil.isNotEmpty(vo.getParamKey1())) vo.setParamKey1(encryptModule.encryptAREA(vo.getParamKey1()));
		vo.setTabPos("1");
		homeKorUserCenterContactSvc.insertHomeKorUserCentercontact(vo);
		insertFileData(FileConst.DIRECTION_CONTACT_ATTACH, vo.getIdx(), vo.getFileDataList1());
		
		String senderInfo = vo.getParamKey1();
		String receipter = vo.getParamKey1();		
		
		emailService.MailSend(senderInfo,receipter,vo.getParamKey2(),vo.getParamKey3(),(List<EgovMap>) selectFileData(FileConst.DIRECTION_CONTACT_ATTACH,vo.getIdx()));
		
		model.addAttribute("msg", "정상적으로 문의처리 되었습니다.");
		model.addAttribute("status", "3");
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do?tabPos="+vo.getTabPos());
	}
}