package web.home.kor.user.education.material.work.ctr;

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
import web.home.kor.user.education.material.work.svc.HomeKorUserEducationMaterialWorkSvc;

@Controller
@RequestMapping(value="/education/material/work/")
public class HomeKorUserEducationMaterialWorkCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserEducationMaterialWorkSvc")
	private HomeKorUserEducationMaterialWorkSvc homeKorUserEducationMaterialWorkSvc; 
	
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
				vo.setIdentifier(FileConst.EDUCATION_MATERIAL_WORK_ATTACH);
				List<?> resultList = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWorkList(vo);
				Integer totalCnt = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWorkListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});*/
		
		materialWorkSet1(vo,model,request);
		materialWorkSet2(vo,model,request);
		materialWorkSet3(vo,model,request);
		List<?> type = commonSvc.selectCategoryParentDataList("C5JLc42IsT");
		model.addAttribute("type", type);
		
	}
	
	private void materialWorkSet1(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_WORK_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL);
		vo.setSearchValue2("103");
		List<?> resultList1 = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWorkList(vo);
		model.addAttribute("resultList1", resultList1);
	}
	private void materialWorkSet3(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_WORK_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL);
		vo.setSearchValue2("104");
		List<?> resultList2 = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWorkList(vo);
		model.addAttribute("resultList2", resultList2);
	}
	private void materialWorkSet2(CommonVO vo, ModelMap model, HttpServletRequest request) throws Exception {
		String userAgent = request.getHeader("User-Agent").toUpperCase();
		vo.setIdentifier(FileConst.EDUCATION_MATERIAL_WORK_ATTACH);
		vo.setIdentifier2(FileConst.EDUCATION_MATERIAL_WORK_THUMBNAIL);
		vo.setSearchValue2("105");
		List<?> resultList3 = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWorkList(vo);
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
			model.addAttribute("fileList1", selectFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH,vo.getIdx()));
			EgovMap resultData = homeKorUserEducationMaterialWorkSvc.selectHomeKorUserEducationMaterialWork(vo);
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
				homeKorUserEducationMaterialWorkSvc.insertHomeKorUserEducationMaterialWork(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorUserEducationMaterialWorkSvc.updateHomeKorUserEducationMaterialWork(vo);
				removeFileData(vo);
				insertFileData(FileConst.EDUCATION_MATERIAL_WORK_ATTACH, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorUserEducationMaterialWorkSvc.deleteHomeKorUserEducationMaterialWork(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorUserEducationMaterialWorkSvc.deleteHomeKorUserEducationMaterialWorkList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}*/
	
}