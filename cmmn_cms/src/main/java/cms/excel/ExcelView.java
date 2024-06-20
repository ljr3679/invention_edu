package cms.excel;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelView extends AbstractExcelPOIView {
	
	private ExcelContents excelContents;
	
	private ExcelCustomContents excelCustomContents;
	
	public ExcelView(ExcelContents excelContents) {
		this.excelContents = excelContents;
	}
	
	public ExcelView(ExcelCustomContents excelCustomContents) {
		this.excelCustomContents = excelCustomContents;
	}
	 
    @Override
    protected void buildExcelDocument(Map<String, Object> excelMap, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        // Sheet 생성
    	if(excelContents != null) {
    		Sheet sheet = workbook.createSheet("sheet1");
            Row row = null;
            Cell cell = null;
            int rowCount = 0;
            int cellCount = 0;
     
            // 첫번째 로우 폰트 설정
            Font headFont = workbook.createFont();
            headFont.setFontHeightInPoints((short) 11);
            headFont.setFontName("돋움");
            headFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
     
            // 첫번째 로우 셀 스타일 설정
            CellStyle headStyle = workbook.createCellStyle();
            headStyle.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
            headStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
            headStyle.setAlignment(CellStyle.ALIGN_CENTER);
            headStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            headStyle.setFont(headFont);
            headStyle.setBorderBottom(CellStyle.BORDER_THIN);
            headStyle.setBorderLeft(CellStyle.BORDER_THIN);
            headStyle.setBorderRight(CellStyle.BORDER_THIN);
            headStyle.setBorderTop(CellStyle.BORDER_THIN);
     
            // 바디 폰트 설정
            Font bodyFont = workbook.createFont();
            bodyFont.setFontHeightInPoints((short) 9);
            bodyFont.setFontName("돋움");
     
            // 바디 스타일 설정
            CellStyle bodyStyle = workbook.createCellStyle();
            bodyStyle.setFont(bodyFont);
            bodyStyle.setWrapText(true);
            bodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
            bodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            bodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
            bodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
            bodyStyle.setBorderRight(CellStyle.BORDER_THIN);
            bodyStyle.setBorderTop(CellStyle.BORDER_THIN);
     
            CellStyle bodyStyleAlign = workbook.createCellStyle();
            bodyStyleAlign.setFont(bodyFont);
            bodyStyleAlign.setWrapText(true);
            bodyStyleAlign.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            bodyStyleAlign.setBorderBottom(CellStyle.BORDER_THIN);
            bodyStyleAlign.setBorderLeft(CellStyle.BORDER_THIN);
            bodyStyleAlign.setBorderRight(CellStyle.BORDER_THIN);
            bodyStyleAlign.setBorderTop(CellStyle.BORDER_THIN);
            bodyStyleAlign.setAlignment(CellStyle.ALIGN_CENTER);
     
            // 제목 셀 생성
            if(!excelMap.containsKey("custom")) {
            	List<String> excel_th = (List<String>) excelMap.get("excel_th");
            	row = sheet.createRow(rowCount);
            	
                for(String th : excel_th) {
                	cell = row.createCell(cellCount++);
                	cell.setCellStyle(headStyle);
                    cell.setCellValue(th);
                }
             // 바디 셀에 데이터 입력, 스타일 적용
                excelContents.ExcelContentsSet(sheet, row, cell, headStyle, bodyStyle);
                
                // 셀 와이드 설정
                for (int i = 0; i < excel_th.size(); i++){
                    sheet.autoSizeColumn(i, true);
//                    if(i == 1){
//                        sheet.setColumnWidth(i, 8000);
//                    }
                }
            } else excelContents.ExcelContentsSet(sheet, row, cell, headStyle, bodyStyle);
    	} else excelCustomContents.ExcelContentsSet(workbook, excelSheetSet(workbook));
    }
    
    private CellStyle[] excelSheetSet(Workbook workbook) throws Exception {
    	CellStyle[] returnData = new CellStyle[6];
		// 첫번째 로우 폰트 설정
        Font headFont = workbook.createFont();
        headFont.setFontHeightInPoints((short) 11);
        headFont.setFontName("돋움");
        headFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
 
        // 첫번째 로우 셀 스타일 설정
        CellStyle headStyle = workbook.createCellStyle();
        headStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
        headStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        headStyle.setAlignment(CellStyle.ALIGN_CENTER);
        headStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        headStyle.setFont(headFont);
        headStyle.setBorderBottom(CellStyle.BORDER_THIN);
        headStyle.setBorderLeft(CellStyle.BORDER_THIN);
        headStyle.setBorderRight(CellStyle.BORDER_THIN);
        headStyle.setBorderTop(CellStyle.BORDER_THIN);
        headStyle.setWrapText(true);
        
        Font headFont2 = workbook.createFont();
        headFont2.setFontHeightInPoints((short) 11);
        headFont2.setFontName("돋움");
        headFont2.setBoldweight(Font.BOLDWEIGHT_BOLD);
        headFont2.setColor(Font.COLOR_RED);
        
        CellStyle headStyle2 = workbook.createCellStyle();
        headStyle2.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
        headStyle2.setFillPattern(CellStyle.SOLID_FOREGROUND);
        headStyle2.setAlignment(CellStyle.ALIGN_CENTER);
        headStyle2.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        headStyle2.setFont(headFont2);
        headStyle2.setBorderBottom(CellStyle.BORDER_THIN);
        headStyle2.setBorderLeft(CellStyle.BORDER_THIN);
        headStyle2.setBorderRight(CellStyle.BORDER_THIN);
        headStyle2.setBorderTop(CellStyle.BORDER_THIN);
 
        // 바디 폰트 설정
        Font bodyFont = workbook.createFont();
        bodyFont.setFontHeightInPoints((short) 9);
        bodyFont.setFontName("돋움");
 
        // 바디 스타일 설정
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setFont(bodyFont);
        bodyStyle.setWrapText(true);
        bodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
        bodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        bodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
        bodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
        bodyStyle.setBorderRight(CellStyle.BORDER_THIN);
        bodyStyle.setBorderTop(CellStyle.BORDER_THIN);
 
        /** 아래 선없음 중앙 정렬 */
        CellStyle custom1Style = workbook.createCellStyle();
        custom1Style.setFont(bodyFont);
        custom1Style.setWrapText(true);
        custom1Style.setAlignment(CellStyle.ALIGN_CENTER);
        custom1Style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        custom1Style.setBorderBottom(CellStyle.BORDER_NONE);
        custom1Style.setBorderLeft(CellStyle.BORDER_THIN);
        custom1Style.setBorderRight(CellStyle.BORDER_THIN);
        custom1Style.setBorderTop(CellStyle.BORDER_THIN);
        /** 아래 선없음 중앙 정렬 */
        
        /** 위 아래 선없음 오른쪽 정렬 */
        CellStyle custom2Style = workbook.createCellStyle();
        custom2Style.setFont(bodyFont);
        custom2Style.setWrapText(true);
        custom2Style.setAlignment(CellStyle.ALIGN_RIGHT);
        custom2Style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        custom2Style.setBorderBottom(CellStyle.BORDER_NONE);
        custom2Style.setBorderLeft(CellStyle.BORDER_THIN);
        custom2Style.setBorderRight(CellStyle.BORDER_THIN);
        custom2Style.setBorderTop(CellStyle.BORDER_NONE);
        /** 위 아래 선없음 오른쪽 정렬 */
        
        /** 위 선없음 오른쪽 정렬 */
        CellStyle custom3Style = workbook.createCellStyle();
        custom3Style.setFont(bodyFont);
        custom3Style.setWrapText(true);
        custom3Style.setAlignment(CellStyle.ALIGN_RIGHT);
        custom3Style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        custom3Style.setBorderBottom(CellStyle.BORDER_THIN);
        custom3Style.setBorderLeft(CellStyle.BORDER_THIN);
        custom3Style.setBorderRight(CellStyle.BORDER_THIN);
        custom3Style.setBorderTop(CellStyle.BORDER_NONE);
        /** 위 선없음 오른쪽 정렬 */
        
        returnData[0] = headStyle;
        returnData[1] = headStyle2;
        returnData[2] = bodyStyle;
        returnData[3] = custom1Style;
        returnData[4] = custom2Style;
        returnData[5] = custom3Style;
        
        return returnData;
	}
 
    @Override
    protected Workbook createWorkbook() {
        return new XSSFWorkbook();
    }
 
}