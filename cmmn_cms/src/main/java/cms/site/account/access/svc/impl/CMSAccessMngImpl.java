package cms.site.account.access.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.account.access.svc.CMSAccessMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSAccessMngSvc")
public class CMSAccessMngImpl extends CommonServiceImpl implements CMSAccessMngSvc {
	
	@Override
	public List<?> selectAccessDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("CmsAccessMng.selectAccessDataList", vo);
	}
	
	@Override
	public Integer selectAccessDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("CmsAccessMng.selectAccessDataListCnt", vo);
	}
	
	@Override
	public String selectIpStatus(CommonVO vo) throws Exception {
		return (String) commonMapper.executeQuery("CmsAccessMng.selectIpStatus", vo);
	}
	
	@Override
	public void insertAndUpdateIpAccessStatusData(CommonVO vo) throws Exception {
		Boolean check = (Boolean) commonMapper.executeQuery("CmsAccessMng.selectIpAccessStatusDataAt", vo);
		
		if(check) commonMapper.executeQuery("CmsAccessMng.updateIpAccessStatusData", vo);
		else commonMapper.executeQuery("CmsAccessMng.insertIpAccessStatusData", vo); 
	}

	@Override
	public EgovMap selectAccessData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("CmsAccessMng.selectAccessData", vo);
	}
	
	@Override
	public List<?> selectAdminAccountDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("CmsAccessMng.selectAdminAccountDataList", vo);
	}

	@Override
	public void insertAccessData(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccessMng.insertAccessData", vo);		
	}

	@Override
	public void updateAccessData(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccessMng.updateAccessData", vo);
	}

	@Override
	public void deleteAccessDataList(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccessMng.deleteAccessDataList", vo);
	}
	
}
