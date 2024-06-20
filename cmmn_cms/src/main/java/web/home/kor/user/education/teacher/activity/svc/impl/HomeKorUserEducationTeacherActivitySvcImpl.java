package web.home.kor.user.education.teacher.activity.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.teacher.activity.svc.HomeKorUserEducationTeacherActivitySvc;

@Service("homeKorUserEducationTeacherActivitySvc")
public class HomeKorUserEducationTeacherActivitySvcImpl extends CommonServiceImpl implements HomeKorUserEducationTeacherActivitySvc{

	@Override
	public List<?> selectHomeKorUserEducationTeacherActivityList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationTeacherActivity_SQL.selectHomeKorUserEducationTeacherActivityList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationTeacherActivityListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationTeacherActivity_SQL.selectHomeKorUserEducationTeacherActivityListCnt", vo);
	}
}
