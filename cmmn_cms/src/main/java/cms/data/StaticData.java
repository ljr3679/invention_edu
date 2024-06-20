package cms.data;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import cms.constant.Const;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class StaticData extends StaticDataHandler {
	
	StaticData() {
		super.init();
	}
	
	public Object[] admSessionAt(String admId) {
		/**
		 * index info
		 * 0 : result code ::::::::: -> 1:ACCESS -1:ACCESS FAILURE
		 */
		Object[] param = new Object[2];
		
		String id = admId;
		Long currentTimeMsec = Calendar.getInstance().getTimeInMillis();
		
		if(!admSessionStore.containsKey(id)) {
			param[0] = 1;
		}
		else if(admSessionStore.containsKey(id)) {
			HttpSession existSession = admSessionStore.get(id);
			Long existTimeMesc = existSession.getCreationTime();
			
			if((currentTimeMsec - existTimeMesc) > Const.ADMIN_SESSION_TIME) {
				param[0] = 1;
			} else {
				param[0] = -1;
				param[1] = existSession;
			}
		}
		
		return param;
	}
	
	public void setAdmSession(HttpSession session) {
		EgovMap admSession = (EgovMap) session.getAttribute(Const.ADMIN_SESSION_SET);
		String id = String.valueOf(admSession.get("id"));
		if(admSessionStore.containsKey(id)) {
			try {
				HttpSession existSession = admSessionStore.get(id);
				if(!existSession.getId().equals(session.getId())) existSession.removeAttribute(Const.ADMIN_SESSION_SET);
			} catch(Exception e) {
				e.printStackTrace();
			}
			admSessionStore.remove(id);
		}
		
		admSessionStore.put(id, session);
	}
	
	public void removeAdmSession(HttpSession session) {
		EgovMap admSession = (EgovMap) session.getAttribute(Const.ADMIN_SESSION_SET);
		String id = String.valueOf(admSession.get("id"));
		admSessionStore.remove(id);
	}
	
	public String defaultSiteCode() {
		for(String siteCode : this.siteInfo.keySet()) {
			return siteCode;
		}
		return null;
	}
	
	public String defaultLangCode(String siteCode) {
		for(String langCode : ((Map<String, EgovMap>) this.siteInfo.get(siteCode).get("langCode")).keySet()) {
			return langCode;
		}
		return null;
	}

	public Map<String, EgovMap> getAllSiteInfo() {
		return this.siteInfo;
	}
	
	public EgovMap getSiteInfo(String siteCode) {
		return this.siteInfo.get(siteCode);
	}
	
	public List<EgovMap> getAllUserMenuTree(String code) {
		return this.allUserMenuTree.get(code);
	}
	
	public List<String> getAllUserMenuIdxList(String code) {
		List<String> idxList = new ArrayList<>();
		Iterator it = this.allUserMenuTree.keySet().iterator();
		
		for(EgovMap innerMap : this.allUserMenuTree.get(code)) {
			String no = String.valueOf(innerMap.get("no"));
			idxList.add("menu"+no);
		}
		
		return idxList;
	}
	
	public List<List<EgovMap>> getUserDepthTree(String code) {
		return this.userDepthTree.get(code);
	}
	
	public Map<String, List<EgovMap>> getAllAdminMenuTree() {
		return this.allAdminMenuTree;
	}
	
	public List<EgovMap> getAllAdminMenuTree(String code) {
		return this.allAdminMenuTree.get(code);
	}
	
	public List<String> getAllAdminMenuIdxList(String code) {
		List<String> idxList = new ArrayList<>();
		
		for(EgovMap innerMap : this.allAdminMenuTree.get(code)) {
			String no = String.valueOf(innerMap.get("no"));
			idxList.add("menu"+no);
		}
		
		return idxList;
	}
	
	public List<List<EgovMap>> getAdminDepthTree(String code) {
		return this.adminDepthTree.get(code);
	}
	
	public void reloadUserMenu() {
		userMenuLoad();
	}
	
	public void reloadAdminMenu() {
		adminMenuLoad();
	}
	
	public Properties getGlobalsProp() {
		return this.globalsProp;
	}
	
	public String getClasspathRoot() {
		return this.classpathRoot;
	}
	
	public String getContextRoot() {
		return this.contextRoot;
	}
	
	public String getEditorPath() {
		return this.editorPath;
	}
	
	public String getAttachPath() {
		return this.attachPath;
	}
	
	public static StaticData getInstance() {
		if(mInstance == null) {
			synchronized (StaticData.class) {
				if(mInstance == null) {
					mInstance = new StaticData();
				}
			}
		}
		return mInstance;
	}

}
