package web.home.kor.admin.homepage.video.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminHomepageVideoSvc {

	/*public List<?> selectHomeKorAdminHomepageVideoList(CommonVO vo) throws Exception;*/
	
	public Integer selectHomeKorAdminHomepageVideoListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminHomepageVideo(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminHomepageVideo(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminHomepageVideo(CommonVO vo) throws Exception;
	
	/*public void deleteHomeKorAdminHomepageVideo(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminHomepageVideoList(CommonVO vo) throws Exception;*/
}
