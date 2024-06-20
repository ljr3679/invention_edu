package web.home.kor.user.education.material.work.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorUserEducationMaterialWorkSvc {

	public List<?> selectHomeKorUserEducationMaterialWorkList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationMaterialWorkListCnt(CommonVO vo) throws Exception;
	
}
