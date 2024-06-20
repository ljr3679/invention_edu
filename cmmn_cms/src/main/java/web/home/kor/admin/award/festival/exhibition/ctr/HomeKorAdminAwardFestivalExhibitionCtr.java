package web.home.kor.admin.award.festival.exhibition.ctr;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

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
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.award.festival.exhibition.svc.HomeKorAdminAwardFestivalExhibitionSvc;

@Controller
@RequestMapping(value="/award/festival/exhibition/")
public class HomeKorAdminAwardFestivalExhibitionCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminAwardFestivalExhibitionSvc")
	private HomeKorAdminAwardFestivalExhibitionSvc homeKorAdminAwardFestivalExhibitionSvc; 
	
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
				List<?> resultList = homeKorAdminAwardFestivalExhibitionSvc.selectHomeKorAdminAwardFestivalExhibitionList(vo);
				Integer totalCnt = homeKorAdminAwardFestivalExhibitionSvc.selectHomeKorAdminAwardFestivalExhibitionListCnt(vo);
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
			EgovMap resultData = homeKorAdminAwardFestivalExhibitionSvc.selectHomeKorAdminAwardFestivalExhibition(vo);
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
		
		/*List<EgovMap> categoryList = (List<EgovMap>)commonSvc.selectCategoryParentDataList("C037pd467T");
		
		for (EgovMap map : categoryList) {
			EgovMap param = new EgovMap();
			param.put("category", "C037pd467T");
			param.put("parent", map.get("no"));
			
			List<Map> categoryList2 = (List<Map>) commonSvc.selectCategoryChildrenDataList(param);
			//System.out.println("categoryList2::::" + categoryList2);
			map.put("categoryList2", categoryList2);
		}*/
	}
	
	@RequestMapping(value= "type_init.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject child_cate(
			@RequestParam(value="parent", defaultValue="") String parent,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(parent)) {
			json.put("result", "400");
			json.put("msg", "키값이 누락되었습니다.");
			return json;
		}
		try {
			EgovMap param = new EgovMap();
			param.put("category", "C037pd467T");
			param.put("parent", parent);
			List<EgovMap> categoryList = (List<EgovMap>) commonSvc.selectCategoryChildrenDataList(param);
			json.put("categoryList", categoryList);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				homeKorAdminAwardFestivalExhibitionSvc.insertHomeKorAdminAwardFestivalExhibition(vo);
				insertFileData(FileConst.AWARD_FESTIVAL_EXHIBITION_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminAwardFestivalExhibitionSvc.updateHomeKorAdminAwardFestivalExhibition(vo);
				removeFileData(vo);
				insertFileData(FileConst.AWARD_FESTIVAL_EXHIBITION_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminAwardFestivalExhibitionSvc.deleteHomeKorAdminAwardFestivalExhibition(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminAwardFestivalExhibitionSvc.deleteHomeKorAdminAwardFestivalExhibitionList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
}