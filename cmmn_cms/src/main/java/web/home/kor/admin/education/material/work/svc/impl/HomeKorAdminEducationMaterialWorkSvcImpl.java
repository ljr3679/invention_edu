package web.home.kor.admin.education.material.work.svc.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.education.material.work.svc.HomeKorAdminEducationMaterialWorkSvc;

@Service("homeKorAdminEducationMaterialWorkSvc")
public class HomeKorAdminEducationMaterialWorkSvcImpl extends CommonServiceImpl implements HomeKorAdminEducationMaterialWorkSvc{
	
	@Override
	public List<?> selectHomeKorAdminEducationMaterialWorkList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.selectHomeKorAdminEducationMaterialWorkList", vo);
	}
	
	@Override
	public Integer selectHomeKorAdminEducationMaterialWorkListCnt(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.selectHomeKorAdminEducationMaterialWorkListCnt", vo);
	}
	
	@Override
	public EgovMap selectHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.selectHomeKorAdminEducationMaterialWork", vo);
	}
	
	@Override
	public void insertHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.insertHomeKorAdminEducationMaterialWork", vo);
	}
	
	@Override
	public void updateHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.updateHomeKorAdminEducationMaterialWork", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationMaterialWork(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.deleteHomeKorAdminEducationMaterialWork", vo);
	}
	
	@Override
	public void deleteHomeKorAdminEducationMaterialWorkList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("HomeKorAdminEducationMaterialWork_SQL.deleteHomeKorAdminEducationMaterialWorkList", vo);
	}
}