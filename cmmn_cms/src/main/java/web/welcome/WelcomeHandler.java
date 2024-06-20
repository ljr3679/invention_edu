package web.welcome;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.data.StaticData;

@Controller
public class WelcomeHandler {

	@RequestMapping(value="/welcome.do")
	public String welcome() throws Exception {
		
		String defaultSiteCode = StaticData.getInstance().defaultSiteCode();
		String defaultLangCode = StaticData.getInstance().defaultLangCode(defaultSiteCode);
		
		return "redirect:"+String.format("/%s/%s/%s", defaultSiteCode, defaultLangCode, "main.do");
	}
	
}
