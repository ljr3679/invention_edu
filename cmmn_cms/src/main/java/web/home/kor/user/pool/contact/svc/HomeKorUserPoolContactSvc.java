package web.home.kor.user.pool.contact.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserPoolContactSvc {

	public List<?> selectTeacherDataList(CommonVO vo) throws Exception;
	
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectTeacherData(CommonVO vo) throws Exception;	
	
	public List<?> selectTeacherSubEduInfoList(CommonVO vo) throws Exception;
	
	public List<?> selectTeacherSubCareerInfoList(CommonVO vo) throws Exception;	

	public void insertTeacherData(CommonVO vo) throws Exception;
	
	public void insertTbTeacherEduData(CommonVO vo) throws Exception;
	
	public void insertTbTeacherCareerData(CommonVO vo) throws Exception;	
	
	public void updateTbTeacherData(CommonVO vo) throws Exception;

	public void insertTeacherDataAgree(CommonVO vo) throws Exception;	

	public EgovMap selectTeacherDataAgree(CommonVO vo) throws Exception;	
	
	public void updateTeacherDataAgree(CommonVO vo) throws Exception;

	public void deleteTeacherAgree(CommonVO vo) throws Exception;
	
	public void deleteTeacherData(CommonVO vo) throws Exception;
	
	public void deleteTeacherCareerData(CommonVO vo) throws Exception;

	public void deleteTeacherEduData(CommonVO vo) throws Exception;		
	
	public void updateTbTeacherLeaveData(CommonVO vo) throws Exception;
	
}
