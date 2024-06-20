package web.home.kor.admin.url.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.url.svc.HomeKorAdminUrlSvc;

@Controller
@RequestMapping(value="/url/")
public class HomeKorAdminUrlCtr extends CMSMappingHandler {

	@Resource(name="homeKorAdminUrlSvc")
	private HomeKorAdminUrlSvc homeKorAdminUrlSvc;

	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		vo.setTabPos("1");
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminUrlSvc.selectHomeKorAdminUrlList(vo);
				Integer totalCnt = homeKorAdminUrlSvc.selectHomeKorAdminUrlListCnt(vo);
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
			EgovMap resultData = homeKorAdminUrlSvc.selectHomeKorAdminUrl(vo);
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
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				vo.setTabPos("1");
				homeKorAdminUrlSvc.insertHomeKorAdminUrl(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				vo.setTabPos("1");
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorAdminUrlSvc.updateHomeKorAdminUrl(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminUrlSvc.deleteHomeKorAdminUrl(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminUrlSvc.deleteHomeKorAdminUrlList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}	
	

	@RequestMapping(value = "checkUrlNm.act", method = RequestMethod.GET, headers = "Accept=application/json")
	public @ResponseBody boolean checkUrlNmAct(@ModelAttribute("commonVO") CommonVO vo, HttpServletRequest request, ModelMap model) throws Exception {
		try {
			if (homeKorAdminUrlSvc.selectUrlInfoCheckUrlNm(vo) == null) {
				return true;
			} else {
				return false;
			}
		} catch(Throwable t) {
			return false;
		}
	}	
	
	
}
