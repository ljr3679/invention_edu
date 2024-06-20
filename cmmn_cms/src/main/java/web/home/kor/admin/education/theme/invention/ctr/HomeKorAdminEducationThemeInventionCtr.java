package web.home.kor.admin.education.theme.invention.ctr;

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
import web.home.kor.admin.education.theme.invention.svc.HomeKorAdminEducationThemeInventionSvc;

@Controller
@RequestMapping(value="/education/theme/invention/")
public class HomeKorAdminEducationThemeInventionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationThemeInventionSvc")
	private HomeKorAdminEducationThemeInventionSvc homeKorAdminEducationThemeInventionSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminEducationThemeInventionSvc.selectHomeKorAdminEducationThemeInventionList(vo);
				Integer totalCnt = homeKorAdminEducationThemeInventionSvc.selectHomeKorAdminEducationThemeInventionListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> type = commonSvc.selectCategoryParentDataList("CJe8Z9211T");
		model.addAttribute("type", type);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> type = commonSvc.selectCategoryParentDataList("CJe8Z9211T");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			EgovMap resultData = homeKorAdminEducationThemeInventionSvc.selectHomeKorAdminEducationThemeInvention(vo);
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
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminEducationThemeInventionSvc.insertHomeKorAdminEducationThemeInvention(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationThemeInventionSvc.updateHomeKorAdminEducationThemeInvention(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationThemeInventionSvc.deleteHomeKorAdminEducationThemeInvention(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationThemeInventionSvc.deleteHomeKorAdminEducationThemeInventionList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}