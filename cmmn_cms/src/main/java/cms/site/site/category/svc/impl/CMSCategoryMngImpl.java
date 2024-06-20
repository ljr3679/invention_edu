package cms.site.site.category.svc.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cms.cmmn.CommonServiceImpl;
import cms.cmmn.CommonVO;
import cms.site.site.category.svc.CMSCategoryMngSvc;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("CMSCategoryMngSvc")
public class CMSCategoryMngImpl extends CommonServiceImpl implements CMSCategoryMngSvc {
	
	@Override
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsCategoryMng.selectCategoryDataList", vo);
	}

	@Override
	public EgovMap selectCategoryData(String code) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsCategoryMng.selectCategoryData", code);
	}

	@Override
	public Integer selectCheckCategoryKey(String code) throws Exception {
		// TODO Auto-generated method stub
		return (Integer) commonMapper.executeQuery("CmsCategoryMng.selectCheckCategoryKey", code);
	}

	@Override
	public void insertCategoryData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.insertCategoryData", vo);
	}

	@Override
	public void updateCategoryData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.updateCategoryData", vo);
	}

	@Override
	public void deleteCategoryData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.deleteCategoryData", vo);
	}
	
	@Override
	public void deleteCategorySubAllData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.deleteCategorySubAllData", vo);
	}

	@Override
	public List<?> selectCategorySubDataList(String code) throws Exception {
		// TODO Auto-generated method stub
		return (List<?>) commonMapper.executeQuery("CmsCategoryMng.selectCategorySubDataList", code);
	}

	@Override
	public EgovMap selectCategorySubData(String key) throws Exception {
		// TODO Auto-generated method stub
		return (EgovMap) commonMapper.executeQuery("CmsCategoryMng.selectCategorySubData", key);
	}

	@Override
	public void insertCategorySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.insertCategorySubData", vo);
	}

	@Override
	public void updateCategorySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.updateCategorySubData", vo);
	}
	
	@Override
	public void updateCategorySubDataSort(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.updateCategorySubDataSort", vo);
	}

	@Override
	public void deleteCategorySubData(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.deleteCategorySubData", vo);
	}

	@Override
	public void updateCategorySubDataDeleteSort(CommonVO vo) throws Exception {
		// TODO Auto-generated method stub
		commonMapper.executeQuery("CmsCategoryMng.updateCategorySubDataDeleteSort", vo);
	}

}
