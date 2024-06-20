package cms.site.account.menu.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.data.StaticData;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.account.menu.svc.CMSMenuAuthorityMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/account/menu/")
public class CMSMenuAuthorityMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSMenuAuthorityMngSvc")
	private CMSMenuAuthorityMngSvc CMSMenuAuthorityMngSvc;
	
	@RequestMapping(value="menuAuthorityMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				List<?> resultList = CMSMenuAuthorityMngSvc.selectMenuAuthorityDataList(vo);
				int totalCnt = CMSMenuAuthorityMngSvc.selectMenuAuthorityDataListCnt(vo);
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
		
		if(vo.getAct().equals("modify")) {
			EgovMap resultData = CMSMenuAuthorityMngSvc.selectMenuAuthorityData(vo);
			resultData.put("menuList", stringUtil.stringToArr(String.valueOf(resultData.get("menuList")), ","));
			model.addAttribute("resultData", resultData);
		}
		
		model.addAttribute("allAdminMenuTree", StaticData.getInstance().getAllAdminMenuTree());
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		switch (vo.getAct()) {
			case "regist":
				CMSMenuAuthorityMngSvc.insertMenuAuthorityData(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				CMSMenuAuthorityMngSvc.updateMenuAuthorityData(vo);
				model.addAttribute("status", "1");
				
				EgovMap authority = CMSMenuAuthorityMngSvc.selectMenuAuthoritySessionInit(vo);
				String menuAuthorityName = String.valueOf(authority.get("menuAuthorityName"));
				String menuList = String.valueOf(authority.get("menuList"));
				
				EgovMap admSession = ((EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET));
				
				admSession.put("menuAuthorityName", menuAuthorityName);
				admSession.put("menuList", stringUtil.stringToArr(menuList, ","));
				
				break;
			case "delete":
				CMSMenuAuthorityMngSvc.deleteMenuAuthorityDataList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("method", "post");
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"menuAuthorityMng.do");
	}
	
	@RequestMapping(value="check.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject check(
			@ModelAttribute("commonVO") CommonVO vo
			) throws Exception {
		
		List<EgovMap> resultList = (List<EgovMap>) CMSMenuAuthorityMngSvc.selectAuthorityDataUseAtList(vo);
		objectBuilder.jsonBulid("result", resultList.size() == 0 ?"T" :"F");
		if(resultList.size() > 0) {
			String menus = ""; 
			for(EgovMap map : resultList) {
				String name = String.valueOf(map.get("name"));
				String id = String.valueOf(map.get("id"));
				menus += (name+" ["+id+"],");
			}
			
			objectBuilder.jsonBulid("account", menus.substring(0, menus.length()-1));	
		}
				
		return objectBuilder.build();
	}

}
