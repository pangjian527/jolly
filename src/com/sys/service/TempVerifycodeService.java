package com.sys.service;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.commontemplate.util.coder.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.functions.DateFuncs;

import com.sys.dao.TempVerifycodeDao;
import com.sys.entity.TempVerifycode;

@Service
@Transactional(readOnly = true)
public class TempVerifycodeService  {


	
/*	
	 * 检查验证码在一定时间内是否存在
	 
	public boolean testExistsCode(String key,String code,int minute){
		
		return tempVerifycodeDao.testExistsCode(key, code, minute);
	}*/
	
	
	@Transactional
	public String create(String key){
		//6位纯阿拉伯数字，有效期5分钟
		String value = "" + (int)Math.round(Math.random()*(999999 - 100000) + 100000);
		this.createAndSave(key, value);
		return value;
	}
	
	@Transactional
	public String create(String key,Date now){ 
		//6位纯阿拉伯数字，有效期5分钟
		String value = "" + (int)Math.round(Math.random()*(999999 - 100000) + 100000);
		this.createAndSave(key, value,now);
		return value;
	}
	
	
	private void createAndSave(String key, String value,Date now){
		TempVerifycode bean = new TempVerifycode();
		bean.setType(0);
		bean.setCodeKey(MD5.encode(key));//预防 key超长导致放不下
		bean.setCodeValue(value);
		bean.setCreateTime(now);
		bean.setDeadline(DateFuncs.addSecond(now, 60 * 5));//默认五分钟
		
		tempVerifycodeDao.save(bean);
	}
	
	@Transactional
	public void create(String key, String value){
		this.createAndSave(key, value);
	}
	
	private void createAndSave(String key, String value){
		TempVerifycode bean = new TempVerifycode();
		bean.setType(0);
		bean.setCodeKey(MD5.encode(key));//预防 key超长导致放不下
		bean.setCodeValue(value);
		Date now = new Date();
		bean.setCreateTime(now);
		bean.setDeadline(DateFuncs.addSecond(now, 60 * 5));//默认五分钟
		
		tempVerifycodeDao.save(bean);
	}
	
	@Transactional
	public boolean verify(String key, String value){
		List<TempVerifycode> beans = tempVerifycodeDao.getValid(MD5.encode(key));
		if(beans.size() > 0 && beans.get(0).getCodeValue().equalsIgnoreCase(value)){
			for(TempVerifycode bean : beans){
				tempVerifycodeDao.delete(bean);
			}
			return true;
		}
		else{
			return false;
		}
	}
	
	/**
	 * 
	 */
	private TempVerifycode create(String key, String value, int type, int second){
		TempVerifycode bean = new TempVerifycode();
		bean.setType(type);
		bean.setCodeKey(key);
		bean.setCodeValue(value);
		Date now = new Date();
		bean.setCreateTime(now);
		bean.setDeadline(DateFuncs.addSecond(now, second));
		
		tempVerifycodeDao.save(bean);
		
		return bean;
	}
	
	public TempVerifycode getTempVerifycode(String key){
		List<TempVerifycode> beans = tempVerifycodeDao.getValid(MD5.encode(key));
		if(beans.size() > 0){
			return beans.get(0);
		}
		 return null ;
	}
	@Transactional
	public String createVerifycode(String key) throws Exception{
		
		TempVerifycode tempVerifycode=  getTempVerifycode(key);
		Date now = new Date();
		if(tempVerifycode != null){
			Date  createDate = tempVerifycode.getCreateTime();
			if(now.getTime() - createDate.getTime()< 60 * 1000){ ////小于60秒不重复发验证码
				throw new Exception("短信已发送，请等待接收。");
			} 
		}
		//6位纯阿拉伯数字，有效期5分钟
		String value = "" + (int)Math.round(Math.random()*(999999 - 100000) + 100000);
		this.createAndSave(key, value);
		return value;
	}
	
	@Autowired
	private TempVerifycodeDao tempVerifycodeDao;

	
}
