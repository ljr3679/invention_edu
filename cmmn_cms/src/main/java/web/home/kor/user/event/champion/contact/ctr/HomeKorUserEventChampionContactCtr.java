package web.home.kor.user.event.champion.contact.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.event.champion.contact.svc.HomeKorUserEventChampionContactSvc;

@Controller
@RequestMapping(value="/event/champion/contact/")
public class HomeKorUserEventChampionContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEventChampionContactSvc")
	private HomeKorUserEventChampionContactSvc homeKorUserEventChampionContactSvc; 
	
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
		vo.setTabPos("3");
		homeKorUserEventChampionContactSvc.insertHomeKorUserEventChampionContact(vo);
		insertFileData(FileConst.DIRECTION_CONTACT_ATTACH, vo.getIdx(), vo.getFileDataList1());
		model.addAttribute("msg", "정상적으로 문의처리 되었습니다.");
		model.addAttribute("status", "3");
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do?tabPos="+vo.getTabPos());
	}
}