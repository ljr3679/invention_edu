package cms.site.contents.ctr;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.mapping.CMSMappingHandler;
import cms.site.contents.svc.CMSContentsSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CMSContentsCtr extends CMSMappingHandler {
	
	@Resource(name="CMSContentsSvc")
	private CMSContentsSvc CMSContentsSvc;
	
	@RequestMapping(value="/{depth1}/{depth2}/contents.do")
	public String adminContents(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		String uri = request.getRequestURI();
		String pathAuthority = "";
		EgovMap menu = null;
		
		if(uri.contains("/cmsManager/")) {
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			menu = (EgovMap) admSession.get("menu");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "admin";
		} else {
			EgovMap menuSession = (EgovMap) request.getSession().getAttribute(Const.USER_MENU_SET);
			menu = (EgovMap) menuSession.get("menu");
			vo.setBoard_code(String.valueOf(menu.get("boardCode")));
			pathAuthority = "user";
		}
		
		EgovMap resultData = CMSContentsSvc.selectCMSContentsData(vo);
		model.addAttribute("resultData", resultData);
		
		return String.format("cms/contents/%s/%s", pathAuthority, String.valueOf(menu.get("skin")));
	}
	
	@RequestMapping(value="/cmsManager/cms/contents_edit.act")
	public void adminContentsEditAct(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		CMSContentsSvc.updateCMSContentsData(vo);
		
		model.addAttribute("status", "1");
		model.addAttribute("method", "post");
		model.addAttribute("returnURL", vo.getSelfPath()+"contents.do");
	}
	
}
