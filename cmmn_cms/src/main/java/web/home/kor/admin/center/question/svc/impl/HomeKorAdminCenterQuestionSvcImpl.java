package web.home.kor.admin.center.question.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.center.question.svc.HomeKorAdminCenterQuestionSvc;

@Service("homeKorAdminCenterQuestionSvc")
public class HomeKorAdminCenterQuestionSvcImpl extends CommonServiceImpl implements HomeKorAdminCenterQuestionSvc{
	
	@Override
	public List<?> selectHomeKorAdminCenterQuestionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.selectHomeKorAdminCenterQuestionList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminCenterQuestionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.selectHomeKorAdminCenterQuestionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminCenterQuestion(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.selectHomeKorAdminCenterQuestion", vo);
	}
	
	@Override
	public void insertHomeKorAdminCenterQuestion(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.insertHomeKorAdminCenterQuestion", vo);
	}
	
	@Override
	public void updateHomeKorAdminCenterQuestion(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.updateHomeKorAdminCenterQuestion", vo);
	}
	
	@Override
	public void deleteHomeKorAdminCenterQuestion(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.deleteHomeKorAdminCenterQuestion", vo);
	}
	
	@Override
	public void deleteHomeKorAdminCenterQuestionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminCenterQuestion_SQL.deleteHomeKorAdminCenterQuestionList", vo);
	}
}