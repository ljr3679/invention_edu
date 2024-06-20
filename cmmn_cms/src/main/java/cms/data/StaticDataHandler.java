package cms.data;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cms.constant.Const;
import cms.data.svc.StaticDataSvc;
import cms.path.PathBean;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public abstract class StaticDataHandler {

	/** INSTANCE */
	protected volatile static StaticData mInstance;
	protected static StaticDataSvc staticDataSvc;
	/** INSTANCE */
	
	/** PROPERTY  */
	protected Properties globalsProp;
	/** PROPERTY  */
	
	/** PATH */
	protected String classpathRoot;
	protected String contextRoot;
	protected String editorPath;
	protected String attachPath;
	/** PATH */
	
	/** MENU */
	private boolean TIME_OUT_AT = false;
	private static double TIME_OUT = 10000;
	private static String CMS_SITE_CODE = "siteCode";
	private static String CMS_LANG_CODE = "langCode";
	private static String CMS_MENU_UNIQUE = "no";
	private static String CMS_MENU_PARENT_UNIQUE = "parent";
	private static String CMS_MENU_CHILDREN = "children";
	private static String CMS_MENU_POINT = "point";
	private static String CMS_MENU_DEPTH_POS = "pos";
	private static String CMS_MENU_POS = "menu_pos";
	private static String CMS_MENU_PARENT_POS = "parent_pos";
	private static String CMS_MENU_DIG_START = "S";
	private static String CMS_MENU_DIG_END = "E";
	private static String CMS_MENU_ROOF_POINT_CNT = "eCnt"; 
	
	protected Map<String, EgovMap> siteInfo = new LinkedHashMap<>();
	
	protected Map<String, List<EgovMap>> allUserMenuTree = new HashMap<>();
	protected Map<String, List<List<EgovMap>>> userDepthTree = new HashMap<>();
	protected Map<String, List<List<EgovMap>>> separateUserMenuTree = new HashMap<>();
	
	protected Map<String, List<EgovMap>> allAdminMenuTree = new HashMap<>();
	protected Map<String, List<List<EgovMap>>> adminDepthTree = new HashMap<>();
	protected Map<String, List<List<EgovMap>>> separateAdminMenuTree = new HashMap<>();
	/** MENU */
	
	/** ADMIN SESSION STROE */
	protected Map<String, HttpSession> admSessionStore = new HashMap<>();
	/** ADMIN SESSION STROE */
	
	protected void init() {
		loadPathBean();
		loadMenuTree();
		loadFilePath();
	}
	
	protected void loadPathBean() {
		FileReader resources = null;
		try {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession session = request.getSession();
			ServletContext conext = session.getServletContext();
			WebApplicationContext wContext = WebApplicationContextUtils.getWebApplicationContext(conext);
			PathBean pathBean = (PathBean) wContext.getBean("pathBean");
			
			Resource classpathRoot = pathBean.getClasspathRoot();
			Resource contextRoot = pathBean.getContextRoot();
			 
			this.classpathRoot = classpathRoot.getFile().getAbsolutePath();
			this.contextRoot = contextRoot.getFile().getAbsolutePath();

			resources = new FileReader(this.classpathRoot+File.separatorChar+"property"+File.separatorChar+"globals.properties");
			globalsProp = new Properties();
			globalsProp.load(resources);	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(resources != null) resources.close(); 	
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void loadMenuTree() {
		try {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			HttpSession session = request.getSession();
			ServletContext conext = session.getServletContext();
			WebApplicationContext wContext = WebApplicationContextUtils.getWebApplicationContext(conext);
			staticDataSvc = (StaticDataSvc) wContext.getBean("staticDataSvc");
			
			siteInfoMake();
			userMenuLoad();
			adminMenuLoad();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void siteInfoMake() {
		try {
			this.siteInfo.clear();
			
			List<EgovMap> siteCodeList = staticDataSvc.selectSiteCodeDataList();
			for(EgovMap siteInfo : siteCodeList) {
				String siteCode = String.valueOf(siteInfo.get(CMS_SITE_CODE));
				String langCode = String.valueOf(siteInfo.get(CMS_LANG_CODE));
				
				String[] langList = langCode.replace("[", "").replace("]", "").split(",");
				Map<String, EgovMap> langInfo = new LinkedHashMap<>();
				List<EgovMap> langCodeList = staticDataSvc.selectLangCodeDataList(Arrays.asList(langList));
				for(EgovMap langCodeMap : langCodeList) {
					String lang = String.valueOf(langCodeMap.get("langCode"));
					langInfo.put(lang, langCodeMap);
				}
				
				siteInfo.put(CMS_LANG_CODE, langInfo);
				this.siteInfo.put(siteCode, siteInfo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void userMenuLoad() {
		try {
			allUserMenuTree.clear();
			userDepthTree.clear();
			separateUserMenuTree.clear();
			
			for(String siteCode : siteInfo.keySet()) {
				for(String langCode : ((Map<String, EgovMap>) ((EgovMap) siteInfo.get(siteCode)).get(CMS_LANG_CODE)).keySet()) {
					int userMenuTotalCnt = 0;
					int userMenuTotalDepth = 0;
					
					userMenuTotalDepth = staticDataSvc.selectMaxMenuDepth("U", siteCode, langCode);
					
					List<EgovMap> allUserMenuTree = new ArrayList<>();
					List<List<EgovMap>> userDepthTree = new ArrayList<>();
					List<List<EgovMap>> separateUserMenuTree = new ArrayList<>();
					for(int i=1; i<=userMenuTotalDepth; i++) {
						List<EgovMap> depth = staticDataSvc.selectSeparateMenuDataList("U", siteCode, langCode, i);
						for(EgovMap menu : depth) {
							String uri = String.valueOf(menu.get("uri"));
							menu.put("oriUri", uri);
							
							uri = String.format("/%s/%s%s", siteCode, langCode, uri);
							menu.put("uri", uri);
						}
						separateUserMenuTree.add(depth);
						userMenuTotalCnt += depth.size();
					}
					
					this.allUserMenuTree.put(siteCode+"_"+langCode, allUserMenuTree);
					this.userDepthTree.put(siteCode+"_"+langCode, userDepthTree);				
					this.separateUserMenuTree.put(siteCode+"_"+langCode, separateUserMenuTree);
					
					mkMenuTree(siteCode+"_"+langCode, this.allUserMenuTree, this.separateUserMenuTree, this.userDepthTree, userMenuTotalCnt);
				}	
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void adminMenuLoad() {
		try {
			allAdminMenuTree.clear();
			separateAdminMenuTree.clear();
			adminDepthTree.clear();
			
			for(String siteCode : siteInfo.keySet()) {
				for(String langCode : ((Map<String, EgovMap>) ((EgovMap) siteInfo.get(siteCode)).get(CMS_LANG_CODE)).keySet()) {
					int adminMenuTotalCnt = 0;
					int adminMenuTotalDepth = 0;
					
					adminMenuTotalDepth = staticDataSvc.selectMaxMenuDepth("A", siteCode, langCode);
					
					List<EgovMap> allAdminMenuTree = new ArrayList<>();
					List<List<EgovMap>> adminDepthTree = new ArrayList<>();
					List<List<EgovMap>> separateAdminMenuTree = new ArrayList<>();
					
					for(int i=1; i<=adminMenuTotalDepth; i++) {
						List<EgovMap> depth = staticDataSvc.selectSeparateMenuDataList("A", siteCode, langCode,  i);
						for(EgovMap menu : depth) {
							String uri = String.valueOf(menu.get("uri"));
							menu.put("oriUri", uri);
							
							String cmsAt = String.valueOf(menu.get("cmsAt"));
							if(cmsAt.equals("Y")) uri = String.format("/%s/%s%s", "cmsManager", "cms", uri);
							else uri = String.format("/%s/%s/%s%s", "cmsManager", siteCode, langCode, uri);
							menu.put("uri", uri);
						}
						separateAdminMenuTree.add(depth);
						adminMenuTotalCnt += depth.size();
					}
					
					this.allAdminMenuTree.put(siteCode+"_"+langCode, allAdminMenuTree);
					this.separateAdminMenuTree.put(siteCode+"_"+langCode, separateAdminMenuTree);
					this.adminDepthTree.put(siteCode+"_"+langCode, adminDepthTree);				
					
					mkMenuTree(siteCode+"_"+langCode, this.allAdminMenuTree, this.separateAdminMenuTree, this.adminDepthTree, adminMenuTotalCnt);
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void mkMenuTree(String mapKey, Map<String, List<EgovMap>> treeMap, Map<String, List<List<EgovMap>>> menuTreeMap, Map<String, List<List<EgovMap>>> depthTreeMap, int totalSize) {
		double start = System.currentTimeMillis();
		List<EgovMap> tree = treeMap.get(mapKey);
		List<List<EgovMap>> menuTrees = menuTreeMap.get(mapKey);
		List<List<EgovMap>> depthTree = depthTreeMap.get(mapKey);
		
		Integer[] childrenArg = new Integer[menuTrees.size()];
		Integer[] positionArg = new Integer[menuTrees.size()];
		
		List<String> tempKeyList = new ArrayList<>();
		
		for(int i=0; i<menuTrees.size();) {
			List<EgovMap> menuTree = menuTrees.get(i);
			
			int j = positionArg[i] != null ?positionArg[i] :0;
			if(j == menuTree.size()) {
				EgovMap topEsMenu = tree.get(tree.size()-1);
				int esCnt = Integer.parseInt(String.valueOf(topEsMenu.get(CMS_MENU_ROOF_POINT_CNT) != null ?topEsMenu.get(CMS_MENU_ROOF_POINT_CNT) :"0"));
				topEsMenu.put(CMS_MENU_ROOF_POINT_CNT, esCnt+1);
				childrenArg[i] = 0;
				i--;
			}
			for(; j<menuTree.size(); j++) {
				EgovMap menu = menuTree.get(j);
				int children = Integer.parseInt(String.valueOf(menu.get(CMS_MENU_CHILDREN)));
				int eCnt = Integer.parseInt(String.valueOf(menu.get(CMS_MENU_ROOF_POINT_CNT) != null ?menu.get(CMS_MENU_ROOF_POINT_CNT) :"0"));
				
				boolean breakPoint = false;
				int histChildren = childrenArg[i] != null ?childrenArg[i] :0;
				if(histChildren > 0) {
					childrenArg[i] = --histChildren;
					if(childrenArg[i] == 0) breakPoint = true;
				}
				
				if(histChildren == -1) {
					EgovMap esMenu = tree.get(tree.size()-1);
					int esCnt = Integer.parseInt(String.valueOf(esMenu.get(CMS_MENU_ROOF_POINT_CNT) != null ?esMenu.get(CMS_MENU_ROOF_POINT_CNT) :"0"));
					esMenu.put(CMS_MENU_ROOF_POINT_CNT, esCnt+1);
					childrenArg[i] = 0;
					i--;
					break;
				}
				
				positionArg[i] = j+1;
				menu.put(CMS_MENU_DEPTH_POS, positionArg[0]);
				tree.add(menu);
				tempKeyList.add(String.valueOf(menu.get(CMS_MENU_UNIQUE)));
				
				if(children > 0) {
					childrenArg[i+1] = children;
					if(breakPoint) {
						childrenArg[i] = -1;
						menu.put(CMS_MENU_POINT, CMS_MENU_DIG_END+CMS_MENU_DIG_START);
					} else menu.put(CMS_MENU_POINT, CMS_MENU_DIG_START);
					
					i++;
					break;
				} else {
					if(breakPoint) {
						menu.put(CMS_MENU_POINT, CMS_MENU_DIG_END);
						menu.put(CMS_MENU_ROOF_POINT_CNT, eCnt+1);
						i--;
						break;	
					}
				}
			}
			
			if((System.currentTimeMillis() - start) > TIME_OUT) {
				//System.out.println("================================= MENU BUILD FIAL ==================================");
				//System.out.println("===================================== TIME OUT =====================================");
				//System.out.println("================================= MENU BUILD FIAL ==================================");
				TIME_OUT_AT = true;
				break;
			}
			
			if(tree.size() == totalSize) break;
		}
		
		if(!TIME_OUT_AT) {
			//System.out.println("================================= MENU BUILD DOWN ==================================");
			//System.out.println(System.currentTimeMillis() - start);
			//System.out.println("================================= MENU BUILD DOWN ==================================");
			
			if(!tree.isEmpty()) {
				int p = 0;
				for(int i=0; i<positionArg[0]; i++) depthTree.add(new ArrayList<EgovMap>());
				for(EgovMap menu : tree) {
					menu.put(CMS_MENU_POS, p++);
					menu.put(CMS_MENU_PARENT_POS, tempKeyList.indexOf(String.valueOf(menu.get(CMS_MENU_PARENT_UNIQUE))));
					Integer pos = Integer.parseInt(String.valueOf(menu.get(CMS_MENU_DEPTH_POS)));
					depthTree.get(pos-1).add(menu);
				}
			}
		}
	}
	
	protected void loadFilePath() {
		File contextRoot = new File(this.contextRoot);
		File editor = new File(contextRoot.getParentFile().getAbsolutePath()+File.separator+Const.EDITOR_DIRECTORY);
		if(!editor.exists()) editor.mkdirs();
		File attach = new File(contextRoot.getParentFile().getAbsolutePath()+File.separator+Const.ATTACH_DIRECTORY);
		if(!attach.exists()) attach.mkdirs();
				
		this.editorPath = editor.getAbsolutePath()+File.separator;
		this.attachPath = attach.getAbsolutePath()+File.separator;
	}
	
}
