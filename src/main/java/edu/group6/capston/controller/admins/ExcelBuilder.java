package edu.group6.capston.controller.admins;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import edu.group6.capston.dtos.LocationDTO2;

public class ExcelBuilder extends AbstractXlsView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<Integer> listYear = (List<Integer>) model.get("listYear");
		for (Integer year : listYear) {
			// get data model which is passed by the Spring container
			List<LocationDTO2> listLocations = (List<LocationDTO2>) model.get("listOrderGroupByLocationId" + year);

			// create a new Excel sheet
			Sheet sheet = workbook.createSheet("Năm " + year);
			sheet.setDefaultColumnWidth(30); // create style for header cells
			CellStyle style = workbook.createCellStyle();
			Font font = workbook.createFont();
			font.setFontName("Arial");
			style.setFillForegroundColor(HSSFColor.GREEN.index);
			style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			font.setBold(true);
			font.setColor(HSSFColor.YELLOW.index);
			style.setFont(font); // create header row
			Row header = sheet.createRow(0);
			header.createCell(0).setCellValue("TÊN ĐỊA ĐIỂM");
			header.getCell(0).setCellStyle(style);
			header.createCell(1).setCellValue("ĐỊA CHỈ");
			header.getCell(1).setCellStyle(style);
			header.createCell(2).setCellValue("TỔNG ĐƠN");
			header.getCell(2).setCellStyle(style);
			header.createCell(3).setCellValue("TỔNG DOANH THU");
			header.getCell(3).setCellStyle(style);
			header.createCell(4).setCellValue("TỔNG PHÍ SHIP");
			header.getCell(4).setCellStyle(style);
			int rowCount = 1;
			for (LocationDTO2 obj : listLocations) {
				Row aRow = sheet.createRow(rowCount++);
				aRow.createCell(0).setCellValue(obj.getLocationName());
				aRow.createCell(1).setCellValue(obj.getAddress());
				aRow.createCell(2).setCellValue(obj.getTotalOrder());
				aRow.createCell(3).setCellValue(obj.getTotalPrice());
				aRow.createCell(4).setCellValue(obj.getTotalShip());
			}
		}
		
	}
}
