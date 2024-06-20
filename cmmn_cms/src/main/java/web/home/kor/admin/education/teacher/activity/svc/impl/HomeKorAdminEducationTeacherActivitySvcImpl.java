package web.home.kor.admin.education.teacher.activity.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.teacher.activity.svc.HomeKorAdminEducationTeacherActivitySvc;

@Service("homeKorAdminEducationTeacherActivitySvc")
public class HomeKorAdminEducationTeacherActivitySvcImpl extends CommonServiceImpl implements HomeKorAdminEducationTeacherActivitySvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationTeacherActivityList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.selectHomeKorAdminEducationTeacherActivityList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationTeacherActivityListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.selectHomeKorAdminEducationTeacherActivityListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.selectHomeKorAdminEducationTeacherActivity", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.insertHomeKorAdminEducationTeacherActivity", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.updateHomeKorAdminEducationTeacherActivity", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.deleteHomeKorAdminEducationTeacherActivity", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationTeacherActivityList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationTeacherActivity_SQL.deleteHomeKorAdminEducationTeacherActivityList", vo);
	}
}