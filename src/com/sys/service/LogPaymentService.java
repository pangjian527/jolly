package com.sys.service;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pub.dao.GeneralDao;
import pub.dao.hibernate.PagedQuery;
import pub.dao.query.Query;
import pub.dao.query.QueryResult;
import pub.dao.query.QuerySettings;
import pub.functions.StrFuncs;

import com.sys.dao.LogPaymentDao;
import com.sys.entity.LogPayment;

@Service("logPaymentService")
@Transactional(readOnly = true)
public class LogPaymentService  extends BaseService<LogPayment>{
	
	/**
	 * jmj 2015-06-11 默认查询方法
	 * 
	 */
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		
		StringBuilder where = new StringBuilder();
		where.append( " 1 = 1");
		
		this.addQueryLikeFilter(queryJson, where, query, "id", 
		" and t.id like :id");
		this.addQueryDateFilter(queryJson, where, query, "startTime", 
				" and t.create_time >= :startTime");
		this.addQueryDateFilter(queryJson, where, query, "endTime", 
				" and t.create_time <= :endTime");
		
		query.select( "t.*").
		from(" log_payment t").
			where( where.toString()).
				orderBy(" t.create_time desc ");
			
		generalDao.execute(query);
		return query.getResult();
	}

	/*
	 * 已有query方法取代, 暂时保留
	 */
//	public QueryResult query(String condition, QuerySettings settings,String...strings) throws Exception{
//		//BaseService.build(); 停用, 该方法也停用
//		//LogPayment queryData = (LogPayment)BaseService.build(condition,new LogPayment());
//	
//		Query query = new PagedQuery(settings);
//		StringBuilder select = new StringBuilder();
//		select.append( " t.*");
//		select.append( "");
//		
//		StringBuilder where = new StringBuilder();
//		where.append( " 1=1");
//		
//		query.select( select.toString()).
//				from(" log_payment t").
//					where( where.toString()).
//						orderBy(" t.create_time desc ");	
//		generalDao.execute(query);
//		return query.getResult();
//	}
//	
//	public LogPayment get(String id){
//		return logPaymentDao.get(id);
//	}
	
	@Transactional
	public void update(LogPayment logPayment){
		if(StrFuncs.notEmpty(logPayment.getId())){
			logPaymentDao.save(logPayment);
		}
	}
	
	@Transactional
	public LogPayment createAndSave(double amount, Integer payType, String reqContent, String task, String orderId){
		
		LogPayment logPayment = new LogPayment();
        logPayment.setAmount(amount);
        logPayment.setSysType(payType == null ? LogPayment.payType_alipay : payType);
        logPayment.setReqContent(reqContent);
//        logPayment.setTableName(Bookform.TABLE_NAME);
        logPayment.setCallbackTask(task);
        logPayment.setOrderId(orderId);
        
		logPaymentDao.save(logPayment);
		return logPayment;
	}
	
	public List<LogPayment> getPaymentsByOrderId(String orderId) {
		return logPaymentDao.getAllByProperty("orderId",orderId,"createTime desc");
	}
	
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private LogPaymentDao logPaymentDao;

	

	
}
