package cms.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.view.RedirectView;

import cms.cmmn.CommonVO;
import cms.cmmn.svc.CommonSvc;
import cms.mapping.CMSMappingHandler;
import cms.constant.Const;
import cms.constant.FileConst;
import cms.data.StaticData;
import cms.file.FileDownload;
import cms.file.svc.FileDataSvc;
import cms.util.PatternUtil;
import cms.util.StringUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class UsrGlobalsInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name="stringUtil")
	private StringUtil stringUtil;
	
	@Resource(name="patternUtil")
	private PatternUtil patternUtil;
	
	@Resource(name="commonSvc")
	private CommonSvc commonSvc;
	
	@Resource(name="fileDataSvc")
	private FileDataSvc fileDataSvc;
	
	private FileDownload file;
	
	CommonVO vo1 = new CommonVO();

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String[] uriPatterns = uri.split("/");
		
		if(uriPatterns.length > 3) {
			String siteCode = uriPatterns[1];
			String langCode = uriPatterns[2];
			
			List<EgovMap> menuTree = StaticData.getInstance().getAllUserMenuTree(siteCode+"_"+langCode);
			List<List<EgovMap>> depthTree = StaticData.getInstance().getUserDepthTree(siteCode+"_"+langCode);
			List<String> menuIdxList = StaticData.getInstance().getAllUserMenuIdxList(siteCode+"_"+langCode);
			
			Object menuSessionCheck = request.getSession().getAttribute(Const.USER_MENU_SET);
			EgovMap menuSession;
			if(menuSessionCheck == null) {
				menuSession = new EgovMap();
				request.getSession().setAttribute(Const.USER_MENU_SET, menuSession);
			} else menuSession = (EgovMap) menuSessionCheck;
			
			String menuPos = request.getParameter("menuPos");
			if((stringUtil.isNotEmpty(menuPos) && patternUtil.isNum(menuPos)) || uri.equals(String.format("/%s/%s/main.do", siteCode, langCode)) || uri.indexOf("/judge/") != -1 || uri.indexOf("/award/festival2021") != -1 || uri.indexOf("/award/festival2022") != -1 || uri.indexOf("/award/festival2023") != -1 || uri.indexOf("/award/festival2024") != -1) menuOperation(request, menuTree, depthTree, menuIdxList, menuSession, menuPos);
			else if((stringUtil.isEmpty(menuPos) || (stringUtil.isNotEmpty(menuPos) && !patternUtil.isNum(menuPos))) && !uri.equals(String.format("/%s/%s/main.do", siteCode, langCode))) accessDenied();
		}
		
		request.setAttribute("footerList", commonSvc.selectUserMainFooterList(vo1));
		return super.preHandle(request, response, handler);
	}
	
	private void menuOperation(HttpServletRequest request, List<EgovMap> menuTree, List<List<EgovMap>> depthTree, List<String> menuIdxList, EgovMap menuSession, String menuPos) throws Exception {
		Optional.ofNullable(menuPos).filter(param -> !(param != null && param.equals(""))).map(Integer::parseInt).ifPresent(pos -> {
			menuSession.put("menu", menuTree.get(pos));
			menuSession.put("menuPos", pos);
			
			List<EgovMap> topMenuList = new ArrayList<>();
			List<Integer> topMenuPosList = new ArrayList<>();
			EgovMap mMenu = menuTree.get(pos);
			EgovMap cMenu = menuTree.get(pos);
			
			int cMenuPos = Integer.parseInt(String.valueOf(cMenu.get("menuPos")));
			topMenuList.add(menuTree.get(cMenuPos));
			topMenuPosList.add(cMenuPos);
			
			for(int i=1; i<=Optional.of(mMenu.get("depth")).map(String::valueOf).map(Integer::parseInt).get(); i++) {
				String parentPos = String.valueOf(cMenu.get("parentPos"));
				if(!parentPos.equals("-1")) {
					cMenu = menuTree.get(Integer.parseInt(parentPos));
					cMenuPos = Integer.parseInt(String.valueOf(cMenu.get("menuPos")));
					topMenuList.add(menuTree.get(cMenuPos));
					topMenuPosList.add(cMenuPos);
				}
			}
			
			menuSession.put("topMenuCnt", topMenuList.size());
			menuSession.put("topMenuList", topMenuList);
			menuSession.put("topMenuPosList", topMenuPosList);
		});
		
		request.setAttribute("menuTree", menuTree);
		request.setAttribute("depthTree", depthTree);
		request.setAttribute("menuSession", menuSession);
		request.setAttribute("menuPos", request.getParameter("menuPos"));
		request.setAttribute("menuIdxList", menuIdxList);
		
		Object usrSession = request.getSession().getAttribute(Const.USER_SESSION_SET);
		request.setAttribute("usrSession", usrSession);
	}
	
	private void accessDenied() throws Exception {
		RedirectView rv = new RedirectView();
		rv.setUrl("/common/action/handler.do");
		rv.addStaticAttribute("returnURL", "/"); 
		rv.addStaticAttribute("status", "3");                                                                   
		rv.addStaticAttribute("method", "get");                                                                 
		rv.addStaticAttribute("msg", Const.ACCESS_DENIED_MSG);
		
		throw new ModelAndViewDefiningException(new ModelAndView(rv));
	}
	
}
