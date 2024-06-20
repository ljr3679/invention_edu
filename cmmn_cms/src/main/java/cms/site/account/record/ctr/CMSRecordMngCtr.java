package cms.site.account.record.ctr;

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
import org.springframework.web.bind.annotation.ResponseBody;

import cms.cmmn.CommonVO;
import cms.constant.Const;
import cms.excel.ExcelContents;
import cms.excel.ExcelView;
import cms.mapping.CMSMappingHandler;
import cms.mapping.PagingDataInterface;
import cms.site.account.record.svc.CMSRecordMngSvc;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/account/record/")
public class CMSRecordMngCtr extends CMSMappingHandler {
	
	@Resource(name="CMSRecordMngSvc")
	private CMSRecordMngSvc CMSRecordMngSvc; 
	
	@RequestMapping(value="recordMng.do")
	public void index(
			@ModelAttribute("commonVO") CommonVO vo,
			HttpServletRequest request,
			ModelMap model
			) throws Exception {
		
		setPaging(vo, model, new PagingDataInterface() {
			
			@Override
			public Object[] callData() throws Exception {
				vo.setPagingAt("Y");
				List<?> resultList = CMSRecordMngSvc.selectRecordDataList(vo);
				int totalCnt = CMSRecordMngSvc.selectRecordDataListCnt(vo);
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
		
		vo.setTitle("관리자 이력 로그 엑셀 다운로드");
		CMSRecordMngSvc.downloadCMSRecord(vo);
		
		String title = "CMS-관리자 [이력 로그 관리]";
		
        String docName = URLEncoder.encode(title, "UTF-8").replaceAll("\\+", "%20");
        response.setHeader("Content-Disposition", "attachment;filename=" + docName + ".xlsx");
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
		
        final List<EgovMap> resultList = (List<EgovMap>) CMSRecordMngSvc.selectRecordDataList(vo);
        ExcelView excelView = new ExcelView(new ExcelContents() {
			
			@Override
			public void ExcelContentsSet(Sheet sheet, Row row, Cell cell, CellStyle headStyle, CellStyle bodyStyle)
					throws Exception {
				// TODO Auto-generated method stub
				int rowCnt = 1;
				int index = 0;
				for(EgovMap innerMap : resultList) {
					int cellCnt = 0;
					
					String menu = String.valueOf(innerMap.get("menu"));
					String title = String.valueOf(innerMap.get("title"));
					String workCode = String.valueOf(innerMap.get("workCode"));
					String downReason = String.valueOf(innerMap.get("downReason"));
					String workId = String.valueOf(innerMap.get("workId"));
					String workName = String.valueOf(innerMap.get("workName"));
					String performDate = String.valueOf(innerMap.get("performDate"));
					String ip = String.valueOf(innerMap.get("ip"));
					String loginDate = String.valueOf(innerMap.get("loginDate"));
					
					String[] values = 
						{
								menu,
								title,
								workCode.equals("I") ?"등록" :workCode.equals("U") ?"수정" :workCode.equals("D") ?"삭제" :workCode.equals("E") ?"다운로드" :"",
								downReason,
								workId,
								workName,
								performDate,
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
		excelMap.put("excel_th", Arrays.asList(new String[]{"No","작업 메뉴","작업 명","작업","다운로드 사유","작업자(ID)","작업자(이름)","작업 일시","접속 IP","접속 일시"}));
        excelView.render(excelMap, request, response);
	}

}
