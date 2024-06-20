package web.home.kor.user.archive.serveyMng.ctr;

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
import web.home.kor.user.archive.question.svc.HomeKorUserArchiveQuestionSvc;
import web.home.kor.user.archive.serveyMng.svc.HomeKorUserArchiveServeyMngSvc;

@Controller
@RequestMapping(value="/archive/serveyMng/")
public class HomeKorUserArchiveServeyMngCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserArchiveServeyMngSvc")
	private HomeKorUserArchiveServeyMngSvc homeKorUserArchiveServeyMngSvc; 
	
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
				List<?> resultList = (List<?>) homeKorUserArchiveServeyMngSvc.selectHomeKorUserArchiveServeyMngList(vo);
				int totalCnt = homeKorUserArchiveServeyMngSvc.selectHomeKorUserArchiveServeyMngListCnt(vo);
				return new Object[]{resultList, totalCnt};
			}
		});

		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		EgovMap resultData = homeKorUserArchiveServeyMngSvc.selectHomeKorUserArchiveServeyMngData(vo);
		List<?> resultSubList = homeKorUserArchiveServeyMngSvc.selectHomeKorUserArchiveServeyMngDataList(vo);
		model.addAttribute("resultData", resultData);
		model.addAttribute("resultSubList", resultSubList);
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="survey_regist.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {

		homeKorUserArchiveServeyMngSvc.insertHomeKorUserArchiveServeyMngData(vo);
		List<String> dataIdxList = (List<String>) vo.getParamKeyList1();
		List<String> dataList = (List<String>) vo.getParamKeyList2();
		
		for(int i=0; i<dataIdxList.size(); i++) {
			vo.setParamKey4(dataIdxList.get(i));
			vo.setParamKey5(dataList.get(i));
			homeKorUserArchiveServeyMngSvc.insertHomeKorUserArchiveServeyMngSubData(vo);
		}
		
		model.addAttribute("method", "get");
		model.addAttribute("status", "3");
		model.addAttribute("msg", "설문조사 제출을 완료하였습니다.");
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do?tabPos="+vo.getTabPos());
	}
}