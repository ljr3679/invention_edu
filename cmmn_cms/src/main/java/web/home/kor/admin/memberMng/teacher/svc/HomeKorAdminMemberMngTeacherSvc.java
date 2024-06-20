package web.home.kor.admin.memberMng.teacher.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminMemberMngTeacherSvc {

	public List<?> selectTeacherDataList(CommonVO vo) throws Exception;
	
	public List<?> selectTeacherExlDataList(CommonVO vo) throws Exception;
	
	public Integer selectTeacherDataListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectTeacherData(CommonVO vo) throws Exception;	
	
	public List<?> selectTeacherSubEduInfoList(CommonVO vo) throws Exception;
	
	public List<?> selectTeacherSubCareerInfoList(CommonVO vo) throws Exception;	

	public void insertTeacherData(CommonVO vo) throws Exception;
	
	public void insertTbTeacherEduData(CommonVO vo) throws Exception;
	
	public void insertTbTeacherCareerData(CommonVO vo) throws Exception;	
	
	public void updateTbTeacherData(CommonVO vo) throws Exception;
	
	public void deleteTeacherData(CommonVO vo) throws Exception;
	
	public void deleteTeacherCareerData(CommonVO vo) throws Exception;

	public void deleteTeacherEduData(CommonVO vo) throws Exception;	
	
	public void downloadCMSRecord(CommonVO vo) throws Exception;
	
}
