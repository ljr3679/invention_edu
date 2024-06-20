package web.home.kor.user.center.find.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import cms.constant.FileConst;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.find.svc.HomeKorAdminCenterFindSvc;
import web.home.kor.user.center.find.svc.HomeKorUserCenterFindSvc;

@Controller
@RequestMapping(value="/center/find/")
public class HomeKorUserCenterFindCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserCenterFindSvc")
	private HomeKorUserCenterFindSvc homeKorUserCenterFindSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		List<?> areaList = commonSvc.selectCategoryParentDataList("Ce6WL4s6pT");
		model.addAttribute("areaList", areaList);
		
		if(stringUtil.isEmpty(vo.getSearchValue2())) vo.setSearchValue2("10");
		
		setPaging(vo, model, new PagingDataInterface() {
			@Override
			public Object[] callData() throws Exception {
				// TODO Auto-generated method stub
				List<?> resultList = homeKorUserCenterFindSvc.selectHomeKorUserCenterFindList(vo);
				Integer totalCnt = homeKorUserCenterFindSvc.selectHomeKorUserCenterFindListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		}, Integer.parseInt(vo.getSearchValue2()), 10);
		
		model.addAttribute("layout_option", "sub");
	}
}