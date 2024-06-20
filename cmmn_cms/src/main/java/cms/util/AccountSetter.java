package cms.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public class AccountSetter {
	
	public static CommonVO set(CommonVO vo) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		Object getSession = session.getAttribute(Const.USER_SESSION_SET);
		if(getSession != null) {
			EgovMap user = (EgovMap) getSession;
			vo.setUsr_idx(user.get("no") != null ?String.valueOf(user.get("no")) :"");
			vo.setUsr_id(user.get("id") != null ?String.valueOf(user.get("id")) :"");
			vo.setUsr_nm(user.get("name") != null ?String.valueOf(user.get("name")) :"");	
		}
		
		getSession = session.getAttribute(Const.ADMIN_SESSION_SET);
		if(getSession != null) {
			EgovMap admin = (EgovMap) getSession;
			vo.setAdm_idx(admin.get("no") != null ?String.valueOf(admin.get("no")) :"");
			vo.setAdm_id(admin.get("id") != null ?String.valueOf(admin.get("id")) :"");
			vo.setAdm_nm(admin.get("name") != null ?String.valueOf(admin.get("name")) :"");
			vo.setAdm_auth(admin.get("authority") != null ?String.valueOf(admin.get("authority")) :"");	
		}
		
		return vo;
	}

}
