package web.url;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.url.svc.UrlInfoService;


@Controller
@RequestMapping(value="/url/")
public class UrlController {

	@Autowired
	private UrlInfoService urlInfoService;	


	@RequestMapping(value = "action.do", method = RequestMethod.GET)
	public void action(@RequestParam("urlNm")String urlNm, @ModelAttribute("commonVO") CommonVO vo, Model model, HttpServletRequest request) throws Exception {
		
		String siteUrl = ""; 
		
		if (urlNm != null) {
			vo.setParamKey1(urlNm);
			EgovMap result = urlInfoService.getUrlInfoByUrlNm(vo);

			if (result != null) {
				vo.setIdx(String.valueOf(result.get("urlMngno")));
				
				urlInfoService.setUrlCnt(vo);
				siteUrl = (String) result.get("urlOrg");
			} else {
				siteUrl = "";
				//siteUrl = "http://ip-edu.net";
			}
						
		} else {
			siteUrl = "";
			//siteUrl = "http://ip-edu.net";
		}

		model.addAttribute("siteUrl", siteUrl);
		//eturn "redirect:" + siteUrl;
	}

		
	@RequestMapping(value = "main.do")
	public void main(@ModelAttribute("commonVO") CommonVO vo, Model model, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
	}	
	
	
}