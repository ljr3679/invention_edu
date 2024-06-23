package web.home.kor.user.pool.teacher.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.pool.teacher.svc.HomeKorUserPoolTeacherSvc;

@Service("homeKorUserPoolTeacherSvc")
public class HomeKorUserPoolTeacherSvcImpl extends CommonServiceImpl implements HomeKorUserPoolTeacherSvc {

	
	@Override
	public List<?> selectTeacherDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherDataList", vo);
	}

	@Override
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherDataListCnt", vo);
	}

	@Override
	public EgovMap selectTeacherData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherData", vo);
	}	

	@Override
	public List<?> selectTeacherSubEduInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherSubEduInfoList", vo);
	}		
	
	@Override
	public List<?> selectTeacherSubCareerInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherSubCareerInfoList", vo);
	}		

	@Override
	public void insertTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.insertTeacherData", vo);
	}	
	
	@Override
	public void insertTbTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.insertTbTeacherEduData", vo);
	}	
	
	@Override
	public void insertTbTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.insertTbTeacherCareerData", vo);
	}		
	
	@Override
	public void updateTbTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.updateTbTeacherData", vo);
	}	

	@Override
	public void insertTeacherDataAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.insertTeacherDataAgree", vo);
	}		

	@Override
	public EgovMap selectTeacherDataAgree(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherDataAgree", vo);
	}		
	
	@Override
	public void updateTeacherDataAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.updateTeacherDataAgree", vo);
	}		

	@Override
	public void deleteTeacherAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.deleteTeacherAgree", vo);
	}		
	
	@Override
	public void deleteTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.deleteTeacherData", vo);
	}	

	@Override
	public void deleteTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.deleteTeacherCareerData", vo);
	}		
	
	@Override
	public void deleteTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.deleteTeacherEduData", vo);
	}		

	@Override
	public void updateTbTeacherLeaveData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.updateTbTeacherLeaveData", vo);
	}		
	@Override
	public void insertTbTeacherAreaData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.insertTbTeacherAreaData", vo);
	}		
	@Override
	public void deleteTbTeacherAreaData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.deleteTbTeacherAreaData", vo);
	}		
	
	
	@Override
	public List<?> selectTeacherSubAreaInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolTeacher_SQL.selectTeacherSubAreaInfoList", vo);
	}		
}
