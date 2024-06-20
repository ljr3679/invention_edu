package web.home.kor.user.award.festival2021.main.ctr;

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
import web.home.kor.user.award.festival2021.main.svc.HomeKorUserAwardFestival2021MainSvc;
import web.home.kor.user.award.festival2022.main.svc.HomeKorUserAwardFestival2022MainSvc;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;
import web.home.kor.user.judge.main.svc.HomeKorUserJudgeMainSvc;

@Controller
@RequestMapping(value="/award/festival2021/")
public class HomeKorUserAwardFestival2021MainCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2021MainSvc")
	private HomeKorUserAwardFestival2021MainSvc homeKorUserAwardFestival2021MainSvc; 
	
	@RequestMapping(value="main.do")
	public void main(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("layout_option", "main");
	}
}