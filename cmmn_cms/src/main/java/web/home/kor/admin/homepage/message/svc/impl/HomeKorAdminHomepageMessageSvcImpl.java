package web.home.kor.admin.homepage.message.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.message.svc.HomeKorAdminHomepageMessageSvc;

@Service("homeKorAdminHomepageMessageSvc")
public class HomeKorAdminHomepageMessageSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageMessageSvc{
	
	@Override
	public List<?> selectHomeKorAdminHomepageMessageList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectHomeKorAdminHomepageMessageList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminHomepageMessageListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectHomeKorAdminHomepageMessageListCnt", vo);
	}
	
	@Override
	public List<?> selectMemberDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectMemberDataList", vo);
	}
	
	@Override
	public Integer selectMemberDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectMemberDataListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminHomepageMessage(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectHomeKorAdminHomepageMessage", vo);
	}

	@Override
	public void insertHomeKorAdminHomepageMessage(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.insertHomeKorAdminHomepageMessage", vo);
	}
	
	@Override
	public void updateHomeKorAdminHomepageMessage(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.updateHomeKorAdminHomepageMessage", vo);
	}

	@Override
	public void deleteHomeKorAdminHomepageMessage(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.deleteHomeKorAdminHomepageMessage", vo);
	}
	
	@Override
	public void deleteHomeKorAdminHomepageMessageList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.deleteHomeKorAdminHomepageMessageList", vo);
	}
	
	@Override
	public void insertHomeKorAdminHomepageMessageLog(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.insertHomeKorAdminHomepageMessageLog", vo);
	}	
	
	@Override
	public List<?> selectHomeKorAdminHomepageMessageLogList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectHomeKorAdminHomepageMessageLogList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminHomepageMessageLogListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageMessage_SQL.selectHomeKorAdminHomepageMessageLogListCnt", vo);
	}	
}