package cms.site.site.category.ctr;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.site.site.category.svc.CMSCategoryMngSvc;
import cms.util.RandomCode;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/site/category/")
public class CMSCategoryMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSCategoryMngSvc")
	private CMSCategoryMngSvc CMSCategoryMngSvc;
	
	@RequestMapping(value="categoryMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		List<?> resultList = CMSCategoryMngSvc.selectCategoryDataList(vo);
		
		model.addAttribute("resultList", resultList);
	}
	
	@RequestMapping(value="select_cate.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject select_cate(
			@RequestParam(value="code", defaultValue="") String code,
			HttpServletRequest request
			) throws Exception {
		EgovMap resultData = CMSCategoryMngSvc.selectCategoryData(code);
		Iterator it = resultData.keySet().iterator();
		while(it.hasNext()) {
			String mapKey = String.valueOf(it.next());
			String value = String.valueOf(resultData.get(mapKey));
			objectBuilder.jsonBulid(mapKey, value);
		}
		
		return objectBuilder.build();
	}
	
	
	@RequestMapping(value="cate_regist.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_regist(
			@RequestParam(value="cate_name", defaultValue="") String cate_name,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		RandomCode randomCode = new RandomCode();
		String getCode;
		while(CMSCategoryMngSvc.selectCheckCategoryKey(getCode = "C"+randomCode.getEngNumCode(8)+"T") != 0);
		
		vo.setIdx(getCode);
		vo.setTitle(cate_name);
		CMSCategoryMngSvc.insertCategoryData(vo);
		
		return getCode;
	}
	
	@RequestMapping(value="cate_modify.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_modify(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="cate_name", defaultValue="") String cate_name,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx(code);
		vo.setTitle(cate_name);
		CMSCategoryMngSvc.updateCategoryData(vo);
		
		return "Y";
	}
	
	@RequestMapping(value="cate_delete.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_delete(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="cate_name", defaultValue="") String cate_name,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx(code);
		CMSCategoryMngSvc.deleteCategorySubAllData(vo);
		vo.setTitle(cate_name);
		CMSCategoryMngSvc.deleteCategoryData(vo);
		
		return "Y";
	}
	
	@RequestMapping(value="cate_data_list.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_data_list(
			@RequestParam(value="code", defaultValue="") String code,
			HttpServletRequest request
			) throws Exception {
		
		List<EgovMap> resultList = (List<EgovMap>) CMSCategoryMngSvc.selectCategorySubDataList(code);
		StringBuilder sb = new StringBuilder();
		int closeCnt = 0;
		for(EgovMap map : resultList) {
			String no = String.valueOf(map.get("no"));
			String dataName = String.valueOf(map.get("dataName"));
			String children = String.valueOf(map.get("children"));
			
			if(children.equals("0") && closeCnt == 0) sb.append("<li><a onClick=\"fn_data_show(this);\" key=\""+no+"\">"+dataName+"</a></li>");
			else if(children.equals("0") && closeCnt != 0) {
				--closeCnt;
				
				if(closeCnt == 0) sb.append("<li><a onClick=\"fn_data_show(this);\" key=\""+no+"\">"+dataName+"</a></li></ul></li>");
				else sb.append("<li><a onClick=\"fn_data_show(this);\" key=\""+no+"\">"+dataName+"</a></li>");
			}
			else {
				closeCnt = Integer.parseInt(children);
				sb.append("<li><a onClick=\"fn_data_show(this);\" key=\""+no+"\">"+dataName+"</a><ul>");
			}
		}
		
		return sb.toString();
	}
	
	@RequestMapping(value="cate_data.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject cate_data(
			@RequestParam(value="key", defaultValue="") String key,
			HttpServletRequest request
			) throws Exception {
		
		EgovMap resultData = CMSCategoryMngSvc.selectCategorySubData(key);
		Iterator it = resultData.keySet().iterator();
		while(it.hasNext()) {
			String mapKey = String.valueOf(it.next());
			String value = String.valueOf(resultData.get(mapKey));
			objectBuilder.jsonBulid(mapKey, value);
		}
		
		return objectBuilder.build();
	}
	
	@RequestMapping(value="cate_data_regist.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_data_regist(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="data_pos", defaultValue="") String data_pos,
			@RequestParam(value="data_txt", defaultValue="") String data_txt,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx(code);
		vo.setIdx3(data_pos);
		vo.setTitle(data_txt);
		CMSCategoryMngSvc.insertCategorySubData(vo);
		return vo.getIdx2();
	}
	
	@RequestMapping(value="cate_data_modify.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_data_modify(
			@RequestParam(value="key", defaultValue="") String key,
			@RequestParam(value="dataName", defaultValue="") String dataName,
			@RequestParam(value="dataSort", defaultValue="") String dataSort,
			@RequestParam(value="mSort", defaultValue="") String mSort,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx2(key);
		vo.setParamKey1(dataSort);
		vo.setParamKey2(mSort);
		if(!dataSort.equals(mSort)) CMSCategoryMngSvc.updateCategorySubDataSort(vo);
		vo.setTitle(dataName);
		CMSCategoryMngSvc.updateCategorySubData(vo);
		return "Y";
	}
	
	@RequestMapping(value="cate_data_delete.ajax", produces="application/text;charset=utf8")
	public @ResponseBody String cate_data_delete(
			@RequestParam(value="key", defaultValue="") String key,
			@RequestParam(value="dataName", defaultValue="") String dataName,
			@RequestParam(value="mSort", defaultValue="") String mSort,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx2(key);
		vo.setParamKey2(mSort);
		CMSCategoryMngSvc.updateCategorySubDataDeleteSort(vo);
		vo.setTitle(dataName);
		CMSCategoryMngSvc.deleteCategorySubData(vo);
		return "Y";
	}
	
}