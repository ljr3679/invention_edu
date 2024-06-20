package web.home.kor.admin.event.invent.exam.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEventInventExamSvc {

	public List<?> selectHomeKorAdminEventInventExamList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEventInventExamListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEventInventExam(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEventInventExam(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEventInventExam(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventInventExam(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEventInventExamList(CommonVO vo) throws Exception;
}
