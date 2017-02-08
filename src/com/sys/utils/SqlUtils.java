package com.sys.utils;

/*
 * 用于组装一些通用的sql string
 * */
public class SqlUtils {

	//获取指定的表记录对应的fileID
	//文件类型（ 0手机大图,1手机小图,2公网缩略图,3公网大图,4内网图片）
	public static String createGetFileId(String tableName,String referenceId,Integer type){
		
		String sql = " (select id from t_file where table_name='" +tableName+"' and reference_id="+referenceId;
		//sql += " and type="+type;
		sql += " and rownum<=1) as fileId";
		return sql;
	}
	
	public static String getFileId(String column){//如：t.photo_ids
		return " substr("+column+",0,32) as fileId";
	}
}
