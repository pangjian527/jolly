package com.sys.service;

import net.sf.json.JSONArray;
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
import pub.functions.StrFuncs;

import com.sys.dao.SmsDao;
import com.sys.entity.Sms;
import com.web.utils.netease.SmsUtils;


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
	public String sendMsg(String mobile,String templateId) throws Exception {
		return SmsUtils.sendMsg(mobile, 6,templateId);
	}
	
	public boolean validate(String mobile,String code) throws Exception {
		return  SmsUtils.validate(mobile, code);
	}
	public void sendTempMsg(String tempId,JSONArray mobileArr,JSONArray tempParamArr) throws Exception {
		SmsUtils.sendTempMsg(tempId, mobileArr, tempParamArr);
	}
	
	@Autowired
	private SmsDao smsDao;
	/*@Autowired
	private SmsBlacklistDao smsBlacklistDao;*/
	@Autowired
	private GeneralDao generalDao;
	
	
}