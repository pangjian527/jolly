package com.sys.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.DateFuncs;
import pub.functions.StrFuncs;

import com.sys.dao.SmsDao;
import com.sys.entity.Sms;
import com.web.utils.montnets.SmsUtils;
import com.web.utils.montnets.SmsUtils.ResultData;


/**
 * 贾孟君 
 * 增加查询功能
 * 2015-04-22 
 */
@Service
@Transactional(readOnly = true)
public class SmsService extends BaseService<Sms>{

	private Logger logger = Logger.getLogger(SmsService.class);
/*	@Override
	protected HibernateDao<Sms> getBaseDao() {
		return smsDao;
	}*/
	/**
	 * jmj query 2015-04-22
	 * 用于查询所有发出的短信记录
	 */
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder(" 1=1 ");
		
		addQueryLikeFilter(queryJson, where, query, "mobile", 
			" and t.obj_mobile like :mobile");
		addQueryLikeFilter(queryJson, where, query, "ipAddr", 
				" and t.ip_Addr like :ipAddr");
		this.addQueryDateFilter(queryJson, where, query, "startTime", 
				" and t.create_time >= :startTime");
		this.addQueryDateFilter(queryJson, where, query, "endTime", 
				" and t.create_time <= :endTime");
		
		query.select( " t.*").from(" T_SMS t").
		where(where.toString()).orderBy(" t.update_time desc ");	
		generalDao.execute(query);

		generalDao.execute(query);
		return query.getResult();
	}
	/**
	 * myq add 2015-4-15 紧急追加，用于封掉来自黑客的短信攻击
	 */
/*	public String verify(String mobile, String content, String ipAddr){
		Date now = new Date();
		//1.ip验证，同一个IP，如果最近30秒内数量>1，或者5分钟内>5，禁掉
		if(smsDao.staticCountByIp(ipAddr, DateFuncs.addSecond(now, -300)) >= 1
			|| smsDao.staticCountByIp(ipAddr, DateFuncs.addMinute(now, -5)) >= 5){
			return ipAddr;
		}

		//2.手机号码验证，防止多个ip对同一个号码的骚扰:5分钟内超过5次请求
		if(smsDao.staticCountByMobile(mobile, DateFuncs.addMinute(now, -5)) >= 5){
			return ipAddr;
		}
		
		//3.可以发
		return null;
	}*/
	/**
	 * myq add 2015-4-15，实时发送短信的统一接口，注意后续其他业务逻辑禁止直接调用SmsUtil
	 * @param mobile
	 * @param content
	 * @param ipAddr
	 * @param remark
	 */
	private Map<String, Date> recentIpMobileLog = new HashMap<String, Date>();
	private Map<String, Date> recentIpLog = new HashMap<String, Date>();
	//private Map<String, Date> recentMobileLog = new HashMap<String, Date>();
	@Transactional
	public String sendSms(String mobile, String content, String ip, String source) throws Exception{
		//1.验证手机有效性，复杂的逻辑预留
		if(StrFuncs.isEmpty(mobile) || mobile.length() != 11){
			logger.error(new Date()+","+mobile +","+ip+",无效的手机号码");
			return "无效的手机号码";
		}
		
		//2.检查手机/IP是不是在黑名单之类，如果在黑名单了，直接退出，不记录
		/*if(smsBlacklistDao.contain(mobile, ip)){
			logger.error(new Date()+","+mobile +","+ip+",您的手机号码或IP已被屏蔽，请拨打倬利客服电话");
			return "您的手机号码或IP已被屏蔽，请拨打倬利客服电话";
		}*/
		
		//10秒内只能够发送1次验证码
		Date now = new Date();
		synchronized(this){
			String key = ip + "-" + mobile;
			Date lastTime = this.recentIpMobileLog.get(key);
			if(lastTime != null && now.getTime() - lastTime.getTime()< 15 * 1000){
				//same ip+mobile in 15 seconds,robot!
				this.recentIpMobileLog.put(key, now);
				//smsBlacklistDao.save(null, ip);
				smsDao.saveError(mobile, ip, content, source + "：IP 请求过于频繁，永久屏蔽");
				logger.error(new Date()+","+mobile +","+ip+",：IP 请求过于频繁，永久屏蔽");
				return "验证码发送过于频繁，请稍后再试";
			}
			else{
				this.recentIpMobileLog.put(key, now);
			}
			
			key = ip ==null ? mobile: ip ;
			lastTime = this.recentIpLog.get(key);
			if(lastTime != null && now.getTime() - lastTime.getTime() < 5 * 1000){
				//same ip in 10 seconds with different mobile , maybe robot!
				this.recentIpLog.put(key, now);
				//smsBlacklistDao.save(null, ip, 5);
				smsDao.saveError(mobile, ip, content, source + "：IP 请求过于频繁，暂时屏蔽");
				logger.error(new Date()+","+mobile +","+ip+",10秒內验证码发送过于频繁，请稍后再试");
				return "验证码发送过于频繁，请稍后再试";
			}
			else{
				this.recentIpLog.put(key, now);
			}
		}
		
		//3.检查IP最近1分钟之内发送短信频率，识别机器人，进行暂时/永久 ban ip
		//3.1 同IP、同手机号码检验：30秒内超过1条，5分钟超过10次，半小时内超过30次，1小时内超过60次
		//	  可以肯定是机器人发送的，直接永久禁
		if(smsDao.staticCount(mobile, ip, DateFuncs.addSecond(now, -30)) > 1
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -5)) > 10
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -30)) > 30
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -60)) > 60){
			/*smsBlacklistDao.save(null, ip);
			smsBlacklistDao.save(mobile, null, 60 * 30);*/
			smsDao.saveError(mobile, ip, content, source + "：IP + 号码 请求过于频繁，永久屏蔽");
			logger.error(new Date()+","+mobile +","+ip+",IP最近1分钟之内发送短信频率IP + 号码 请求过于频繁，永久屏蔽");
			return "您的手机号码或IP已被屏蔽，请拨打倬利客服电话";
		}
		
		//3.2同IP、不同同手机号码检验：30秒内超过1条，5分钟超过10次，半小时内超过30次，1小时内超过60次
		//	可能是同一个内网的多个真实用户在操作，也可能是机器人发起欺骗时变更了手机号码，暂时性的额禁ip 5分钟，并且记录此次请求
		if(smsDao.staticCount(mobile, ip, DateFuncs.addSecond(now, -30)) > 1
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -5)) > 10
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -30)) > 30
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -60)) > 60){
			//smsBlacklistDao.save(null, ip, 5);
			smsDao.saveError(mobile, ip, content, source + "：同IP请求过于频繁，禁IP 5分钟");
			logger.error(new Date()+","+mobile +","+ip+",同IP请求过于频繁，禁IP 5分钟");
			return "您的手机号码或IP已被屏蔽，请拨打倬利客服电话";
		}
		
		//4.检查同一手机接收的短信频率（可能来自不同IP的攻击，甚至每10分钟一次的低频率，但是一天累计的数量也很多），避免客户被机器人骚然
		//	禁止内容：10分钟内超过10条，一小时内超过20条，2小时内超过30条。禁止方式：屏蔽1小时，并记录此次请求
		if(smsDao.staticCountByMobile(mobile, DateFuncs.addMinute(now, -10)) > 10
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -60)) > 20
				|| smsDao.staticCount(mobile, ip, DateFuncs.addMinute(now, -120)) > 30){
			//smsBlacklistDao.save(null, ip, 60);
			smsDao.saveError(mobile, ip, content, "同号码接收过于频繁，禁IP 60分钟");
			logger.error(new Date()+","+mobile +","+ip+",同号码接收过于频繁，禁IP 60分钟");
			return "您的手机号码或IP已被屏蔽，请拨打倬利客服电话";
		}
		
		//final.经过了9x9 81难得考验，这才能够发短信了
		//smsDao.saveSuccess(mobile, ip, content, source + ":人工发送短信");
		ResultData result = SmsUtils.sendMsg(mobile, content);
		if(result.isok == true){
			smsDao.saveSuccess(mobile, ip, content, source + ":发送成功");
			return null;
		}
		else{
			smsDao.saveError(mobile, ip, content, source + ":发送失败——" + result.message);
			logger.error(new Date()+","+mobile +","+ip+",发送失败——"+ result.message);
			return "短信网关发送失败：" + result.message;
		}
	}
	
	/**
	 * 该方法不校验发送频率，针对系统主动发送的短信
	 * @param mobile
	 * @param content
	 * @param ip
	 * @param source
	 * @return
	 * @throws Exception
	 */
	@Transactional
	public String sendSmsWithOutValid(String mobile, String content, String ip, String source) throws Exception{
		//1.验证手机有效性，复杂的逻辑预留
		if(StrFuncs.isEmpty(mobile) || mobile.length() != 11){
			logger.error(new Date()+","+mobile +","+ip+",无效的手机号码");
			return "无效的手机号码";
		}
		
		//2.检查手机/IP是不是在黑名单之类，如果在黑名单了，直接退出，不记录
		/*if(smsBlacklistDao.contain(mobile, ip)){
			logger.error(new Date()+","+mobile +","+ip+",您的手机号码或IP已被屏蔽，请拨打倬利客服电话");
			return "您的手机号码或IP已被屏蔽，请拨打倬利客服电话";
		}*/
		
		//smsDao.saveSuccess(mobile, ip, content, source + ":人工发送短信");
		ResultData result = SmsUtils.sendMsg(mobile, content);
		if(result.isok == true){
			smsDao.saveSuccess(mobile, ip, content, source + ":发送成功");
			return null;
		}
		else{
			smsDao.saveError(mobile, ip, content, source + ":发送失败——" + result.message);
			logger.error(new Date()+","+mobile +","+ip+",发送失败——"+ result.message);
			return "短信网关发送失败：" + result.message;
		}
	}
	
	private String run(String mobile, String content, String ip, String source){
		ResultData result = SmsUtils.sendMsg(mobile, content);
		if(result.isok == true){
			smsDao.saveSuccess(mobile, ip, content, source + ":发送成功");
			return null;
		}
		else{
			smsDao.saveError(mobile, ip, content, source + ":发送失败——" + result.message);
			return "短信网关发送失败：" + result.message;
		}
	}
	
	
	public void sendSmsIgnoreError(String mobile, String content, String ip, String source){
		try{
			this.sendSms(mobile, content, ip, source);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * myq add 2015-4-15，定时发送短信的统一接口，注意后续其他业务逻辑禁止直接调用SmsUtil
	 * 这个方法预留，以后再实现
	 * @scheduleTime 预约发送的时间，如果<当前时间则转为直接发送
	 * @param mobile
	 * @param content
	 * @param ipAddr
	 * @param remark
	 */
	public void sendSms(String mobile, String content, String ipAddr, String scheduleTime, String remark){
		
	}
	@Autowired
	private SmsDao smsDao;
	/*@Autowired
	private SmsBlacklistDao smsBlacklistDao;*/
	@Autowired
	private GeneralDao generalDao;
	
	
}