package web.home.kor.user.pool.contact.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.pool.contact.svc.HomeKorUserPoolContactSvc;

@Service("homeKorUserPoolContactSvc")
public class HomeKorUserPoolContactSvcImpl extends CommonServiceImpl implements HomeKorUserPoolContactSvc {

	
	@Override
	public List<?> selectTeacherDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherDataList", vo);
	}

	@Override
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherDataListCnt", vo);
	}

	@Override
	public EgovMap selectTeacherData(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherData", vo);
	}	

	@Override
	public List<?> selectTeacherSubEduInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherSubEduInfoList", vo);
	}		
	
	@Override
	public List<?> selectTeacherSubCareerInfoList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherSubCareerInfoList", vo);
	}		

	@Override
	public void insertTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.insertTeacherData", vo);
	}	
	
	@Override
	public void insertTbTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.insertTbTeacherEduData", vo);
	}	
	
	@Override
	public void insertTbTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.insertTbTeacherCareerData", vo);
	}		
	
	@Override
	public void updateTbTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.updateTbTeacherData", vo);
	}	

	@Override
	public void insertTeacherDataAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.insertTeacherDataAgree", vo);
	}		

	@Override
	public EgovMap selectTeacherDataAgree(CommonVO vo) throws Exception {
		return (EgovMap) commonMapper.executeQuery("HomeKorUserPoolContact_SQL.selectTeacherDataAgree", vo);
	}		
	
	@Override
	public void updateTeacherDataAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.updateTeacherDataAgree", vo);
	}		

	@Override
	public void deleteTeacherAgree(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.deleteTeacherAgree", vo);
	}		
	
	@Override
	public void deleteTeacherData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.deleteTeacherData", vo);
	}	

	@Override
	public void deleteTeacherCareerData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.deleteTeacherCareerData", vo);
	}		
	
	@Override
	public void deleteTeacherEduData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.deleteTeacherEduData", vo);
	}		

	@Override
	public void updateTbTeacherLeaveData(CommonVO vo) throws Exception  {
		commonMapper.executeQuery("HomeKorUserPoolContact_SQL.updateTbTeacherLeaveData", vo);
	}		
	
}
