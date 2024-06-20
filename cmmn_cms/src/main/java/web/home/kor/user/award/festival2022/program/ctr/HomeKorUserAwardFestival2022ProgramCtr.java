package web.home.kor.user.award.festival2022.program.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.award.festival2022.program.svc.HomeKorUserAwardFestival2022ProgramSvc;

@Controller
@RequestMapping(value="/award/festival2022/program/")
public class HomeKorUserAwardFestival2022ProgramCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2022ProgramSvc")
	private HomeKorUserAwardFestival2022ProgramSvc homeKorUserAwardFestival2022ProgramSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="indexTabA.do")
	public void indexTabA(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="indexTabB.do")
	public void indexTabB(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="indexTabC.do")
	public void indexTabC(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="indexTabD.do")
	public void indexTabD(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "sub");
	}
}