package cms.site.account.record.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.account.record.svc.CMSRecordMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("CMSRecordMngSvc")
public class CMSRecordMngImpl extends CommonServiceImpl implements CMSRecordMngSvc {

	@Override
	public List<?> selectRecordDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsRecordMng.selectRecordDataList", vo);
	}

	@Override
	public Integer selectRecordDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsRecordMng.selectRecordDataListCnt", vo);
	}

	@Override
	public void downloadCMSRecord(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsRecordMng.downloadCMSRecord", vo);
	}


}
