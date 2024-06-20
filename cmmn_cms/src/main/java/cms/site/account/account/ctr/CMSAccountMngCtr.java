package cms.site.account.account.ctr;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.aspect.Paging;
import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.account.account.svc.CMSAccountMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/account/account/")
public class CMSAccountMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSAccountMngSvc")
	private CMSAccountMngSvc CMSAccountMngSvc;
	
	@RequestMapping(value="accountMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				List<?> resultList = CMSAccountMngSvc.selectAccountDataList(vo);
				int totalCnt = CMSAccountMngSvc.selectAccountDataListCnt(vo);
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
		
		List<?> accountList = CMSAccountMngSvc.selectAuthorityNameList(vo);
		model.addAttribute("accountList", accountList);
		
		if(vo.getAct().equals("modify")) {
			EgovMap resultData = CMSAccountMngSvc.selectAccountData(vo);
			if(resultData != null) {
				String siteCode = String.valueOf(resultData.get("siteCode")).replace("[", "").replace("]", "");
				resultData.put("siteCodeList", Arrays.asList(siteCode.split(",")));
				resultData.put("phone", encryptModule.decryptAREA(String.valueOf(resultData.get("phone"))));
				resultData.put("email", encryptModule.decryptAREA(String.valueOf(resultData.get("email"))));
			}
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="id_check.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String IdCheck(
		@RequestParam(value="id", defaultValue="") String id,
		HttpServletRequest request,
		ModelMap model
		) throws Exception {
		
		Integer cnt = CMSAccountMngSvc.selectAdminIdCheck(id);
		
		if(cnt > 0) return "F";
		else return "T";
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		if(!vo.getParamKey3().equals("")) vo.setParamKey3(encryptModule.encryptSHA256(vo.getParamKey3()));
		vo.setParamKey6(encryptModule.encryptAREA(vo.getParamKey6()));
		vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
		switch (vo.getAct()) {
			case "regist":
				CMSAccountMngSvc.insertAccountData(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				CMSAccountMngSvc.updateAccountData(vo);
				model.addAttribute("status", "1");
				break;
			case "delete":
				CMSAccountMngSvc.deleteAccountDataList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("method", "post");
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"accountMng.do");
	}

}
