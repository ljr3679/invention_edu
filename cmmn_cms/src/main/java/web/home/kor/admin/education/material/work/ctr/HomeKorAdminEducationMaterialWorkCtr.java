package web.home.kor.admin.education.material.work.ctr;

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
import web.home.kor.admin.education.material.work.svc.HomeKorAdminEducationMaterialWorkSvc;

@Controller
@RequestMapping(value="/education/material/work/")
public class HomeKorAdminEducationMaterialWorkCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminEducationMaterialWorkSvc")
	private HomeKorAdminEducationMaterialWorkSvc homeKorAdminEducationMaterialWorkSvc; 
	
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
				vo.setIdentifier(FileConst.EDUCATION_MATERIAL_WORK_ATTACH);
				List<?> resultList = homeKorAdminEducationMaterialWorkSvc.selectHomeKorAdminEducationMaterialWorkList(vo);
				Integer totalCnt = homeKorAdminEducationMaterialWorkSvc.selectHomeKorAdminEducationMaterialWorkListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		List<?> type = commonSvc.selectCategoryParentDataList("C5JLc42IsT");
		model.addAttribute("type", type);
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		List<?> type = commonSvc.selectCategoryParentDataList("C5JLc42IsT");
		model.addAttribute("type", type);
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH,vo.getIdx()));
			model.addAttribute("fileList2", selectFileData(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorAdminEducationMaterialWorkSvc.selectHomeKorAdminEducationMaterialWork(vo);
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
				homeKorAdminEducationMaterialWorkSvc.insertHomeKorAdminEducationMaterialWork(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminEducationMaterialWorkSvc.updateHomeKorAdminEducationMaterialWork(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH, vo.getIdx(), vo.getFileDataList1());
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL, vo.getIdx(), vo.getFileDataList2());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminEducationMaterialWorkSvc.deleteHomeKorAdminEducationMaterialWork(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminEducationMaterialWorkSvc.deleteHomeKorAdminEducationMaterialWorkList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}