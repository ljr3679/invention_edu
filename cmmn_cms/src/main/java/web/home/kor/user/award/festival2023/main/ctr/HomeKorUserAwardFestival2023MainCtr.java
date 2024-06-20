package web.home.kor.user.award.festival2023.main.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;

@Controller
@RequestMapping(value="/award/festival2023/")
public class HomeKorUserAwardFestival2023MainCtr extends CMSMappingHandler {
	
	@RequestMapping(value="main.do")
	public void main(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "main");
	}	
}
