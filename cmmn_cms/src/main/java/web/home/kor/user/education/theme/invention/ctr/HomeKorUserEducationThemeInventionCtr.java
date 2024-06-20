package web.home.kor.user.education.theme.invention.ctr;

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
import web.home.kor.user.education.theme.invention.svc.HomeKorUserEducationThemeInventionSvc;

@Controller
@RequestMapping(value="/education/theme/invention/")
public class HomeKorUserEducationThemeInventionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationThemeInventionSvc")
	private HomeKorUserEducationThemeInventionSvc homeKorUserEducationThemeInventionSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getSearchValue2())) vo.setSearchValue2("106");
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorUserEducationThemeInventionSvc.selectHomeKorUserEducationThemeInventionList(vo);
				Integer totalCnt = homeKorUserEducationThemeInventionSvc.selectHomeKorUserEducationThemeInventionListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> type = commonSvc.selectCategoryParentDataList("CJe8Z9211T");
		model.addAttribute("type", type);
	}
	
}