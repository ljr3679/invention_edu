package web.home.kor.admin.center.find.ctr;

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
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;

@Controller
@RequestMapping(value="/center/find/")
public class HomeKorAdminCenterFindCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminCenterFindSvc")
	private HomeKorAdminCenterFindSvc homeKorAdminCenterFindSvc; 
	
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
				List<?> resultList = homeKorAdminCenterFindSvc.selectHomeKorAdminCenterFindList(vo);
				Integer totalCnt = homeKorAdminCenterFindSvc.selectHomeKorAdminCenterFindListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			EgovMap resultData = homeKorAdminCenterFindSvc.selectHomeKorAdminCenterFind(vo);
			model.addAttribute("resultData", resultData);
		}
		List<?> region = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("region", region);
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminCenterFindSvc.insertHomeKorAdminCenterFind(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminCenterFindSvc.updateHomeKorAdminCenterFind(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminCenterFindSvc.deleteHomeKorAdminCenterFind(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminCenterFindSvc.deleteHomeKorAdminCenterFindList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}