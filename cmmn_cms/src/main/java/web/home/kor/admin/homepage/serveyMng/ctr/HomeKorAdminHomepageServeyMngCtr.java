package web.home.kor.admin.homepage.serveyMng.ctr;

import java.util.Arrays;
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
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.serveyMng.svc.HomeKorAdminHomepageServeyMngSvc;

@Controller
@RequestMapping(value="/homepage/serveyMng/")
public class HomeKorAdminHomepageServeyMngCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepageServeyMngSvc")
	private HomeKorAdminHomepageServeyMngSvc homeKorAdminHomepageServeyMngSvc; 
	
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
				List<?> resultList = (List<?>) homeKorAdminHomepageServeyMngSvc.selectAdminSurveyDataList(vo);
				int totalCnt = homeKorAdminHomepageServeyMngSvc.selectAdminSurveyDataListCnt(vo);
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
			EgovMap resultData = homeKorAdminHomepageServeyMngSvc.selectAdminSurveyData(vo);
			List<?> resultSubDataList = homeKorAdminHomepageServeyMngSvc.selectAdminSurveySubDataList(vo);
			model.addAttribute("resultData", resultData);
			model.addAttribute("resultSubDataList", resultSubDataList);
		}
		
	}
	
	@RequestMapping(value="editTotal.do")
	public void editTotal(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> resultList = homeKorAdminHomepageServeyMngSvc.selectAdminSurveyEditSubTotalDataList(vo);
		model.addAttribute("resultList", resultList);
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		List<String> subIdxList = (List<String>) vo.getParamKeyList1();
		List<String> subSurveyTypeList = (List<String>) vo.getParamKeyList2();
		List<String> subSurveyTitleList = (List<String>) vo.getParamKeyList3();
		List<String> subSurveyTxtList = (List<String>) vo.getParamKeyList5();
		
		switch (vo.getAct()) {
			case "regist":
				homeKorAdminHomepageServeyMngSvc.insertAdminSurveyData(vo);	
				for(int i=0; i<subSurveyTypeList.size(); i++) {
					CommonVO paramVO = new CommonVO();
					paramVO.setParamKey1(vo.getIdx());
					paramVO.setParamKey2(subSurveyTypeList.get(i));
					paramVO.setParamKey3(subSurveyTitleList.get(i));
					if(paramVO.getParamKey2().equals("A")) paramVO.setParamKey5(subSurveyTxtList.get(i));
					
					homeKorAdminHomepageServeyMngSvc.insertAdminSurveySubData(paramVO);
					model.addAttribute("status", "0");
				}
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminHomepageServeyMngSvc.deleteAdminSurveySubData(vo);
				homeKorAdminHomepageServeyMngSvc.updateAdminSurveyData(vo);

				for(int i=0; i<subIdxList.size(); i++) {
					CommonVO paramVO = new CommonVO();
					paramVO.setIdx(subIdxList.get(i));
					paramVO.setParamKey1(vo.getIdx());
					paramVO.setParamKey2(subSurveyTypeList.get(i));
					paramVO.setParamKey3(subSurveyTitleList.get(i));
					if(paramVO.getParamKey2().equals("A")) paramVO.setParamKey5(subSurveyTxtList.get(i));
					switch (paramVO.getIdx()) {
						
						case "-1":homeKorAdminHomepageServeyMngSvc.insertAdminSurveySubData(paramVO);break;
						default:homeKorAdminHomepageServeyMngSvc.updateAdminSurveySubData(paramVO);break;
					}
				}
				model.addAttribute("status", "1");
				
				break;
			case "delete":
				homeKorAdminHomepageServeyMngSvc.updateAdminSurveyDataDel(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
	@RequestMapping(value = "servey_list.do")
	public void servey_list(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request, 
			ModelMap model
			) throws Exception {
		
		setPaging2(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = (List<?>) homeKorAdminHomepageServeyMngSvc.selectEducationParticipantSurveyDataList(vo);
				int totalCnt = homeKorAdminHomepageServeyMngSvc.selectEducationParticipantSurveyDataListCnt(vo);
				return new Object[]{resultList, totalCnt};
			}
		});

	}
	
	@RequestMapping(value="servey_edit.do")
	public void servey_edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request, 
			ModelMap model
			) throws Exception {
		if(vo.getAct2().equals("modify")) {
			EgovMap resultData = homeKorAdminHomepageServeyMngSvc.selectAdminSurveyEditData(vo);
			model.addAttribute("resultData", resultData);
			
			vo.setIdx3(resultData.get("surveyNo").toString());
			List<?> resultSubDataList = homeKorAdminHomepageServeyMngSvc.selectAdminSurveyEditSubDataList(vo);
			model.addAttribute("resultSubDataList", resultSubDataList);
		}
	}
	
	@RequestMapping(value="survey_text.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject surveyText(
			@RequestParam(value="keyArr", defaultValue="") String keyArr
			) throws Exception {

		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(keyArr)) {
			json.put("result", "400");
			json.put("msg", "키값이 누락되었습니다.");
			return json;
		}
		
		try {
			List<String> keyList = Arrays.asList(keyArr.split(","));
			EgovMap param = new EgovMap();
			param.put("keyArr", keyList);
			
			List<Map> resultList = (List<Map>) homeKorAdminHomepageServeyMngSvc.selectAdminSurveyEditSubmitTextDataInfoList(param);
			for(Map innerMap : resultList) {
				String answer = String.valueOf(innerMap.get("answer"));
				innerMap.put("answer", CustomTldFunctions.nl2br(answer));
			}
			json = objectBuilder.listMapToJson("list", resultList);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		
		return json;
	}
}