package cms.excel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public interface ExcelContents {

	public void ExcelContentsSet(Sheet sheet, Row row, Cell cell, CellStyle headStyle, CellStyle bodyStyle) throws Exception;
}
