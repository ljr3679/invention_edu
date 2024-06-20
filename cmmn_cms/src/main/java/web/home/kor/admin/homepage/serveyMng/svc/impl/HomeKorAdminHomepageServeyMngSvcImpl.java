package web.home.kor.admin.homepage.serveyMng.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.cmmn.mapper.CommonMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.homepage.serveyMng.svc.HomeKorAdminHomepageServeyMngSvc;
import web.home.kor.admin.homepage.video.svc.HomeKorAdminHomepageVideoSvc;

@Service("homeKorAdminHomepageServeyMngSvc")
public class HomeKorAdminHomepageServeyMngSvcImpl extends CommonServiceImpl implements HomeKorAdminHomepageServeyMngSvc{
	
	@Resource(name="commonMapper")
	private CommonMapper commonMapper;
	
	@Override
	public List<?> selectAdminSurveyDataList(CommonVO vo) throws Exception {
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyDataList", vo);
	}

	@Override
	public Integer selectAdminSurveyDataListCnt(CommonVO vo) throws Exception {
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyDataListCnt", vo);
	}
	
	@Override
	public EgovMap selectAdminSurveyData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyData", vo);
	}

	@Override
	public List<?> selectAdminSurveySubDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveySubDataList", vo);
	}

	@Override
	public void insertAdminSurveyData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.insertAdminSurveyData", vo);
	}
	
	@Override
	public void updateAdminSurveyData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.updateAdminSurveyData", vo);
	}

	@Override
	public void insertAdminSurveySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.insertAdminSurveySubData", vo);
	}
	
	@Override
	public void updateAdminSurveySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.updateAdminSurveySubData", vo);
	}
	
	@Override
	public void updateAdminSurveyDataDel(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.updateAdminSurveyDataDel", vo);
	}
	
	@Override
	public void deleteAdminSurveySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.deleteAdminSurveySubData", vo);
	}

	@Override
	public List<?> selectEducationParticipantSurveyDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectEducationParticipantSurveyDataList", vo);
	}

	@Override
	public Integer selectEducationParticipantSurveyDataListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectEducationParticipantSurveyDataListCnt", vo);
	}

	@Override
	public EgovMap selectAdminSurveyEditData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyEditData", vo);
	}

	@Override
	public List<?> selectAdminSurveyEditSubDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyEditSubDataList", vo);
	}
	
	@Override
	public List<?> selectAdminSurveyEditSubTotalDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyEditSubTotalDataList", vo);
	}
	
	@Override
	public List<?> selectAdminSurveyEditSubmitTextDataInfoList(EgovMap map) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminHomepageServeyMngSQL.selectAdminSurveyEditSubmitTextDataInfoList", map);
	}
}