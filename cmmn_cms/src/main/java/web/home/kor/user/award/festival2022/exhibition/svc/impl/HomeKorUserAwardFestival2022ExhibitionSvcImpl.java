package web.home.kor.user.award.festival2022.exhibition.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2022.exhibition.svc.HomeKorUserAwardFestival2022ExhibitionSvc;

@Service("homeKorUserAwardFestival2022ExhibitionSvc")
public class HomeKorUserAwardFestival2022ExhibitionSvcImpl extends CommonServiceImpl implements HomeKorUserAwardFestival2022ExhibitionSvc{

	@Override
	public List<?> selectHomeKorUserAwardFestival2022ExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionList", vo);
	}

	@Override
	public Integer selectHomeKorUserAwardFestival2022ExhibitionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserAwardFestival2022ExhibitionBasicData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionBasicData", vo);
	}

	@Override
	public EgovMap selectHomeKorUserAwardFestival2022Exhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022Exhibition", vo);
	}
	
}