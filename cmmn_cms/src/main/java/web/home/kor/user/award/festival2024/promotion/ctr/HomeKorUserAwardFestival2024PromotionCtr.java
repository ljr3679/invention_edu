package web.home.kor.user.award.festival2024.promotion.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;

@Controller
@RequestMapping(value="/award/festival2024/promotion/")
public class HomeKorUserAwardFestival2024PromotionCtr extends CMSMappingHandler {

	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getTabPos2())) vo.setTabPos2("1");
		
		model.addAttribute("layout_option", "sub");
	} 	
	
}
