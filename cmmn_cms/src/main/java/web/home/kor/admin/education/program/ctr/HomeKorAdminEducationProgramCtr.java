package web.home.kor.admin.education.program.ctr;

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

import com.mysql.cj.Session;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.program.svc.HomeKorAdminEducationProgramSvc;

@Controller
@RequestMapping(value="/education/program/")
public class HomeKorAdminEducationProgramCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationProgramSvc")
	private HomeKorAdminEducationProgramSvc homeKorAdminEducationProgramSvc; 
	
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
				List<?> resultList = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgramList(vo);
				Integer totalCnt = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgramListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
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
			EgovMap resultData = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgram(vo);
			model.addAttribute("resultData", resultData);
			
			List<?> resultList1 = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgramIndexList(vo);
			model.addAttribute("resultList1", resultList1);
			List<?> resultList2 = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgramLinkList(vo);
			model.addAttribute("resultList2", resultList2);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		/*		목차		*/
		List<String> keyList = (List<String>) vo.getParamKeyList1();
		List<String> contentList = (List<String>) vo.getParamKeyList2();
		
		/*		관련 자료 링크		*/
		List<String> linkKeyList = (List<String>) vo.getParamKeyList3();
		List<String> titleList = (List<String>) vo.getParamKeyList4();
		List<String> linkList = (List<String>) vo.getParamKeyList5();
		
		switch (vo.getAct()) {
			case "regist":
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgram(vo);
				insertFileData(FileConst.EDUCATION_PROGRAM_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_PROGRAM_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				if(keyList != null) {
					for(int i=0; i<keyList.size(); i++) {
						String key = keyList.get(i);
						String indexContent = contentList.get(i);
						
						EgovMap param = new EgovMap();
						param.put("key", key);
						param.put("parentKey", vo.getIdx());
						param.put("indexContent", indexContent);
						homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgramIndex(param);
					}
				}
				if(linkKeyList != null) {
					for(int i=0; i<linkKeyList.size(); i++) {
						String key = linkKeyList.get(i);
						String title = titleList.get(i);
						String link = linkList.get(i);
						
						EgovMap param = new EgovMap();
						param.put("key", key);
						param.put("parentKey", vo.getIdx());
						param.put("title", title);
						param.put("link", link);
						homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgramLink(param);
					}
				}
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationProgramSvc.updateHomeKorAdminEducationProgram(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_PROGRAM_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_PROGRAM_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				if(keyList != null) {
					for(int i=0; i<keyList.size(); i++) {
						String key = keyList.get(i);
						String indexContent = contentList.get(i);
						
						EgovMap param = new EgovMap();
						param.put("key", key);
						param.put("parentKey", vo.getIdx());
						param.put("indexContent", indexContent);
						if(key.equals("0")) {
							homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgramIndex(param);
						} else {
							homeKorAdminEducationProgramSvc.updateHomeKorAdminEducationProgramIndex(param);
						}
						
					}
				}
				if(linkKeyList != null) {
					for(int i=0; i<linkKeyList.size(); i++) {
						String key = linkKeyList.get(i);
						String title = titleList.get(i);
						String link = linkList.get(i);
						
						EgovMap param = new EgovMap();
						param.put("key", key);
						param.put("parentKey", vo.getIdx());
						param.put("title", title);
						param.put("link", link);
						if(key.equals("0")) {
							homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgramLink(param);
						} else {
							homeKorAdminEducationProgramSvc.updateHomeKorAdminEducationProgramLink(param);
						}
						
					}
				}
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgram(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramCommentList(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramIndexList(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramLinkList(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramList(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramCommentMultipleList(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramIndexMultipleList(vo);
				homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramLinkMultipleList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
	@RequestMapping(value="index_delete.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject index_delete(
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx2(no);
			homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramIndex(vo);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="link_delete.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject link_delete(
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx3(no);
			homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramLink(vo);
			json.put("result", "200");
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
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx(no);
			List<?> commentList = homeKorAdminEducationProgramSvc.selectHomeKorAdminEducationProgramCommentList(vo);
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
		EgovMap adminSession = admSessionAt(request);
		String no2 = String.valueOf(adminSession.get("no"));
		try {
			EgovMap param = new EgovMap();
			param.put("parentKey", no);
			param.put("userKey", no2);
			param.put("content", content);
			homeKorAdminEducationProgramSvc.insertHomeKorAdminEducationProgramComment(param);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
	@RequestMapping(value="comment_delete.ajax", produces="application/json;charset=utf8")
	public @ResponseBody JSONObject comment_delete(
			@RequestParam(value="no", defaultValue="") String no,
			HttpServletRequest request
			) throws Exception {
		JSONObject json = new JSONObject();
		try {
			CommonVO vo = new CommonVO();
			vo.setIdx4(no);
			homeKorAdminEducationProgramSvc.deleteHomeKorAdminEducationProgramComment(vo);
			json.put("result", "200");
		} catch(Exception e) {
			e.printStackTrace();
			json.put("result", "500");
		}
		return json;
	}
	
}