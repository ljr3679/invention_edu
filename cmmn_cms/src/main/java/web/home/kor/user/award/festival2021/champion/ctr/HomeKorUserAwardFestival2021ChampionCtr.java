package web.home.kor.user.award.festival2021.champion.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.award.festival2021.champion.svc.HomeKorUserAwardFestival2021ChampionSvc;


@Controller
@RequestMapping(value="/award/festival2021/champion/")
public class HomeKorUserAwardFestival2021ChampionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2021ChampionSvc")
	private HomeKorUserAwardFestival2021ChampionSvc homeKorUserAwardFestival2021ChampionSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
}