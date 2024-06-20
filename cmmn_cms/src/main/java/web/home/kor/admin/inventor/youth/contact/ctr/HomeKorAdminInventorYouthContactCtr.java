package web.home.kor.admin.inventor.youth.contact.ctr;

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
import web.home.kor.admin.inventor.youth.contact.svc.HomeKorAdminInventorYouthContactSvc;

@Controller
@RequestMapping(value="/inventor/youth/contact/")
public class HomeKorAdminInventorYouthContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminInventorYouthContactSvc")
	private HomeKorAdminInventorYouthContactSvc homeKorAdminInventorYouthContactSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("7");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminInventorYouthContactSvc.selectHomeKorAdminInventorYouthContactList(vo);
				Integer totalCnt = homeKorAdminInventorYouthContactSvc.selectHomeKorAdminInventorYouthContactListCnt(vo);
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
			EgovMap resultData = homeKorAdminInventorYouthContactSvc.selectHomeKorAdminInventorYouthContact(vo);
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
				vo.setTabPos("7");
				homeKorAdminInventorYouthContactSvc.insertHomeKorAdminInventorYouthContact(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("7");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminInventorYouthContactSvc.updateHomeKorAdminInventorYouthContact(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminInventorYouthContactSvc.deleteHomeKorAdminInventorYouthContact(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminInventorYouthContactSvc.deleteHomeKorAdminInventorYouthContactList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}