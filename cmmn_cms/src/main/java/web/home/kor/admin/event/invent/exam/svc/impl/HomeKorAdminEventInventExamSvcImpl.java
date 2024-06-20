package web.home.kor.admin.event.invent.exam.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.event.invent.exam.svc.HomeKorAdminEventInventExamSvc;

@Service("homeKorAdminEventInventExamSvc")
public class HomeKorAdminEventInventExamSvcImpl extends CommonServiceImpl implements HomeKorAdminEventInventExamSvc{
	
	@Override
	public List<?> selectHomeKorAdminEventInventExamList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.selectHomeKorAdminEventInventExamList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEventInventExamListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.selectHomeKorAdminEventInventExamListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEventInventExam(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.selectHomeKorAdminEventInventExam", vo);
	}
	
	@Override
	public void insertHomeKorAdminEventInventExam(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.insertHomeKorAdminEventInventExam", vo);
	}
	
	@Override
	public void updateHomeKorAdminEventInventExam(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.updateHomeKorAdminEventInventExam", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventInventExam(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.deleteHomeKorAdminEventInventExam", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEventInventExamList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEventInventExam_SQL.deleteHomeKorAdminEventInventExamList", vo);
	}
}