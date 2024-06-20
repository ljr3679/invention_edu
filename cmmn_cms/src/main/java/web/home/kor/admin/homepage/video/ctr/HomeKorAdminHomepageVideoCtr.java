package web.home.kor.admin.homepage.video.ctr;

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
import web.home.kor.admin.homepage.video.svc.HomeKorAdminHomepageVideoSvc;

@Controller
@RequestMapping(value="/homepage/video/")
public class HomeKorAdminHomepageVideoCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepageVideoSvc")
	private HomeKorAdminHomepageVideoSvc homeKorAdminHomepageVideoSvc; 
	
	/*@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorAdminHomepageVideoSvc.selectHomeKorAdminHomepageVideo(vo);
				Integer totalCnt = homeKorAdminHomepageVideoSvc.selectHomeKorAdminHomepageVideoListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		
	}*/
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL1,"1"));
		model.addAttribute("fileList2", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL2,"1"));
		model.addAttribute("fileList3", selectFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL3,"1"));
		EgovMap resultData = homeKorAdminHomepageVideoSvc.selectHomeKorAdminHomepageVideo(vo);
		model.addAttribute("resultData", resultData);
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		Integer totalCnt = homeKorAdminHomepageVideoSvc.selectHomeKorAdminHomepageVideoListCnt(vo);
		if(totalCnt == 0) {
			homeKorAdminHomepageVideoSvc.insertHomeKorAdminHomepageVideo(vo);
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL1, "1", vo.getFileDataList1());
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL2, "1", vo.getFileDataList2());
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL3, "1", vo.getFileDataList3());
			model.addAttribute("status", "0");
		} else {
			homeKorAdminHomepageVideoSvc.updateHomeKorAdminHomepageVideo(vo);
			removeFileData(vo);
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL1, "1", vo.getFileDataList1());
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL2, "1", vo.getFileDataList2());
			insertFileData(FileConst.HOMEPAGE_VIDEO_THUMBNAIL3, "1", vo.getFileDataList3());
			model.addAttribute("status", "1");
		}
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"index.do");
	}
	
}