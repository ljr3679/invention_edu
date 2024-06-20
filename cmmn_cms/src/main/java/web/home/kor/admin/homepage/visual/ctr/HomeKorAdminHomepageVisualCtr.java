package web.home.kor.admin.homepage.visual.ctr;

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
import web.home.kor.admin.homepage.visual.svc.HomeKorAdminHomepageVisualSvc;

@Controller
@RequestMapping(value="/homepage/visual/")
public class HomeKorAdminHomepageVisualCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepageVisualSvc")
	private HomeKorAdminHomepageVisualSvc homeKorAdminHomepageVisualSvc; 
	
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
				List<?> resultList = homeKorAdminHomepageVisualSvc.selectHomeKorAdminHomepageVisualList(vo);
				Integer totalCnt = homeKorAdminHomepageVisualSvc.selectHomeKorAdminHomepageVisualListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		
	}
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_VISUAL_THUMBNAIL,vo.getIdx()));
			EgovMap resultData = homeKorAdminHomepageVisualSvc.selectHomeKorAdminHomepageVisual(vo);
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
				homeKorAdminHomepageVisualSvc.insertHomeKorAdminHomepageVisual(vo);
				insertFileData(FileConst.HOMEPAGE_VISUAL_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "0");
				break;
			case "modify":
				homeKorAdminHomepageVisualSvc.updateHomeKorAdminHomepageVisual(vo);
				removeFileData(vo);
				insertFileData(FileConst.HOMEPAGE_VISUAL_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				homeKorAdminHomepageVisualSvc.deleteHomeKorAdminHomepageVisual(vo);
				model.addAttribute("status", "2");
				break;
			case "deleteAll":
				homeKorAdminHomepageVisualSvc.deleteHomeKorAdminHomepageVisualList(vo);
				model.addAttribute("status", "2");
				break;
			default:
				break;
		}
		
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}