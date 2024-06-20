package web.home.kor.admin.homepage.popup.ctr;

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
import web.home.kor.admin.homepage.popup.svc.HomeKorAdminHomepagePopupSvc;

@Controller
@RequestMapping(value="/homepage/popup/")
public class HomeKorAdminHomepagePopupCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminHomepagePopupSvc")
	private HomeKorAdminHomepagePopupSvc homeKorAdminHomepagePopupSvc; 
	
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
				List<?> resultList = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopup(vo);
				Integer totalCnt = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
		
	}*/
	
	@RequestMapping(value="edit.do")
	public void edit(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isEmpty(vo.getTabPos())) vo.setTabPos("A");
		switch (vo.getTabPos()) {
			case "A":
				vo.setSearchValue1("A");
				Integer aCnt = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
				if(aCnt >= 1) {
					EgovMap resultData1 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopup(vo);
					model.addAttribute("resultData1", resultData1);
					vo.setIdx(  String.valueOf(resultData1.get("no")));
					model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL,vo.getIdx()));
				}
				break;
			case "B":
				vo.setSearchValue1("B");
				Integer bCnt = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
				if(bCnt >= 1) {
					EgovMap resultData2 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopup(vo);
					vo.setIdx(  String.valueOf(resultData2.get("no")));
					model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL,vo.getIdx()));
					model.addAttribute("resultData2", resultData2);
				}
				break;
			case "C":
				setPaging(vo, model, new PagingDataInterface() {
					@Override
					public Object[] callData() throws Exception {
						// TODO Auto-generated method stub
						vo.setSearchValue1("C");
						List<?> resultList = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupList(vo);
						Integer totalCnt = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
						return new Object[] {resultList, totalCnt};
					}
				});
				break;
			default:
				break;
		}
	}
	
	@RequestMapping(value="editC.do")
	public void editC(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getIdx())) {
			model.addAttribute("fileList1", selectFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL,vo.getIdx()));
			EgovMap resultData3 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopup(vo);
			model.addAttribute("resultData3", resultData3);
		}
	}
	
	@RequestMapping(value="edit.act")
	public void editAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		switch (vo.getTabPos()) {
		case "A":
			vo.setSearchValue1("A");
			vo.setParamKey3("A");
			Integer totalCnt1 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
			if(totalCnt1 == 0) {
				homeKorAdminHomepagePopupSvc.insertHomeKorAdminHomepagePopup(vo);
				insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
			} else {
				homeKorAdminHomepagePopupSvc.updateHomeKorAdminHomepagePopup(vo);
				removeFileData(vo);
				insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
			}
			model.addAttribute("status", "0");
			break;
		case "B":
			vo.setSearchValue1("B");
			vo.setParamKey3("B");
			Integer totalCnt2 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
			if(totalCnt2 == 0) {
				homeKorAdminHomepagePopupSvc.insertHomeKorAdminHomepagePopup(vo);
				insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
			} else {
				homeKorAdminHomepagePopupSvc.updateHomeKorAdminHomepagePopup(vo);
				removeFileData(vo);
				insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
			}
			model.addAttribute("status", "0");
			break;
		case "C":
			vo.setSearchValue1("C");
			vo.setParamKey3("C");
			Integer totalCnt3 = homeKorAdminHomepagePopupSvc.selectHomeKorAdminHomepagePopupListCnt(vo);
			switch (vo.getAct()) {
			case "regist":
				if(totalCnt3 <= 5) {
					homeKorAdminHomepagePopupSvc.insertHomeKorAdminHomepagePopup(vo);
					insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
					model.addAttribute("status", "0");
				}
				break;
			case "modify":
				homeKorAdminHomepagePopupSvc.updateHomeKorAdminHomepagePopup(vo);
				removeFileData(vo);
				insertFileData(FileConst.HOMEPAGE_POPUP_THUMBNAIL, vo.getIdx(), vo.getFileDataList1());
				model.addAttribute("status", "1");
				break;
			case "delete":
				if(totalCnt3 != 1) {
					homeKorAdminHomepagePopupSvc.deleteHomeKorAdminHomepagePopup(vo);
					model.addAttribute("status", "2");
				}
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		model.addAttribute("params", searchDataToJson(vo));
		model.addAttribute("returnURL", vo.getSelfPath()+"edit.do?tabPos="+vo.getTabPos());
	}
	
}