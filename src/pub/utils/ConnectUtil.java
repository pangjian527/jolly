package pub.utils;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class ConnectUtil {
	
	private static final int SO_TIMEOUT = 10000;
	private static final int CON_TIMEOUT = 10000;
	private static final int BUFFER_SIZE = 1024;

	public static String loadUrl(String json_url) throws Exception{
		InputStream inputStream = null;
		ByteArrayOutputStream bytes = null;
		URL url = new URL(json_url);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setDoInput(true);
		conn.setConnectTimeout(CON_TIMEOUT);
		conn.setReadTimeout(SO_TIMEOUT);
		conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31");
		conn.connect();
		int respCode = conn.getResponseCode();
		if (respCode != -1) {
			if (respCode == 200) {
				byte[] data = null;
				byte[] buffer = new byte[BUFFER_SIZE];
				inputStream = conn.getInputStream();
				bytes = new ByteArrayOutputStream();
				int len = -1;
				while ((len = inputStream.read(buffer)) != -1) {
					bytes.write(buffer, 0, len);
				}
				bytes.flush();
				data = bytes.toByteArray();
				if (data == null || data.length == 0) {
					return null;
				} else {
					String str = new String(data,"utf-8");
					return str;
				}
			}			
		}
		return null;		
	}
	
	//http://v.iphone.1006.tv/jumpletv/lolvideo/1138998?channel=3&type=video_addr_high
	//得到重定向的url
	//http://pl.youku.com/playlist/m3u8.m3u8?vid=177984290
	//&type=mp4&ts=1407601481&keyframe=1&ep=dCaUHU%2BNV8sC7Cvfjj8bMSuxdiIPXP8N8RaNhdBrANQhS%2BC%2F&sid=640760152980612f7c2e0&token=5380&ctype=12&ev=1&oip=3550172228
	public static String getRedirectUrl(String json_url){
		String redirectUrl = "";
		try {
			URL url = new URL(json_url);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoInput(true);
			conn.setConnectTimeout(10000);
			conn.setReadTimeout(10000);
			conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31");
			conn.setInstanceFollowRedirects(false);  
			conn.connect();
			redirectUrl = conn.getHeaderField("Location");  
		} catch (Exception e) {
			System.out.println();
		}
		return redirectUrl;
	}
}
