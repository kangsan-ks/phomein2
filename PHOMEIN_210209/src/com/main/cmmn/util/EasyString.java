package com.main.cmmn.util;

import java.text.DecimalFormat;
import java.util.StringTokenizer;
import java.util.Vector;

/**
 * <pre>
 * filename : EasyString.java<br>
 * Object for controlling String<br>
 * added functions which String Object is not containing
 * <pre>
 *
 * @ClassName   : EasyString.java
 * @Description : String 관련 유틸
 * @author jkKim
 * @since 2013. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2013. 1. 28.     jkKim     최초 생성
 * </pre>
 */
public class EasyString {
	private EasyString() {
	}

	/**
	* get string at a position from String Object
	*/
	public static String substring(String srValue, int nStartIndex, int nEndIndex) {
		try {
			if (srValue == null)
				return "";
			if (nEndIndex > srValue.length())
				nEndIndex = srValue.length();
			return srValue.substring(nStartIndex, nEndIndex);
		} catch (IndexOutOfBoundsException e) {
			return "";
		}
	}

	/**
	* get string from begin to the nLength 
	*/
	public static String left(String srValue, int nLength) {//from begin to the nLength
		try {
			if (nLength > srValue.length())
				nLength = srValue.length();
			return srValue.substring(0, nLength);
		} catch (IndexOutOfBoundsException e) {
			return "";
		}
	}

	/**
	* get string from end to the nLength
	*/
	public static String right(String srValue, int nLength) {//from end to nLength
		try {
			int tmpIndex = srValue.length() - nLength;
			if (tmpIndex < 0)
				tmpIndex = 0;
			return srValue.substring(tmpIndex);
		} catch (IndexOutOfBoundsException e) {
			return "";
		}
	}

	/**
	* replace type of char
	*/
	public static String replace(String src, String oldstr, String newstr) {

		if (src == null)
			return null;

		StringBuffer dest = new StringBuffer("");

		int len = oldstr.length();
		int srclen = src.length();
		int pos = 0;
		int oldpos = 0;

		while ((pos = src.indexOf(oldstr, oldpos)) >= 0) {
			dest.append(src.substring(oldpos, pos));
			dest.append(newstr);
			oldpos = pos + len;
		}

		if (oldpos < srclen)
			dest.append(src.substring(oldpos, srclen));
		return dest.toString();
	}

	/**
	*  connect String to nCount times
	*/
	public static String fillString(String srValue, int nCount) {
		StringBuffer temp = new StringBuffer();
		for (int i = 0; i < nCount; i++) {
			temp.append(srValue);
		}
		return temp.toString();
	}

	/**
	* connect Numbers to nCount times
	*/
	public static int fillInteger(int i, int nCount) {
		String tmpString = String.valueOf(i);
		tmpString = fillString(tmpString, nCount);
		return Integer.parseInt(tmpString);
	}

	/**
	* to make a String has width
	* if string is too short, fill spaces to end
	*/
	public static String fillSpace(String srValue, int nCount) {
		return fillRight(srValue, nCount, ' ');
	}

	/**
	* fill zero('0') in front of number
	*/
	public static String fillZero(int nValue, int nCount) {
		return fillLeft(String.valueOf(nValue), nCount, '0');
	}

	public static String fillRight(String srValue, int nCount, char fillchar) {
		if (srValue == null)
			return "";
		StringBuffer temp = new StringBuffer();

		temp.append(srValue);
		temp.append(EasyString.fillString(String.valueOf(fillchar), nCount - srValue.length()));

		return temp.toString();
	}

	public static String fillSpace0x00(String srValue, int nCount) {
		return fillRight(srValue, nCount, (char) 0x00);
	}

	public static String fillLeft(String nValue, int nCount, char fillchar) {
		String tmpString = nValue;
		int len = nValue.length();
		tmpString = fillString(String.valueOf(fillchar), nCount - len) + nValue;
		return tmpString;
	}

	public static String fillLeftSpace0x00(String srValue, int nCount) {
		return fillLeft(srValue, nCount, (char) 0x00);
	}

	/**
	* to convert the value of String Object to Integer ,if Exception occured return nReturnValue
	*/
	public static int parseInt(String srValue, int nReturnValue) {
		try {
			return Integer.parseInt(srValue);
		} catch (NumberFormatException nfe) {
			return nReturnValue;
		}
	}

	public static long parseLong(String srValue, long nReturnValue) {
		try {
			return Long.parseLong(replace(srValue, ",", ""));
		} catch (NumberFormatException nfe) {
			return nReturnValue;
		}
	}

	/**
	* to convert the value of String Object to Integer 
	* @param srValue string to convert
	* @return if Exception occured return -1, or return value
	*/
	public static int parseInt(String srValue) {
		return parseInt(replace(srValue, ",", ""), -1);
	}

	public static long parseLong(String srValue) {
		return parseLong(replace(srValue, ",", ""), -1);
	}

	/**
	* to convert the value of String Object to boolean
	* @param srValue string to convert
	* @return if String is null return false, or return true
	*/
	public static boolean parseBoolean(String srValue) {
		boolean isTrue = true;
		if (srValue == null)
			isTrue = false;
		return isTrue;
	}

	public static String special(String srValue) {
		if (srValue == null) {
			return "";
		} else {
			srValue = srValue.replace('<', '(');
			srValue = srValue.replace('>', ')');
			return srValue;
		}
	}

	/**
	* if String is Null return ""
	* @return if srValue is null return ""
	*/
	public static String toString(String srValue) {
		if (srValue == null) {
			return "";
		} else {
			return srValue;
		}
	}

	public static String toString(String srValue, String defaultStr) {
		if (srValue == null || srValue == "") {
			return defaultStr;
		} else {
			return srValue;
		}
	}

	/**
	* input string divied by modifier to Vector 
	* @return if srValue is null return ""
	*/
	public static Vector stringTokenizer(String srValue, String dlm) {
		return StringTokenizer(srValue, dlm, false);
	}

	public static Vector split(String srValue, String dlm) {
		return StringTokenizer(srValue, dlm, false);
	}

	public static Vector StringTokenizer(String srValue, String dlm, boolean reCheck) {
		if (srValue == null || dlm == null) {
			return null;
		}
		Vector vt = new Vector(5, 5);
		StringTokenizer st = new StringTokenizer(srValue, dlm, reCheck);
		while (st.hasMoreElements()) {
			String token = st.nextToken();
			vt.addElement(token);
		}
		return vt;
	}

	/**
	* insert ',' to numbers
	*/
	public static String addComma(String value) {
		return addComma(Long.parseLong(value));
	}

	public static String addComma(long value) {
		/*
		String 	tmpValue  = "";
		String 	realValue = "";
		int 	length;
		String 	strValue = String.valueOf(value);
		length	= strValue.length();
		int count = 0;
		for(int i=length-1;i>=0;i--){
			tmpValue += strValue.substring(i,i+1);
			if((count)%3==2 && i>0) tmpValue +=",";
			count++;
		}
		length = tmpValue.length();

		for(int i=length-1;i>=0;i--){
			realValue += tmpValue.substring(i,i+1);
		}

		*/

		return numberFormat(value, "###,###,###,###,###,###");
	}

	public static String numberFormat(double value, String format) {

		DecimalFormat df = new DecimalFormat(format);
		return df.format(value);
	}

	static public int getByteLength(String str) {
		byte btString[] = str.getBytes();
		//		for(int i=0;i<btString.length;i++){
		//		}
		return btString.length;
	}

	static public int getByteLength(char chr) {
		String srTemp = new String(chr + "");
		byte bt[] = srTemp.getBytes();
		return bt.length;
	}

	static public boolean isHanCode(char chr) {
		if (chr >= 0 && chr <= 255) {//(chr>='A' && chr<='z'){
			return false;
		} else if (chr >= '\uAC00' && chr <= '\uD7A3') {
			return true;
		}
		return false;
	}

	static public String cutByteString(String str, int maxlength) {
		return cutByteString(str, maxlength, null);
	}

	static public String[] cutByteStringToArray(String str, int maxlength) {
		int total_len = getByteLength(str);

		String[] arResult = new String[(total_len - 1) / maxlength + 1];

		if (str == null)
			return arResult;

		char caTemp[] = str.toCharArray();

		StringBuffer bsString = new StringBuffer();

		int cut_len = maxlength;

		int len = 0;
		int tmpLen = 0;

		int index = 0;

		for (int i = 0; i < caTemp.length; i++) {
			tmpLen = getByteLength(caTemp[i]);
			len += tmpLen;
			if (cut_len >= len) {
				bsString.append(caTemp[i]);
			} else {
				arResult[index] = bsString.toString();
				bsString.delete(0, bsString.length());
				index++;
			}
		}

		return arResult;
	}

	/**
	* cut byte string and input to Vector
	*/
	public static Vector cutByteStringToVector(String str, int maxlength) {
		int total_len = getByteLength(str);
		Vector vtResult = new Vector();
		if (str == null)
			return vtResult;
		char caTemp[] = str.toCharArray();
		StringBuffer bsString = new StringBuffer();
		int cut_len = maxlength;
		int len = 0;
		int tmpLen = 0;
		int index = 0;

		for (int i = 0; i < caTemp.length; i++) {
			tmpLen = getByteLength(caTemp[i]);
			len += tmpLen;
			if (cut_len >= len) {
				bsString.append(caTemp[i]);
			} else {
				vtResult.addElement(bsString.toString());
				bsString.delete(0, bsString.length());
				index++;
				i--;
				len = 0;
			}
		}

		if (bsString.length() > 0) {
			vtResult.addElement(bsString.toString());
		}
		return vtResult;
	}

	/**
	* insert '...' after cut the string by byte
	* @return if str is null return "";
	*/
	static public String cutByteString(String str, int maxlength, String ppp) {
		if (str == null)
			return "";

		char caTemp[] = str.toCharArray();
		StringBuffer bsString = new StringBuffer();

		int total_len = getByteLength(str);
		int ppp_len;

		if (ppp == null) {
			ppp_len = 0;
		} else {
			ppp_len = getByteLength(ppp);
		}

		if (total_len <= maxlength) { //less than maxlength
			return str;
		}

		int cut_len = maxlength - ppp_len;

		int len = 0;
		int tmpLen = 0;

		for (int i = 0; i < caTemp.length; i++) {
			tmpLen = getByteLength(caTemp[i]);
			len += tmpLen;
			if (cut_len >= len) {
				bsString.append(caTemp[i]);
			}
		}

		if (ppp != null) {
			bsString.append(ppp);
		}

		return bsString.toString();
	}

	static public String cutByteString2(String str, int maxlength, String ppp) {
		if (str == null)
			return "";

		char caTemp[] = str.toCharArray();
		StringBuffer bsString = new StringBuffer();

		int total_len = getByteLength(str);
		int ppp_len;

		if (ppp == null) {
			ppp_len = 0;
		} else {
			ppp_len = getByteLength(ppp);
		}

		if (total_len <= maxlength) { //less than maxlength
			return str;
		}

		int cut_len = maxlength - ppp_len;

		int len = 0;
		int tmpLen = 0;

		for (int i = 0; i < caTemp.length; i++) {
			tmpLen = getByteLength(caTemp[i]);
			if (tmpLen > 1) {
				len += 2;
			} else {
				len += tmpLen;
			}

			if (cut_len >= len) {
				bsString.append(caTemp[i]);
			}
		}

		if (ppp != null) {
			bsString.append(ppp);
		}

		return bsString.toString();
	}

	/**
	 * cut the quote string 
	 */
	public static String cutQuote(String string) {
		if (string == null || string.length() < 1)
			return string;

		final char QUOTE = '\'';
		final char DOUBLEQUOTE = '"';

		string = string.trim();
		int i = string.length() - 1;

		if (i < 2)
			return string;

		if ((string.charAt(0) == DOUBLEQUOTE && string.charAt(i) == DOUBLEQUOTE) || (string.charAt(0) == QUOTE && string.charAt(i) == QUOTE)) {
			string = string.substring(1, i);
		}

		return string;
	}

	/**
	 * to change the fisrt character to UpperCase.
	 */
	public static String changeFirstChartoUpperCase(String s) {
		String s1 = s.substring(0, 1).toUpperCase();
		String s2 = s1.concat(s.toLowerCase().substring(1));
		return s2;
	}

	public static boolean isSet(String str) {
		return (str != null && str.length() > 0);
	}

	public static String makeRandomString() {
		return makeRandomString(8);
	}

	public static String makeRandomString(int size) {
		byte[] sourceBytes = new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").getBytes();
		return makeRandomString(size, sourceBytes);
	}

	public static String makeRandomString(int size, String sourceString) {
		return makeRandomString(size, sourceString.getBytes());
	}

	public static String makeRandomString(int size, byte[] sourceBytes) {
		byte[] buf = new byte[size];
		for (int i = 0; i < size; i++) {
			buf[i] = sourceBytes[(int) (Math.random() * sourceBytes.length)];
		}
		return new String(buf);
	}

	/**
	Get the number of matched words in the sentence.
	@param String sentence, String words.
	@return int the number of matched words in the sentence.
	*/
	public int getWordCounts(String str, String checkSome) {
		int strFlag = 0;
		int counts = 0;
		int jump = checkSome.length();

		while (true) {
			try {
				strFlag = str.indexOf(checkSome, strFlag);
				if (strFlag == -1)
					break;
				strFlag = jump + strFlag;
				counts++;
			} catch (Exception ex) {
				break;
			}
		}
		return counts;

	} //End of int getStringCounter(String str, String checkSome);

	public static String insert(String strTarget, int loc, String strInsert) {
		StringBuffer strBuf = new StringBuffer();
		int lengthSize = strTarget.length();
		if (loc >= 0) {
			if (lengthSize < loc) {
				loc = lengthSize;
			}
			strBuf.append(strTarget.substring(0, loc));
			strBuf.append(strInsert);
			strBuf.append(strTarget.substring(loc + strInsert.length()));
		} else {
			if (lengthSize < Math.abs(loc)) {
				loc = lengthSize * (-1);
			}
			strBuf.append(strTarget.substring(0, (lengthSize - 1) + loc));
			strBuf.append(strInsert);
			strBuf.append(strTarget.substring((lengthSize - 1) + loc + strInsert.length()));
		}
		return new String(strBuf);
	}

	/**
	/* @made by mpeon(Philip) 2002/08/28
	*/
	public static String DelimiterConcat(String StrMain, String Delimiter, String StrNew) {
		String Str1 = toString(StrMain);
		String Str2 = toString(StrNew);
		if (!Str1.equals("") && !StrNew.equals("")) {
			return Str1 + Delimiter + Str2;
		} else if (Str1.equals("") && !StrNew.equals("")) {
			return Str2;
		} else {
			return StrMain;
		}
	}

	public String getLikeClause(String FieldName, String FieldValue) {
		String LikeClause = "";
		StringTokenizer tokens = new StringTokenizer(FieldValue);
		while (tokens.hasMoreElements()) {
			String token = tokens.nextToken();
			if (!token.trim().equals("")) {
				LikeClause = EasyString.DelimiterConcat(LikeClause, " and ", "instr(" + FieldName + ",'" + token.trim() + "')>0");
			}
		}
		if (!LikeClause.equals("")) {
			return "(" + LikeClause + ")";
		} else {
			return "";
		}
	}

	public static String removeHTML(String htmlString) {
		//String noHTMLString = htmlString.replaceAll("(?:<!.*?(?:--.*?--\\s*)*.*?>)|(?:<(?:[^>'\"]*|\".*?\"|'.*?')+>)", "");
		String noHTMLString = htmlString.replaceAll("<p>", ""); 
		noHTMLString = htmlString.replaceAll("</p>", "");
		noHTMLString = htmlString.replaceAll("<P>", "");
		noHTMLString = htmlString.replaceAll("</P>", "");
		noHTMLString = noHTMLString.replaceAll("(?:<!--.*?(?:--.*?--\\s*)*.*?-->)|(?:<(?:[^>'\"]*|\".*?\"|'.*?')+>)","");
		
		//String noHTMLString = htmlString.replaceAll("(?:<!--.*?(?:--.*?--\\s*)*.*?-->)|(?:<(?:[^>'\"]*|\".*?\"|'.*?')+>)","");
		
		return noHTMLString;
	}

	public static String enterCutString(String str, int enterNum) {
		if (str == null) {
			return "";
		}
		String temp = "";
		if (str.indexOf("<br/>") > -1) {
			String[] s = str.trim().split("<br/>");
			int num = s.length > enterNum ? enterNum : s.length;
			for (int i = 0; i < num; i++) {
				if (i == 0) {
					temp += s[i];
				} else {
					temp += "<br/>" + s[i];
				}
			}
		} else {
			String[] s = str.trim().split("\r\n");
			int num = s.length > enterNum ? enterNum : s.length;
			for (int i = 0; i < num; i++) {
				if (i == 0) {
					temp += s[i];
				} else {
					temp += "<br/>" + s[i];
				}
			}
		}
		return temp;
	}

	public static String cutString(String source, int slength , String output) {
        String returnVal = null;
        if (source != null) {
            if (source.length() > slength) {
                returnVal = source.substring(0, slength) + output;
            } else
                returnVal = source;
        }
        return returnVal;
    }
}