package cms.site.menu.contents.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.menu.contents.svc.CMSContentsMngSvc;
import cms.util.RandomCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/menu/contents/")
public class CMSContentsMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSContentsMngSvc")
	private CMSContentsMngSvc CMSContentsMngSvc;
	
	@RequestMapping(value="contentsMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = (List<?>) CMSContentsMngSvc.selectContentsDataList(vo);
				int totalCnt = CMSContentsMngSvc.selectContentsListDataCnt(vo);
				return new Object[]{resultList, totalCnt};
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
			EgovMap resultData = CMSContentsMngSvc.selectContentsData(vo);
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
				RandomCode randomCode = new RandomCode();
				String getCode;
				while(CMSContentsMngSvc.selectCheckBoardKey(getCode = randomCode.getEngNumCode(8)) != 0);
				vo.setBoard_code(getCode);
				CMSContentsMngSvc.insertAndUpdateContentsData(vo);
				model.addAttribute("status", "0");
				break;
			case "modify":
				CMSContentsMngSvc.updateAndUpdateContentsData(vo);
				model.addAttribute("status", "1");
//				model.addAttribute("status", vo.getAct().equals("regist") ?"0" :"1");
				break;
			case "delete":
				CMSContentsMngSvc.deleteContentsData(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("method", "post");
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"contentsMng.do");
	}

	@RequestMapping(value="check.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject check(
			@ModelAttribute("commonVO") CommonVO vo
			) throws Exception {
		
		List<EgovMap> resultList = (List<EgovMap>) CMSContentsMngSvc.selectContentsDataUseAtList(vo);
		objectBuilder.jsonBulid("result", resultList.size() == 0 ?"T" :"F");
		if(resultList.size() > 0) {
			String menus = ""; 
			for(EgovMap map : resultList) {
				String menu = String.valueOf(map.get("menuTitle"));
				menus += (menu+",");
			}
			
			objectBuilder.jsonBulid("menuTitle", menus.substring(0, menus.length()-1));	
		}
		
		return objectBuilder.build();
	}
	
}
