package web.home.kor.user.education.teacher.activity.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import web.home.kor.user.education.teacher.activity.svc.HomeKorUserEducationTeacherActivitySvc;

@Controller
@RequestMapping(value="/education/teacher/activity/")
public class HomeKorUserEducationTeacherActivityCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationTeacherActivitySvc")
	private HomeKorUserEducationTeacherActivitySvc homeKorUserEducationTeacherActivitySvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				vo.setIdentifier(FileConst.EDUCATION_TEACHER_ACTIVITY_ATTACH);
				List<?> resultList = homeKorUserEducationTeacherActivitySvc.selectHomeKorUserEducationTeacherActivityList(vo);
				Integer totalCnt = homeKorUserEducationTeacherActivitySvc.selectHomeKorUserEducationTeacherActivityListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
		List<?> year = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
		model.addAttribute("year", year);
		List<?> type = commonSvc.selectCategoryParentDataList("CmxX26O0VT");
		model.addAttribute("type", type);
		
	}
}