package web.home.kor.user.award.festival2022.champion.ctr;

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
import web.home.kor.user.award.festival2022.champion.svc.HomeKorUserAwardFestival2022ChampionSvc;

@Controller
@RequestMapping(value="/award/festival2022/champion/")
public class HomeKorUserAwardFestival2022ChampionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserAwardFestival2022ChampionSvc")
	private HomeKorUserAwardFestival2022ChampionSvc homeKorUserAwardFestival2022ChampionSvc; 
	
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
				vo.setSearchValue2("118");
				vo.setSearchValue1("2022");
				List<?> resultList = homeKorUserAwardFestival2022ChampionSvc.selectHomeKorUserAwardFestival2022ExhibitionList(vo);
				Integer totalCnt = homeKorUserAwardFestival2022ChampionSvc.selectHomeKorUserAwardFestival2022ExhibitionListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		int year = Calendar.getInstance().get(Calendar.YEAR);
		List<Integer> yearList = new ArrayList<Integer>();
		for(int i = 2021; i <= year; i++) {
			yearList.add(i);
			//System.out.println("yearList::::::::::::::" + i);
		}
		model.addAttribute("yearList", yearList);
		List<?> parent = commonSvc.selectCategoryParentDataList("C037pd467T");
		model.addAttribute("parent", parent);
		List<?> school = commonSvc.selectCategoryParentDataList("CO4843JP1T");
		model.addAttribute("school", school);
		List<?> tech = commonSvc.selectCategoryParentDataList("C4I8N4030T");
		model.addAttribute("tech", tech);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.AWARD_FESTIVAL_EXHIBITION_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorUserAwardFestival2022ChampionSvc.selectHomeKorUserAwardFestival2022Exhibition(vo);
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
			//System.out.println("yearList::::::::::::::" + i);
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