package web.home.kor.admin.memberMng.teacher.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.memberMng.teacher.svc.HomeKorAdminMemberMngTeacherSvc;


@Service("homeKorAdminMemberMngTeacherSvc")
public class HomeKorAdminMemberMngTeacherSvcImpl extends CommonServiceImpl implements HomeKorAdminMemberMngTeacherSvc {

	@Override
	public List<?> selectTeacherDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherDataList", vo);
	}

	@Override
	public List<?> selectTeacherExlDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherExlDataList", vo);
	}	
	
	@Override
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherDataListCnt", vo);
	}

	@Override
	public EgovMap selectTeacherData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherData", vo);
	}	

	@Override
	public List<?> selectTeacherSubEduInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherSubEduInfoList", vo);
	}		
	
	@Override
	public List<?> selectTeacherSubCareerInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.selectTeacherSubCareerInfoList", vo);
	}		

	@Override
	public void insertTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.insertTeacherData", vo);
	}	
	
	@Override
	public void insertTbTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.insertTbTeacherEduData", vo);
	}	
	
	@Override
	public void insertTbTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.insertTbTeacherCareerData", vo);
	}		
	
	@Override
	public void updateTbTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.updateTbTeacherData", vo);
	}	
	
	@Override
	public void deleteTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.deleteTeacherData", vo);
	}	

	@Override
	public void deleteTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.deleteTeacherCareerData", vo);
	}		
	
	@Override
	public void deleteTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.deleteTeacherEduData", vo);
	}		
	
	@Override
	public void downloadCMSRecord(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminMemberMngTeacher_SQL.downloadCMSRecord", vo);
	}	
	
}
