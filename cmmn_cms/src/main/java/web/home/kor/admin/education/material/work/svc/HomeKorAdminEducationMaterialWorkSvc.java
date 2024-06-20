package web.home.kor.admin.education.material.work.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationMaterialWorkSvc {

	public List<?> selectHomeKorAdminEducationMaterialWorkList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationMaterialWorkListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationMaterialWorkList(CommonVO vo) throws Exception;
}
