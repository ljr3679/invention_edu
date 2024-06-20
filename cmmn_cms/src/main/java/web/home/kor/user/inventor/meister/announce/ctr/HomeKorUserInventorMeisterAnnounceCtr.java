package web.home.kor.user.inventor.meister.announce.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.json.JsonObject;
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
import cms.data.StaticData;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.inventor.meister.announce.svc.HomeKorUserInventorMeisterAnnounceSvc;
import web.home.kor.user.inventor.meister.contact.svc.HomeKorUserInventorMeisterContactSvc;

@Controller
@RequestMapping(value="/inventor/meister/announce/")
public class HomeKorUserInventorMeisterAnnounceCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserInventorMeisterAnnounceSvc")
	private HomeKorUserInventorMeisterAnnounceSvc homeKorUserInventorMeisterAnnounceSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		List<?> yearList = commonSvc.selectCategoryParentDataList("C4EvWU5dHT");
		model.addAttribute("yearList", yearList);
		
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceList(vo);
				Integer totalCnt = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("fileList1", selectFileData(FileConst.INVENTOR_MEISTER_ANNOUNCE_ATTACH,vo.getIdx()));
		EgovMap resultData = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounce(vo);
		model.addAttribute("resultData", resultData);
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="step1_apply.do")
	public void step1_apply(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("content1", getBoardContent("1676Bavm"));
		model.addAttribute("content2", getBoardContent("AF1816g2"));
		model.addAttribute("content3", getBoardContent("nx6r01X7"));
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="step2_apply.do")
	public void step2_apply(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="step3_apply.do")
	public void step3_apply(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		EgovMap resultData = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceApplyNumber(vo);
		model.addAttribute("resultData", resultData);
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="apply_view.do")
	public void apply_view(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("fileList1", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH1,vo.getIdx()));
		model.addAttribute("fileList2", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH2,vo.getIdx()));
		EgovMap resultData = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceApply(vo);
		model.addAttribute("resultData", resultData);
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="apply_edit.do")
	public void apply_edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		model.addAttribute("fileList1", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH1,vo.getIdx()));
		model.addAttribute("fileList2", selectFileData(FileConst.MEISTER_ANNOUNCE_ATTACH2,vo.getIdx()));
		EgovMap resultData = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceApply(vo);
		model.addAttribute("resultData", resultData);
		
		model.addAttribute("layout_option", "sub");
	}
	
	@RequestMapping(value="apply.act")
	public void applyAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getParamKey1())) vo.setParamKey1(encryptModule.encryptSHA256(vo.getParamKey1()));	//비밀번호
		if(stringUtil.isNotEmpty(vo.getParamKey13())) vo.setParamKey13(encryptModule.encryptAREA(vo.getParamKey13()));	//팁원1 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey14())) vo.setParamKey14(encryptModule.encryptAREA(vo.getParamKey14()));	//팀원1 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey19())) vo.setParamKey19(encryptModule.encryptAREA(vo.getParamKey19()));	//팁원2 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey20())) vo.setParamKey20(encryptModule.encryptAREA(vo.getParamKey20()));	//팀원2 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey25())) vo.setParamKey25(encryptModule.encryptAREA(vo.getParamKey25()));	//팁원3 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey26())) vo.setParamKey26(encryptModule.encryptAREA(vo.getParamKey26()));	//팀원3 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey31())) vo.setParamKey31(encryptModule.encryptAREA(vo.getParamKey31()));	//교사 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey32())) vo.setParamKey32(encryptModule.encryptAREA(vo.getParamKey32()));	//교사 이메일
		
		homeKorUserInventorMeisterAnnounceSvc.insertHomeKorUserInventorMeisterAnnounceApply(vo);
		insertFileData(FileConst.MEISTER_ANNOUNCE_ATTACH1, vo.getIdx2(), vo.getFileDataList1());
		insertFileData(FileConst.MEISTER_ANNOUNCE_ATTACH2, vo.getIdx2(), vo.getFileDataList2());
		model.addAttribute("status", "3");
		model.addAttribute("msg", "대회공고에 신청 되었습니다.");
		
		JSONObject json = searchDataToJson(vo);
		json.put("idx2", vo.getIdx2());
		
		model.addAttribute("params", json);
		model.addAttribute("returnURL", vo.getSelfPath()+"step3_apply.do");
	}
	
	@RequestMapping(value="apply_update.act")
	public void applyUpdateAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getParamKey1())) vo.setParamKey1(encryptModule.encryptSHA256(vo.getParamKey1()));	//비밀번호
		if(stringUtil.isNotEmpty(vo.getParamKey13())) vo.setParamKey13(encryptModule.encryptAREA(vo.getParamKey13()));	//팁원1 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey14())) vo.setParamKey14(encryptModule.encryptAREA(vo.getParamKey14()));	//팀원1 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey19())) vo.setParamKey19(encryptModule.encryptAREA(vo.getParamKey19()));	//팁원2 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey20())) vo.setParamKey20(encryptModule.encryptAREA(vo.getParamKey20()));	//팀원2 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey25())) vo.setParamKey25(encryptModule.encryptAREA(vo.getParamKey25()));	//팁원3 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey26())) vo.setParamKey26(encryptModule.encryptAREA(vo.getParamKey26()));	//팀원3 이메일
		if(stringUtil.isNotEmpty(vo.getParamKey31())) vo.setParamKey31(encryptModule.encryptAREA(vo.getParamKey31()));	//교사 휴대전화
		if(stringUtil.isNotEmpty(vo.getParamKey32())) vo.setParamKey32(encryptModule.encryptAREA(vo.getParamKey32()));	//교사 이메일
		
		homeKorUserInventorMeisterAnnounceSvc.updateHomeKorUserInventorMeisterAnnounceApply(vo);
		removeFileData(vo);
		insertFileData(FileConst.MEISTER_ANNOUNCE_ATTACH1, vo.getIdx(), vo.getFileDataList1());
		insertFileData(FileConst.MEISTER_ANNOUNCE_ATTACH2, vo.getIdx(), vo.getFileDataList2());
		model.addAttribute("status", "3");
		model.addAttribute("msg", "수정 되었습니다.");
		
		JSONObject json = searchDataToJson(vo);
		model.addAttribute("params", json);
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
	@RequestMapping(value="/apply_check.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject apply_check(
			@RequestParam(value="user_number", defaultValue="") String user_number,
			@RequestParam(value="user_pw", defaultValue="") String user_pw,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			EgovMap map = new EgovMap();
			map.put("number", user_number);
			map.put("pw", encryptModule.encryptSHA256(user_pw));
			
			String checked = "N";
			EgovMap resultData = homeKorUserInventorMeisterAnnounceSvc.selectHomeKorUserInventorMeisterAnnounceApplyNo(map);
			if(stringUtil.isNotEmpty(resultData)) {
				checked = "Y";
				json.put("idx", String.valueOf(resultData.get("no")));
			}
				
			json.put("checked", checked);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="/apply_cancellation.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject apply_cancellation(
			@RequestParam(value="idx", defaultValue="") String idx,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			EgovMap map = new EgovMap();
			map.put("idx", idx);
			homeKorUserInventorMeisterAnnounceSvc.updateHomeKorUserInventorMeisterAnnounceApplyUseAt(map);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
}