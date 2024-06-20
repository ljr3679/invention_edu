package web.home.kor.admin.inventor.meister.contact.ctr;

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
import web.home.kor.admin.inventor.meister.contact.svc.HomeKorAdminInventorMeisterContactSvc;

@Controller
@RequestMapping(value="/inventor/meister/contact/")
public class HomeKorAdminInventorMeisterContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminInventorMeisterContactSvc")
	private HomeKorAdminInventorMeisterContactSvc homeKorAdminInventorMeisterContactSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("8");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminInventorMeisterContactSvc.selectHomeKorAdminInventorMeisterContactList(vo);
				Integer totalCnt = homeKorAdminInventorMeisterContactSvc.selectHomeKorAdminInventorMeisterContactListCnt(vo);
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
			EgovMap resultData = homeKorAdminInventorMeisterContactSvc.selectHomeKorAdminInventorMeisterContact(vo);
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
				vo.setTabPos("8");
				homeKorAdminInventorMeisterContactSvc.insertHomeKorAdminInventorMeisterContact(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("8");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminInventorMeisterContactSvc.updateHomeKorAdminInventorMeisterContact(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminInventorMeisterContactSvc.deleteHomeKorAdminInventorMeisterContact(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminInventorMeisterContactSvc.deleteHomeKorAdminInventorMeisterContactList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}