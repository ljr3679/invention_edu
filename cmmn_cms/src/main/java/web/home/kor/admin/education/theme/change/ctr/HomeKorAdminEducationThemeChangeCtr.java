package web.home.kor.admin.education.theme.change.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.theme.change.svc.HomeKorAdminEducationThemeChangeSvc;


@Controller
@RequestMapping(value="/education/theme/change/")
public class HomeKorAdminEducationThemeChangeCtr extends CMSMappingHandler {

	@Resource(name="homeKorAdminEducationThemeChangeSvc")
	private HomeKorAdminEducationThemeChangeSvc homeKorAdminEducationThemeChangeSvc; 
	
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
				List<?> resultList = homeKorAdminEducationThemeChangeSvc.selectHomeKorAdminEducationThemeChangeList(vo);
				Integer totalCnt = homeKorAdminEducationThemeChangeSvc.selectHomeKorAdminEducationThemeChangeListCnt(vo);
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
			EgovMap resultData = homeKorAdminEducationThemeChangeSvc.selectHomeKorAdminEducationThemeChange(vo);
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
				homeKorAdminEducationThemeChangeSvc.insertHomeKorAdminEducationThemeChange(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationThemeChangeSvc.updateHomeKorAdminEducationThemeChange(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationThemeChangeSvc.deleteHomeKorAdminEducationThemeChange(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationThemeChangeSvc.deleteHomeKorAdminEducationThemeChangeList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}	
	
	
}
