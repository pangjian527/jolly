package com.wxpay.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import pub.functions.DateFuncs;

import com.sys.consts.Consts;

public class LogUtil {

	/** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */        
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
        	//ServletContext servletContext = ServletUtils.getSession().getServletContext();
        	String logDir = Consts.REALPATH+"/wxpay_log";
        	String logfile_allpath = logDir + File.separator + DateFuncs.toString(new Date(), "yyyy-MM-dd") + ".txt";
        	System.out.println("logfile_allpath="+logfile_allpath);
            writer = new FileWriter(logfile_allpath,true);
            writer.write(sWord+"\r\n");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
