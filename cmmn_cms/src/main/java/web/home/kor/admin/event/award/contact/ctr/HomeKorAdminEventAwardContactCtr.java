package web.home.kor.admin.event.award.contact.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.award.contact.svc.HomeKorAdminEventAwardContactSvc;

@Controller
@RequestMapping(value="/event/award/contact/")
public class HomeKorAdminEventAwardContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEventAwardContactSvc")
	private HomeKorAdminEventAwardContactSvc homeKorAdminEventAwardContactSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("4");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminEventAwardContactSvc.selectHomeKorAdminEventAwardContactList(vo);
				Integer totalCnt = homeKorAdminEventAwardContactSvc.selectHomeKorAdminEventAwardContactListCnt(vo);
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
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.DIRECTION_CONTACT_ATTACH,vo.getIdx()));
			EgovMap resultData = homeKorAdminEventAwardContactSvc.selectHomeKorAdminEventAwardContact(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				vo.setTabPos("4");
				homeKorAdminEventAwardContactSvc.insertHomeKorAdminEventAwardContact(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("4");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminEventAwardContactSvc.updateHomeKorAdminEventAwardContact(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEventAwardContactSvc.deleteHomeKorAdminEventAwardContact(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEventAwardContactSvc.deleteHomeKorAdminEventAwardContactList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}