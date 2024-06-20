package web.home.kor.admin.classroom.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.classroom.svc.HomeKorAdminClassroomSvc;

@Service("homeKorAdminClassroomSvc")
public class HomeKorAdminClassroomSvcImpl extends CommonServiceImpl implements HomeKorAdminClassroomSvc {

	@Override
	public List<?> selectHomeKorAdminClassroomList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroomList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminClassroomListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroomListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminClassroom(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroom", vo);
	}	

	@Override
	public void insertHomeKorAdminClassroom(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.insertHomeKorAdminClassroom", vo);
	}
	
	@Override
	public void updateHomeKorAdminClassroom(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.updateHomeKorAdminClassroom", vo);
	}

	@Override
	public void deleteHomeKorAdminClassroom(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.deleteHomeKorAdminClassroom", vo);
	}	
	
	@Override
	public void deleteHomeKorAdminClassroomList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.deleteHomeKorAdminClassroomList", vo);
	}		

	@Override
	public List<?> selectTeacherDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectTeacherDataList", vo);
	}
	
	@Override
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectTeacherDataListCnt", vo);
	}	
	
	
	
	
	@Override
	public EgovMap selectHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroomSchedule", vo);
	}	

	@Override
	public void insertHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.insertHomeKorAdminClassroomSchedule", vo);
	}
	
	@Override
	public void updateHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.updateHomeKorAdminClassroomSchedule", vo);
	}

	@Override
	public void deleteHomeKorAdminClassroomSchedule(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminClassroom_SQL.deleteHomeKorAdminClassroomSchedule", vo);
	}		
	
	
	@Override
	public List<?> selectHomeKorAdminClassroomScheduleList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroomScheduleList", vo);
	}	
	
	@Override
	public Integer selectHomeKorAdminClassroomScheduleListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminClassroom_SQL.selectHomeKorAdminClassroomScheduleListCnt", vo);
	}	
}
