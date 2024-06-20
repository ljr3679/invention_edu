package web.home.kor.user.award.festival2021.program.ctr;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.data.StaticData;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2021.program.svc.HomeKorUserAwardFestival2021ProgramSvc;
import web.home.kor.user.award.festival2022.champion.svc.HomeKorUserAwardFestival2022ChampionSvc;
import web.home.kor.user.award.festival2022.competition.svc.HomeKorUserAwardFestival2022CompetitionSvc;
import web.home.kor.user.award.festival2022.exhibition.svc.HomeKorUserAwardFestival2022ExhibitionSvc;
import web.home.kor.user.award.festival2022.main.svc.HomeKorUserAwardFestival2022MainSvc;
import web.home.kor.user.award.festival2022.program.svc.HomeKorUserAwardFestival2022ProgramSvc;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;
import web.home.kor.user.judge.main.svc.HomeKorUserJudgeMainSvc;

@Controller
@RequestMapping(value="/award/festival2021/program/")
public class HomeKorUserAwardFestival2021ProgramCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2021ProgramSvc")
	private HomeKorUserAwardFestival2021ProgramSvc homeKorUserAwardFestival2021ProgramSvc; 
	
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