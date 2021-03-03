package com.main.cmmn.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

public class ExcelUtil {

	private HSSFWorkbook hWorkbook;
	private XSSFWorkbook xWorkbook;

	/**
	 * 엑셀 다운로드 해당 엑셀은 xls 파일을 읽어서 리스트로 만들어 준다.
	 * @param fis
	 * @return
	 * @throws IOException
	 */
	public List<List<String>> readXls(InputStream fis) throws IOException {

		hWorkbook = new HSSFWorkbook(fis);
		int rowindex = 0;
		int columnindex = 0;
		//시트 수 (첫번째에만 존재하므로 0을 준다)
		//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		HSSFSheet sheet = hWorkbook.getSheetAt(0);
		//행의 수
		int rows = sheet.getLastRowNum() + 1;
		List<List<String>> sheetList = new ArrayList<List<String>>();
		for (rowindex = 1; rowindex < rows; rowindex++) {
			//행을 읽는다
			List<String> rowList = new ArrayList<String>();
			HSSFRow row = sheet.getRow(rowindex);
			if (row != null) {
				//셀의 수
				int cells = row.getLastCellNum();
				for (columnindex = 0; columnindex <= cells; columnindex++) {
					//셀값을 읽는다
					HSSFCell cell = row.getCell(columnindex);
					String value = "";
					//셀이 빈값일경우를 위한 널체크
					if (cell == null) {
						//빈값도 갯수를 마추기위해 스킵하지 않기로 한다.
						//빈값은 null을 넣기로 한다.
						value = null;
						//continue;
					} else {

						//타입별로 내용 읽기

						switch (cell.getCellType()) {

							case HSSFCell.CELL_TYPE_FORMULA:

								value = cell.getCellFormula();

								break;

							case HSSFCell.CELL_TYPE_NUMERIC:
								if (HSSFDateUtil.isCellDateFormatted(cell)) {
									if (HSSFDateUtil.isADateFormat((int) cell.getNumericCellValue(), "dd:mmm:yyyy")) {
										DateFormat df = new SimpleDateFormat("HH:mm");
										String date = df.format(cell.getDateCellValue());
										value = date;
									}
								} else {
									value = Integer.parseInt(String.valueOf(Math.round(cell.getNumericCellValue()))) + "";
								}
								break;

							case HSSFCell.CELL_TYPE_STRING:
								value = cell.getStringCellValue() + "";
								break;
							case HSSFCell.CELL_TYPE_BLANK:
								value = cell.getBooleanCellValue() + "";
								break;
							case HSSFCell.CELL_TYPE_ERROR:
								value = cell.getErrorCellValue() + "";
								break;
						}
					}

					if(value != null && value.equals("false")){
						value = null;
					}
					//System.out.println("각 셀 내용 :"+value);
					rowList.add(value);
				}
				sheetList.add(rowList);

			}

		}
		return sheetList;
	}

	/**
	 * 엑셀 다운로드 해당 엑셀 내용은 xlsx로 만들어 준다.
	 * @param fis
	 * @return
	 * @throws IOException
	 */
	public List<List<String>> readXlsx(InputStream fis) throws IOException {

		xWorkbook = new XSSFWorkbook(fis);
		int rowindex = 0;
		int columnindex = 0;
		//시트 수 (첫번째에만 존재하므로 0을 준다)
		//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		XSSFSheet sheet = xWorkbook.getSheetAt(0);
		//행의 수
		//int rows = sheet.getPhysicalNumberOfRows();
		int rows = sheet.getLastRowNum() + 1;
		List<List<String>> sheetList = new ArrayList<List<String>>();
		for (rowindex = 1; rowindex < rows; rowindex++) {
			//행을읽는다
			XSSFRow row = sheet.getRow(rowindex);
			List<String> rowList = new ArrayList<String>();
			if (row != null) {
				//셀의 수
				//int cells = row.getPhysicalNumberOfCells();
				int cells = row.getLastCellNum();
				for (columnindex = 0; columnindex <= cells; columnindex++) {
					//셀값을 읽는다
					XSSFCell cell = row.getCell(columnindex);
					String value = "";
					//셀이 빈값일경우를 위한 널체크
					if (cell == null) {
						//빈값도 갯수를 마추기위해 스킵하지 않기로 한다.
						//빈값은 null을 넣기로 한다.
						value = null;
						//continue;

					} else {
						//타입별로 내용 읽기
						switch (cell.getCellType()) {
							case XSSFCell.CELL_TYPE_FORMULA:
								value = cell.getCellFormula();
								break;
							case XSSFCell.CELL_TYPE_NUMERIC:
								if (HSSFDateUtil.isCellDateFormatted(cell)) {
									if (HSSFDateUtil.isADateFormat((int) cell.getNumericCellValue(), "dd:mmm:yyyy")) {
										DateFormat df = new SimpleDateFormat("HH:mm");
										String date = df.format(cell.getDateCellValue());
										value = date;
									}
								} else {
									value = Integer.parseInt(String.valueOf(Math.round(cell.getNumericCellValue()))) + "";
								}
								break;
							case XSSFCell.CELL_TYPE_STRING:
								value = cell.getStringCellValue() + "";
								break;
							case XSSFCell.CELL_TYPE_BLANK:
								// 색깔있으면 빈값으로 측정 된다.
								value = cell.getBooleanCellValue() + "";
								break;
							case XSSFCell.CELL_TYPE_ERROR:
								value = cell.getErrorCellValue() + "";
								break;
						}

					}
					if(value != null && value.equals("false")){
						value = null;
					}
					rowList.add(value);
					//System.out.println(cell.getCellType() + "각 셀 내용 :" + value);
				}
				sheetList.add(rowList);
			}
		}
		return sheetList;
	}

	
	/**
	 * CVS 를 리스트로 만들어 준다. 구분자는 ,를 사용
	 * @param fis
	 * @return
	 * @throws IOException
	 */
	public List<List<String>> readCvs(InputStream fis) throws IOException {
		InputStreamReader isr = new InputStreamReader(fis);
		BufferedReader br = new BufferedReader(isr);

		String line=null;
		List<List<String>> sheetList = new ArrayList<List<String>>();
		List<String> rowList = new ArrayList<String>();
		while ((line = br.readLine()) != null) {
			String[] strs = line.split(",");
			if(strs.length < 6){
				return null;
			}
			for (String str : strs) {
				rowList.add(str);
			}
			sheetList.add(rowList);
		}
		return sheetList;
		
		
	}
	
	/**
	 * 타입 감지 사용하지 않음
	 * @param cell
	 */
	private void type(XSSFCell cell) {
		String value = "";
		//타입별로 내용 읽기
		switch (cell.getCellType()) {
			case XSSFCell.CELL_TYPE_FORMULA:
				value = cell.getCellFormula();
				break;
			case XSSFCell.CELL_TYPE_NUMERIC:
				//숫자 타입중에 날짜 타입이 존재 한다.
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					if (HSSFDateUtil.isADateFormat((int) cell.getNumericCellValue(), "dd:mmm:yyyy")) {
						DateFormat df = new SimpleDateFormat("HH:mm");
						String date = df.format(cell.getDateCellValue());
						value = date;
					}
				} else {
					value = Integer.parseInt(String.valueOf(Math.round(cell.getNumericCellValue()))) + "";
				}
				break;
			case XSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue() + "";
				break;
			case XSSFCell.CELL_TYPE_BLANK:
				value = cell.getBooleanCellValue() + "";
				break;
			case XSSFCell.CELL_TYPE_ERROR:
				value = cell.getErrorCellValue() + "";
				break;
		}
	}

	public void readXls(String filePath) throws IOException {
		FileInputStream fis = new FileInputStream(filePath);
		readXls(fis);
	}
	
	public List<List<String>> readFile(MultipartFile upload) throws IOException {
		String filePrefix = upload.getOriginalFilename().substring(upload.getOriginalFilename().lastIndexOf("."));
		if(filePrefix == null){
			return null;
		}else if(filePrefix.toLowerCase().indexOf("xlsx") > -1){
			return readXlsx(upload.getInputStream());
		}else if(filePrefix.toLowerCase().indexOf("xls") > -1){
			return readXls(upload.getInputStream());
		}else if(filePrefix.toLowerCase().indexOf("cvs") > -1){
			return readCvs(upload.getInputStream());
		}
		
		return null;
		
		
	}

	public static void main(String[] args) throws IOException {
		ExcelUtil util = new ExcelUtil();
		util.readXls("C:\\Users\\kim\\Desktop\\KBSN BIS 등록 자료3.16.xlsx");
	}
}
