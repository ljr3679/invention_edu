package web.home.kor.admin.inventor.student.contact.ctr;

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
import web.home.kor.admin.inventor.student.contact.svc.HomeKorAdminInventorStudentContactSvc;

@Controller
@RequestMapping(value="/inventor/student/contact/")
public class HomeKorAdminInventorStudentContactCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminInventorStudentContactSvc")
	private HomeKorAdminInventorStudentContactSvc homeKorAdminInventorStudentContactSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("9");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminInventorStudentContactSvc.selectHomeKorAdminInventorStudentContactList(vo);
				Integer totalCnt = homeKorAdminInventorStudentContactSvc.selectHomeKorAdminInventorStudentContactListCnt(vo);
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
			EgovMap resultData = homeKorAdminInventorStudentContactSvc.selectHomeKorAdminInventorStudentContact(vo);
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
				vo.setTabPos("9");
				homeKorAdminInventorStudentContactSvc.insertHomeKorAdminInventorStudentContact(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("9");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminInventorStudentContactSvc.updateHomeKorAdminInventorStudentContact(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminInventorStudentContactSvc.deleteHomeKorAdminInventorStudentContact(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminInventorStudentContactSvc.deleteHomeKorAdminInventorStudentContactList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}