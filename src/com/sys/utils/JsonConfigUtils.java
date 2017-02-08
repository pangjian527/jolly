package com.sys.utils;

import java.io.File;
import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;

import pub.functions.JsonFuncs;
import pub.functions.StrFuncs;

import com.sys.consts.Consts;

public class JsonConfigUtils {

	public static double installationPrice=80.0;
	
	//百度access_key与geotable_id
	private static String ak;
	private static String factory_geotable_id;
	
	
	
	/*获取当前的版本号，判断是否需要升级*/
	public static JSONObject getAndroidMallVersion(){
		return getApkVersion("android", "mall");
	}
	
	public static JSONObject getAndroidMerchantVersion(){
		return getApkVersion("android", "merchant");
	}
	
	public static JSONObject getIosMallVersion(){
		return getApkVersion("ios", "mall");
	}
	
	public static JSONObject getIosMerchantVersion(){
		return getApkVersion("ios", "merchant");
	}
	
	private static JSONObject getApkVersion(String system, String name){
		File file = new File(Consts.REALPATH+"/config/apk.json");
		try {
			String configStr = FileUtils.readFileToString(file, "UTF-8");
			return JsonFuncs.toJsonObject(configStr).getJSONObject(system + "-" + name);
		} 
		catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	/*获取当前的版本号，判断是否需要升级*/
/*	public static String getMerchantCurrentVersion(){
		File file = new File(Consts.REALPATH+"/config/version.json");
		
		try {
			String configStr = FileUtils.readFileToString(file, "UTF-8");
			JSONObject object=JsonFuncs.toJsonObject(configStr).getJSONObject("android-merchant");
			return object.toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}*/
	
	//已经用t_config记录，将废除
	public static String getBaidu_ak(){
		if(StrFuncs.isEmpty(ak)){
			File file = new File(Consts.REALPATH+"/config/baidu.json");
			try {
				String configStr = FileUtils.readFileToString(file, "UTF-8");
				JSONObject jsonObject=JsonFuncs.toJsonObject(configStr);
				ak = jsonObject.getString("ak");
				factory_geotable_id = jsonObject.getString("factory_geotable_id");;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return ak;
	}
	//已经用t_config记录，将废除
	public static String getBaidu_factory_geotable_id(){
		if(StrFuncs.isEmpty(factory_geotable_id)){
			File file = new File(Consts.REALPATH+"/config/baidu.json");
			try {
				String configStr = FileUtils.readFileToString(file, "UTF-8");
				JSONObject jsonObject=JsonFuncs.toJsonObject(configStr);
				ak = jsonObject.getString("ak");
				factory_geotable_id = jsonObject.getString("factory_geotable_id");;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return factory_geotable_id;
	}
	
}
