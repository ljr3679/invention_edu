package cms.menu;

import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cms.constant.Const;
import cms.data.StaticData;
import cms.util.ObjectBuilder;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CMSFolderMenuHandler {
	
	@Resource(name="objectBuilder")
	private ObjectBuilder objectBuilder;

	@RequestMapping(value={"/{siteCode}/{langCode}/folder.act", "/cmsManager/{siteCode}/{langCode}/folder.act"})
	public String siteFolderHandler(
			@PathVariable(value="siteCode") String siteCode,
			@PathVariable(value="langCode") String langCode,
			HttpServletRequest request,
			HttpServletResponse response,
			ModelMap model 
			) throws Exception {
		
		String requestURI = request.getRequestURI();
		String authType = "";
		List<String> menuAuth = null;
		List<EgovMap> menuTree = null;
		if(requestURI.equals(String.format("/%s/%s/%s", siteCode, langCode, "folder.act"))) {
			menuTree = StaticData.getInstance().getAllUserMenuTree(siteCode+"_"+langCode);
			authType = "U";
		} else if(requestURI.equals(String.format("/%s/%s/%s/%s", "cmsManager", siteCode, langCode, "folder.act"))) {
			EgovMap admSession = (EgovMap) request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			menuAuth = (List<String>) admSession.get("menuList");
			menuTree = StaticData.getInstance().getAllAdminMenuTree(siteCode+"_"+langCode);
			authType = "A";
		}
		
		int menuPos = Integer.parseInt(request.getParameter("menuPos"));
		EgovMap menu = menuTree.get(menuPos);
		
		int roof = 1;
		while(true) {
			EgovMap tmpMenu = menuTree.get(menuPos+roof);
			String menuNo = String.valueOf(tmpMenu.get("no"));
			int tmpPos = Integer.parseInt(String.valueOf(tmpMenu.get("menuPos")));
			int tmpChildren = Integer.parseInt(String.valueOf(tmpMenu.get("children")));
			String tmpUseAt = String.valueOf(tmpMenu.get("useAt"));
			String tmpMenuType = String.valueOf(tmpMenu.get("menuType"));
			
			if(authType.equals("A") && menuAuth.indexOf("auth_"+menuNo) == -1) {
				roof++;
				continue;
			} else if(authType.equals("U")) {
				String sessionAt = String.valueOf(tmpMenu.get("sessionAt"));
				if(sessionAt.equals("R") || sessionAt.equals("N")) {
					Object usrSession = request.getSession().getAttribute(Const.USER_SESSION_SET);
					if((usrSession == null && sessionAt.equals("R")) || (usrSession != null && sessionAt.equals("N"))) {
						roof++;
						continue;
					}
				}
			}
			
			if(tmpUseAt.equals("N") || tmpMenuType.equals("L")) {
				roof++;
				continue;
			} else {
				if(tmpChildren == 0) {
					menu = tmpMenu;
					menuPos = tmpPos;
					break;
				} else {
					roof++;
					continue;
				}
			}
		}
		
		String returnPage = "";
		String menuType = String.valueOf(menu.get("menuType"));
		switch (menuType) {
		default:
		case "C":
		case "B":
			model.addAttribute("boardCode", menu.get("boardCode"));
			model.addAttribute("menuPos", menuPos);
		case "D":
			Optional.of(requestURI).filter(uri -> uri.indexOf("cmsManager") == -1).ifPresent(uri -> model.addAttribute("method", "get"));
			model.addAttribute("params", objectBuilder.jsonBulid("menuPos", menuPos).build());
			model.addAttribute("returnURL", menu.get("uri"));
			returnPage = Const.ACTION_HANDLER;
			break;
		}
		
		return returnPage;
	}
	
}