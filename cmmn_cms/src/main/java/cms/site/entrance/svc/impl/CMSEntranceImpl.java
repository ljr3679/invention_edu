package cms.site.entrance.svc.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.data.StaticData;
import cms.site.entrance.svc.CMSEntranceSvc;
import cms.util.WebRequestInfo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSEntranceSvc")
public class CMSEntranceImpl extends CommonServiceImpl implements CMSEntranceSvc {

	@Resource(name="webRequestInfo")
	private WebRequestInfo webRequestInfo;
	
	@Override
	public String selectIpStatus(CommonVO vo, HttpServletRequest request) throws Exception {
		String status = (String) commonMapper.executeQuery("CmsEntrance.selectIpStatus", vo);
		
		switch (status) {
			case "Y":
				vo.setParamKey1(webRequestInfo.getIpAddress(request));				
				return (Integer) commonMapper.executeQuery("CmsEntrance.selectAccessCheck", vo) > 0 ?"Y" :"N";
			case "N":
			default:
				return "PASS";
		}
	}

	@Override
	public EgovMap selectLoginAct(CommonVO vo, HttpServletRequest request) throws Exception {
		EgovMap resultDataAt = (EgovMap) commonMapper.executeQuery("CmsEntrance.selectLoginAdmDataInfoAt", vo);
		EgovMap resultDataInfo = null;
		
		if(resultDataAt == null) unMatchedAccount(vo);
		else {
			String account = String.valueOf(resultDataAt.get("account"));
			String siteCode = String.valueOf(resultDataAt.get("siteCode"));
			String useAt = String.valueOf(resultDataAt.get("useAt"));
			String idx = String.valueOf(resultDataAt.get("no"));
			vo.setIdx(idx);
			vo.setParamKey4(webRequestInfo.getIpAddress(request));
			
			if(!account.equals("S") && !siteCode.contains("["+vo.getSiteCode()+"]")) {
				vo.setParamKey3("STAT_S");
				return null;
			} else if(useAt.equals("N")) {
				vo.setParamKey3("STAT_N");
				return null;
			} else if(useAt.equals("E")) {
				vo.setParamKey3("STAT_E");
				return null;
			}
			
			resultDataInfo = (EgovMap) commonMapper.executeQuery("CmsEntrance.selectLoginAct", vo);
			
			if(resultDataInfo == null) {
				vo.setParamKey3("E");
				return null;
			}
			
			if(vo.getParamKey3().equals("Y")) {
				String ipCheck = String.valueOf(resultDataInfo.get("ipCheck"));
				
				if(ipCheck.equals("N")) {
					vo.setParamKey3("N");
					return null;
				}
			}
			
			Map<String, EgovMap> adminSiteCode = new LinkedHashMap<String, EgovMap>();
			Map<String, EgovMap> allSiteInfo = StaticData.getInstance().getAllSiteInfo();
			for(String siteInfoCode : allSiteInfo.keySet()) {
				if(account.equals("S") || siteCode.contains("["+siteInfoCode+"]")) adminSiteCode.put(siteInfoCode, allSiteInfo.get(siteInfoCode));
			}
			
			resultDataInfo.put("ip", vo.getParamKey4());
			resultDataInfo.put("siteInfo", adminSiteCode);
			
			commonMapper.executeQuery("CmsEntrance.updateLoginFailCntInit", vo);
			commonMapper.executeQuery("CmsEntrance.insertCMSAdminAccessLog", resultDataInfo);
		}
		
		return resultDataInfo;
	}
	
	private void unMatchedAccount(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsEntrance.updateAccessFailCnt", vo);
		
		if(vo.getParamKey4() == null || (vo.getParamKey4() != null && vo.getParamKey4().equals(""))) vo.setParamKey4("-1");
	}

}
