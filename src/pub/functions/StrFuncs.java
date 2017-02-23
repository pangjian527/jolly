package pub.functions;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.sql.Clob;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.hibernate.lob.SerializableClob;

import pub.utils.Inflector;

/**
 * Created by IntelliJ IDEA.
 * 
 * @author zhuangzhonglong Date: 2007-1-29 Time: 14:09:03
 */
@SuppressWarnings("unchecked")
public class StrFuncs {

	private static Map<String, String> transformCache = new Hashtable<String, String>();
	
	/**
	 * 字节数组所有元素 转换成
	 * @param b
	 * @return
	 */
	public static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0xFF));
			if (stmp.length() == 1)
				hs = hs + "0" + stmp;
			else
				hs = hs + stmp;
		}
		return hs;
	}

	public static String nvl(Object o) {
		return o == null ? "" : o.toString();
	}

	public static String nvl(String s) {
		return s == null ? "" : s;
	}

/*	public static <T> String join(T[] arr, String sep) {
		StringBuilder sb = new StringBuilder();
		int nCount = arr.length;
		for (int n = 0; n < nCount; n++) {
			sb.append(arr[n]);
			if (n < nCount - 1) {
				sb.append(sep);
			}
		}
		return sb.toString();
	}*/

/*	public static <T> String join(ArrayList<T> arr, String sep) {
		return join(arr.toArray(), sep);
	}*/

	public static boolean isEmpty(String s) {
		return s == null || s.trim().length() == 0;
	}

	public static boolean notEmpty(String s) {
		return s != null && s.length() > 0;
	}

	public static Double toDouble(String s) {
		if (isEmpty(s))
			return null;
		return Double.valueOf(s);
	}

	public static BigDecimal toBitDecimal(String s) {
		if (isEmpty(s))
			return null;
		return BigDecimal.valueOf(Double.valueOf(s));
	}

	public static String valueOf(Double value) {
		if (value == null)
			return null;
		return String.valueOf(value);
	}

	public static String valueOf(BigDecimal value) {
		if (value == null)
			return null;
		return String.valueOf(value);
	}

	public static String quotedStr(String str) {
		if (str == null)
			return "''";
		return "'" + str.replace("'", "''") + "'";
	}

	public static String join(List values, String sep) {
		
		if (values == null || values.size() == 0)
			return "";
		
		String result = "";
		for (int i = 0; i < values.size(); i++) {
			Object value = values.get(i);
			String text = value == null ? "" : value.toString();
			result = i == 0 ? text : result + sep + text;
		}
		return result;
	}
	
	public static String join(Object[] values, String sep) {
		
		if (values == null || values.length == 0)
			return "";
		
		String result = "";
		for (int i = 0; i < values.length; i++) {
			Object value = values[i];
			String text = value == null ? "" : value.toString();
			result = i == 0 ? text : result + sep + text;
		}
		return result;
	}

	public static Integer toInteger(String s) {
		if (isEmpty(s))
			return null;
		return Integer.valueOf(s);
	}

	public static Integer toInteger(String s, int defValue) {
		try {
			return Integer.valueOf(s);
		} catch (Throwable e) {
			return defValue;
		}
	}

	public static String getCommonPrefix(String s1, String s2) {
		if (s1 == null || s2 == null)
			return "";
		StringBuilder sb = new StringBuilder("");
		for (int n = 0; n < Math.min(s1.length(), s2.length()); n++) {
			char c = s1.charAt(n);
			if (c != s2.charAt(n))
				break;
			sb.append(c);
		}
		return sb.toString();
	}

	public static Long toLong(String s) {
		if (isEmpty(s))
			return null;
		return Long.valueOf(s);
	}

	public static String valueOf(Integer value) {
		if (value == null)
			return null;
		return String.valueOf(value);
	}

	public static String valueOf(Object o) {
		if (o == null)
			return "";
		if (o instanceof Date) {
			return valueOf((Date) o);
		}
		return "" + o;
	}

	public static String valueOf(Date date) {
		if (date == null) {
			return null;
		}
		return DateFuncs.toString(date);
	}

	public static String left(String s, int cCount) {
		return s.substring(0, Math.min(s.length(), cCount));
	}

	public static boolean isAllNumber(String s) {
		return s.matches("\\d+");
	}

	public static int getByteLen(Object oText) {
		if (oText == null) {
			return 0;
		}
		String text = oText.toString();
		try {
			byte[] bts = text.getBytes("gbk");
			return bts.length;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static String ellipseText(Object oText, int maxBytes) {
		if (oText == null)
			return "";
		return ellipseText(oText.toString(), maxBytes);
	}

	public static String ellipseText(String text, int maxBytes) {
		if (maxBytes >= text.length() * 2)
			return text;
		String subText = text.substring(0, Math.min(maxBytes, text.length()));
		try {
			byte[] bts = subText.getBytes("gbk");
			if (maxBytes < bts.length) { // found HZ
				String s = new String(bts, 0, maxBytes, "gbk");
				String s1 = new String(bts, 0, maxBytes + 1, "gbk");
				if (s1.length() == s.length())
					s = new String(bts, 0, maxBytes - 1);

				return s + "...";
			}
		} catch (Exception e) {
			// never fail, do nothing
		}
		if (subText.length() < text.length())
			subText += "...";
		return subText;
	}

	public static String emptyIsZero(String s) {
		return s == null ? "0" : (s.length() == 0 ? "0" : s);
	}

	public static String anyLike(String s) {
		return "%" + s + "%";
	}

	public static String rightLike(String s) {
		return s + "%";
	}

	public static String anyLikeIfNotEmpty(String s) {
		if (isEmpty(s))
			return s;
		return anyLike(s);
	}

	public static boolean equalsIgnoreNull(String s1, String s2) {
		if (s1 == null)
			s1 = "";
		if (s2 == null)
			s2 = "";
		return s1.equals(s2);
	}

	public static boolean equalsIgnoreNullAndCase(String s1, String s2) {
		if (s1 == null)
			s1 = "";
		if (s2 == null)
			s2 = "";
		return s1.equalsIgnoreCase(s2);
	}

	/**
	 * 判断字符串是否为NULL或等于某个特定值，在检测下拉框值时十分好用。 空时返回true
	 * 
	 * @param str
	 *            字符串
	 * @param empty
	 *            特定值
	 * @return true/false
	 */
	public static boolean CheckString(String str, String empty) {
		if (str == null || str.equals(empty)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 给字符串前补零
	 * 
	 * @param s
	 *            字符串
	 * @param len
	 *            位数
	 * @return 补零后的字符串
	 */
	public static String appendPreZero(String s, int len) {
		int strLen = 0;
		if (s != null) {
			strLen = s.length();
			if (strLen > 0 && strLen < len) {
				for (int i = strLen; i < len; i++) {
					s = "0" + s;
				}
			}
		}
		return s;
	}

	public static String trimEnd(String textValue, char... charsToTrim) {
		char[] chars = charsToTrim;
		if (chars.length == 0) {
			chars = new char[] { '\r', '\n', '\t', ' ' };
		}
		int len = -1;
		while (len != textValue.length() && (len = textValue.length()) > 0) {
			for (int n = 0; n < chars.length; n++) {
				if (textValue.charAt(len - 1) == chars[n]) {
					textValue = textValue.substring(0, len - 1);
					break;
				}
			}
		}
		return textValue;
	}

	public static String pluralize(String name) {
		return Inflector.getInstance().pluralize(name);
	}

	public static String lstrip(String s, char c) {
		if (s == null || s.length() == 0) {
			return s;
		}
		if (s.charAt(0) == c) {
			return s.substring(1);
		}
		return s;
	}

	public static String unCamelize(String s) {
		int firstPos = -1;
		for (int n = 0; n < s.length(); n++) {
			char c = s.charAt(n);
			if (Character.isUpperCase(c)) {
				firstPos = n;
				break;
			}
		}
		if (firstPos == -1) {
			return s;
		}
		String result = transformCache.get(s);
		if (result != null) {
			return result;
		}
		StringBuilder sb = new StringBuilder(s.substring(0, firstPos));
		for (int n = firstPos; n < s.length(); n++) {
			char c = s.charAt(n);
			if (Character.isUpperCase(c)) {
				sb.append('_');
				sb.append(Character.toLowerCase(c));
			} else {
				sb.append(c);
			}
		}
		result = sb.toString();
		transformCache.put(s, result);
		return result;
	}

	public static String camelize(String s) {
		int firstPos = s.indexOf('_');
		if (firstPos == -1) {
			return s;
		}
		String result = transformCache.get(s);
		if (result != null) {
			return result;
		}
		StringBuilder sb = new StringBuilder(s.substring(0, firstPos));
		boolean needUpcase = true;
		for (int n = firstPos + 1; n < s.length(); n++) {
			char c = s.charAt(n);
			if (c == '_') {
				needUpcase = true;
			} else if (needUpcase) {
				sb.append(Character.toUpperCase(c));
				needUpcase = false;
			} else {
				sb.append(c);
			}
		}
		result = sb.toString();
		transformCache.put(s, result);
		return result;
	}

	public static String trimStart(String textValue, char... charsToTrim) {
		char[] chars = charsToTrim;
		if (chars.length == 0) {
			chars = new char[] { '\r', '\n', '\t', ' ' };
		}
		int len = -1;
		while (len != textValue.length() && (len = textValue.length()) > 0) {
			for (int n = 0; n < chars.length; n++) {
				if (textValue.charAt(0) == chars[n]) {
					textValue = textValue.substring(1);
					break;
				}
			}
		}
		return textValue;
	}
	
	public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }
	
	/*
	 * 单位转换
	 */
	public static String conversionDistance(double distance){
		
		DecimalFormat df2 = new DecimalFormat("###.00");
		
		if(distance>=100){
			return df2.format(distance/1000.0)+"km";
		}
		return df2.format(distance)+"m";
	}

	public static String getFullIndexKeyword(String str) {
		if (null == str) {
			return null;
		}

		// 去掉相应的符号
		String newStr = null;
		newStr = StringUtils.remove(str, "!");
		newStr = StringUtils.remove(newStr, "$");
		newStr = StringUtils.remove(newStr, "%");
		newStr = StringUtils.remove(newStr, "&");
		newStr = StringUtils.remove(newStr, "*");
		newStr = StringUtils.remove(newStr, "(");
		newStr = StringUtils.remove(newStr, ")");
		newStr = StringUtils.remove(newStr, "-");
		newStr = StringUtils.remove(newStr, "=");
		newStr = StringUtils.remove(newStr, "[");
		newStr = StringUtils.remove(newStr, "]");
		newStr = StringUtils.remove(newStr, "{");
		newStr = StringUtils.remove(newStr, "}");
		newStr = StringUtils.remove(newStr, ";");
		newStr = StringUtils.remove(newStr, ",");
		newStr = StringUtils.remove(newStr, ">");
		newStr = StringUtils.remove(newStr, "?");
		newStr = StringUtils.remove(newStr, "~");

		if (newStr.trim().length() == 0) {
			return null;
		}

		String[] s = newStr.toString().trim().split(" ");
		StringBuilder sb = new StringBuilder();
		for (String ss : s) {
			sb.append("/" + ss + " and ");
		}
		return sb.substring(0, sb.length() - 5).toString();
	}
	
	
	public static void clobToString(List<Object> list,String[] keys){
		if(list==null||list.size()<=0)
			return;
		for (int i=0;i<list.size();i++) {
			Map map =(Map)list.get(i);
			for (String key : keys) {
				Clob clob=(Clob)map.get(key);;
				if(clob==null)
					continue;
				char[] tempDoc=null;
				try {
					Reader inStreamDoc;
					inStreamDoc = ((Clob)map.get(key)).getCharacterStream();
					tempDoc= new char[(int) clob.length()];  
		            inStreamDoc.read(tempDoc);  
		            inStreamDoc.close();  
				} catch (Exception e) {
					e.printStackTrace();
				}
				map.put(key, new String(tempDoc));
			}
		}
	}
	
	//检查是否为手机号码 by dgs 2015-01-26
	public static boolean IsMobile(String mobile){
		if(mobile == null || mobile.length() != 11){
			return false;
		}
		Pattern p = Pattern.compile("^(1)\\d{10}$");  
		Matcher m = p.matcher(mobile);  
		//System.out.println(m.matches()+"---");  
		return m.matches(); 
	}
	
	public static List<String> toList(String str,String sep){
		if(StrFuncs.isEmpty(str))
			return null;
		return Arrays.asList(str.split(sep));
	}
	
	public static String valueOf(Exception e){
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try{
			e.printStackTrace(new PrintStream(baos));
			baos.close();
			return baos.toString();
		}
		catch(Exception error){
			return null;
		}
	}
	
	public static String valueOf(SerializableClob sc){
		if(sc == null)
			return null;

		try { 
		     //根据CLOB长度创建字符数组 
			 char[] buffer = new char[(int)sc.length()]; 
		     //获取CLOB的字符流Reader,并将内容读入到字符数组中 
		    sc.getCharacterStream().read(buffer); 
		    return String.valueOf(buffer);
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return null;
	}
	
	public static String createTimeUID(){
		
		long t = System.currentTimeMillis();//获得当前时间的毫秒数
		System.out.println(t);
		String millis = StrFuncs.valueOf(t).substring(5);
		
		String time = DateFuncs.toString(new Date(), "yyyyMMdd");
        Random rd = new Random(t);
        int nextInt = rd.nextInt(100);
        
        return time+millis+nextInt;
		
	}
}
