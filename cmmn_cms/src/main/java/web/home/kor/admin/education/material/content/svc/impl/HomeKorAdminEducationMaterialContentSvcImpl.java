package web.home.kor.admin.education.material.content.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.material.content.svc.HomeKorAdminEducationMaterialContentSvc;

@Service("homeKorAdminEducationMaterialContentSvc")
public class HomeKorAdminEducationMaterialContentSvcImpl extends CommonServiceImpl implements HomeKorAdminEducationMaterialContentSvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationMaterialContentList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.selectHomeKorAdminEducationMaterialContentList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationMaterialContentListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.selectHomeKorAdminEducationMaterialContentListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.selectHomeKorAdminEducationMaterialContent", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.insertHomeKorAdminEducationMaterialContent", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.updateHomeKorAdminEducationMaterialContent", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationMaterialContent(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.deleteHomeKorAdminEducationMaterialContent", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationMaterialContentList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialContent_SQL.deleteHomeKorAdminEducationMaterialContentList", vo);
	}
}