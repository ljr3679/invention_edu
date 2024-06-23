package web.home.kor.admin.memberMng.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.memberMng.contact.svc.HomeKorAdminMemberMngContactSvc;


@Service("homeKorAdminMemberMngContactSvc")
public class HomeKorAdminMemberMngContactSvcImpl extends CommonServiceImpl implements HomeKorAdminMemberMngContactSvc {

	@Override
	public List<?> selectContactDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactDataList", vo);
	}

	@Override
	public List<?> selectContactExlDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactExlDataList", vo);
	}	
	
	@Override
	public Integer selectContactDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactDataListCnt", vo);
	}

	@Override
	public EgovMap selectContactData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactData", vo);
	}	

	@Override
	public List<?> selectContactSubEduInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactSubEduInfoList", vo);
	}		
	
	@Override
	public List<?> selectContactSubCareerInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.selectContactSubCareerInfoList", vo);
	}		

	@Override
	public void insertContactData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.insertContactData", vo);
	}	
	
	@Override
	public void insertTbContactEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.insertTbContactEduData", vo);
	}	
	
	@Override
	public void insertTbContactCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.insertTbContactCareerData", vo);
	}		
	
	@Override
	public void updateTbContactData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.updateTbContactData", vo);
	}	
	
	@Override
	public void deleteContactData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.deleteContactData", vo);
	}	

	@Override
	public void deleteContactCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.deleteContactCareerData", vo);
	}		
	
	@Override
	public void deleteContactEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.deleteContactEduData", vo);
	}		
	
	@Override
	public void downloadCMSRecord(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminMemberMngContact_SQL.downloadCMSRecord", vo);
	}	
	
}
