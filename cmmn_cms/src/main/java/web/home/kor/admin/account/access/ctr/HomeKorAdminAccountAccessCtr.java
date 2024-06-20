package web.home.kor.admin.account.access.ctr;

import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cms.cmmn.CommonVO;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import web.home.kor.admin.account.access.svc.HomeKorAdminAccountAccessSvc;

@Controller
@RequestMapping(value="/account/access/")
public class HomeKorAdminAccountAccessCtr extends CMSMappingHandler {
	
	@Resource(name="homeKorAdminAccountAccessSvc")
	private HomeKorAdminAccountAccessSvc homeKorAdminAccountAccessSvc ; 	
	
	
	@RequestMapping(value="index.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {

		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				vo.setPagingAt("Y");
				List<?> resultList = homeKorAdminAccountAccessSvc.selectLoginDataList(vo);
				int totalCnt = homeKorAdminAccountAccessSvc.selectLoginDataListCnt(vo);
				return new Object[] {resultList, totalCnt};
			}
		});
	}		

	@RequestMapping(value="excelDownload.do", method=RequestMethod.POST)
	public void excelDownload(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletResponse response,
			HttpServletRequest request
			) throws Exception {
		
		vo.setTitle("관리자 접속 이력 엑셀 다운로드");
		homeKorAdminAccountAccessSvc.downloadCMSRecord(vo);
		
		String title = "CMS-관리자 [접속 이력 관리]";
		
        String docName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		
        final List<EgovMap> resultList = (List<EgovMap>) homeKorAdminAccountAccessSvc.selectLoginDataList(vo);
        ExcelView excelView = new ExcelView(new ExcelContents() {
			
			@Override
			public void ExcelContentsSet(Sheet sheet, Row row, Cell cell, CellStyle headStyle, CellStyle bodyStyle)
					throws Exception {
				// TODO Auto-generated method stub
				int rowCnt = 1;
				int index = 0;
				for(EgovMap innerMap : resultList) {
					int cellCnt = 0;
					
					String id = String.valueOf(innerMap.get("id"));
					String name = String.valueOf(innerMap.get("name"));
					String ip = String.valueOf(innerMap.get("ip"));
					String loginDate = String.valueOf(innerMap.get("loginDate"));
					
					String[] values = 
						{
								id,
								name,
								ip,
								loginDate,
						};
					
					row = sheet.createRow(rowCnt++);
					cell = row.createCell(cellCnt++);
					cell.setCellStyle(bodyStyle);
					cell.setCellValue(resultList.size() - index++);
					
					for(String value : values) {
						cell = row.createCell(cellCnt++);
						cell.setCellStyle(bodyStyle);
						cell.setCellValue(!value.equals("") && !value.equals("null") ?value :"-");
					}
				}
			}
		});
        
        Map<String, Object> excelMap = new HashMap<String, Object>();
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","ID","이름","IP","접속 일시"}));
        excelView.render(excelMap, request, response);
	}	
	
	
}
