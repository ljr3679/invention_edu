package web.home.kor.admin.classroom.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminClassroomSvc {

	public List<?> selectHomeKorAdminClassroomList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminClassroomListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminClassroom(CommonVO vo) throws Exception;	
	
	public void insertHomeKorAdminClassroom(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminClassroom(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminClassroom(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminClassroomList(CommonVO vo) throws Exception;
	
	public List<?> selectTeacherDataList(CommonVO vo) throws Exception;
	
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception;	
	
	
	public EgovMap selectHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception;

	public void insertHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception;	
	
	public List<?> selectHomeKorAdminClassroomScheduleList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminClassroomScheduleListCnt(CommonVO vo) throws Exception;
	
}
