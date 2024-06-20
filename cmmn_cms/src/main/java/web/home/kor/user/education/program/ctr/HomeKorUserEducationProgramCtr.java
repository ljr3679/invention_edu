package web.home.kor.user.education.program.ctr;

import java.util.ArrayList;
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
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.education.program.svc.HomeKorUserEducationProgramSvc;

@Controller
@RequestMapping(value="/education/program/")
public class HomeKorUserEducationProgramCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationProgramSvc")
	private HomeKorUserEducationProgramSvc homeKorUserEducationProgramSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		EgovMap userSession = usrSessionAt(request);
		if(stringUtil.isEmpty(userSession))
			vo.setSearchValue2("");
		else 
			vo.setSearchValue2(String.valueOf(userSession.get("no")));
		List<String> searchValueList1 = new ArrayList<>();
		searchValueList1.add("A");
		if(stringUtil.isEmpty(vo.getSearchValueList1())) vo.setSearchValueList1(searchValueList1);
		/*if(vo.getSearchValueList1().size() == 0 || vo.getSearchValueList1() == null) vo.setSearchValueList1(searchValueList1);*/
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				vo.setIdentifier(FileConst.EDUCATION_PROGRAM_THUMBNAIL);
				List<?> resultList = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramList(vo);
				Integer totalCnt = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		}, 8, 10);
		List<?> promList = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramPromList(vo);
		model.addAttribute("promList", promList);
		List<?> targetList = commonSvc.selectCategoryParentDataList("CpF1M7T17T");
		model.addAttribute("targetList", targetList);
		List<?> subjectList = commonSvc.selectCategoryParentDataList("C59593d35T");
		model.addAttribute("subjectList", subjectList);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> targetList = commonSvc.selectCategoryParentDataList("CpF1M7T17T");
		model.addAttribute("targetList", targetList);
		List<?> subjectList = commonSvc.selectCategoryParentDataList("C59593d35T");
		model.addAttribute("subjectList", subjectList);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_PROGRAM_ATTACH,vo.getIdx()));
			model.addAttribute("fileList2", selectFileData(FileConst.EDUCATION_PROGRAM_THUMBNAIL,vo.getIdx()));
			vo.setIdentifier(FileConst.EDUCATION_PROGRAM_THUMBNAIL);
			EgovMap resultData = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgram(vo);
			model.addAttribute("resultData", resultData);
			
			Integer scrapAt = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramScrapAtCnt(vo);
			model.addAttribute("scrapAt", scrapAt);
			
			List<?> indexList = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramIndexList(vo);
			model.addAttribute("indexList", indexList);
			List<?> linkList = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramLinkList(vo);
			model.addAttribute("linkList", linkList);
		}
	}
	
	@RequestMapping(value="stat_info.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject stat_info(
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx(no);
			EgovMap statInfo = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgram(vo);
			json.put("result", "200");
			json.put("statInfo", statInfo);
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="comment_init.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject comment_init(
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		EgovMap userSession = admSessionAt(request);
		String no2 = String.valueOf(5);
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx(no);
			List<?> commentList = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramCommentList(vo);
			if(commentList != null) {
				for(int i=0; i<commentList.size(); i++) {
					EgovMap map = new EgovMap();
					map = (EgovMap) commentList.get(i);
					String id = String.valueOf(map.get("register"));
					if(!id.equals(no2)) {
						String name = String.valueOf(map.get("registerName"));
						map.put("registerName", name.substring(0, name.length() - 2) + "**");
					}
				}
			}
			json.put("commentList", commentList);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="comment_insert.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject comment_insert(
			@RequestParam(value="no", defaultValue="") String no,
			@RequestParam(value="content", defaultValue="") String content,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		EgovMap userSession = usrSessionAt(request);
		String no2 = String.valueOf(userSession.get("no"));
		
		try {
			EgovMap param = new EgovMap();
			param.put("parentKey", no);
			param.put("userKey", no2);
			param.put("content", content);
			homeKorUserEducationProgramSvc.insertHomeKorUserEducationProgramComment(param);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="comment_update.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject comment_update(
			@RequestParam(value="no", defaultValue="") String no,
			@RequestParam(value="content", defaultValue="") String content,
			@RequestParam(value="userId", defaultValue="") String userId,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		EgovMap userSession = usrSessionAt(request);
		String no2 = String.valueOf(userSession.get("no"));
		try {
			if(no2.equals(userId)) {
				EgovMap param = new EgovMap();
				param.put("key", no);
				param.put("content", content);
				homeKorUserEducationProgramSvc.updateHomeKorUserEducationProgramComment(param);
				json.put("result", "200");
			} else {
				json.put("msg", "자기 댓글만 수정할 수 있습니다.");
				json.put("result", "400");
			}
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="comment_delete.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject comment_delete(
			@RequestParam(value="no", defaultValue="") String no,
			@RequestParam(value="userId", defaultValue="") String userId,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		EgovMap userSession = usrSessionAt(request);
		String no2 = String.valueOf(userSession.get("no"));
		try {
			if(no2.equals(userId)) {
				CommonVO vo = new CommonVO();
				vo.setIdx4(no);
				homeKorUserEducationProgramSvc.deleteHomeKorUserEducationProgramComment(vo);
				json.put("result", "200");
			} else {
				json.put("msg", "자기 댓글만 삭제할 수 있습니다.");
				json.put("result", "400");
			}
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="scrap_regist.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject scrap_regist(
			@ModelAttribute("commonVO") CommonVO vo,
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		EgovMap userSession = usrSessionAt(request);
		
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		vo.setIdx(no);
		Integer cnt = homeKorUserEducationProgramSvc.selectHomeKorUserEducationProgramScrapAtCnt(vo);
		//System.out.println("cnt ::" + cnt);
		if(cnt >=1) {
			homeKorUserEducationProgramSvc.deleteHomeKorUserEducationProgramScrap(vo);
			json.put("result", "201");
			json.put("msg", "스크랩 삭재 됬습니다.");
			return json;
		}
		try {
			String no2 = String.valueOf(userSession.get("no"));
			EgovMap param = new EgovMap();
			param.put("parentKey", no);
			param.put("userKey", no2);
			homeKorUserEducationProgramSvc.insertHomeKorUserEducationProgramScrap(param);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="scrap_delete.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject scrap_delete(
			@RequestParam(value="no", defaultValue="") String no,
			@RequestParam(value="userId", defaultValue="") String userId,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		EgovMap userSession = usrSessionAt(request);
		String no2 = String.valueOf(userSession.get("no"));
		if(stringUtil.isEmpty(usrSessionAt(request))) {
			json.put("result", "400");
			json.put("msg", "로그인 후 이용해주세요.");
			return json;
		}
		try {
			if(no2.equals("5")) {
				CommonVO vo = new CommonVO();
				vo.setIdx4(no);
				homeKorUserEducationProgramSvc.deleteHomeKorUserEducationProgramScrapList(vo);
				json.put("result", "200");
			} else {
				json.put("msg", "자기 댓글만 수정할 수 있습니다.");
				json.put("result", "400");
			}
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
}
