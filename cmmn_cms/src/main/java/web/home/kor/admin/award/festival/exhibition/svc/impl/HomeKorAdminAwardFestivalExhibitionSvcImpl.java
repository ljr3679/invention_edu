package web.home.kor.admin.award.festival.exhibition.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.award.festival.exhibition.svc.HomeKorAdminAwardFestivalExhibitionSvc;

@Service("homeKorAdminAwardFestivalExhibitionSvc")
public class HomeKorAdminAwardFestivalExhibitionSvcImpl extends CommonServiceImpl implements HomeKorAdminAwardFestivalExhibitionSvc{
	
	@Override
	public List<?> selectHomeKorAdminAwardFestivalExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.selectHomeKorAdminAwardFestivalExhibitionList", vo);
	}

	@Override
	public Integer selectHomeKorAdminAwardFestivalExhibitionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.selectHomeKorAdminAwardFestivalExhibitionListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.selectHomeKorAdminAwardFestivalExhibition", vo);
	}

	@Override
	public void insertHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.insertHomeKorAdminAwardFestivalExhibition", vo);
	}

	@Override
	public void updateHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.updateHomeKorAdminAwardFestivalExhibition", vo);
	}

	@Override
	public void deleteHomeKorAdminAwardFestivalExhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.deleteHomeKorAdminAwardFestivalExhibition", vo);
	}
	
	@Override
	public void deleteHomeKorAdminAwardFestivalExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminAwardFestivalExhibition_SQL.deleteHomeKorAdminAwardFestivalExhibitionList", vo);
	}
}