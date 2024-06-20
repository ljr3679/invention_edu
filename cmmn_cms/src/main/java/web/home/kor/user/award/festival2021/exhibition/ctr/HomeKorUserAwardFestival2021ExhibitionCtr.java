package web.home.kor.user.award.festival2021.exhibition.ctr;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

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
import web.home.kor.user.award.festival2021.exhibition.svc.HomeKorUserAwardFestival2021ExhibitionSvc;

@Controller
@RequestMapping(value="/award/festival2021/exhibition/")
public class HomeKorUserAwardFestival2021ExhibitionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2021ExhibitionSvc")
	private HomeKorUserAwardFestival2021ExhibitionSvc homeKorUserAwardFestival2021ExhibitionSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getSearchValue1())) vo.setSearchValue1("2021");
		if(stringUtil.isEmpty(vo.getTabPos2())) vo.setTabPos2("1");
		if(stringUtil.isEmpty(vo.getSearchValue3())) vo.setSearchValue3("");
		
		EgovMap param = new EgovMap();
		List<Map> categoryList2 = null;
		
		switch (vo.getTabPos2()) {
			case "1": 
				vo.setSearchValue2("118"); 
				EgovMap resultData = homeKorUserAwardFestival2021ExhibitionSvc.selectHomeKorUserAwardFestival2021ExhibitionBasicData(vo);
				model.addAttribute("resultData", resultData);
				break;
			case "2": 
				param.put("category", "C037pd467T");
				param.put("parent", "119");
				categoryList2 = (List<Map>) commonSvc.selectCategoryChildrenDataList(param);
				break;
			case "3": 
				vo.setSearchValue2("120");
				param.put("parent", "120");
				categoryList2 = (List<Map>) commonSvc.selectCategoryChildrenDataList(param);
				break;
			case "4": 
				vo.setSearchValue2("121");
				param.put("parent", "121");
				categoryList2 = (List<Map>) commonSvc.selectCategoryChildrenDataList(param);
				break;
			default:
				break;
		}
		
		model.addAttribute("categoryList2", categoryList2);
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2021; i <= year; i++) {
			yearList.add(i);
		}
		model.addAttribute("yearList", yearList);
		List<?> parent = commonSvc.selectCategoryParentDataList("C037pd467T");
		model.addAttribute("parent", parent);
		List<?> school = commonSvc.selectCategoryParentDataList("CO4843JP1T");
		model.addAttribute("school", school);
		List<?> tech = commonSvc.selectCategoryParentDataList("C4I8N4030T");
		model.addAttribute("tech", tech);
		
	}
	
	@RequestMapping(value="inc/list.ajax")
	public String list(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		int unit = 9;
		if(vo.getSearchValue10().equals("BACK")) {
			Integer index = vo.getPageIndex();
			unit *= index;
			vo.setPageIndex(1);
		}
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				switch (vo.getTabPos2()) {
					case "1": vo.setSearchValue2("118"); break;
					case "2": vo.setSearchValue2("119"); break;
					case "3": vo.setSearchValue2("120"); break;
					case "4": vo.setSearchValue2("121"); break;
					default:
						break;
				}
				
				vo.setIdentifier(FileConst.AWARD_FESTIVAL_EXHIBITION_THUMBNAIL);
				List<?> resultList = homeKorUserAwardFestival2021ExhibitionSvc.selectHomeKorUserAwardFestival2021ExhibitionList(vo);
				Integer totalCnt = homeKorUserAwardFestival2021ExhibitionSvc.selectHomeKorUserAwardFestival2021ExhibitionListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		}, unit, 10);
		
		return "web/home/kor/user/award/inc/list";
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.AWARD_FESTIVAL_EXHIBITION_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorUserAwardFestival2021ExhibitionSvc.selectHomeKorUserAwardFestival2021Exhibition(vo);
			model.addAttribute("resultData", resultData);
			EgovMap param = new EgovMap();
			param.put("category", "C037pd467T");
			param.put("parent", resultData.get("parentRef"));
			//System.out.println(resultData.get("parentRef"));
			List<Map> categoryList2 = (List<Map>) commonSvc.selectCategoryChildrenDataList(param);
			model.addAttribute("categoryList2", categoryList2);
		}
		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2021; i <= year; i++) {
			yearList.add(i);
		}
		model.addAttribute("yearList", yearList);
		List<?> parent = commonSvc.selectCategoryParentDataList("C037pd467T");
		model.addAttribute("parent", parent);
		List<?> school = commonSvc.selectCategoryParentDataList("CO4843JP1T");
		model.addAttribute("school", school);
		List<?> tech = commonSvc.selectCategoryParentDataList("C4I8N4030T");
		model.addAttribute("tech", tech);
	}
}