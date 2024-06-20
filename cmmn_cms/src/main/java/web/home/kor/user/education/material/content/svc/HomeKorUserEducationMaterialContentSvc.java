package web.home.kor.user.education.material.content.svc;

import java.util.List;

import cms.cmmn.CommonVO;

public interface HomeKorUserEducationMaterialContentSvc {

	public List<?> selectHomeKorUserEducationMaterialContentList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorUserEducationMaterialContentListCnt(CommonVO vo) throws Exception;
	
}
