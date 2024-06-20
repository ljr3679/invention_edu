package web.home.kor.user.archive.serveyMng.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.user.archive.question.svc.HomeKorUserArchiveQuestionSvc;
import web.home.kor.user.archive.serveyMng.svc.HomeKorUserArchiveServeyMngSvc;

@Service("homeKorUserArchiveServeyMngSvc")
public class HomeKorUserArchiveServeyMngSvcImpl extends CommonServiceImpl implements HomeKorUserArchiveServeyMngSvc{

	@Override
	public List<?> selectHomeKorUserArchiveServeyMngList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.selectHomeKorUserArchiveServeyMngList", vo);
	}

	@Override
	public Integer selectHomeKorUserArchiveServeyMngListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.selectHomeKorUserArchiveServeyMngListCnt", vo);
	}

	@Override
	public EgovMap selectHomeKorUserArchiveServeyMngData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.selectHomeKorUserArchiveServeyMngData", vo);
	}

	@Override
	public List<?> selectHomeKorUserArchiveServeyMngDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.selectHomeKorUserArchiveServeyMngDataList", vo);
	}

	@Override
	public void insertHomeKorUserArchiveServeyMngData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.insertHomeKorUserArchiveServeyMngData", vo);
	}

	@Override
	public void insertHomeKorUserArchiveServeyMngSubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorUserArchiveServeyMngSQL.insertHomeKorUserArchiveServeyMngSubData", vo);
	}

}