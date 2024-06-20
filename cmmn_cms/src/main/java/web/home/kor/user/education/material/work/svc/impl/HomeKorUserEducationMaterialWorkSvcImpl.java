package web.home.kor.user.education.material.work.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.material.work.svc.HomeKorUserEducationMaterialWorkSvc;

@Service("homeKorUserEducationMaterialWorkSvc")
public class HomeKorUserEducationMaterialWorkSvcImpl extends CommonServiceImpl implements HomeKorUserEducationMaterialWorkSvc{
	
	@Override
	public List<?> selectHomeKorUserEducationMaterialWorkList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationMaterialWork_SQL.selectHomeKorUserEducationMaterialWorkList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationMaterialWorkListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationMaterialWork_SQL.selectHomeKorUserEducationMaterialWorkListCnt", vo);
	}
	
}