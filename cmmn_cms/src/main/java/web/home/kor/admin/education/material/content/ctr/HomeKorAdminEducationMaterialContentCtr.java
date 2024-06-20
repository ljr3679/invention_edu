package web.home.kor.admin.education.material.content.ctr;

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
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.material.content.svc.HomeKorAdminEducationMaterialContentSvc;

@Controller
@RequestMapping(value="/education/material/content/")
public class HomeKorAdminEducationMaterialContentCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationMaterialContentSvc")
	private HomeKorAdminEducationMaterialContentSvc homeKorAdminEducationMaterialContentSvc; 
	
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
				vo.setIdentifier(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH);
				List<?> resultList = homeKorAdminEducationMaterialContentSvc.selectHomeKorAdminEducationMaterialContentList(vo);
				Integer totalCnt = homeKorAdminEducationMaterialContentSvc.selectHomeKorAdminEducationMaterialContentListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> type = commonSvc.selectCategoryParentDataList("Cv16d1B6eT");
		model.addAttribute("type", type);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> type = commonSvc.selectCategoryParentDataList("Cv16d1B6eT");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH,vo.getIdx()));
			model.addAttribute("fileList2", selectFileData(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorAdminEducationMaterialContentSvc.selectHomeKorAdminEducationMaterialContent(vo);
			model.addAttribute("resultData", resultData);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		switch (vo.getAct()) {
			case "regist":
				/*vo.setParamKey7(encryptModule.encryptAREA(vo.getParamKey7()));*/
				homeKorAdminEducationMaterialContentSvc.insertHomeKorAdminEducationMaterialContent(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationMaterialContentSvc.updateHomeKorAdminEducationMaterialContent(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_MATERIAL_CONTENT_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationMaterialContentSvc.deleteHomeKorAdminEducationMaterialContent(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationMaterialContentSvc.deleteHomeKorAdminEducationMaterialContentList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}