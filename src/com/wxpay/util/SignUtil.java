package com.wxpay.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.Random;

import com.wxpay.config.WXPayConfig;

/**
 * 请求校验工具类
 * 
 * 
 */
public class SignUtil {
    // 与接口配置信息中的Token要一致
    private static String token = "htwtoken";

    /**
     * 验证签名
     * 
     * @param signature
     * @param timestamp
     * @param nonce
     * @return
     */
    public static boolean checkSignature(String signature, String timestamp,
            String nonce) {
        String[] arr = new String[] { token, timestamp, nonce };
        // 将token、timestamp、nonce三个参数进行字典序排序
        //Arrays.sort(arr);
        sort(arr);
        StringBuilder content = new StringBuilder();
        for (int i = 0; i < arr.length; i++) {
            content.append(arr[i]);
        }
        MessageDigest md = null;
        String tmpStr = null;

        try {
            md = MessageDigest.getInstance("SHA-1");
            // 将三个参数字符串拼接成一个字符串进行sha1加密
            byte[] digest = md.digest(content.toString().getBytes());
            tmpStr = byteToStr(digest);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        content = null;
        // 将sha1加密后的字符串可与signature对比，标识该请求来源于微信
        return tmpStr != null ? tmpStr.equals(signature.toUpperCase()) : false;
    }

    /**
     * 将字节数组转换为十六进制字符串
     * 
     * @param byteArray
     * @return
     */
    private static String byteToStr(byte[] byteArray) {
        String strDigest = "";
        for (int i = 0; i < byteArray.length; i++) {
            strDigest += byteToHexStr(byteArray[i]);
        }
        return strDigest;
    }

    /**
     * 将字节转换为十六进制字符串
     * 
     * @param mByte
     * @return
     */
    private static String byteToHexStr(byte mByte) {
        char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
                'B', 'C', 'D', 'E', 'F' };
        char[] tempArr = new char[2];
        tempArr[0] = Digit[(mByte >>> 4) & 0X0F];
        tempArr[1] = Digit[mByte & 0X0F];

        String s = new String(tempArr);
        return s;
    }

    public static void sort(String a[]) {
        for (int i = 0; i < a.length - 1; i++) {
            for (int j = i + 1; j < a.length; j++) {
                if (a[j].compareTo(a[i]) < 0) {
                    String temp = a[i];
                    a[i] = a[j];
                    a[j] = temp;
                }
            }
        }
    }
    
  //Sha1签名()
  	public static String getSha1(String str) {
  		if (str == null || str.length() == 0) {
  			return null;
  		}
  		char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  				'a', 'b', 'c', 'd', 'e', 'f' };
  		try {
  			MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
  			mdTemp.update(str.getBytes("GBK"));
  			byte[] md = mdTemp.digest();
  			int j = md.length;
  			char buf[] = new char[j * 2];
  			int k = 0;
  			for (int i = 0; i < j; i++) {
  				byte byte0 = md[i];
  				buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
  				buf[k++] = hexDigits[byte0 & 0xf];
  			}
  			return new String(buf);
  		} catch (Exception e) {
  			return null;
  		}
  	}
  	
  	
  	/**
     * 获取一定长度的随机字符串
     * @param length 指定字符串长度
     * @return 一定长度的字符串
     */
    public static String getRandomStringByLength(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }
    
    //公众号接口的签名
    public static String getPublicSign(Map<String,Object> map){
        ArrayList<String> list = new ArrayList<String>();
        for(Map.Entry<String,Object> entry:map.entrySet()){
            if(entry.getValue()!=""){
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String [] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < size; i ++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        
        result += "key=" + WXPayConfig.PUBLIC_API_KEY;
        result = MD5.MD5Encode(result).toUpperCase();
        return result;
    }
    
    /*
     * map to xml
     * */
    public static String mapToXML(Map<String,Object> map){
    	StringBuilder xml = new StringBuilder();
    	xml.append("<xml>");
    	for(Map.Entry<String,Object> entry:map.entrySet()){
    		xml.append("<"+entry.getKey()+">");
    		xml.append(entry.getValue());
    		xml.append("</"+entry.getKey()+">");
        }
    	xml.append("</xml>");
    	return xml.toString();
    }
    
  //支付结果接口的签名验证
    public static String getPublicResultSign(Map<String,String> map){
        ArrayList<String> list = new ArrayList<String>();
        for(Map.Entry<String,String> entry:map.entrySet()){
            if(entry.getValue()!=""){
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String [] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < size; i ++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        
        result += "key=" + WXPayConfig.PUBLIC_API_KEY;
        result = MD5.MD5Encode(result).toUpperCase();
        return result;
    }
}