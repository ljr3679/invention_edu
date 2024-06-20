package web.home.kor.user.education.material.content.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import web.home.kor.user.education.material.content.svc.HomeKorUserEducationMaterialContentSvc;

@Service("homeKorUserEducationMaterialContentSvc")
public class HomeKorUserEducationMaterialContentSvcImpl extends CommonServiceImpl implements HomeKorUserEducationMaterialContentSvc{
	
	@Override
	public List<?> selectHomeKorUserEducationMaterialContentList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorUserEducationMaterialContent_SQL.selectHomeKorUserEducationMaterialContentList", vo);
	}
	
	@Override
	public Integer selectHomeKorUserEducationMaterialContentListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorUserEducationMaterialContent_SQL.selectHomeKorUserEducationMaterialContentListCnt", vo);
	}
	
}