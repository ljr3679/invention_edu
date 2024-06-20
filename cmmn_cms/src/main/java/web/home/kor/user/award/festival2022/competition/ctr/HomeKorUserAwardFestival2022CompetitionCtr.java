package web.home.kor.user.award.festival2022.competition.ctr;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.award.festival2022.competition.svc.HomeKorUserAwardFestival2022CompetitionSvc;

@Controller
@RequestMapping(value="/award/festival2022/competition/")
public class HomeKorUserAwardFestival2022CompetitionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2022CompetitionSvc")
	private HomeKorUserAwardFestival2022CompetitionSvc homeKorUserAwardFestival2022CompetitionSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="view.do")
	public void view(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	
}