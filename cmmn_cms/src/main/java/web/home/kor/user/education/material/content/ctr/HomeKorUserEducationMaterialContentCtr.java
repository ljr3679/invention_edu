package web.home.kor.user.education.material.content.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import web.home.kor.user.education.material.content.svc.HomeKorUserEducationMaterialContentSvc;

@Controller
@RequestMapping(value="/education/material/content/")
public class HomeKorUserEducationMaterialContentCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationMaterialContentSvc")
	private HomeKorUserEducationMaterialContentSvc homeKorUserEducationMaterialContentSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		/*setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				vo.setIdentifier(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH);
				List<?> resultList = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContentList(vo);
				Integer totalCnt = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContentListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});*/
		
		materialContentSet1(vo,model,request);
		materialContentSet2(vo,model,request);
		materialContentSet3(vo,model,request);
		List<?> type = commonSvc.selectCategoryParentDataList("Cv16d1B6eT");
		model.addAttribute("type", type);
		
	}
	
	private void materialContentSet1(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL);
		vo.setSearchValue2("148");
		List<?> resultList1 = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContentList(vo);
		model.addAttribute("resultList1", resultList1);
	}
	private void materialContentSet3(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL);
		vo.setSearchValue2("149");
		List<?> resultList2 = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContentList(vo);
		model.addAttribute("resultList2", resultList2);
	}
	private void materialContentSet2(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL);
		vo.setSearchValue2("150");
		List<?> resultList3 = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContentList(vo);
		model.addAttribute("resultList3", resultList3);
	}
	
	/*@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> type = commonSvc.selectCategoryParentDataList("C5JLc42IsT");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH,vo.getIdx()));
			EgovMap resultData = homeKorUserEducationMaterialContentSvc.selectHomeKorUserEducationMaterialContent(vo);
			model.addAttribute("resultData", resultData);
		}
	}*/
	
	/*@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));
				homeKorUserEducationMaterialContentSvc.insertHomeKorUserEducationMaterialContent(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorUserEducationMaterialContentSvc.updateHomeKorUserEducationMaterialContent(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorUserEducationMaterialContentSvc.deleteHomeKorUserEducationMaterialContent(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorUserEducationMaterialContentSvc.deleteHomeKorUserEducationMaterialContentList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}*/
	
}