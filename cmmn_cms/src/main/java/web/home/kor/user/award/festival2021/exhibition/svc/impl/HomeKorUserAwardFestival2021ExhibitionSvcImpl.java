package web.home.kor.user.award.festival2021.exhibition.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.award.festival2021.exhibition.svc.HomeKorUserAwardFestival2021ExhibitionSvc;
import web.home.kor.user.award.festival2021.main.svc.HomeKorUserAwardFestival2021MainSvc;
import web.home.kor.user.judge.main.svc.HomeKorUserJudgeMainSvc;

@Service("homeKorUserAwardFestival2021ExhibitionSvc")
public class HomeKorUserAwardFestival2021ExhibitionSvcImpl extends CommonServiceImpl implements HomeKorUserAwardFestival2021ExhibitionSvc{

	@Override
	public List<?> selectHomeKorUserAwardFestival2021ExhibitionList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionList", vo);
	}

	@Override
	public Integer selectHomeKorUserAwardFestival2021ExhibitionListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorUserAwardFestival2021ExhibitionBasicData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022ExhibitionBasicData", vo);
	}

	@Override
	public EgovMap selectHomeKorUserAwardFestival2021Exhibition(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserAwardFestival2022Exhibition_SQL.selectHomeKorUserAwardFestival2022Exhibition", vo);
	}

	
}