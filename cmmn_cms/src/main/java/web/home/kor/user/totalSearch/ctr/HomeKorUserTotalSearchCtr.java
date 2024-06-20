package web.home.kor.user.totalSearch.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import web.home.kor.user.totalSearch.svc.HomeKorUserTotalSearchSvc;

@Controller
@RequestMapping(value="/totalSearch/")
public class HomeKorUserTotalSearchCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorUserTotalSearchSvc")
	private HomeKorUserTotalSearchSvc homeKorUserTotalSearchSvc; 
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		if(stringUtil.isNotEmpty(vo.getSearchKeyword())) {
			setPaging(vo, model, new PagingDataInterface() {
				
				@Override
				public Object[] callData() throws Exception {
					// TODO Auto-generated method stub
					List<?> resultList = homeKorUserTotalSearchSvc.selectHomeKorUserTotalSearchList(vo);
					Integer totalCnt = homeKorUserTotalSearchSvc.selectHomeKorUserTotalSearchListCnt(vo);
					return new Object[] {resultList, totalCnt};
				}
			});
		}
	}
}