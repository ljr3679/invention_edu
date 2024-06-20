package cms.site.account.access.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.account.access.svc.CMSAccessMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/account/access/")
public class CMSIpAccessMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSAccessMngSvc")
	private CMSAccessMngSvc CMSAccessMngSvc;
	
	@RequestMapping(value="ipAccessMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		vo.setSiteCode("CMS");
		String result = CMSAccessMngSvc.selectIpStatus(vo);
		model.addAttribute("result", result);
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				List<?> resultList = CMSAccessMngSvc.selectAccessDataList(vo);
				int totalCnt = CMSAccessMngSvc.selectAccessDataListCnt(vo);
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
		
		List<?> accountList = CMSAccessMngSvc.selectAdminAccountDataList(vo);
		model.addAttribute("accountList", accountList);
		
		if(vo.getAct().equals("modify")) {
			EgovMap resultData = CMSAccessMngSvc.selectAccessData(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		//System.out.println(vo.toString());
		
		switch (vo.getAct()) {
			case "regist":
				CMSAccessMngSvc.insertAccessData(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				CMSAccessMngSvc.updateAccessData(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				CMSAccessMngSvc.deleteAccessDataList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("method", "post");
		model.addAttribute("returnURL", vo.getSelfPath()+"ipAccessMng.do");
	}
	
	@RequestMapping(value = "ip_status.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String ip_status(
			@ModelAttribute("commonVO") CommonVO vo,
			@RequestParam(value="paramKey1", defaultValue="") String status,
			HttpServletRequest request
			) throws Exception {
		
		vo.setSiteCode("CMS");
		vo.setParamKey1(status);
		CMSAccessMngSvc.insertAndUpdateIpAccessStatusData(vo);
		
		return "Y";
	}
	
	
	
}
