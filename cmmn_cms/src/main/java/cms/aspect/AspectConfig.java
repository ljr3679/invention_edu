package cms.aspect;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.json.simple.JSONObject;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.view.RedirectView;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.data.StaticData;
import cms.tld.CustomTldFunctions;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Aspect
@Component
public class AspectConfig {
	
	@Order(0)
	@Before("@annotation(AccessNeedSession)")
	public void AccessNeedSession(JoinPoint joinPoint) throws Exception {
		HttpServletRequest request = Arrays.stream(joinPoint.getArgs()).parallel().filter(HttpServletRequest.class::isInstance).map(HttpServletRequest.class::cast).findFirst().orElse(null);
		String uri = request.getRequestURI();
		
		if(request != null && !uri.contains("/cmsManager/") && request.getSession().getAttribute(Const.USER_SESSION_SET) == null) {
			String[] uriPatterns = uri.split("/");
			String siteCode = "";
			String langCode = "";
			if(uriPatterns.length >= 3) {
				siteCode = uriPatterns[1];
				langCode = uriPatterns[2];
			}
			
			List<String> idxList = StaticData.getInstance().getAllUserMenuIdxList(siteCode+"_"+langCode);
			JSONObject params = new JSONObject();
			params.put("menuPos", CustomTldFunctions.arrIndexOf(idxList, "menu[MenuUnique]"));
			
			RedirectView rv = new RedirectView();
			rv.setUrl("/common/action/handler.do");
			rv.addStaticAttribute("returnURL", String.format("/%s/%s/service/login/index.do", siteCode, langCode)); 
			rv.addStaticAttribute("status", "3");                                                                   
			rv.addStaticAttribute("method", "get");                                                                 
			rv.addStaticAttribute("msg", "로그인 후 이용하실 수 있습니다.");                                                     
			rv.addStaticAttribute("params", params.toString());    
			
			throw new ModelAndViewDefiningException(new ModelAndView(rv));
		}
	}
	
	@Order(0)
	@Before("@annotation(DeniedSession)")
	public void DeniedSession(JoinPoint joinPoint) throws Exception {
		HttpServletRequest request = Arrays.stream(joinPoint.getArgs()).parallel().filter(HttpServletRequest.class::isInstance).map(HttpServletRequest.class::cast).findFirst().orElse(null);
		String uri = request.getRequestURI();
		
		if(request != null && !uri.contains("/cmsManager/") && request.getSession().getAttribute(Const.USER_SESSION_SET) != null) {
			RedirectView rv = new RedirectView();
			rv.setUrl("/common/action/handler.do");
			rv.addStaticAttribute("returnURL", "/"); 
			rv.addStaticAttribute("status", "3");                                                                   
			rv.addStaticAttribute("method", "get");                                                                 
			rv.addStaticAttribute("msg", Const.ACCESS_DENIED_MSG);                                                     
			rv.addStaticAttribute("params", "");    
			
			throw new ModelAndViewDefiningException(new ModelAndView(rv));
		}
	}

	@Order(1)
	@Before("execution(* *..*.*Ctr.*(..))")
	public void controllerBeforeAOP(JoinPoint joinPoint) {
		try {
			HttpServletRequest request = Arrays.stream(joinPoint.getArgs()).parallel().filter(HttpServletRequest.class::isInstance).map(HttpServletRequest.class::cast).findFirst().orElse(null);
			CommonVO vo = Arrays.stream(joinPoint.getArgs()).parallel().filter(CommonVO.class::isInstance).map(CommonVO.class::cast).findFirst().orElse(null);
			
			if(request != null) {
				String methodName = joinPoint.getSignature().getName();
				Class targetClass = joinPoint.getSignature().getDeclaringType();
				
				for(Method method : targetClass.getDeclaredMethods()) {
					if(methodName.equals(method.getName())) {
						RequestMapping requestAnnotation = AnnotationUtils.findAnnotation(method, RequestMapping.class);
						if(requestAnnotation != null) {
							String packagePath = targetClass.getPackage().getName().replace(".", "/");
							String defaultPath = packagePath.substring(0, packagePath.lastIndexOf("/")+1);
							String uri = request.getRequestURI();
							String[] uriPatterns = uri.split("/");
							String siteCode = "";
							String langCode = "";
							
							if(uriPatterns[1].equals("cmsManager")) {
								Object admSessionObj = request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
								if(admSessionObj != null) {
									EgovMap admSession = (EgovMap) admSessionObj;
									siteCode = String.valueOf(admSession.get("mSiteCode"));
									langCode = String.valueOf(admSession.get("mLangCode"));
								}
							} else {
								if(uriPatterns.length >= 3) {
									siteCode = uriPatterns[1];
									langCode = uriPatterns[2];
								}
							}
							
							if(vo != null) {
								vo.setSelfURI(uri);
								vo.setSelfPath(uri.substring(0, uri.lastIndexOf("/")+1));
								if(!siteCode.equals("")) vo.setSiteCode(siteCode);
								if(!langCode.equals("")) vo.setLangCode(langCode);
								
								if(method.getReturnType().getSimpleName().toLowerCase().equals("void") && vo.getReturnPage().equals("")) {
									vo.setReturnPage
									(
										uri.endsWith(".act") 
											?Const.ACTION_HANDLER 
											:defaultPath+methodName
									);
								}	
							}
							
						}		
						break;
					}
				}	
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
	}

	@After("execution(* *..*.*Ctr.*(..))")
	public void controllerAfterAOP(JoinPoint joinPoint) {
		try {
			CommonVO vo = Arrays.stream(joinPoint.getArgs()).parallel().filter(CommonVO.class::isInstance).map(CommonVO.class::cast).findFirst().orElse(null);			
			ModelMap modelMap = Arrays.stream(joinPoint.getArgs()).parallel().filter(ModelMap.class::isInstance).map(ModelMap.class::cast).findFirst().orElse(null);
			
			if(vo != null && modelMap != null) modelMap.addAttribute("vo", vo);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
