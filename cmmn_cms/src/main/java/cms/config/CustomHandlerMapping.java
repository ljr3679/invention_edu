package cms.config;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Comparator;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.util.ClassUtils;
import org.springframework.util.ReflectionUtils.MethodFilter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.method.HandlerMethodSelector;
import org.springframework.web.servlet.handler.MappedInterceptor;
import org.springframework.web.servlet.mvc.condition.ConsumesRequestCondition;
import org.springframework.web.servlet.mvc.condition.HeadersRequestCondition;
import org.springframework.web.servlet.mvc.condition.ParamsRequestCondition;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.condition.ProducesRequestCondition;
import org.springframework.web.servlet.mvc.condition.RequestCondition;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import cms.util.Logs;

public class CustomHandlerMapping extends RequestMappingHandlerMapping {
	
	private static String ADMIN_PACKAGE = ".admin.";
	private static String CMS_PACKAGE = "cms.";
	private static String CMS_BOARD_PACKAGE = CMS_PACKAGE+"site.board";
	private static String CMS_CONTENTS_PACKAGE = CMS_PACKAGE+"site.contents";
	private static String CMS_ENTRANCE_PACKAGE = CMS_PACKAGE+"site.entrance";
	private static String CMS_FILE_PACKAGE = CMS_PACKAGE+"file";
	private static String CMS_MENU_PACKAGE = CMS_PACKAGE+"menu";
	private static String CMS_COMMON_PACKAGE = CMS_PACKAGE+"cmmn";
	private static String CMS_CONFIG_PACKAGE = CMS_PACKAGE+"config";
	private static String ADMIN_PATTERN = "/cmsManager";
	private static String CMS_PATTERN = "/cms";
	
	private RequestMappingInfo createRequestMappingInfoCustom(RequestMapping annotation, RequestCondition<?> customCondition, Class<?> cls, boolean postMethod, boolean isAdm, boolean isCms, boolean isPrefix) {
		String[] patterns = resolveEmbeddedValuesInPatterns(annotation.value());
		RequestMethod[] methods = annotation.method();
		String[] produces = annotation.produces();
		String[] params = annotation.params();
		
		if(patterns.length > 0) {
			for(int i=0; i<patterns.length; i++) {
				String pattern = patterns[i];
				boolean actMapping = pattern.endsWith(".act");
				boolean ajaxMapping = pattern.endsWith(".ajax");
				
				if(cls != null && (actMapping || ajaxMapping || postMethod)) {
					if(postMethod) methods = new RequestMethod[] {RequestMethod.POST};
				}

				if(pattern.equals("/welcome.do")) continue;
				else {
					String prefix = "";
					if(isPrefix && cls != null) {
						String[] packagePattern = cls.getPackage().getName().split("[.]");
						if(packagePattern.length > 2 && packagePattern[0].equals("web")) {
							prefix = "/"+packagePattern[1]+"/"+packagePattern[2];
//							params = new String[] {"CMSSiteCode="+packagePattern[1], "CMSLangCode="+packagePattern[2]};	
						}
					}
					
					patterns[i] = (isAdm ?ADMIN_PATTERN :"") + (isCms ?CMS_PATTERN :"") + prefix + pattern;	
				}
			}
		}
		
		return new RequestMappingInfo(
				new PatternsRequestCondition(patterns, getUrlPathHelper(), getPathMatcher(), useSuffixPatternMatch(), useTrailingSlashMatch(), getFileExtensions()),
				new RequestMethodsRequestCondition(methods),
				new ParamsRequestCondition(params),
				new HeadersRequestCondition(annotation.headers()),
				new ConsumesRequestCondition(annotation.consumes(), annotation.headers()),
				new ProducesRequestCondition(produces, annotation.headers(), getContentNegotiationManager()), customCondition);
	}

	@Override
	protected RequestMappingInfo getMappingForMethod(Method method, Class<?> cls) {
		// TODO Auto-generated method stub
		RequestMappingInfo info = null;
		RequestMapping methodAnnotation = AnnotationUtils.findAnnotation(method, RequestMapping.class);
		if (methodAnnotation != null) {
			String packagePattern = cls.getPackage().getName();
			boolean prefixPackage = !packagePattern.startsWith(CMS_PACKAGE);
			boolean cmsPackage = packagePattern.startsWith(CMS_PACKAGE);
			boolean admPackage = cmsPackage || packagePattern.contains(ADMIN_PACKAGE);
			
			RequestCondition<?> methodCondition = getCustomMethodCondition(method);
			RequestMapping typeAnnotation = AnnotationUtils.findAnnotation(cls, RequestMapping.class);
			if (typeAnnotation != null) {
				info = createRequestMappingInfoCustom(methodAnnotation, methodCondition, null, admPackage && manipulateMapping(packagePattern, true), false, false, false);
				RequestCondition<?> typeCondition = getCustomTypeCondition(cls);
				info = createRequestMappingInfoCustom(typeAnnotation, typeCondition, cls, admPackage && manipulateMapping(packagePattern, true), manipulateMapping(packagePattern, admPackage), manipulateMapping(packagePattern, cmsPackage), manipulateMapping(packagePattern, prefixPackage)).combine(info);
			} else info = createRequestMappingInfoCustom(methodAnnotation, methodCondition, cls, admPackage && manipulateMapping(packagePattern, true), manipulateMapping(packagePattern, admPackage), manipulateMapping(packagePattern, cmsPackage), manipulateMapping(packagePattern, prefixPackage));
		}
		
		return info;
	}
	
	private boolean manipulateMapping(String packagePattern, boolean condition) {
		return (packagePattern.startsWith(CMS_BOARD_PACKAGE) || packagePattern.startsWith(CMS_CONTENTS_PACKAGE) || packagePattern.startsWith(CMS_ENTRANCE_PACKAGE) || packagePattern.startsWith(CMS_FILE_PACKAGE) || packagePattern.startsWith(CMS_COMMON_PACKAGE) || packagePattern.startsWith(CMS_CONFIG_PACKAGE) || packagePattern.startsWith(CMS_MENU_PACKAGE)) ?false :condition;
	}

}
