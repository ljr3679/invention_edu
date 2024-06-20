package web.home.kor.admin.memberMng.member.ctr;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.memberMng.member.svc.HomeKorAdminMemberMngMemberSvc;

@Controller
@RequestMapping(value="/memberMng/member/")
public class HomeKorAdminMemberMngMemberCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminMemberMngMemberSvc")
	private HomeKorAdminMemberMngMemberSvc homeKorAdminMemberMngMemberSvc;
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				vo.setPagingYn("Y");
				List<?> resultList = homeKorAdminMemberMngMemberSvc.selectMemberDataList(vo);
				int totalCnt = homeKorAdminMemberMngMemberSvc.selectMemberDataListCnt(vo);
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
		
		EgovMap resultData = homeKorAdminMemberMngMemberSvc.selectMemberData(vo);
		if(resultData != null) {
			String siteCode = String.valueOf(resultData.get("siteCode")).replace("[", "").replace("]", "");
			resultData.put("siteCodeList", Arrays.asList(siteCode.split(",")));
			resultData.put("phone", String.valueOf(resultData.get("phone")));
			resultData.put("email", String.valueOf(resultData.get("email")));
		}
		model.addAttribute("resultData", resultData);
	}
	
}