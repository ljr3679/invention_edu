package web.home.kor.admin.homepage.footer.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.footer.svc.HomeKorAdminHomepageFooterSvc;

@Controller
@RequestMapping(value="/homepage/footer/")
public class HomeKorAdminHomepageFooterCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepageFooterSvc")
	private HomeKorAdminHomepageFooterSvc homeKorAdminHomepageFooterSvc; 
	
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
				List<?> resultList = homeKorAdminHomepageFooterSvc.selectHomeKorAdminHomepageFooterList(vo);
				Integer totalCnt = homeKorAdminHomepageFooterSvc.selectHomeKorAdminHomepageFooterListCnt(vo);
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
			EgovMap resultData = homeKorAdminHomepageFooterSvc.selectHomeKorAdminHomepageFooter(vo);
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
				homeKorAdminHomepageFooterSvc.insertHomeKorAdminHomepageFooter(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminHomepageFooterSvc.updateHomeKorAdminHomepageFooter(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminHomepageFooterSvc.deleteHomeKorAdminHomepageFooter(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminHomepageFooterSvc.deleteHomeKorAdminHomepageFooterList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}