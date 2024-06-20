package cms.cmmn.mapper;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.util.AccountSetter;
import cms.util.StringUtil;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public abstract class AbstractMapper extends EgovAbstractMapper {
	
	@Resource(name="stringUtil")
	private StringUtil stringUtil;
	
	public Object executeQuery(String queryId, Object objParam) throws Exception {
		objParam = sessionSet(objParam);
		
		String queryIdWithoutPath = queryId.substring(queryId.lastIndexOf(".") + 1, queryId.length());
		
		if ((queryIdWithoutPath.startsWith("read") || queryIdWithoutPath.startsWith("select"))  && queryIdWithoutPath.endsWith("List"))
			return selectList(queryId, objParam);
		else if ((queryIdWithoutPath.startsWith("read") || queryIdWithoutPath.startsWith("select")))
			return selectOne(queryId, objParam);
		else if (queryIdWithoutPath.startsWith("add")|| queryIdWithoutPath.startsWith("insert")) {
			xssRemove(objParam);
			return insert(queryId, objParam);
		}
		else if (queryIdWithoutPath.startsWith("update")) {
			xssRemove(objParam);
			return Integer.valueOf(update(queryId, objParam));
		}
		else if (queryIdWithoutPath.startsWith("delete")) {
			return Integer.valueOf(delete(queryId, objParam));
		}
		else if(queryIdWithoutPath.equals("downloadCMSRecord")) {
			return Integer.valueOf(download(queryId, objParam));
		}
		return null;
	}
	
	@Override
	public int insert(String queryId, Object parameterObject) {
		// TODO Auto-generated method stub
		int result = super.insert(queryId, parameterObject);
		insertCMSLog(parameterObject, "I");
		return result;
	}
	
	@Override
	public int update(String queryId, Object parameterObject) {
		// TODO Auto-generated method stub
		int result = super.update(queryId, parameterObject);
		insertCMSLog(parameterObject, "U");
		return result;
	}
	
	
	@Override
	public int delete(String queryId, Object parameterObject) {
		// TODO Auto-generated method stub
		int result = super.delete(queryId, parameterObject);
		insertCMSLog(parameterObject, "D");
		return result;
	}

	public int download(String queryId, Object parameterObject) {
		insertCMSLog(parameterObject, "E");
		return 1;
	}

	private void insertCMSLog(Object parameterObject, String workCode) {
		if(parameterObject instanceof CommonVO) {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
			Object admSession = request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
			CommonVO vo = (CommonVO) parameterObject;
			if(admSession != null && request.getRequestURI().indexOf("/cmsManager/") != -1 && ((vo.getTitle() != null && !vo.getTitle().equals("")))) {
				EgovMap adm = ((EgovMap) admSession);
				List<EgovMap> topMenuList = (List<EgovMap>) adm.get("topMenuList");
				String menu = "";
				for(int i=topMenuList.size()-1; i>=0; i--) {
					String title = String.valueOf(topMenuList.get(i).get("menuTitle"));
					menu += title+" > ";
				}
				
				EgovMap map = new EgovMap();
				map.put("menu", menu.substring(0, menu.length()-3));
				map.put("title", vo.getTitle());
				map.put("downReason", vo.getDownReason()); 
				map.put("workCode", workCode);
				map.put("workId", adm.get("id"));
				map.put("workName", adm.get("name"));
				map.put("cmsAdminAccessRef", adm.get("cmsAdminAccessRef"));
				
				super.insert("CmsRecordMng.insertCMSAdminRecordData", map);
			}
		}
	}

	protected Object sessionSet(Object objParam) {
		if(objParam instanceof CommonVO) {
			objParam = AccountSetter.set(((CommonVO) objParam));
		}
		return objParam;
	}

	protected void xssRemove(Object obj) throws Exception {
		if(obj.getClass().getName().toLowerCase().indexOf("vo") == -1) return;
		
		Method[] methods = obj.getClass().getMethods();
		
		List<String> array = new ArrayList<String>();
		
		boolean xssFilter = true;
		
		for(Method method : methods) {
			array.add(method.getName());
		}
		
		for(int i=0; i<methods.length; i++) {
			if(methods[i].getName().startsWith("get")) {
				if(methods[i].getName().equals("getClass")) continue;
				String str = String.valueOf(methods[i].invoke(obj, null));
				
				if(xssFilter && methods[i].getReturnType().getName().equals("java.lang.String")) {
					if(stringUtil.isNotEmpty(str)) {
						str = stringUtil.removeXSSNew(str);
						String setMethod = "set"+methods[i].getName().substring(3);
						methods[array.indexOf(setMethod)].invoke(obj, str);	
					}
				}
				
			}
		}
	}

}
