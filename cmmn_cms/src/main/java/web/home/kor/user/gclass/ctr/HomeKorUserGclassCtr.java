package web.home.kor.user.gclass.ctr;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.gclass.svc.HomeKorUserGclassSvc;

@Controller
@RequestMapping(value="/gclass/")
public class HomeKorUserGclassCtr extends CMSMappingHandler {

	@Resource(name="homeKorUserGclassSvc")
	private HomeKorUserGclassSvc homeKorUserGclassSvc;

	
	@RequestMapping(value="index.do")
	public void index(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
	}

	
	@RequestMapping(value="calendar.do")
	public void calendar(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		
		String sDate = request.getParameter("setDate");
		LocalDate now = LocalDate.now(); // 현재 날짜		

		DateTimeFormatter yearFormat = DateTimeFormatter.ofPattern("yyyy"); // 포맷 정의
		String formatedNowYear = now.format(yearFormat); // 포맷 적용
		// 월 포맷
		DateTimeFormatter monthFormat = DateTimeFormatter.ofPattern("MM"); // 포맷 정의
		String formatedNowMonth = now.format(monthFormat); // 포맷 적용

		if(sDate == null || "null".equals(sDate)) {
			sDate = formatedNowYear + "-" + formatedNowMonth;
		}
		
		vo.setSearchDate1(sDate);
		vo.setSearchDate2(sDate.substring(0,4));
				
		List<?> gclassList = homeKorUserGclassSvc.selectUserGclassList(vo);
		
		List<?> monthList = homeKorUserGclassSvc.selectUserGclassMonthList(vo);
		
		
		
		
		model.addAttribute("gclassList", gclassList);
		model.addAttribute("monthList", monthList);
		
		
	}	
	
	
}
