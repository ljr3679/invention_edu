package web.home.kor.user.education.theme.change.ctr;

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
import web.home.kor.user.education.theme.change.svc.HomeKorUserEducationThemeChangeSvc;


@Controller
@RequestMapping(value="/education/theme/change/")
public class HomeKorUserEducationThemeChangeCtr extends CMSMappingHandler {

	@Resource(name="homeKorUserEducationThemeChangeSvc")
	private HomeKorUserEducationThemeChangeSvc homeKorUserEducationThemeChangeSvc; 
	
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
				List<?> resultList = homeKorUserEducationThemeChangeSvc.selectHomeKorUserEducationThemeChangeList(vo);
				Integer totalCnt = homeKorUserEducationThemeChangeSvc.selectHomeKorUserEducationThemeChangeListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}	
	
}
