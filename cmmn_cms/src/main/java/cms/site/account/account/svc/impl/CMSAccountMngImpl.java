package cms.site.account.account.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.account.account.svc.CMSAccountMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSAccountMngSvc")
public class CMSAccountMngImpl extends CommonServiceImpl implements CMSAccountMngSvc {
	
	@Override
	public List<?> selectAccountDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("CmsAccountMng.selectAccountDataList", vo);
	}

	@Override
	public Integer selectAccountDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("CmsAccountMng.selectAccountDataListCnt", vo);
	}

	@Override
	public EgovMap selectAccountData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("CmsAccountMng.selectAccountData", vo);
	}

	@Override
	public void insertAccountData(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccountMng.insertAccountData", vo);
		commonMapper.executeQuery("CmsAccountMng.insertAdminInfoData", vo);
	}

	@Override
	public void updateAccountData(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccountMng.updateAccountData", vo);
		commonMapper.executeQuery("CmsAccountMng.updateAdminInfoData", vo);
	}

	@Override
	public void deleteAccountDataList(CommonVO vo) throws Exception {
		commonMapper.executeQuery("CmsAccountMng.deleteAccountDataList", vo);
		commonMapper.executeQuery("CmsAccountMng.deleteAccountSubDataList", vo);
	}

	@Override
	public List<EgovMap> selectAuthorityNameList(CommonVO vo) throws Exception {
		return (List<EgovMap>) commonMapper.executeQuery("CmsAccountMng.selectAuthorityNameList", vo);
	}

	@Override
	public Integer selectAdminIdCheck(String id) throws Exception {
		return (Integer) commonMapper.executeQuery("CmsAccountMng.selectAdminIdCheck", id);
	}


}
