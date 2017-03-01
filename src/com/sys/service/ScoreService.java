package com.sys.service;

import java.util.Date;
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

import com.sys.dao.ScoreDao;
import com.sys.entity.Score;

@Service
@Transactional(readOnly = true)
public class ScoreService extends BaseService<Score>{

	@Override
	public QueryResult query(String condition, QuerySettings settings) {
		JSONObject queryJson = StrFuncs.isEmpty(condition) ? new JSONObject() : JSONObject.fromObject(condition);
		Query query = new PagedQuery(settings);
		StringBuffer select = new StringBuffer(" s.* ");
		StringBuilder where = new StringBuilder(" 1=1 ");

		this.addQueryEqualFilter(queryJson, where, query, "sysUserId",
				" and s.sys_user_id = :sysUserId");
		this.addQueryEqualFilter(queryJson, where, query, "factoryId",
		" and s.factory_id = :factoryId");

		query.select(select.toString()).from(" t_score s ").where(
				where.toString()).orderBy(" s.create_time desc ");
		generalDao.execute(query);
		return query.getResult();
	}
	
	public double getAllScoreBySysUser(String sysUserId,Date startDate,Date endDate){
		return scoreDao.getAllScore(sysUserId,startDate,endDate);
	}
	
	//获取商家的历史总积分
	public int getFactoryHistoryScore(String factoryId){
		return scoreDao.getFactoryHistoryScore(factoryId);
	}
	//获取商家的已经消费的积分
	public int getFactoryConsumeScore(String factoryId) {
		return scoreDao.getFactoryConsumeScore(factoryId);
	}
	
	@Transactional
	public void deliverFactoryScore(double score,String source,String factoryId,String bookId) {
		Score scoreObj = new Score();
		scoreObj.setFactoryId(factoryId);
		scoreObj.setScore(score);
		scoreObj.setSource(source);
		//订单发货积分
		scoreObj.setRelationId(bookId);
		scoreDao.save(scoreObj);
	}
	
	//门店下单，地推人员所得积分
	@Transactional
	public void sysUserScore(double score,String factoryId,String source,String sysUserId) {
		Score scoreObj = new Score();
		scoreObj.setSysUserId(sysUserId);
		scoreObj.setScore(score);
		scoreObj.setSource(source);
		//订单发货积分
		scoreObj.setRelationId(factoryId);
		scoreDao.save(scoreObj);
	}
	
	
	
	/**
	 * @param key
	 * @param value
	 * @param orderBy
	 * @return
	 */
	public List<Score> getAllByFactoryId(String factoryId){
		return scoreDao.getAllByProperty("factoryId", factoryId, "createTime desc");
	}
	@Autowired
	private GeneralDao generalDao;
	
	@Autowired
	private ScoreDao scoreDao;

	
	
	
}
