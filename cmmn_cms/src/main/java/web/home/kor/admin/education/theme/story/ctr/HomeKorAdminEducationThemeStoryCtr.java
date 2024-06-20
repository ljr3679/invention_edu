package web.home.kor.admin.education.theme.story.ctr;

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
import web.home.kor.admin.education.theme.story.svc.HomeKorAdminEducationThemeStorySvc;

@Controller
@RequestMapping(value="/education/theme/story/")
public class HomeKorAdminEducationThemeStoryCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationThemeStorySvc")
	private HomeKorAdminEducationThemeStorySvc homeKorAdminEducationThemeStorySvc; 
	
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
				List<?> resultList = homeKorAdminEducationThemeStorySvc.selectHomeKorAdminEducationThemeStoryList(vo);
				Integer totalCnt = homeKorAdminEducationThemeStorySvc.selectHomeKorAdminEducationThemeStoryListCnt(vo);
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
			EgovMap resultData = homeKorAdminEducationThemeStorySvc.selectHomeKorAdminEducationThemeStory(vo);
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
				homeKorAdminEducationThemeStorySvc.insertHomeKorAdminEducationThemeStory(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationThemeStorySvc.updateHomeKorAdminEducationThemeStory(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationThemeStorySvc.deleteHomeKorAdminEducationThemeStory(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationThemeStorySvc.deleteHomeKorAdminEducationThemeStoryList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}