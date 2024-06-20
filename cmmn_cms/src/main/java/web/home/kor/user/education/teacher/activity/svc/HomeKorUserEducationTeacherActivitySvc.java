package web.home.kor.user.education.teacher.activity.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserEducationTeacherActivitySvc {

	public List<?> selectHomeKorUserEducationTeacherActivityList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationTeacherActivityListCnt(CommonVO vo) throws Exception;
}
