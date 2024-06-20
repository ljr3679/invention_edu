package web.home.kor.admin.education.teacher.activity.ctr;

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
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.teacher.activity.svc.HomeKorAdminEducationTeacherActivitySvc;

@Controller
@RequestMapping(value="/education/teacher/activity/")
public class HomeKorAdminEducationTeacherActivityCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationTeacherActivitySvc")
	private HomeKorAdminEducationTeacherActivitySvc homeKorAdminEducationTeacherActivitySvc; 
	
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
				List<?> resultList = homeKorAdminEducationTeacherActivitySvc.selectHomeKorAdminEducationTeacherActivityList(vo);
				Integer totalCnt = homeKorAdminEducationTeacherActivitySvc.selectHomeKorAdminEducationTeacherActivityListCnt(vo);
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
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
		List<?> year = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
		model.addAttribute("year", year);
		List<?> type = commonSvc.selectCategoryParentDataList("CmxX26O0VT");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_TEACHER_ACTIVITY_ATTACH,vo.getIdx()));
			EgovMap resultData = homeKorAdminEducationTeacherActivitySvc.selectHomeKorAdminEducationTeacherActivity(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminEducationTeacherActivitySvc.insertHomeKorAdminEducationTeacherActivity(vo);
				insertFileData(FileConst.EDUCATION_TEACHER_ACTIVITY_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationTeacherActivitySvc.updateHomeKorAdminEducationTeacherActivity(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_TEACHER_ACTIVITY_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationTeacherActivitySvc.deleteHomeKorAdminEducationTeacherActivity(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationTeacherActivitySvc.deleteHomeKorAdminEducationTeacherActivityList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}