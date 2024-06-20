package cms.site.account.menu.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.account.menu.svc.CMSMenuAuthorityMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSMenuAuthorityMngSvc")
public class CMSMenuAuthorityMngImpl extends CommonServiceImpl implements CMSMenuAuthorityMngSvc {

	@Override
	public List<?> selectMenuAuthorityDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsMenuAuthorityMng.selectMenuAuthorityDataList", vo);
	}

	@Override
	public Integer selectMenuAuthorityDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsMenuAuthorityMng.selectMenuAuthorityDataListCnt", vo);
	}

	@Override
	public EgovMap selectMenuAuthorityData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsMenuAuthorityMng.selectMenuAuthorityData", vo);
	}

	@Override
	public void insertMenuAuthorityData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuAuthorityMng.insertMenuAuthorityData", vo);
	}

	@Override
	public void updateMenuAuthorityData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuAuthorityMng.updateMenuAuthorityData", vo);
	}

	@Override
	public void deleteMenuAuthorityDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsMenuAuthorityMng.deleteMenuAuthorityDataList", vo);
	}

	@Override
	public EgovMap selectMenuAuthoritySessionInit(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsMenuAuthorityMng.selectMenuAuthoritySessionInit", vo);
	}

	@Override
	public List<EgovMap> selectAuthorityDataUseAtList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<EgovMap>) commonMapper.executeQuery("CmsMenuAuthorityMng.selectAuthorityDataUseAtList", vo);
	}

}
