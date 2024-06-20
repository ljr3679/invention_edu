package cms.site.menu.board.ctr;

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
import cms.site.menu.board.svc.CMSBoardMngSvc;
import cms.util.Logs;
import cms.util.RandomCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/menu/board/")
public class CMSBoardMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSBoardMngSvc")
	private CMSBoardMngSvc CMSBoardMngSvc;
	
	@RequestMapping(value="boardMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = (List<?>) CMSBoardMngSvc.selectBoardDataList(vo);
				int totalCnt = CMSBoardMngSvc.selectBoardListDataCnt(vo);
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
		
		if(stringUtil.isNotEmpty(vo.getBoard_code())) {
			EgovMap resultData = CMSBoardMngSvc.selectBoardData(vo);
			resultData.put("listFields", stringUtil.stringToArr(String.valueOf(resultData.get("listField")), Const.SITE_SEPERATOR));
			resultData.put("listTitles", stringUtil.stringToArr(String.valueOf(resultData.get("listTitle")), Const.SITE_SEPERATOR));
			resultData.put("listValis", stringUtil.stringToArr(String.valueOf(resultData.get("listVali")), Const.SITE_SEPERATOR));
			resultData.put("listSearchs", stringUtil.stringToArr(String.valueOf(resultData.get("listSearchField")), Const.SITE_SEPERATOR));
			resultData.put("listViewFields", stringUtil.stringToArr(String.valueOf(resultData.get("listViewField")), Const.SITE_SEPERATOR));
			resultData.put("listViewTitles", stringUtil.stringToArr(String.valueOf(resultData.get("listViewTitle")), Const.SITE_SEPERATOR));
			resultData.put("listViewPercents", stringUtil.stringToArr(String.valueOf(resultData.get("listViewPercent")), Const.SITE_SEPERATOR));
			resultData.put("listViewClasses", stringUtil.stringToArr(String.valueOf(resultData.get("listViewClass")), Const.SITE_SEPERATOR));
			model.addAttribute("resultData", resultData);
		}
		
		List<?> categoryList = CMSBoardMngSvc.selectCategoryDataList(vo);
		
		model.addAttribute("categoryList", categoryList);
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
				while(CMSBoardMngSvc.selectCheckBoardKey(getCode = randomCode.getEngNumCode(8)) != 0);
				vo.setBoard_code(getCode);
			case "modify":
				if(stringUtil.isEmpty(vo.getParamKey9())) vo.setParamKey9("0");
				if(stringUtil.isEmpty(vo.getParamKey10())) vo.setParamKey10("0");
				
				List<String> paramKey11 = (List<String>) vo.getParamKeyList1();
				List<String> paramKey12 = (List<String>) vo.getParamKeyList2();
				List<String> paramKey13 = (List<String>) vo.getParamKeyList3();
				List<String> paramKey14 = (List<String>) vo.getParamKeyList4();
				List<String> paramKey15 = (List<String>) vo.getParamKeyList5();
				List<String> paramKey16 = (List<String>) vo.getParamKeyList6();
				List<String> paramKey17 = (List<String>) vo.getParamKeyList7();
				List<String> paramKey18 = (List<String>) vo.getParamKeyList8();
				List<String> paramKey38 = (List<String>) vo.getParamKeyList9();
				
				vo.setParamKey11(stringUtil.arrToString(paramKey11, Const.SITE_SEPERATOR));
				vo.setParamKey12(stringUtil.arrToString(paramKey12, Const.SITE_SEPERATOR));
				vo.setParamKey13(stringUtil.arrToString(paramKey13, Const.SITE_SEPERATOR));
				vo.setParamKey14(stringUtil.arrToString(paramKey14, Const.SITE_SEPERATOR));
				vo.setParamKey15(stringUtil.arrToString(paramKey15, Const.SITE_SEPERATOR));
				vo.setParamKey16(stringUtil.arrToString(paramKey16, Const.SITE_SEPERATOR));
				vo.setParamKey17(stringUtil.arrToString(paramKey17, Const.SITE_SEPERATOR));
				vo.setParamKey18(stringUtil.arrToString(paramKey18, Const.SITE_SEPERATOR));
				vo.setParamKey38(stringUtil.arrToString(paramKey38, Const.SITE_SEPERATOR));
				
				CMSBoardMngSvc.insertAndUpdateBoardData(vo);
				model.addAttribute("status", vo.getAct().equals("regist") ?"0" :"1");
				break;
			case "delete":
				CMSBoardMngSvc.deleteBoardData(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("method", "post");
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"boardMng.do");
	}

	@RequestMapping(value="check.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject check(
			@ModelAttribute("commonVO") CommonVO vo
			) throws Exception {
		
		List<EgovMap> resultList = (List<EgovMap>) CMSBoardMngSvc.selectBoardDataUseAtList(vo);
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
