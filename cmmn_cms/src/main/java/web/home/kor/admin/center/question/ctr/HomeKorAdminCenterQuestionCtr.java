package web.home.kor.admin.center.question.ctr;

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
import web.home.kor.admin.center.question.svc.HomeKorAdminCenterQuestionSvc;

@Controller
@RequestMapping(value="/center/question/")
public class HomeKorAdminCenterQuestionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminCenterQuestionSvc")
	private HomeKorAdminCenterQuestionSvc homeKorAdminCenterQuestionSvc; 
	
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
				List<?> resultList = homeKorAdminCenterQuestionSvc.selectHomeKorAdminCenterQuestionList(vo);
				Integer totalCnt = homeKorAdminCenterQuestionSvc.selectHomeKorAdminCenterQuestionListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.CENTER_QUESTION_ATTACH,vo.getIdx()));
			EgovMap resultData = homeKorAdminCenterQuestionSvc.selectHomeKorAdminCenterQuestion(vo);
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
				homeKorAdminCenterQuestionSvc.insertHomeKorAdminCenterQuestion(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminCenterQuestionSvc.updateHomeKorAdminCenterQuestion(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminCenterQuestionSvc.deleteHomeKorAdminCenterQuestion(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminCenterQuestionSvc.deleteHomeKorAdminCenterQuestionList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}