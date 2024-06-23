package web.home.kor.admin.event.invent.contact.ctr;

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
import web.home.kor.admin.event.invent.contact.svc.HomeKorAdminEventInventContactSvc;

@Controller
@RequestMapping(value="/event/invent/contact/")
public class HomeKorAdminEventInventContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEventInventContactSvc")
	private HomeKorAdminEventInventContactSvc homeKorAdminEventInventContactSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("2");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminEventInventContactSvc.selectHomeKorAdminEventInventContactList(vo);
				Integer totalCnt = homeKorAdminEventInventContactSvc.selectHomeKorAdminEventInventContactListCnt(vo);
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
			EgovMap resultData = homeKorAdminEventInventContactSvc.selectHomeKorAdminEventInventContact(vo);
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
				vo.setTabPos("2");
				homeKorAdminEventInventContactSvc.insertHomeKorAdminEventInventContact(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("2");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminEventInventContactSvc.updateHomeKorAdminEventInventContact(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEventInventContactSvc.deleteHomeKorAdminEventInventContact(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEventInventContactSvc.deleteHomeKorAdminEventInventContactList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}