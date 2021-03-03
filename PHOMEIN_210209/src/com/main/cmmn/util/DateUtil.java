package com.main.cmmn.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;


public class DateUtil {
    // 요일상수
    public final static int SUN = 1;
    public final static int MON = 2;
    public final static int TUE = 3;
    public final static int WEN = 4;
    public final static int THU = 5;
    public final static int FRI = 6;
    public final static int SAT = 7;
    public final static int HOLIDAY = 9;

    // 월별 마지막일자
    public final static int[] endDay = {
                                           31, 28, 31, 30, 31, 30, 31, 31, 30,
                                           31, 30, 31
                                       };
    private static final String[] day = { "일", "월", "화", "수", "목", "금", "토" };

    
	/**
	 * YYYYMMDD 형식의 날짜 String을 Calendar의 형식으로 변환
	 *
	 * @param date_Y4MD 날짜
	 * @return calendar
	 */
	public static Calendar getCalendar(String date)
	{
		Calendar calendar = Calendar.getInstance();
		long iDate = 0;

		try
		{
			iDate = Long.parseLong(date);
		}
		catch(Exception e){}

		int year = (int)(iDate / 10000L);
		int month = (int)((iDate % 10000L) / 100);
		int day = (int)(iDate % 100);
		calendar.set(year, month - 1, day);

		return calendar;
	}    
    
	
	
	
	
	
	
    /**
     * 포맷에 따라 해당 날짜 등을 가져온다.
     * @author Administrator
     * @param format(yyyy, MM, dd, hh, mm, ss, SSS)
     * @return
     * @date   2007. 05. 17
     */
    public static String getDate(String format) {
        SimpleDateFormat sfmt = new SimpleDateFormat(format);

        return sfmt.format(new Date());
    }
    
    /**
     * 기본적인 날짜 문자열을 가져온다.(yyyy-MM-dd)
     * @author Administrator
     * @return
     * @date   2007. 05. 17
     */
    public static String getDate() {
        return getDate("yyyy-MM-dd");
    }    
    
    
    /**
     * 기본적인 날짜 문자열을 가져온다.(yyyy-MM-dd)
     * @author Administrator
     * @return
     * @date   2007. 05. 17
     */
    public static String getDateTime() {
    	return getDate("yyyy-MM-dd hh:mm:ss");
    }    
    
    /**
     * 기본적인 시간 문자열을 가져온다.(hh:MM:ss)
     * @author Administrator
     * @return
     * @date   2007. 05. 17
     */
    public static String getTime() {
        return getDate("hh:mm:ss");
    }      
    
    public static String getHour() {
    	return getDate("hh");
    }      
    
    public static String getMinute() {
    	return getDate("mm");
    }      
    
    
    /**
     * 날짜에 해당하는 요일을 구함
     *
     * @param date 날짜
     * @return 1:일요일, 2:월요일, ... , 7:토요일
     */
    public static int getDayOfWeekNo(String date) {
        return getCalendar(date).get(Calendar.DAY_OF_WEEK);
    }
    
    /**
     * 날짜에 해당하는 요일을 구함
     *
     * @param date 날짜
     * @return 1:일요일, 2:월요일, ... , 7:토요일
     */
    public static String getDayOfWeek(String date) {
    	
    	int dayNo = getDayOfWeekNo(date);
    	
    	String week = day[dayNo];
    	
    	return week;
    }

	/**	
	 * 지정된 날짜에서 지정된 일 수 만큼 더하거나 뺀 날짜(Date) 를 반환한다.
	 * 
	 * @param strDate 날짜 (예: 2004-03-15,  2004-03-15 12:45:59)
	 * @param int 더하거나 빼고자 하는 일 수 
	 * @return 지정된 날짜에서 지정된 일 수 만큼 더하거나 뺀 날짜(Date) Object
	 * @exception Exception
	 */	
    public static Date dateDiff(String strDate, int days) throws Exception {
		SimpleDateFormat sdf = null;
		Calendar calendar = new GregorianCalendar();
		Date date = null;
		
		int year = 0;
		int month = 0;
		int day = 0;
		int hour = 0;
		int minute = 0;
		int second = 0;		
		
		String deli = "";
		
		//포맷 delimeter가 무엇인지를 파악
		if(strDate.indexOf(".")>-1) {
			deli = ".";
		} else if(strDate.indexOf("-")>-1) {
			deli = "-";
		}		
		
		strDate = DateUtil.getParseDateString(strDate, "-");
		
		if(strDate.length() == 10 ) {
			sdf = new SimpleDateFormat("yyyy-MM-dd", java.util.Locale.KOREA);
		} else {
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", java.util.Locale.KOREA);
		}
				
		try {
			Date tmpDate = sdf.parse(strDate);
		} catch(Exception e) {
			throw new Exception(e.getMessage());
		}	
				
		try {
			year = Integer.parseInt(strDate.substring(0,4));
			month = Integer.parseInt(strDate.substring(5,7));
			day = Integer.parseInt(strDate.substring(8,10));
			hour = Integer.parseInt(strDate.substring(11,13));
			minute = Integer.parseInt(strDate.substring(14,16));
			second = Integer.parseInt(strDate.substring(17,19));			
			
		} catch(Exception e) {
					
			hour = 0;
			minute = 0;
			second = 0;
			//	throw new Exception(e.getMessage()+"Here");	
		}		
		
		calendar.set(year, month-1, day + days, hour, minute, second);		

		try {			
			date = calendar.getTime();
		}catch(Exception e) {}							
		
		return date;    	
    }
    
	/**
	 * 입력한 날짜(형식 yyyy-MM-dd)기준으로 +,- 일 후의 날짜를 표시한다.
	 *
	 * @param strDate 기준날짜.(null일 경우 오늘 날짜가 된다.)
	 * @param days   증가,또는 감소한 일
	 * @param format  결과 출력 날짜 포멧
	 * @return  +,- 일 후의 날짜를 표시하는 문자열.
	 * @exception Exception
	 */
	public static String dateDiff(String strDate, int days, String format) throws Exception
	{
		Date dt = dateDiff(strDate, days);
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String sDateNTime = sdf.format(dt);

		return sDateNTime;
	}
    
	/**
	 * sDateNTimeForm 형식의 현재 시각 문자열을 얻는다.
	 * @param sDateNTimeForm 현재시각 Formatting 문자열(년도:yyyy 월:MM 일:dd 시:HH 분:mm 초:ss)<br>
	 * example - yyyyMMddHHmmss, yyyy년 MM월 dd일 HH시 mm분 ss초
	 * @return 현재 시간 문자열
	 */
	public static String getDateNTimeByForm(String sDateNTimeForm)
	{
		Calendar Today = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(sDateNTimeForm);
		String sDateNTime = sdf.format(Today.getTime() );

		return sDateNTime;
	}
    

    /**
     * 해당월의 마지막 일자 얻음
     * @param year 연도
     * @param month 월
     * @return 마지막 일자
     * @author Sungju Kang(sonaki@kftc.or.kr)
     * @since 2004-03-10
     */
    public static int getLastDayOfMonth(int year,
                                        int month) {
        if (month == 2) {
            if ((((year % 4) == 0) && ((year % 100) != 0)) ||
                    ((year % 400) == 0)) {
                return 29;
            } else {
                return 28;
            }
        } else {
            return endDay[month - 1];
        }
    }

    /**
     * 해당월의 마지막 일자 얻음
     * @param date_Y4M 일자(YYYYMM)
     * @return 마지막 일자
     * @author Sungju Kang(sonaki@kftc.or.kr)
     * @since 2004-03-10
     */
    public static int getLastDayOfMonth(String dateY4M) {
        return getLastDayOfMonth(Integer.parseInt(dateY4M.substring(0, 4)),
                                 Integer.parseInt(dateY4M.substring(4, 6)));
    }

    
    
    
    
    /**
     * SimpleDateFormat 을 얻음(한국기준)
     * @param datePattern pattern
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDateFormat(String datePattern) {
        SimpleDateFormat format = new SimpleDateFormat(datePattern,
                                                       new Locale("ko", "KOREA"));

        return format;
    }

    public static SimpleDateFormat getDateFormat() {
        return getDateFormat("yyyy-MM-dd");
    }

    public static SimpleDateFormat getDateTimeFormat() {
        return getDateFormat("yyyy-MM-dd HH:mm:ss");
    }

    public static SimpleDateFormat getDateTimeMilliFormat() {
        return getDateFormat("yyyy-MM-dd HH:mm:ss SSS");
    }

    public static SimpleDateFormat getTimeFormat() {
        return getDateFormat("HH:mm:ss");
    }

    public static SimpleDateFormat getTimeMilliFormat() {
        return getDateFormat("HH:mm:ss SSS");
    }

    
    
    
    /**
     *
     * For example, String time = DateTime.getFormatString("yyyy-MM-dd HH:mm:ss");
     *
     * @param java.lang.String pattern  "yyyy, MM, dd, HH, mm, ss and more"
     * @return formatted string representation of current day and time with  your pattern.
     */
    public static int getNumberByPattern(String pattern) {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(pattern,
                                                                              java.util.Locale.KOREA);
        String dateString = formatter.format(new java.util.Date());

        return Integer.parseInt(dateString);
    }

    /**
     * 현재날짜의 년도를 구하는 Method
     *
     * @param
     * @exception
     * @author
     */
    public static int getYear() {
        return getNumberByPattern("yyyy");
    }

    /**
     * 현재날짜의 월을 구하는 Method
     *
     * @param
     * @exception
     * @author
     */
    public static int getMonth() {
        return getNumberByPattern("MM");
    }

    /**
    * 현재날짜의 일자를 구하는 Method
    *
    * @param
    * @exception
    * @author
    */
    public static int getDay() {
        return getNumberByPattern("dd");
    }

    /**
    * 주중 요일을 구하는 Method
    *
    * @param
    * @exception
    * @author
    */
    public static String getDayOfWeek() {
        Calendar c = Calendar.getInstance();

        return day[c.get(java.util.Calendar.DAY_OF_WEEK) - 1];
    }

    /**
     * 입력된 문자열을 특정 패턴으로 변환하여 리턴
     * 
     * @param dateTime
     * @param pattern
     * @return
     * @date   2007. 05. 18
     */
    public static String getParseDateString(String dateTime,
                                            String pattern) {
        if (dateTime != null && !"".equals(dateTime)) {
        	
        	dateTime = dateTime.replaceAll("[.]", "");
        	dateTime = dateTime.replaceAll("[-]", "");
        	dateTime = dateTime.replaceAll("[/]", "");
        	
        	if(dateTime.length()>=8) {
                String year = dateTime.substring(0, 4);
                String month = dateTime.substring(4, 6);
                String day = dateTime.substring(6, 8);

                return year + pattern + month + pattern + day;        		
        	} else {
        		return "";
        	}
        } else {
            return "";
        }
    }

    /**
       * 주어진 년도가 윤년인지를 구하는 Method
       *
       * @param int year
       * @exception
       * @author
       */
    public static boolean checkEmbolism(int year) {
        int remain = 0;
        int remain_1 = 0;
        int remain_2 = 0;

        remain = year % 4;
        remain_1 = year % 100;
        remain_2 = year % 400;

        // the ramain is 0 when year is divided by 4;
        if (remain == 0) {
            // the ramain is 0 when year is divided by 100;
            if (remain_1 == 0) {
                // the remain is 0 when year is divided by 400;
                if (remain_2 == 0) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        }

        return false;
    }

    /**
     * 주어진 년,월의 일수를 구하는 Method
     *
     * @param    String year, String month
     * @exception
     * @author
     */
    public static int getMonthDate(String year,
                                   String month) {
        int[] dateMonth = new int[12];

        dateMonth[0] = 31;
        dateMonth[1] = 28;
        dateMonth[2] = 31;
        dateMonth[3] = 30;
        dateMonth[4] = 31;
        dateMonth[5] = 30;
        dateMonth[6] = 31;
        dateMonth[7] = 31;
        dateMonth[8] = 30;
        dateMonth[9] = 31;
        dateMonth[10] = 30;
        dateMonth[11] = 31;

        if (checkEmbolism(Integer.parseInt(year))) {
            dateMonth[1] = 29;
        }

        int day = dateMonth[Integer.parseInt(month) - 1];

        return day;
    }

	
	/**
	 * 오늘날짜부터 입력 받은 Days 이후 날짜 반환
	 * @param addDays
	 * @return
	 */
	 public static String getAddDate(int addDays) {
			String sTt = "";
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, +addDays);
			String y_year = String.valueOf(cal.get(Calendar.YEAR));
			String y_month = String.valueOf(cal.get(Calendar.MONTH) + 1);
			String y_date = String.valueOf(cal.get(Calendar.DATE));

			if (y_month.length() == 1)
				y_month = "0" + y_month; // month 3 => 03
			if (y_date.length() == 1)
				y_date = "0" + y_date; // day 7=> 07

			sTt = y_year + "-" + y_month + "-" + y_date;
			return sTt;
	 }
	 
	/**
	 * 오늘 날짜가 아닌 입력 받은 날짜로 간격
	 * 
	 * @param date
	 *            입력 : format 20080101
	 * @param period
	 *            1, 2 (일)
	 * @return
	 */
	public static boolean BetweenDay(String date, int period) {

		java.util.Date yymmdd = new java.util.Date();

		SimpleDateFormat myformat = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat InputDateformat = new SimpleDateFormat("yyyyMMdd");

		try {

			String curdate = myformat.format(yymmdd);

			if (Integer.parseInt(curdate) >= Integer.parseInt(date) + period) {
				return true;
			}
		} catch (Exception e) {

		}

		return false;

	}

	/**
	 * 오늘 기준 1년 전 날짜 가져오기
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String get1yearAgo() {
		String sTt = "";
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -1);
		String y_year = String.valueOf(cal.get(Calendar.YEAR));
		String y_month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		String y_date = String.valueOf(cal.get(Calendar.DATE));

		if (y_month.length() == 1)
			y_month = "0" + y_month; // month 3 => 03
		if (y_date.length() == 1)
			y_date = "0" + y_date; // day 7=> 07

		sTt = y_year + "-" + y_month + "-" + y_date;
		return sTt;
	}

	/**
	 * 오늘 기준 전 날짜 가져오기
	 * 
	 * @param year
	 * @param month
	 * @param date
	 * @param format
	 * @return
	 */
	public static String getDateAgo(int year, int month, int date) {
		String sTt = "";
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, date);
		String y_year = String.valueOf(cal.get(Calendar.YEAR));
		String y_month = String.valueOf(cal.get(Calendar.MONTH) + 1);
		String y_date = String.valueOf(cal.get(Calendar.DATE));

		if (y_month.length() == 1)
			y_month = "0" + y_month; // month 3 => 03
		if (y_date.length() == 1)
			y_date = "0" + y_date; // day 7=> 07

		sTt = y_year + y_month + y_date;
		return sTt;
	}

	/**
	 * date를 String으로 변환하여 반환
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String getConvertToString(Date date, String format) {
		SimpleDateFormat myformat = new SimpleDateFormat(format);
		String result = "";

		if (date != null) {
			result = myformat.format(date);
		}
		return result;
	}

	/**
	 * 날짜를 입력받아 포멧 변경후 리턴 yyyy.MM.dd HH:mm:ss
	 * 
	 * @param date
	 * @param format
	 * @return
	 */
	public static String getDateByFormat(Date date, String format) {
		String dd = "";
		try {
			try {
				if (date == null)
					return "";
			} catch (Exception e) {
				return "";
			}

			try {
				if (format == null)
					format = "yyyyMMdd";
			} catch (Exception e) {
				format = "yyyy-MM-dd";
			}
			SimpleDateFormat myformat = new SimpleDateFormat(format);

			dd = myformat.format(date);

		} catch (Exception e) {
		}
		return dd;

	}

	/**
	 * 특수한 경우 00/00/00 으로 리턴 스트링타입
	 * 
	 * @param format
	 * @return
	 */
	public static String getStringDateFormat(String date) {
		String d = "";

		if (!CommonUtil.nvl(date, "").equals("")) {
			d = date;
			d = date.substring(2, d.length());
			d = d.replace("/", ".");
		}

		return d;

	}

	/**
	 * 입력받은 포멧 형태의 현재시각 가져오기 : yyyy MM dd HH mm ss SSS
	 * 
	 * @param format
	 * @return
	 */
	public static String getCurrentDT(String format) {
		String datetime = "";
		try {
			Calendar calendar = Calendar.getInstance();

			SimpleDateFormat sdf = new SimpleDateFormat(format);
			datetime = sdf.format(calendar.getTime());

		} catch (Exception e) {
		}
		return datetime;
	}

	/**
	 * 두 날짜 사이의 차이
	 * 
	 * @param startDate
	 *            시작 날짜
	 * @param endDate
	 *            종료 날짜
	 * @param format
	 *            날짜 형식
	 * @return long 날짜 차이
	 */
	public static long day2Day(String startDate, String endDate, String format)
			throws Exception {
		if (format == null)
			format = "yyyy-MM-dd HH:mm:ss.SSS";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date sDate;
		Date eDate;
		long day2day = 0;
		try {
			sDate = sdf.parse(startDate);
			eDate = sdf.parse(endDate);
			
			day2day = (eDate.getTime() - sDate.getTime())
					/ (1000 * 60 * 60 * 24);

		} catch (Exception e) {
			throw new Exception("wrong format string");
		}

		return day2day;
	}

	public static long day2Day(String endDate, String format) throws Exception {
		if (format == null)
			format = "yyyy-MM-dd HH:mm:ss.SSS";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date sDate;
		Date eDate;
		long day2day = 0;
		try {
			sDate = sdf.parse(getCurrentDT(format));
			eDate = sdf.parse(endDate);

			// 12408 4950 0000 / 12409 1376 0000

			day2day = (eDate.getTime() - sDate.getTime())
					/ (1000 * 60 * 60 * 24);

			// 1일 (1000 * 60 * 60 * 24)

		} catch (Exception e) {
			throw new Exception("wrong format string");
		}

		return day2day;
	}

	/**
	 * 몇 시간차이인지
	 * 
	 * @param endDate
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static long day2Dayhour(String endDate, String format)
			throws Exception {
		if (format == null)
			format = "yyyy-MM-dd HH:mm:ss.SSS";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date sDate;
		Date eDate;
		long day2day = 0;
		try {
			sDate = sdf.parse(getCurrentDT(format));
			eDate = sdf.parse(endDate);

			day2day = (eDate.getTime() - sDate.getTime()) / (1000 * 60 * 60);

		} catch (Exception e) {
			throw new Exception("wrong format string");
		}

		return day2day;
	}

	/**
	 * 몇 분차이인지
	 * 
	 * @param endDate
	 * @param format
	 * @return
	 * @throws Exception
	 */
	public static long day2DayMinute(String endDate, String format)
			throws Exception {
		if (format == null)
			format = "yyyy-MM-dd HH:mm:ss.SSS";
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date sDate;
		Date eDate;
		long day2day = 0;
		try {
			sDate = sdf.parse(getCurrentDT(format));
			eDate = sdf.parse(endDate);

			day2day = (eDate.getTime() - sDate.getTime()) / (1000 * 60);

		} catch (Exception e) {
			throw new Exception("wrong format string");
		}

		return day2day;
	}

	/**
	 * String to Date
	 * 
	 * @param str
	 * @param format
	 * @return
	 */
	public static Date stringToDate(String str, String format) {
		if (format == null)
			format = "yyyyMMddHHmmssSSS";

		DateFormat sdFormat = new SimpleDateFormat(format);
		Date dt = null;

		try {
			if (str == null)
				str = System.currentTimeMillis() + "";

			dt = sdFormat.parse(str);
		} catch (ParseException e) {
		}

		return dt;
	}

	/**
	 * String to Date
	 * 
	 * @param str
	 * @param format
	 * @return
	 */
	public static Calendar stringToDate2(String str) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar c = Calendar.getInstance();
		if (str == null) {
			str = "19800101010101";
		}
		try {
			c.setTime(df.parse(str));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return c;
	}

	public static Long getTimeStamp() {
		String t = getDate("yyyy-MM-dd HH:mm:ss:SSS");

		SimpleDateFormat formatter = new SimpleDateFormat(
				"yyyy-mm-dd HH:mm:ss:SSS");
		Date userDate = null;
		try {
			userDate = formatter.parse(t);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return userDate.getTime();
	}
}
