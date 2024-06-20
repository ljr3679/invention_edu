package web.home.kor.admin.education.teacher.activity.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationTeacherActivitySvc {

	public List<?> selectHomeKorAdminEducationTeacherActivityList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationTeacherActivityListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationTeacherActivity(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationTeacherActivityList(CommonVO vo) throws Exception;
}
