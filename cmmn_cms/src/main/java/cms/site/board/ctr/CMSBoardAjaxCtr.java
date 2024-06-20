package cms.site.board.ctr;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.mapping.CMSMappingHandler;
import cms.site.board.svc.CMSBoardSvc;
import cms.site.menu.board.svc.CMSBoardMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CMSBoardAjaxCtr extends CMSMappingHandler {
	
	@Resource(name="CMSBoardSvc")
	private CMSBoardSvc CMSBoardSvc;
	
	@Resource(name="CMSBoardMngSvc")
	private CMSBoardMngSvc CMSBoardMngSvc;	
	
	@RequestMapping(value= {"/cms/board/secret.ajax", "/cmsManager/cms/board/secret.ajax"}, produces="application/text;charset=utf8")
	public @ResponseBody String secret(
			@RequestParam(value="idx", defaultValue="") String idx,
			@RequestParam(value="inputData", defaultValue="") String inputData,
			HttpServletRequest request
			) throws Exception {
		CommonVO vo = new CommonVO();
		vo.setIdx(idx);
		vo.setParamKey1(encryptModule.encryptSHA256(inputData));
		
		int result = CMSBoardSvc.selectCMSBoardSecretCheck(vo);
		
		return result > 0?"Y" :"N";
	}
	
	@RequestMapping(value= {"/cms/board/cate.ajax", "/cmsManager/cms/board/cate.ajax"}, produces="application/text;charset=utf8")
	public @ResponseBody String cate(
			@RequestParam(value="value", defaultValue="") String value,
			@RequestParam(value="select", defaultValue="") String select,
			HttpServletRequest request
			) throws Exception {
		
		StringBuilder sb = new StringBuilder();
		
		if(stringUtil.isNotEmpty(value)) {
			CommonVO vo = new CommonVO();
			vo.setIdx4(value);
			List<EgovMap> categoryList = (List<EgovMap>) CMSBoardSvc.selectCategoryDataList(vo);	
			
			for(EgovMap map : categoryList) {
				sb.append("<option value=\""+String.valueOf(map.get("no"))+"\" "+(String.valueOf(map.get("no")).equals(select) ?"selected=\"selected\"" :"")+">"+String.valueOf(map.get("dataName"))+"</option>");
			}
		}
		
		return sb.toString();
	}
	
}
