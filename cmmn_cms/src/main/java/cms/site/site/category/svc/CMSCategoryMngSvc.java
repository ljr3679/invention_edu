package cms.site.site.category.svc;

import java.util.List;

import cms.cmmn.CommonVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CMSCategoryMngSvc {
	
	public List<?> selectCategoryDataList(CommonVO vo) throws Exception;
	
	public EgovMap selectCategoryData(String code) throws Exception;

	public Integer selectCheckCategoryKey(String code) throws Exception;
	
	public void insertCategoryData(CommonVO vo) throws Exception;
	
	public void updateCategoryData(CommonVO vo) throws Exception;
	
	public void deleteCategoryData(CommonVO vo) throws Exception;
	
	public void deleteCategorySubAllData(CommonVO vo) throws Exception;
	
	public List<?> selectCategorySubDataList(String code) throws Exception;
	
	public EgovMap selectCategorySubData(String key) throws Exception;
	
	public void insertCategorySubData(CommonVO vo) throws Exception;
	
	public void updateCategorySubData(CommonVO vo) throws Exception;
	
	public void updateCategorySubDataSort(CommonVO vo) throws Exception;
	
	public void deleteCategorySubData(CommonVO vo) throws Exception;
	
	public void updateCategorySubDataDeleteSort(CommonVO vo) throws Exception;
	
}
