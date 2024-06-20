package cms.site.menu.menu.ctr;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

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
import cms.site.menu.menu.svc.CMSMenuMngSvc;
import cms.util.AccountSetter;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/menu/menu/")
public class CMSMenuMngCtr extends CMSMappingHandler {

	@Resource(name="CMSMenuMngSvc")
	private CMSMenuMngSvc CMSMenuMngSvc;
	
	@RequestMapping(value="menuMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		EgovMap admSession = admSessionAt(request);
		
		if(stringUtil.isEmpty(vo.getTabPos())) vo.setTabPos("1");
		if(stringUtil.isEmpty(vo.getSearchValue1())) vo.setSearchValue1(String.valueOf(admSession.get("mSiteCode"))); 
		if(stringUtil.isEmpty(vo.getSearchValue2())) vo.setSearchValue2(String.valueOf(admSession.get("mLangCode")));
		
		switch (Optional.ofNullable(vo.getTabPos()).map(Integer::parseInt).get()) {
			case 1: 
				model.addAttribute("menuTreeSet", StaticData.getInstance().getAllUserMenuTree(vo.getSearchValue1()+"_"+vo.getSearchValue2()));
				model.addAttribute("maxParent", propertiesService.getInt(Const.USR_MAX_PARENT));
				model.addAttribute("maxDepth", propertiesService.getInt(Const.USR_MAX_DEPTH));
				break;
			case 2: 
				model.addAttribute("menuTreeSet", StaticData.getInstance().getAllAdminMenuTree(vo.getSearchValue1()+"_"+vo.getSearchValue2()));
				model.addAttribute("maxParent", propertiesService.getInt(Const.ADM_MAX_PARENT));
				model.addAttribute("maxDepth", propertiesService.getInt(Const.ADM_MAX_DEPTH));
				break;
			default:
				break;
		}
		
		List<?> boardList = CMSMenuMngSvc.selectBoardMngDataList();
		List<?> contentsList = CMSMenuMngSvc.selectContentsMngDataList();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("contentsList", contentsList);
		
	}
	
	@RequestMapping(value="regist.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject regist(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request
			) throws Exception {
		
		vo.setParamKey13(vo.getTabPos().equals("1") ?"U" :"A");
		EgovMap depthSort = CMSMenuMngSvc.selectMenuMaxSort(vo);
		switch (vo.getParamKey4()) {
			case "C":
				vo.setParamKey5("/contents.do");
				vo.setSearchValue3("Y");
				break;
			case "B":
				vo.setParamKey5("/board.do");
				vo.setSearchValue3("Y");
				break;
			default:
				break;
		}
		vo.setParamKey11(String.valueOf(depthSort.get("depth")));
		vo.setParamKey12(String.valueOf(depthSort.get("sort")));
		
		vo.setTitle(vo.getParamKey3());
		EgovMap insertData = CMSMenuMngSvc.insertChildMenuData(vo);
		
		if(stringUtil.isNotEmpty(insertData)) {
			switch (vo.getTabPos()) {
				case "1": 
					StaticData.getInstance().reloadUserMenu(); 
					break;
				case "2": 
					StaticData.getInstance().reloadAdminMenu(); 
					break;
				default:
					break;
			}
			Iterator it = insertData.keySet().iterator();
			while(it.hasNext()) {
				String key = String.valueOf(it.next());
				String value = String.valueOf(insertData.get(key));
				objectBuilder.jsonBulid(key, value);
			}	
		}
		
		return objectBuilder.build();
	}
	
	@RequestMapping(value="delete.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String delete(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request
			) throws Exception {
		vo.setTitle("[메뉴삭제]"+vo.getParamKey3());
		CMSMenuMngSvc.updateMenuListDeleteData(vo);
		
		switch (vo.getTabPos()) {
			case "1": 
				StaticData.getInstance().reloadUserMenu(); 
				break;
			case "2": 
				StaticData.getInstance().reloadAdminMenu(); 
				break;
			default:
				break;
		}
		return "Y";
	}
	
	@RequestMapping(value="modify.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String modify(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request
			) throws Exception {
		vo.setTitle(vo.getParamKey3());
		CMSMenuMngSvc.updateMenuData(vo);
		
		switch (vo.getTabPos()) {
			case "1": 
				StaticData.getInstance().reloadUserMenu(); 
				break;
			case "2": 
				StaticData.getInstance().reloadAdminMenu(); 
				break;
			default:
				break;
		}
		return "Y";
	}
	
	@RequestMapping(value="sort.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String sort(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request
			) throws Exception {

		
		switch (vo.getParamKey13()) {
			case "D":
				CMSMenuMngSvc.updateDragMenuMove(vo);
				CMSMenuMngSvc.updateDragMenuChildrenDepth(vo);
			case "S":
				List<String> idx = (List<String>) vo.getParamKeyList1();
				List<String> index = (List<String>) vo.getParamKeyList2();
				List<EgovMap> paramList = new ArrayList<EgovMap>();
				for(int i=0; i<idx.size(); i++) {
					EgovMap param = new EgovMap();
					param.put("idx", idx.get(i));
					param.put("index", index.get(i));
					
					paramList.add(param);
				}
				vo.setParamKeyList3(paramList);
				CMSMenuMngSvc.updateDragMenuSortOrder(vo);
				break;
			default:
				break;
		}
		
		switch (vo.getTabPos()) {
			case "1": 
				StaticData.getInstance().reloadUserMenu(); 
				break;
			case "2": 
				StaticData.getInstance().reloadAdminMenu(); 
				break;
			default:
				break;
		}
		return "Y";
	}

	/** 사용안함 **/
	@RequestMapping(value="uriCheck.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String uri_check(
			@RequestParam(value="ajaxValue1", defaultValue="") String idx,
			@RequestParam(value="ajaxValue2", defaultValue="") String uri
			) throws Exception {
		EgovMap map = new EgovMap();
		map.put("idx", idx);
		map.put("uri", uri);
		
		switch (CMSMenuMngSvc.selectMenuURICheck(map)) {
			case 0:
				return "Y";	
			default:
				return "N";
		}
	}
	
}
