package cms.site.contents.svc.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.contents.svc.CMSContentsSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSContentsSvc")
public class CMSContentsImpl extends CommonServiceImpl implements CMSContentsSvc {
	
	@Override
	public EgovMap selectCMSContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsContents.selectCMSContentsData", vo);
	}

	@Override
	public void updateCMSContentsData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsContents.updateCMSContentsData", vo); 
	}
	
}
