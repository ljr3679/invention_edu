package cms.excel;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Workbook;

public interface ExcelCustomContents {
	
	public void ExcelContentsSet(Workbook workbook, CellStyle[] cellStyle) throws Exception;

}
