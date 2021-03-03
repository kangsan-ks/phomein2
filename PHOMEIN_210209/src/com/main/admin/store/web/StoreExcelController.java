package com.main.admin.store.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;


import com.main.cmmn.util.AbstractExcelPOIView;

@Component("StoreExcelView")
public class StoreExcelController extends AbstractExcelPOIView {

	private String filename;
	
	private int rowNo = 0;
	private int totalCnt = 0;
	
	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}
	
	@Override
	protected String getDownloadFilename() {
		return this.filename;
	}
	
	@SuppressWarnings("unchecked")
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			List<Map> listData = (List<Map>) model.get("listData");

			XSSFSheet sheet = (XSSFSheet) workbook.createSheet();
			XSSFRow row = null;
			rowNo = 0;
			//XSSFRichTextString rt = null;
			XSSFFont fontRed = (XSSFFont) workbook.createFont();
			fontRed.setColor(Font.COLOR_RED);
			
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// 파일 이름 저장
			this.filename = "store_list" + sdf.format(d).replaceAll("-", "") + ".xlsx";

			// 컬럼 넓이 조정
			sheet.setColumnWidth(0, 3000); //오픈상태
			sheet.setColumnWidth(1, 9000); //매장명
			sheet.setColumnWidth(2, 4000);
			sheet.setColumnWidth(3, 15000);
			sheet.setColumnWidth(4, 6000);
			sheet.setColumnWidth(5, 6000);
			sheet.setColumnWidth(6, 6000);

			// 타이틀
			row = sheet.createRow(rowNo);
			row.setHeight((short) 500);
			row.createCell(0).setCellValue("오픈상태");
			row.createCell(1).setCellValue("매장명");
			row.createCell(2).setCellValue("우편번호");;
			row.createCell(3).setCellValue("주소");;
			row.createCell(4).setCellValue("전화번호");;
			row.createCell(5).setCellValue("등록일");;
			row.createCell(6).setCellValue("수정일");;
			// 셀 스타일
			setCustomCellStyle(row.getCell(0), "TITLE");
			setCustomCellStyle(row.getCell(1), "TITLE");
			setCustomCellStyle(row.getCell(2), "TITLE");
			setCustomCellStyle(row.getCell(3), "TITLE");
			setCustomCellStyle(row.getCell(4), "TITLE");
			setCustomCellStyle(row.getCell(5), "TITLE");
			setCustomCellStyle(row.getCell(6), "TITLE");
			// 타이틀 셀 병합
			//sheet.addMergedRegion(new CellRangeAddress(rowNo, rowNo, 0, 2));
			rowNo++;


			// 사용자 로그 리스트
			/*            
 			rowNo++;
            row = sheet.createRow(rowNo);
            row.createCell(0).setCellValue("구분");
            row.createCell(1).setCellValue("교육명");
            row.createCell(2).setCellValue("신청자");
            row.createCell(3).setCellValue("연락처");
            row.createCell(4).setCellValue("소속");
            setCustomCellStyle(row.getCell(0), "HEADER");
            setCustomCellStyle(row.getCell(1), "HEADER");
            setCustomCellStyle(row.getCell(2), "HEADER");
            setCustomCellStyle(row.getCell(3), "HEADER");
            setCustomCellStyle(row.getCell(4), "HEADER");
            rowNo++;
			 */
            for(Map list : listData) {
                row = sheet.createRow(rowNo);
                String Open = "";
                if( "Y".equals( (String)list.get("openstatus") ) ){
                	Open = "영업중";
                }else {
                	Open = "오픈예정 (" + (String) list.get("opendt") +")";
                }
                row.createCell(0).setCellValue(Open);
                row.createCell(1).setCellValue( (String)list.get("name") );
                row.createCell(2).setCellValue( (String)list.get("post") );
                row.createCell(3).setCellValue( (String)list.get("naddr") + (String)list.get("daddr") );
                row.createCell(4).setCellValue( (String)list.get("hp1") +"-"+(String)list.get("hp2") +"-"+(String)list.get("hp3") );
                row.createCell(5).setCellValue( sdf.format(list.get("regdt")) );
                System.out.println( "RD:" + sdf.format(list.get("regdt")) );
                String Dt = "";
                if( !"".equals( list.get("moddt") ) && list.get("moddt") != null ){
                	System.out.println( "MD:" + sdf.format(list.get("moddt")) );
                	Dt = sdf.format(list.get("moddt"));
        		}else{
        			Dt = "";
        		}
                row.createCell(6).setCellValue( Dt );

                setCustomCellStyle(row.getCell(0), "LIST_VALUE");
                setCustomCellStyle(row.getCell(1), "LIST_VALUE");
                setCustomCellStyle(row.getCell(2), "LIST_VALUE");
                setCustomCellStyle(row.getCell(3), "LIST_VALUE");
                setCustomCellStyle(row.getCell(4), "LIST_VALUE");
                setCustomCellStyle(row.getCell(5), "LIST_VALUE");
                setCustomCellStyle(row.getCell(6), "LIST_VALUE");
                rowNo++;
            }

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * setCellStyle 확장
	 */ 
	public void setCustomCellStyle(XSSFCell cell, String cellType) {
		
		if("TITLE".equals(cellType)) {
			setCellStyle(cell, VerticalAlignment.CENTER, HorizontalAlignment.LEFT
					, IndexedColors.GREY_50_PERCENT.getIndex(), BorderStyle.THIN
					, IndexedColors.WHITE.getIndex(), FillPatternType.SOLID_FOREGROUND);
		} else if("LEFT_LABEL".equals(cellType)) {
			setCellStyle(cell, VerticalAlignment.CENTER, HorizontalAlignment.LEFT
					, IndexedColors.GREY_50_PERCENT.getIndex(), BorderStyle.THIN
					, IndexedColors.GREY_25_PERCENT.getIndex(), FillPatternType.SOLID_FOREGROUND);
		} else if("RIGHT_VALUE".equals(cellType)) {
			setCellStyle(cell, VerticalAlignment.CENTER, HorizontalAlignment.RIGHT
					, IndexedColors.GREY_50_PERCENT.getIndex(), BorderStyle.THIN
					, IndexedColors.WHITE.getIndex(), FillPatternType.SOLID_FOREGROUND);
		} else if("HEADER".equals(cellType)) {
			setCellStyle(cell, VerticalAlignment.CENTER, HorizontalAlignment.CENTER
					, IndexedColors.GREY_50_PERCENT.getIndex(), BorderStyle.THIN
					, IndexedColors.GREY_25_PERCENT.getIndex(), FillPatternType.SOLID_FOREGROUND);
		} else if("LIST_VALUE".equals(cellType)) {
			setCellStyle(cell, VerticalAlignment.CENTER, HorizontalAlignment.CENTER
					, IndexedColors.GREY_50_PERCENT.getIndex(), BorderStyle.THIN
					, IndexedColors.WHITE.getIndex(), FillPatternType.SOLID_FOREGROUND);
		}
		
	}
	
	/*
	 * 셀 스타일 설정
	 * 파라미터 ex)
	 * vAlign : VerticalAlignment.CENTER
	 * hAlign : HorizontalAlignment.LEFT, HorizontalAlignment.CENTER, HorizontalAlignment.RIGHT
	 * borderColor : IndexedColors.GREY_50_PERCENT.getIndex()
	 * borderPattern : BorderStyle.THIN
	 * bgColor : IndexedColors.GREY_25_PERCENT.getIndex()
	 * bgPattern : FillPatternType.SOLID_FOREGROUND
	 */
	
	public void setCellStyle(XSSFCell cell, VerticalAlignment vAlign, HorizontalAlignment hAlign
			, short borderColor, BorderStyle borderPattern
			, short bgColor, FillPatternType bgPattern) {
		Map<String, Object> cellStyle = new HashMap<String, Object>();
		cellStyle.put(CellUtil.VERTICAL_ALIGNMENT, vAlign);
		cellStyle.put(CellUtil.ALIGNMENT, hAlign);
		cellStyle.put(CellUtil.BORDER_TOP, borderPattern);
		cellStyle.put(CellUtil.BORDER_LEFT, borderPattern);
		cellStyle.put(CellUtil.BORDER_RIGHT, borderPattern);
		cellStyle.put(CellUtil.BORDER_BOTTOM, borderPattern);
		cellStyle.put(CellUtil.TOP_BORDER_COLOR, borderColor);
		cellStyle.put(CellUtil.LEFT_BORDER_COLOR, borderColor);
		cellStyle.put(CellUtil.RIGHT_BORDER_COLOR, borderColor);
		cellStyle.put(CellUtil.BOTTOM_BORDER_COLOR, borderColor);
		cellStyle.put(CellUtil.FILL_FOREGROUND_COLOR, bgColor);
		cellStyle.put(CellUtil.FILL_PATTERN, bgPattern);
		CellUtil.setCellStyleProperties(cell, cellStyle);
	}
}
