package web.home.kor.user.education.theme.story.ctr;

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
import web.home.kor.user.education.theme.story.svc.HomeKorUserEducationThemeStorySvc;

@Controller
@RequestMapping(value="/education/theme/story/")
public class HomeKorUserEducationThemeStoryCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationThemeStorySvc")
	private HomeKorUserEducationThemeStorySvc homeKorUserEducationThemeStorySvc; 
	
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
				List<?> resultList = homeKorUserEducationThemeStorySvc.selectHomeKorUserEducationThemeStoryList(vo);
				Integer totalCnt = homeKorUserEducationThemeStorySvc.selectHomeKorUserEducationThemeStoryListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}
}