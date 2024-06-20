package cms.mapping;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import cms.cmmn.CommonVO;
import cms.cmmn.FileVO;
import cms.cmmn.svc.CommonSvc;
import cms.constant.Const;
import cms.enc.EncryptModule;
import cms.file.svc.FileDataSvc;
import cms.util.FileUtil;
import cms.util.FormatUtil;
import cms.util.ObjectBuilder;
import cms.util.PatternUtil;
import cms.util.StringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public abstract class CMSMappingHandler {
	
	@Resource(name="fileDataSvc")
	private FileDataSvc fileDataSvc;
	
	@Resource(name="propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name="objectBuilder")
	protected ObjectBuilder objectBuilder;
	
	@Resource(name="encryptModule")
	protected EncryptModule encryptModule;
	
	@Resource(name="fileUtil")
	protected FileUtil fileUtil;
	
	@Resource(name="stringUtil")
	protected StringUtil stringUtil;
	
	@Resource(name="formatUtil")
	protected FormatUtil formatUtil;
	
	@Resource(name="patternUtil")
	protected PatternUtil patternUtil;
	
	@Resource(name="commonSvc")
	protected CommonSvc commonSvc;
	
	protected List<?> getParentCategoryDataList(String category) throws Exception {
		return commonSvc.selectCategoryParentDataList(category);
	}
	
	protected List<?> getChildrenCategoryDataList(String category, String parent) throws Exception {
		EgovMap map = new EgovMap();
		map.put("category", category);
		map.put("parent", parent);
		return commonSvc.selectCategoryChildrenDataList(map);
	}
	
	protected EgovMap getBoardContent(String boardCode) throws Exception {
		return commonSvc.selectCMSBoardContentData(boardCode);
	}
	
	/**
	 * 
	 * @param vo
	 * @param model
	 * @param pagingData
	 * @param pageSet... [0] pageUnit / [1] pageSize
	 */
	protected void setPaging(CommonVO vo, ModelMap model, PagingDataInterface pagingData, int... pageSet) throws Exception {
		int unit;
		int size;
		if(pageSet.length > 0) {
			unit = pageSet[0];
			size = pageSet[1];
		} else {
			unit = propertiesService.getInt("pageUnit20");
			size = propertiesService.getInt("pageSize20");
		}
		
		vo.setPageUnit(unit);
		vo.setPageSize(size);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit());
		paginationInfo.setPageSize(vo.getPageSize());
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		vo.setLastPageNo(paginationInfo.getLastPageNo());
		
		Object[] dataSet = pagingData.callData();
		for(Object data : dataSet) {
			if(data instanceof Integer) paginationInfo.setTotalRecordCount((Integer) data);
			else model.addAttribute("resultList", data);
		}
		
		model.addAttribute("paginationInfo",paginationInfo);
	}
	
	/**
	 * 
	 * @param vo
	 * @param model
	 * @param pagingData
	 * @param pageSet... [0] pageUnit / [1] pageSize
	 */
	protected void setPaging2(CommonVO vo, ModelMap model, PagingDataInterface pagingData, int... pageSet) throws Exception {
		int unit;
		int size;
		if(pageSet.length > 0) {
			unit = pageSet[0];
			size = pageSet[1];
		} else {
			unit = propertiesService.getInt("pageUnit20");
			size = propertiesService.getInt("pageSize20");
		}
		
		vo.setPageUnit2(unit);
		vo.setPageSize2(size);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex2());
		paginationInfo.setRecordCountPerPage(vo.getPageUnit2());
		paginationInfo.setPageSize(vo.getPageSize2());
		vo.setFirstIndex2(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex2(paginationInfo.getLastRecordIndex());
		vo.setRecordCountPerPage2(paginationInfo.getRecordCountPerPage());
		
		Object[] dataSet = pagingData.callData();
		for(Object data : dataSet) {
			if(data instanceof Integer) paginationInfo.setTotalRecordCount((Integer) data);
			else model.addAttribute("resultList2", data);
		}
		
		model.addAttribute("paginationInfo2",paginationInfo);
	}
	
	protected List<EgovMap> selectFileData(String identifier, String key) throws Exception {
		EgovMap map = new EgovMap();
		map.put("identifier", identifier);
		map.put("keyRef", key);
		return (List<EgovMap>) fileDataSvc.selectFileDataList(map);
	}
	
	protected List<EgovMap> selectFileData(String[] identifier, String key) throws Exception {
		EgovMap map = new EgovMap();
		map.put("identifier", identifier);
		map.put("keyRef", key);
		return (List<EgovMap>) fileDataSvc.selectFileDataList(map);
	}
	
	protected void insertFileData(String identifier, String key, List<?> fileList) throws Exception {
		List<String> rmList = new ArrayList<String>();
		List<FileVO> files = fileUtil.uploadForMultipartFileList((List<MultipartFile>) fileList);
		for(FileVO fileVO : files) {
		    String mimeType = fileVO.getMimeType();
		    String extension = fileVO.getExtension();
		    
		    if(!excludeMimeTypeList().contains(mimeType) && !excludeExtensionList().contains(extension)) {
		        EgovMap map = new EgovMap();
	            map.put("identifier", identifier);
	            map.put("keyRef", key);
	            map.put("attachName", fileVO.getFileName());
	            map.put("attachReName", fileVO.getNewFileName());
	            map.put("extension", fileVO.getExtension());
	            map.put("attachSize", fileVO.getFileSize());
	            map.put("mimeType", fileVO.getMimeType());
	            fileDataSvc.insertFileData(map);    
		    } else rmList.add(fileVO.getNewFileName());
		}
		
		if(rmList.size() > 0) fileUtil.deleteFileList(rmList);
	}
	
	private List<String> excludeMimeTypeList() throws Exception {
	    List<String> exclude = new ArrayList<>();
	    
	    exclude.add("jsp");
	    exclude.add("php");
	    exclude.add("html");
	    exclude.add("java");
	    exclude.add("plain");
	    exclude.add("javascript");
	    exclude.add("asp");
	    exclude.add("msdownload");
	    exclude.add("format=pe");
	    
	    return exclude;
	}
	
	private List<String> excludeExtensionList() throws Exception {
	    List<String> exclude = new ArrayList<>();
	    
	    exclude.add("phh3");
	    exclude.add("php");
	    exclude.add("jsp");
	    exclude.add("asp");
	    exclude.add("inc");
	    exclude.add("cgi");
	    exclude.add("htm");
	    exclude.add("html");
	    exclude.add("pl");
	    exclude.add("exe");
	    exclude.add("msi");
	    exclude.add("bat");
	    exclude.add("cmd");
	    exclude.add("vbs");
	    exclude.add("com");
	    exclude.add("bin");
	    exclude.add("cmd");
	    exclude.add("cpl");
	    exclude.add("gadget");
	    exclude.add("inf1");
	    exclude.add("ins");
	    exclude.add("inx");
	    exclude.add("isu");
	    exclude.add("jse");
	    exclude.add("lnk");
	    exclude.add("msc");
	    exclude.add("msp");
	    exclude.add("mst");
	    exclude.add("paf");
	    exclude.add("plf");
	    exclude.add("ps1");
	    exclude.add("reg");
	    exclude.add("rgs");
	    exclude.add("scr");
	    exclude.add("sct");
	    exclude.add("shb");
	    exclude.add("shs");
	    exclude.add("u3p");
	    exclude.add("vb");
	    exclude.add("vbe");
	    exclude.add("vbs");
	    exclude.add("vbscript");
	    exclude.add("ws");
	    exclude.add("wsf");
	    exclude.add("wsh");
	    exclude.add("java");
	    exclude.add("js");
	    
	    return exclude;
	}
	
	protected void removeFileData(CommonVO vo) throws Exception {
		fileUtil.deleteFileList((List<String>) vo.getFileDataNameRmList());
		String numPattern = "^[0-9]+$";
		List<String> rmList = (List<String>) vo.getFileDataRmList();
		if(rmList != null) {
			for(int i=0; i<rmList.size(); i++) {
				if(!rmList.get(i).matches(numPattern)) rmList.set(i, encryptModule.decryptAREA(rmList.get(i)));
			}
			fileDataSvc.deleteFileData(vo);
		}
	}
	
	protected JSONObject searchDataToJson(CommonVO vo) throws Exception {
		ObjectBuilder json = objectBuilder;
		Method[] ms = vo.getClass().getDeclaredMethods();
		for(Method m : ms) {
			String getName = m.getName();
			if(getName.startsWith("getSearch")) {
				Object o = null;
				String key = String.valueOf(getName.charAt(getName.startsWith("get") ?3 :2)).toLowerCase()+getName.substring(getName.startsWith("get") ?4 : 3);
				if((o = m.invoke(vo)) != null && o instanceof String && String.valueOf(o).length() > 0) {
					json.jsonBulid(key, o);
				}
			}
		}
		
		Optional.of(vo.getPageIndex()).filter(param -> !param.equals("1")).ifPresent(param -> json.jsonBulid("pageIndex", param));
		Optional.of(vo.getPageIndex2()).filter(param -> !param.equals("1")).ifPresent(param -> json.jsonBulid("pageIndex2", param));
		Optional.ofNullable(vo.getMenuPos()).ifPresent(param -> json.jsonBulid("menuPos", param));
		
		return json.build();
	}
	
	protected EgovMap admSessionAt(HttpServletRequest request) {
		Object admSessionObj = request.getSession().getAttribute(Const.ADMIN_SESSION_SET);
		if(admSessionObj != null) return (EgovMap) admSessionObj;
		else return null;
	}
	
	protected EgovMap usrSessionAt(HttpServletRequest request) {
		Object usrSessionObj = request.getSession().getAttribute(Const.USER_SESSION_SET);
		if(usrSessionObj != null) return (EgovMap) usrSessionObj;
		else return null;
	}
	
}
