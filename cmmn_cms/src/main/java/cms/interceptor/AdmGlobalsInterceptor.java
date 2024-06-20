package cms.interceptor;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cms.constant.Const;
import cms.data.StaticData;
import cms.util.Logs;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class AdmGlobalsInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		try {
			Optional.of(request.getSession().getAttribute(Const.ADMIN_SESSION_SET)).map(EgovMap.class::cast).ifPresent(session -> {
				String uri = request.getRequestURI();
				if(!uri.equals("/cmsManager/folder.act")) {
					String siteCode = String.valueOf(session.get("mSiteCode"));
					String langCode = String.valueOf(session.get("mLangCode"));
				
					List<EgovMap> menuTree = StaticData.getInstance().getAllAdminMenuTree(siteCode+"_"+langCode);
					List<List<EgovMap>> depthTree = StaticData.getInstance().getAdminDepthTree(siteCode+"_"+langCode);
					request.setAttribute("menuTree", menuTree);
					request.setAttribute("depthTree", depthTree);
					
					Optional.ofNullable(request.getParameter("menuPos")).filter(param -> !(param != null && param.equals(""))).map(Integer::parseInt).ifPresent(pos -> {
						session.put("menu", menuTree.get(pos));
						session.put("menuPos", pos);
						
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
						
						session.put("topMenuCnt", topMenuList.size());
						session.put("topMenuList", topMenuList);
						session.put("topMenuPosList", topMenuPosList);
					});
					
					request.setAttribute("admSession", session);
				}
			});
			request.setAttribute("admSessionTime", Const.ADMIN_SESSION_TIME);
		} catch(Exception e) {
			Logs.print("EMPTY ADMIN SESSION");
			throw new ModelAndViewDefiningException(new ModelAndView("redirect:/cmsManager/cms/noSession.act"));
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
