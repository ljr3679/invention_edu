package web.home.kor.admin.education.material.content.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminEducationMaterialContentSvc {

	public List<?> selectHomeKorAdminEducationMaterialContentList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminEducationMaterialContentListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminEducationMaterialContentList(CommonVO vo) throws Exception;
}
