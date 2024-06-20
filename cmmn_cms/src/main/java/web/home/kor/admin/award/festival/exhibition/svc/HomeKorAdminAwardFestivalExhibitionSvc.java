package web.home.kor.admin.award.festival.exhibition.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface HomeKorAdminAwardFestivalExhibitionSvc {

	public List<?> selectHomeKorAdminAwardFestivalExhibitionList(CommonVO vo) throws Exception;
	
	public Integer selectHomeKorAdminAwardFestivalExhibitionListCnt(CommonVO vo) throws Exception;
	
	public EgovMap selectHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception;
	
	public void insertHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception;
	
	public void updateHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception;
	
	public void deleteHomeKorAdminAwardFestivalExhibitionList(CommonVO vo) throws Exception;
}
